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
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-25
 */
@Controller
@RequestMapping("/emp")
public class EmployeeInfController {
    @Autowired
    private UserInfService userInfService;

    @Autowired
    private EmployeeInfService employeeInfService;

    @Autowired
    private DeptInfService deptInfService;

    @Autowired
    private EducationInfService educationInfService;

    @Autowired
    private JobInfService jobInfService;

    @Autowired
    private SexInfService sexInfService;

    @RequestMapping("/list")
    public String toList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                         @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                         @RequestParam(value = "content", required = false) String content,
                         Model model) {
        Page<EmployeeInf> page = new Page<>(pageNo, pageSize);
        employeeInfService.selectEmployeeAll(page, content);

        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "employee/list";
    }

    @RequestMapping("/toupd")
    public String rePassword(Integer id, Model model) {
        EmployeeInf employeeInf = employeeInfService.getById(id);
        List<DeptInf> dept_list = deptInfService.list(null);
        List<JobInf> job_list = jobInfService.list(null);
        List<SexInf> sex_list = sexInfService.list(null);
        List<EducationInf> education_list = educationInfService.list(null);
        model.addAttribute("job_list", job_list);
        model.addAttribute("employee", employeeInf);
        model.addAttribute("dept_list", dept_list);
        model.addAttribute("sex_list", sex_list);
        model.addAttribute("education_list", education_list);
        return "employee/edit";
    }

    @RequestMapping("/upd")
    public String upd(EmployeeInf employeeInf) {
        System.out.println(employeeInf);
        employeeInfService.updateById(employeeInf);
        return "redirect:/emp/list";
    }

    @RequestMapping("/del")
    public String del(Integer id) {

        employeeInfService.removeById(id);

        return "redirect:/emp/list";
    }

    @RequestMapping("/toassociation")
    public String toassociation() {

        return "employee/association";
    }

    @RequestMapping("/toplist")
    public String plist(Integer id, Model model) {
        EmployeeInf employeeInf = employeeInfService.findEmpById(id);
        model.addAttribute("employee", employeeInf);
        return "employee/plist";
    }

    @RequestMapping("/topedit")
    public String topedit(Integer id, Model model) {
        EmployeeInf employeeInf = employeeInfService.getById(id);
        List<DeptInf> dept_list = deptInfService.list(null);
        List<JobInf> job_list = jobInfService.list(null);
        List<SexInf> sex_list = sexInfService.list(null);
        List<EducationInf> education_list = educationInfService.list(null);
        model.addAttribute("job_list", job_list);
        model.addAttribute("employee", employeeInf);
        model.addAttribute("dept_list", dept_list);
        model.addAttribute("sex_list", sex_list);
        model.addAttribute("education_list", education_list);
        return "employee/pedit";
    }

    @RequestMapping("/pedit")
    public String pedit(EmployeeInf employeeInf) {
        System.out.println(employeeInf);
        employeeInfService.updateById(employeeInf);
        return "redirect:/emp/toplist";
    }


    @RequestMapping("/topadd")
    public String topadd(Integer id, Model model,String email) {
        EmployeeInf employeeInf = employeeInfService.getById(id);
        List<SexInf> sex_list = sexInfService.list(null);
        List<EducationInf> education_list = educationInfService.list(null);
        List<DeptInf> dept_list = deptInfService.list(null);
        List<JobInf> job_list = jobInfService.list(null);
        model.addAttribute("email",email);
        System.out.println(email);
        model.addAttribute("job_list", job_list);
        model.addAttribute("dept_list", dept_list);
        model.addAttribute("education_list", education_list);
        model.addAttribute("employee", employeeInf);
        model.addAttribute("sex_list", sex_list);
        return "employee/padd";
    }

    @RequestMapping("/padd")
    public String padd(EmployeeInf employeeInf,String email) {
        // 创建时间
        UserInf userInf=userInfService.getById(employeeInf.getUserId());
        userInf.setEmail(email);
        employeeInfService.updateById(employeeInf);
        return "redirect:/emp/toplist";
    }





    @RequestMapping("/association")
    public String association(String loginname, Model model) {
        QueryWrapper<UserInf> wrapper = new QueryWrapper<>();
        wrapper.eq("loginname", loginname);
        UserInf userInf = userInfService.getOne(wrapper);
        if (userInf != null) {
            List<DeptInf> dept_list = deptInfService.list(null);
            List<JobInf> job_list = jobInfService.list(null);
            List<SexInf> sex_list = sexInfService.list(null);
            List<EducationInf> education_list = educationInfService.list(null);
            model.addAttribute("job_list", job_list);
            model.addAttribute("dept_list", dept_list);
            model.addAttribute("sex_list", sex_list);
            model.addAttribute("education_list", education_list);
            model.addAttribute("user", userInf);
            return "employee/add";
        } else {
            model.addAttribute("message", "此用户不存在,请修改");
            return "employee/association";
        }
    }



    @RequestMapping("/add")
    public String addEmp(EmployeeInf employeeInf) {
        // 创建时间
        employeeInf.setCreatedate(new Date());
        System.out.println(employeeInf);
        employeeInfService.save(employeeInf);
        return "redirect:/emp/list";
    }

}

