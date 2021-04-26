package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.*;
import com.ly.bigdata.service.TrainInfService;
import com.ly.bigdata.service.TraindataInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-29
 */
@Controller
@RequestMapping("/traindata")
public class TraindataInfController {
    @Autowired
    private TraindataInfService traindataInfService;

    @RequestMapping("/list")
    public String getList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content,
                          Model model) {
        Page<TraindataInf> page = new Page<>(pageNo, pageSize);
        traindataInfService.selectTrdAll(page, content);
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "traindata/list";
    }


    @RequestMapping("/toadd")
    public String toadd(Model model) {

        return "/traindata/add";
    }


    @RequestMapping("/add")
    public String add(TraindataInf traindataInf, MultipartFile file, HttpServletRequest request)throws Exception{
        //String filePath = request.getServletContext().getRealPath("/WEB-INF/jsp/traindata/源文件");
        String dir=System.getProperty("user.dir");
        System.out.println(dir+"---------------------------------------");
        String filePath =dir+"\\src\\main\\resources\\static\\upload";
        //上传文件名称
        String fileName = file.getOriginalFilename();
        //上传文件,复制文件
        file.transferTo(new File(filePath,fileName));
        traindataInf.setFilename(fileName);
        traindataInf.setCreatedate(new Date());
        UserInf userInf = (UserInf) request.getSession().getAttribute("user_session");
        traindataInf.setUserId(userInf.getId());
        //数据入库
        traindataInfService.save(traindataInf);
        return "redirect:/traindata/list";
    }



    @RequestMapping("/del")
    public String del(Integer id, HttpServletRequest request){

        TraindataInf traindataInf=traindataInfService.getById(id);
        //找文件位置
       // String filePath = request.getServletContext().getRealPath("/WEB-INF/jsp/traindata/源文件");
        String dir=System.getProperty("user.dir");

        String filePath =  dir+"\\src\\main\\resources\\static\\upload";
        File  file=new File(filePath,traindataInf.getFilename());

        if(file.exists()){
            file.delete();
        }

        traindataInfService.removeById(id);

        return "redirect:/traindata/list";
    }

    @RequestMapping("/downLoad")
    public ResponseEntity<byte[]> download(String filename, HttpSession request) throws Exception {
        //找文件位置
        String dir=System.getProperty("user.dir");
        String filePath =dir+"\\src\\main\\resources\\static\\upload";
        //找到文件
        File file = new File(filePath, filename);
        //io流
        InputStream is = new FileInputStream(file);
        byte[] buf = new byte[is.available()];
        is.read(buf);

        HttpStatus status = HttpStatus.OK;
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment", URLEncoder.encode(filename, "utf-8"));
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<byte[]>(buf, headers, status);

        is.close();
        return responseEntity;
    }


    @RequestMapping("/toupd")
    public String toupd(Integer id,Model model){
        TraindataInf traindataInf=traindataInfService.getById(id);
        model.addAttribute("traindata",traindataInf);
        return "traindata/edit";
    }


    @RequestMapping("/upd")
    public String upd(TraindataInf traindataInf, MultipartFile file, HttpServletRequest request)throws Exception{
        String filePath = request.getServletContext().getRealPath("/WEB-INF/jsp/traindata/源文件");
        //上传文件位置
        System.out.println(filePath);
        //上传文件名称
        String fileName = file.getOriginalFilename();
        //上传文件,复制文件
        file.transferTo(new File(filePath,fileName));
        traindataInf.setFilename(fileName);
        System.out.println(fileName);
        //数据入库
        //替换原来的文件,还有就是上传大小有限制这个怎么设置
        traindataInfService.updateById(traindataInf);
        return "redirect:/traindata/list";
    }

//播放还有问题
    @RequestMapping("/play")
    public String toplay(String filename,Model model){
     model.addAttribute("filename",filename);

        return "traindata/play";
    }

}

