package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ly.bigdata.po.UserInf;
import com.ly.bigdata.po.UservisitInf;
import com.ly.bigdata.service.UservisitInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ybsan
 * @since 2021-03-23
 */
@Controller
@RequestMapping("/uservisit")
public class UservisitInfController {

    @Autowired
    private UservisitInfService uservisitInfService;
    @Autowired
    private StringRedisTemplate redisTemplate;


    @RequestMapping("/list")
    public String toList(Model model) {

        List<String> users = redisTemplate.opsForList().range("users", 0, 10);
        List<UservisitInf> list = new ArrayList<>();
        for (int i = 0; i < users.size(); i++) {
            try {
                UservisitInf uservisitInf = new ObjectMapper().readValue(users.get(i), UservisitInf.class);
                list.add(uservisitInf);
            } catch (JsonProcessingException e) {
                e.printStackTrace();
            }
        }
        // redis数据是空的时候取数据库
        if (list.isEmpty() || list.size() < 1) {
            System.out.println("去数据库");
            list = uservisitInfService.list(null);
            //存到redis数据库
            for (UservisitInf uservisitInf:list){
                try {
                    redisTemplate.opsForList().leftPush("users", new ObjectMapper().writeValueAsString(uservisitInf));
                } catch (JsonProcessingException e) {
                    e.printStackTrace();
                }
            }
        }
        model.addAttribute("list", list);
        return "uservisit/list";
    }

//    @RequestMapping("/list")
//    public String getList(Model model) {
//        List<UservisitInf> list =uservisitInfService.list(null);
//        model.addAttribute("list", list);
//        return "/uservisit/list";
//    }


    @RequestMapping("/del")
    public String deleteVisit(Integer id) {
        uservisitInfService.removeById(id);
        return "redirect:/uservisit/list";
    }
}

