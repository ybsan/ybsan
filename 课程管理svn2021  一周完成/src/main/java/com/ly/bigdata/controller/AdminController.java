package com.ly.bigdata.controller;


import com.ly.bigdata.entity.Admin;
import com.ly.bigdata.service.AdminService;
import com.ly.bigdata.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;


    @RequestMapping("/password")
    @ResponseBody
    public Object password(String oldPassword, String password, Integer adminNo){

        System.out.println(oldPassword+"++++++++++++++++"+password+"+++++++++++++++++"+adminNo);
        Admin oldadmin=adminService.getById(adminNo);

        if(oldadmin.getAdminPwd().equals(oldPassword)){
            oldadmin.setAdminPwd(password);
            adminService.saveOrUpdate(oldadmin);
            return new DataGridView(oldadmin);
        }else{
            return  new DataGridView(0L,"旧密码输入错误",null);
        }

    }

    @RequestMapping("/topassword")
    public  String topassword(){
        return "Admin/password";
    }

    @RequestMapping("/toedit")
    public String toedit(){
        return "Admin/adminedit";
    }
}

