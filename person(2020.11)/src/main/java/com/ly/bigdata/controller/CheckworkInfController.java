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
 * @since 2021-03-26
 */
@Controller
@RequestMapping("/checkwork")
public class CheckworkInfController {

    @Autowired
    private CheckworkInfService checkworkInfService;

    @Autowired
    private EmployeeInfService employeeInfService;

    @Autowired
    private LeavetypeInfService leavetypeInfService;

    @Autowired
    private LeaveInfService leaveInfService;


    @RequestMapping("/list")
    public String getList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content,
                          Model model) {
        Page<CheckworkInf> page = new Page<>(pageNo, pageSize);
        checkworkInfService.selectCheckAll(page, content);
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "checkwork/list";
    }




    @RequestMapping("/toadd")
    public String toadd() {

        return "checkwork/add";
    }


    @RequestMapping("/add")
    public String association(CheckworkInf checkworkInf, String username, Model model) {
        QueryWrapper<EmployeeInf> wrapper = new QueryWrapper<>();
        wrapper.eq("name", username);
        EmployeeInf employeeInf = employeeInfService.getOne(wrapper);

        if (employeeInf != null) {
            checkworkInf.setDeptId(employeeInf.getDeptId());
            checkworkInf.setJobId(employeeInf.getJobId());
            checkworkInf.setEmpId(employeeInf.getId());
            checkworkInf.setCreatedate(new Date());
            System.out.println(checkworkInf);

            checkworkInfService.save(checkworkInf);
            return "redirect:/checkwork/list";
        } else {
            model.addAttribute("message", "此员工不存在,请修改");
            return "checkwork/add";
        }
    }




    @RequestMapping("/del")
    public String del(Integer id) {

        checkworkInfService.removeById(id);

        return "redirect:/checkwork/list";
    }

    @RequestMapping("/upd")
    public String upd(CheckworkInf checkworkInf) {

        checkworkInfService.saveOrUpdate(checkworkInf);
        return "redirect:/checkwork/list";
    }

    @RequestMapping("/topedit")
    public String topedit(Integer empId,Model model) {
        System.out.println(empId);
        CheckworkInf checkworkInf=checkworkInfService.findCheById(empId);
        model.addAttribute("checkwork",checkworkInf);
        return "checkwork/pedit";
    }

    @RequestMapping("/toleaveadd")
    public String leaveadd(Integer empId,Model model) {
        LeaveInf leaveInf = leaveInfService.getById(empId);
        System.out.println(empId);
       EmployeeInf employeeInf= employeeInfService.getById(empId);
        System.out.println(employeeInf);
        List<LeavetypeInf> typ_list = leavetypeInfService.list(null);
        model.addAttribute("typ_list", typ_list);
        model.addAttribute("employee",employeeInf);
        model.addAttribute("leave",leaveInf);
        return "checkwork/leaveadd";
    }


    @RequestMapping("/leaveadd")
    public String leaveadd(LeaveInf leaveInf,String id) {
        EmployeeInf employeeInf =employeeInfService.getById(id);
        leaveInf.setEmpId(employeeInf.getId());
        leaveInf.setDeptId(employeeInf.getDeptId());
        leaveInf.setJobId(employeeInf.getJobId());
        leaveInf.setLeavestatus(0);
        leaveInf.setLeavetime(new Date());
        leaveInfService.save(leaveInf);
        return "redirect:/checkwork/leavelist";
    }



    @RequestMapping("/leavelist")
    public String leavelist(Integer empId,Model model) {
        List<LeaveInf> list=  leaveInfService.selectLeaById(empId);
        System.out.println(list);
        model.addAttribute("list", list);
        return "checkwork/adminleavelist";
    }


}

