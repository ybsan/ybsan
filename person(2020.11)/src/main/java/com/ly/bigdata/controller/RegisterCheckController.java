package com.ly.bigdata.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ly.bigdata.po.CodeInf;
import com.ly.bigdata.po.UserInf;
import com.ly.bigdata.service.CodeInfService;
import com.ly.bigdata.service.SendMailService;
import com.ly.bigdata.service.UserInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
public class RegisterCheckController {

    @Autowired
    private CodeInfService codeInfService;
    @Autowired
    private UserInfService userInfService;
    @Autowired
    private SendMailService mailService;

    @RequestMapping("/registCode")
    public String registCode() {
        return "registCode";
    }

    @RequestMapping("/toregist")
    public String toRegist() {
        return "regist";
    }

    @RequestMapping("/toregistCode")
    @ResponseBody
    public Object toRegistCode(String registCode) {
        QueryWrapper<CodeInf> wrapper = new QueryWrapper<>();
        wrapper.eq("code", registCode);
        CodeInf codeIn = codeInfService.getOne(wrapper);
        if (codeIn != null) {
            Date date = codeIn.getCreatedate();
            if (date != null) {
                return "注册码已被使用";
            } else {
                return "";
            }
        }else{
            return "注册码不正确请重新输入";
        }
    }


    @RequestMapping("/check_Register_email")
    @ResponseBody
    public String check_Register_email(String email) {
        QueryWrapper<UserInf> wrapper = new QueryWrapper<UserInf>();
        wrapper.eq("email", email);

        UserInf userInf = userInfService.getOne(wrapper);
        if (userInf != null) {
            return "一个邮箱仅限注册一个账户";
        } else {
            return "";
        }
    }

    @RequestMapping("/check_Register_loginname")
    @ResponseBody
    public String check_Register_loginname(String loginname) {
        QueryWrapper<UserInf> wrapper = new QueryWrapper<UserInf>();
        wrapper.eq("loginname", loginname);

        UserInf userInf = userInfService.getOne(wrapper);
        if (userInf != null) {
            return "该登录名已经存在";
        } else {
            return "";
        }
    }


    @RequestMapping("/register")
    public String addUser(UserInf userInf, Model model,CodeInf codeInf) {
        Date date = new Date();
        codeInf.setCreatedate(date);
        codeInfService.saveOrUpdate(codeInf);
        userInf.setStatusId(0);
        userInf.setCreatedate(new Date());
        System.out.println(userInf);
        // md5加密
        String pwd = DigestUtils.md5DigestAsHex(userInf.getPassword().getBytes());
        userInf.setPassword(pwd);
        userInfService.save(userInf);
        mailService.send("用户注册","用户已注册,请管理员尽快审批!","643789459@qq.com",new String[]{"xdybsan@gmail.com"});
        return "loginForm";
    }

}



