package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.ly.bigdata.po.*;
import com.ly.bigdata.service.DeptInfService;
import com.ly.bigdata.service.EmployeeInfService;
import com.ly.bigdata.service.JobInfService;
import com.ly.bigdata.service.SalaryInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
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
@RequestMapping("/salary")
public class SalaryInfController {


    @Autowired
    private SalaryInfService salaryInfService;
    @Autowired
    private EmployeeInfService employeeInfService;

    @Autowired
    private DeptInfService deptInfService;

    @Autowired
    private JobInfService jobInfService;

    @RequestMapping("/list")
    public String getList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content,
                          Model model) {
        Page<SalaryInf> page = new Page<>(pageNo, pageSize);
        salaryInfService.selectSalAll(page, content);
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "salary/list";
    }

    @RequestMapping("/toadd")
    public String toadd() {

        return "salary/add";
    }


    @RequestMapping("/add")
    public String association(SalaryInf salaryInf, String empname, Model model) {
        QueryWrapper<EmployeeInf> wrapper = new QueryWrapper<>();
        wrapper.eq("name", empname);
        EmployeeInf employeeInf = employeeInfService.getOne(wrapper);
        if (employeeInf != null) {
            salaryInf.setDeptId(employeeInf.getDeptId());
            salaryInf.setJobId(employeeInf.getJobId());
            salaryInf.setEmpId(employeeInf.getId());
            salaryInf.setCreateDate(new Date());
            System.out.println(salaryInf);
            salaryInfService.save(salaryInf);
            return "redirect:/salary/list";
        } else {
            model.addAttribute("message", "此员工不存在,请修改");
            return "salary/add";
        }
    }

    @RequestMapping("/del")
    public String del(Integer id) {

        salaryInfService.removeById(id);

        return "redirect:/salary/list";
    }



    @RequestMapping("/toupd")
    public String toupd(Integer id, Model model) {
        SalaryInf salaryInf = salaryInfService.getById(id);
        List<DeptInf> dept_list = deptInfService.list(null);
        System.out.println(dept_list);
        List<JobInf> job_list = jobInfService.list(null);
        System.out.println(job_list);
        model.addAttribute("dept_list", dept_list);
        model.addAttribute("job_list", job_list);
        model.addAttribute("salary", salaryInf);
        return "salary/edit";
    }


    @RequestMapping("/upd")
    public String upd(SalaryInf salaryInf) {

        salaryInfService.updateById(salaryInf);
        return "redirect:/salary/list";
    }

    @RequestMapping("/topedit")
    public String topedit(Integer empId, Model model) {
        SalaryInf salaryInf = salaryInfService.findSalById(empId);
        model.addAttribute("salary", salaryInf);
        return "salary/pedit";
    }


}

