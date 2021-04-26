package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.*;

import com.ly.bigdata.service.LeaveInfService;
import com.ly.bigdata.service.LeavestatusInfService;
import com.ly.bigdata.service.LeavetypeInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-28
 */
@Controller
@RequestMapping("/leave")
public class LeaveInfController {

    @Autowired
    private LeaveInfService leaveInfService;

    @Autowired
    private LeavestatusInfService leavestatusInfService;

    @Autowired
    private LeavetypeInfService leavetypeInfService;

    @RequestMapping("/list")
    public String getList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content,
                          Model model) {
        Page<LeaveInf> page = new Page<>(pageNo, pageSize);
        leaveInfService.selectLeaAll(page, content);
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "checkwork/adminleavelist";
    }

    @RequestMapping("/toupd")
    public String toupd(Integer id, Model model) {
        LeaveInf leaveInf = leaveInfService.getById(id);
        List<LeavestatusInf> sta_list = leavestatusInfService.list(null);
        System.out.println(sta_list);
        List<LeavetypeInf> typ_list = leavetypeInfService.list(null);
        System.out.println(typ_list);
        model.addAttribute("sta_list", sta_list);
        model.addAttribute("typ_list", typ_list);
        model.addAttribute("leave", leaveInf);
        return "checkwork/adminleaveedit";
    }


    @RequestMapping("/upd")
    public String upd(LeaveInf leaveInf) {
        System.out.println(leaveInf);
        leaveInfService.updateById(leaveInf);
        return "redirect:/leave/list";
    }

}

