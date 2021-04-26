package com.ly.bigdata.controller;



import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ly.bigdata.po.UserInf;
import com.ly.bigdata.po.UservisitInf;
import com.ly.bigdata.service.StatusInfService;
import com.ly.bigdata.service.UserInfService;

import com.ly.bigdata.service.UservisitInfService;
import eu.bitwalker.useragentutils.Browser;
import eu.bitwalker.useragentutils.OperatingSystem;
import eu.bitwalker.useragentutils.UserAgent;
import eu.bitwalker.useragentutils.Version;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-22
 */
@Controller
@RequestMapping("/user")
public class UserInfController {


    @Autowired
    private UserInfService userInfService;

    @Autowired
    private StatusInfService statusInfService;

    @Autowired
    private StringRedisTemplate redisTemplate;
    @Autowired
    private UservisitInfService uservisitInfService;

    @RequestMapping("/list")
    public String toList(Model model, @RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo,
                         @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                         @RequestParam(value = "content", required = false) String content) {
        Page<UserInf> page = new Page<>(pageNo, pageSize);
        if (content != null && !content.equals("")) {
            QueryWrapper<UserInf> wrapper = new QueryWrapper<>();
            wrapper.like("loginname", "%" + content + "%")
                    .or().like("username", "%" + content + "%");
            userInfService.page(page, wrapper);
        } else {
            userInfService.page(page, null);
        }

//        System.out.println("当前页："+page.getCurrent());
//        System.out.println("每页记录数："+page.getSize());
//        System.out.println("总记录数："+page.getTotal());
//        System.out.println("总页数："+page.getPages());
//        System.out.println("上一页："+(page.hasPrevious()?page.getCurrent()-1:1));
//        System.out.println("下一页："+(page.hasNext()?page.getCurrent()+1:page.getPages()));
        model.addAttribute("list", page.getRecords());
        model.addAttribute("pageNo", page.getCurrent());
        model.addAttribute("pageSize", page.getSize());
        model.addAttribute("count", page.getTotal());
        return "user/list";
    }


    @RequestMapping("/toadd")
    public String toadd() {
        return "user/add";
    }

    @RequestMapping("/topedit")
    public String toPedit(Integer id,Model model) {
        UserInf userInf = userInfService.getById(id);
        model.addAttribute("user",userInf);
        return "user/pedit";
    }


    @RequestMapping("/pedit")
    public String Pedit(UserInf userInf,String password) {
        String pwd = DigestUtils.md5DigestAsHex(password.getBytes());
        userInf.setPassword(pwd);

        System.out.println(userInf);
        userInfService.updateById(userInf);
        return "redirect:/";
    }

    @RequestMapping("/add")
    public String add(UserInf userInf) {
        userInf.setStatusId(0);
        Date date = new Date();
        userInf.setCreatedate(date);
        String pwd = DigestUtils.md5DigestAsHex(userInf.getPassword().getBytes());
        userInf.setPassword(pwd);
        userInfService.save(userInf);
        return "redirect:/user/list";
    }

    @RequestMapping("/del")
    public String del(Integer id) {

        userInfService.removeById(id);
        return "redirect:/user/list";
    }

    @RequestMapping("/toupd")
    public String rePassword(Integer id, Model model) {
        List list = statusInfService.list();
        UserInf userInf = userInfService.getById(id);
        model.addAttribute("userInf", userInf);
        model.addAttribute("list", list);
        return "user/edit";
    }

    @RequestMapping("/upd")
    public String upd(UserInf userInf) {
        userInfService.saveOrUpdate(userInf);
        return "redirect:/user/list";
    }


