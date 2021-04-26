package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.mapper.NoticeInfMapper;
import com.ly.bigdata.po.EmployeeInf;
import com.ly.bigdata.po.NoticeInf;
import com.ly.bigdata.po.UserInf;
import com.ly.bigdata.service.NoticeInfService;
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
 * @since 2021-03-26
 */
@Controller
@RequestMapping("/notice")
public class NoticeInfController {


    @Autowired
    private NoticeInfService noticeInfService;

    @RequestMapping("/list")
    public String getList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content,
                          Model model) {
        Page<NoticeInf> page = new Page<>(pageNo, pageSize);
        noticeInfService.selectNoticeAll(page, content);
        System.out.println(page.getRecords().get(0).getUser());
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "notice/list";
    }

    @RequestMapping("/toadd")
    public String toadd(){

        return "notice/add";
    }


    @RequestMapping("/add")
    public String add(NoticeInf noticeInf){
        noticeInfService.save(noticeInf);
        return "redirect:/notice/list";
    }
    @RequestMapping("/del")
    public String del(Integer id){

        noticeInfService.removeById(id);

        return "redirect:/notice/list";
    }
    @RequestMapping("/toupd")
    public String toupd(Integer id,Model model){
        NoticeInf noticeInf=noticeInfService.getById(id);
        model.addAttribute("notice",noticeInf);
        return "notice/edit";
    }

    @RequestMapping("/upd")
    public String upd(NoticeInf noticeInf){

        noticeInfService.saveOrUpdate(noticeInf);
        return "redirect:/notice/list";
    }
}

