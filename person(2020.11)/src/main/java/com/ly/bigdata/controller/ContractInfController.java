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
 *  前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-26
 */
@Controller
@RequestMapping("/contract")
public class ContractInfController {

    @Autowired
    private ContractInfService contractInfService;

    @Autowired
    private EmployeeInfService employeeInfService;

    @Autowired
    private DeptInfService deptInfService;

    @Autowired
    private JobInfService jobInfService;

    @Autowired
    private LaborcontractInfService laborcontractInfService;

    @Autowired
    private ConfidentialitycontractInfService confidentialitycontractInfService;

    @Autowired
    private TraincontractInfService traincontractInfService;

    @Autowired
    private StatusInfService statusInfService;


    @RequestMapping("/list")
    public String getList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content,
                          Model model) {
        Page<ContractInf> page = new Page<>(pageNo, pageSize);
        contractInfService.selectConAll(page, content);
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "contract/list";
    }


    @RequestMapping("/add")
    public String add(ContractInf contractInf, String empname, Model model) {
        QueryWrapper<EmployeeInf> wrapper = new QueryWrapper<>();
        wrapper.eq("name", empname);
        EmployeeInf employeeInf = employeeInfService.getOne(wrapper);
        if (employeeInf != null) {
            contractInf.setDeptId(employeeInf.getDeptId());
            contractInf.setJobId(employeeInf.getJobId());
            contractInf.setEmpId(employeeInf.getId());
            contractInf.setCreateDate(new Date());
            System.out.println(contractInf);
            contractInfService.save(contractInf);
            return "redirect:/contract/list";
        } else {
            model.addAttribute("message", "此员工不存在,请修改");
            return "contract/add";
        }
    }




    @RequestMapping("/toadd")
    public String toadd() {

        return "contract/add";
    }



    @RequestMapping("/toupd")
    public String toupd(Integer id, Model model) {
        ContractInf contractInf = contractInfService.getById(id);
        List<DeptInf> dept_list = deptInfService.list(null);
        List<JobInf> job_list = jobInfService.list(null);
        List<LaborcontractInf> la_list = laborcontractInfService.list(null);
        List<ConfidentialitycontractInf> con_list = confidentialitycontractInfService.list(null);
        List<TraincontractInf> tra_list = traincontractInfService.list(null);
        model.addAttribute("dept_list", dept_list);
        model.addAttribute("job_list", job_list);
        model.addAttribute("contract", contractInf);
        model.addAttribute("la_list", la_list);
        model.addAttribute("con_list", con_list);
        model.addAttribute("tra_list", tra_list);
        return "contract/edit";
    }


    @RequestMapping("/upd")
    public String upd(ContractInf contractInf) {
        System.out.println(contractInf);
        contractInfService.updateById(contractInf);
        return "redirect:/contract/list";
    }



    @RequestMapping("/del")
    public String del(Integer id) {

        contractInfService.removeById(id);

        return "redirect:/contract/list";
    }

    @RequestMapping("/pedit")
    public String pedit(Integer empId,Model model) {
        ContractInf contractInf = contractInfService.findConById(empId);
        model.addAttribute("contract", contractInf);

        return "contract/pedit";
    }

}

