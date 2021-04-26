package com.ly.bigdata.controller;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ly.bigdata.po.DeptInf;
import com.ly.bigdata.service.DeptInfService;
import com.ly.bigdata.vo.DeptNum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-23
 */
@Controller
@RequestMapping("/dept")
public class DeptInfController {

    @Autowired
    private DeptInfService deptInfService;



    @RequestMapping("/list")
    public String getList(@RequestParam(value = "content", required = false) String content, Model model) {
        List<DeptInf> list = null;
        if(content !=null&&!content.equals("")){
       // if (content != null && !"".equals(content)) {
            QueryWrapper<DeptInf> wrapper = new QueryWrapper<>();
            wrapper.like("name", "%" + content + "%")
                    .or().like("remark", "%" + content + "%");
            list = deptInfService.list(wrapper);
        } else {
            list = deptInfService.list(null);
        }

        model.addAttribute("list", list);
        return "/dept/list";
    }

    @RequestMapping("/toadd")
    public String toadd(){

        return "dept/add";
    }


    @RequestMapping("/add")
    public String add(DeptInf deptInf){
        deptInfService.save(deptInf);
        return "redirect:/dept/list";
    }
    @RequestMapping("/del")
    public String del(Integer id){

        deptInfService.removeById(id);

        return "redirect:/dept/list";
    }
    @RequestMapping("/toupd")
    public String toupd(Integer id,Model model){
        DeptInf deptInf=deptInfService.getById(id);
        model.addAttribute("deptInf",deptInf);
        return "dept/edit";
    }

    @RequestMapping("/upd")
    public String upd(DeptInf deptInf){

        deptInfService.saveOrUpdate(deptInf);
        return "redirect:/dept/list";
    }

    @RequestMapping("/getDeptNum")
    @ResponseBody
    public Object getDeptNum(){
        List<DeptNum> list=deptInfService.getDeptNumbers();
        list.forEach(d-> System.out.println(d));
        return list;
    }

}