    @RequestMapping("/login")
    public String login(String loginname, String password, String user_input_verifyCode,
                        HttpSession session, Model model, HttpServletRequest request) {
        this.getClientInfo(request, loginname);
        try {
            String sessionCode = (String) session.getAttribute("code");
//        System.out.println(sessionCode);
//        System.out.println(user_input_verifyCode);
//        System.out.println(sessionCode.equalsIgnoreCase(user_input_verifyCode));


            // sessionCode.equalsIgnoreCase()不区分大小写
            if (sessionCode.equalsIgnoreCase(user_input_verifyCode)) {
                QueryWrapper<UserInf> wrapper = new QueryWrapper<>();
                String pwd = DigestUtils.md5DigestAsHex(password.getBytes());
                wrapper.eq("loginname", loginname).eq("password", pwd);
                UserInf userInf = userInfService.getOne(wrapper);

                if (userInf != null) {
                    Integer user = userInf.getStatusId();

                    if (user != 1) {
                        model.addAttribute("message", "请等待管理员通过!");
                        return "loginForm";
                    } else {
                        session.setAttribute("user_session", userInf);
                        return "index";
                    }
                } else {
                    model.addAttribute("message", "用户名或者密码不对!");
                    return "loginForm";
                }
            } else {
                model.addAttribute("message", "验证码不对!");
                return "loginForm";
            }
        } catch (Exception e) {
            return "redirect:/";
        }
    }


    private void getClientInfo(HttpServletRequest request, String loginname) {

        //User Agent中文名为用户代理，简称 UA，它是一个特殊字符串头，使得服务器
        //能够识别客户使用的操作系统及版本、CPU 类型、浏览器及版本、
        //浏览器渲染引擎、浏览器语言、浏览器插件等
        String agent = request.getHeader("User-Agent");
        System.out.println(agent);

        UserAgent userAgent = UserAgent.parseUserAgentString(agent);
        // 获取浏览器
        Browser browser = userAgent.getBrowser();
        System.out.println(browser.getName());
        // 获取浏览器版本
        Version vr = userAgent.getBrowserVersion();
        System.out.println(vr.getVersion());
        // 获取操作系统
        OperatingSystem os = userAgent.getOperatingSystem();
        System.out.println(os.getName());

        String iphone = "";
        if (agent.contains("Windows NT")) {

            //pc型号获取实现
            String pc_regex = " \\((.*); ";
            Pattern pattern = Pattern.compile(pc_regex);
            Matcher matcher = pattern.matcher(agent);
            while (matcher.find()) {
                iphone = matcher.group(1);
            }
            agent = "pc端";
        } else {
            String type = "";
            if (agent.contains("iPhone") || agent.contains("iPod") || agent.contains("iPad")) {
                type = "ios";
            } else if (agent.contains("Android") || agent.contains("Linux")) {
                type = "apk";
            } else if (agent.indexOf("micromessenger") > 0) {
                type = "wx";
            }
            String iphone_regex = "\\((.*)\\) Apple";
            Pattern pattern = Pattern.compile(iphone_regex);
            Matcher matcher = pattern.matcher(agent);
            while (matcher.find()) {
                iphone = matcher.group(1);
            }
            agent = "移动端" + type;
        }
        System.out.println(iphone);
        System.out.println(agent);
        System.out.println("---------------------获取ip--------------------------");

        String ipAddress = null;
        if (request.getHeader("x-forwarded-for") == null) {
            ipAddress = request.getRemoteAddr();
        } else {
            if (request.getHeader("x-forwarded-for").length() > 15) {
                String[] aStr = request.getHeader("x-forwarded-for").split(",");
                ipAddress = aStr[0];
            } else {
                ipAddress = request.getHeader("x-forwarded-for");
            }
        }


        System.out.println(ipAddress);
        // 封装UservisitInf
        UservisitInf uservisitInf =new UservisitInf();
        uservisitInf.setLoginname(loginname);
        uservisitInf.setLoginTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        uservisitInf.setVisitIp(ipAddress);
        uservisitInf.setUserAddress("");
        uservisitInf.setUserFrom(agent);
        uservisitInf.setBrowser(browser.getName());
        uservisitInf.setOpsystem(os.getName());
        uservisitInf.setVersion(vr.getVersion());
        uservisitInf.setIphone(iphone);
        //写入数据库
        uservisitInfService.save(uservisitInf);
        String s = null;
        try {
            s = new ObjectMapper().writeValueAsString(uservisitInf);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        // 写入redis
        redisTemplate.opsForList().leftPush("users", s);
        // 写入到session
        request.getSession().setAttribute("USERV_ISIT", uservisitInf);

    }
}