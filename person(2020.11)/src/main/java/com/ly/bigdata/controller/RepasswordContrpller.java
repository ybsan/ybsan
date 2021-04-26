package com.ly.bigdata.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ly.bigdata.po.UserInf;
import com.ly.bigdata.service.UserInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class RepasswordContrpller {

    @Autowired
  private  UserInfService userInfService;

    @RequestMapping("/repassword")
    public String registCode() {
        return "repasswordPage";
    }


    @RequestMapping("/toFindPassword")
    public String FindPassword(UserInf userInf, String user_input_verifyCode,
                               HttpSession session, Model model) {
        String sessionCode = (String) session.getAttribute("code");

        if (sessionCode.equalsIgnoreCase(user_input_verifyCode)) {
            QueryWrapper<UserInf> wrapper = new QueryWrapper<>();

            wrapper.eq("loginname", userInf.getLoginname())
                    .eq("username", userInf.getUsername());
            UserInf dbUser = userInfService.getOne(wrapper);
            model.addAttribute("user",dbUser);
            return "findPassword";
        }

        model.addAttribute("Message","验证码错误");
        return "repasswordPage";
    }


    @RequestMapping("/checkLoginname")
    @ResponseBody
    public String checkLoginname(String loginname) {
        QueryWrapper<UserInf> wrapper = new QueryWrapper<UserInf>();
        wrapper.eq("loginname", loginname);
        UserInf userInf = userInfService.getOne(wrapper);
        if (userInf != null) {
            return "";
        } else {
            return "请输入正确登录名";
        }
    }

    @RequestMapping("/checkUsername")
    @ResponseBody
    public String checkUsername(String username) {
        QueryWrapper<UserInf> wrapper = new QueryWrapper<UserInf>();
        wrapper.eq("username", username);

        UserInf userInf = userInfService.getOne(wrapper);
        if (userInf != null) {
            return "";
        } else {
            return "请输入正确用户名";
        }
    }

    @RequestMapping("/toPassword")
    public String toPassword(UserInf userInf, Model model) {

        String pwd = DigestUtils.md5DigestAsHex(userInf.getPassword().getBytes());
        userInf.setPassword(pwd);
        userInfService.saveOrUpdate(userInf);
        return "loginForm";
    }
}
