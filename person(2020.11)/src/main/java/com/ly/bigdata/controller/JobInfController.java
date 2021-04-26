package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ly.bigdata.po.JobInf;
import com.ly.bigdata.service.JobInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-25
 */
@Controller
@RequestMapping("job")
public class JobInfController {

    @Autowired
    private JobInfService jobInfService;



    @RequestMapping("/list")
    public String getList(@RequestParam(value = "content", required = false) String content, Model model) {
        List<JobInf> list = null;
        if(content !=null&&!content.equals("")){
            // if (content != null && !"".equals(content)) {
            QueryWrapper<JobInf> wrapper = new QueryWrapper<>();
            wrapper.like("name", "%" + content + "%")
                    .or().like("remark", "%" + content + "%");
            list = jobInfService.list(wrapper);
        } else {
            list = jobInfService.list(null);
        }

        model.addAttribute("list", list);
        return "/job/list";
    }

    @RequestMapping("/toadd")
    public String toadd(){

        return "job/add";
    }


    @RequestMapping("/add")
    public String add(JobInf jobInf){
        jobInfService.save(jobInf);
        return "redirect:/job/list";
    }
    @RequestMapping("/del")
    public String del(Integer id){

        jobInfService.removeById(id);

        return "redirect:/job/list";
    }
    @RequestMapping("/toupd")
    public String toupd(Integer id,Model model){
        JobInf jobInf=jobInfService.getById(id);
        model.addAttribute("jobInf",jobInf);
        return "job/edit";
    }

    @RequestMapping("/upd")
    public String upd(JobInf jobInf){

        jobInfService.saveOrUpdate(jobInf);
        return "redirect:/job/list";
    }


}

