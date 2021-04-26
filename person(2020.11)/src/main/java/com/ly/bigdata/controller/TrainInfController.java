package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.ly.bigdata.po.*;
import com.ly.bigdata.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.List;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-29
 */
@Controller
@RequestMapping("/train")
public class TrainInfController {

    @Autowired
    private TrainInfService trainInfService;
    @Autowired
    private EmployeeInfService employeeInfService;
    @Autowired
    private CompletionInfService completionInfService;



    @RequestMapping("/totrain")
    public String totrain() {

        return "/train/train";
    }

    @RequestMapping("/toadd")
    public String toadd(Model model) {

        List<CompletionInf> com_list = completionInfService.list(null);
        model.addAttribute("com_list", com_list);
        return "/train/add";
    }

    @RequestMapping("/add")

    public String add(TrainInf trainInf, String empname, Model model) {
        try {
            QueryWrapper<EmployeeInf> wrapper = new QueryWrapper<>();
            wrapper.eq("name", empname);
            EmployeeInf employeeInf = employeeInfService.getOne(wrapper);
            if (employeeInf != null) {
                trainInf.setDeptId(employeeInf.getDeptId());
                trainInf.setJobId(employeeInf.getJobId());
                trainInf.setEmpId(employeeInf.getId());
                trainInf.setTraintime(new Date());
                System.out.println(trainInf);
                trainInfService.save(trainInf);
                return "redirect:/train/list";
            } else {
                model.addAttribute("message", "此员工不存在,请修改");
                return "train/add";
            }
        } catch (Exception e) {
            return "redirect:/train/add";
        }
    }


    @RequestMapping("/toupd")
    public String toadd(Integer id, Model model) {

        TrainInf trainInf = trainInfService.getById(id);
        List<CompletionInf> com_list = completionInfService.list(null);
        List<EmployeeInf> emp_list = employeeInfService.list(null);
        model.addAttribute("com_list", com_list);
        model.addAttribute("emp_list", emp_list);
        model.addAttribute("train", trainInf);


        return "/train/edit";
    }

    @RequestMapping("/upd")
    public String toadd(TrainInf trainInf) {
       trainInfService.updateById(trainInf);
        return "redirect:/train/list";
    }


    @RequestMapping("/list")
    public String getList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content,
                          Model model) {
        Page<TrainInf> page = new Page<>(pageNo, pageSize);
        trainInfService.selectTraAll(page, content);
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "train/trainlist";
    }


    @RequestMapping("/del")
    public String del(Integer id) {

        trainInfService.removeById(id);

        return "redirect:/train/trainlist";
    }

    @RequestMapping("/admintrainlist")
    public String admintrainlist(Integer empId,Model model) {

      List<TrainInf> trainInf=  trainInfService.selectTraById(empId);
        System.out.println(trainInf);
        model.addAttribute("train", trainInf);

        return "/train/admintrainlist";
    }

}

