package com.ly.bigdata.controller;



import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.DocumentInf;
import com.ly.bigdata.po.UserInf;
import com.ly.bigdata.service.DocumentInfService;
import com.sun.xml.internal.bind.v2.model.core.ID;
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

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-26
 */
@Controller
@RequestMapping("document")
public class DocumentInfController {

    @Autowired
    private DocumentInfService documentInfService;



    @RequestMapping("/list")
    public String getList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content,
                          Model model) {
        Page<DocumentInf> page = new Page<>(pageNo, pageSize);
        documentInfService.selectDoAll(page, content);
        System.out.println(page.getRecords().get(0).getUser());
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "document/list";
    }

    @RequestMapping("/toadd")
    public String toadd(){

        return "document/add";
    }


    @RequestMapping("/add")
    public String add(DocumentInf documentInf, MultipartFile file, HttpServletRequest request)throws Exception{
      String filePath = request.getServletContext().getRealPath("/WEB-INF/files");
        //上传文件位置
        System.out.println(filePath);
        //上传文件名称
        String fileName = file.getOriginalFilename();
        //上传文件,复制文件
        file.transferTo(new File(filePath,fileName));
        documentInf.setFilename(fileName);
        documentInf.setCreatedate(new Date());
        UserInf userInf = (UserInf) request.getSession().getAttribute("user_session");
        documentInf.setUserId(userInf.getId());
        //数据入库
        documentInfService.save(documentInf);
        return "redirect:/document/list";
    }

    @RequestMapping("/del")
    public String del(Integer id,HttpServletRequest request){

        DocumentInf documentInf=documentInfService.getById(id);
        //找文件位置
        String filePath = request.getServletContext().getRealPath("/WEB-INF/files");

        File  file=new File(filePath,documentInf.getFilename());

        if(file.exists()){
            file.delete();
        }

        documentInfService.removeById(id);

        return "redirect:/document/list";
    }


    @RequestMapping("/toupd")
    public String toupd(Integer id,Model model){
        DocumentInf documentInf=documentInfService.getById(id);
        model.addAttribute("documentInf",documentInf);
        return "document/edit";
    }

    @RequestMapping("/downLoad")
    public ResponseEntity<byte[]> download(String filename, HttpSession request) throws Exception {
        //找文件位置
        String filePath = request.getServletContext().getRealPath("/WEB-INF/files");
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

    @RequestMapping("/upd")
    public String upd(DocumentInf documentInf, MultipartFile file, HttpServletRequest request)throws Exception{
        String filePath = request.getServletContext().getRealPath("/WEB-INF/files");


        //上传文件位置
        System.out.println(filePath);
        //上传文件名称
        String fileName = file.getOriginalFilename();
        //上传文件,复制文件
        file.transferTo(new File(filePath,fileName));
        documentInf.setFilename(fileName);
        System.out.println(fileName);
        //数据入库
        documentInfService.updateById(documentInf);
        return "redirect:/document/list";
    }

}

