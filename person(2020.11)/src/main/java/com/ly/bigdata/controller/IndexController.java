package com.ly.bigdata.controller;

import com.ly.bigdata.GenCode;
import com.ly.bigdata.po.CodeInf;
import com.ly.bigdata.service.CodeInfService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


@Controller
public class IndexController {

    private static int COUNT=3;

    @Autowired
    private  CodeInfService codeInfService;

    //主界面
    @RequestMapping("/")
    public String toLogin(){
        return "loginForm";
    }

    //主界面
    @RequestMapping("/index")
    public String toIndex(){
        return "index";
    }
    @RequestMapping("/welcome")
    public String toWelcome(){
        return "welcome";
    }


    @RequestMapping("/exit")
    public String logout(HttpSession session){
        session.invalidate();
        return "/loginForm";
    }

    @RequestMapping("/toCreateCode")
    @ResponseBody
    public Object toCreateCode() {
        if (COUNT > 0) {
            String code = GenCode.gen();
            CodeInf codeInf = new CodeInf();
            codeInf.setCode(code);
            codeInfService.save(codeInf);
            COUNT--;

            return codeInf;
        } else {
            return "获取失败";
        }
    }


    @RequestMapping("/statistics")
    public String statistics(){

        return "statistics/statistics";
    }

    @RequestMapping("/echart")
    public String toEchart() {
        return "statistics/echart";
    }

}
