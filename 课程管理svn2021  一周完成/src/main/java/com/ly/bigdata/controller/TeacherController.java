package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.Teacher;
import com.ly.bigdata.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {

    @Autowired
    private TeacherService teacherService;

    @ResponseBody
    @RequestMapping("/teachList")
    public Map<String,Object> toTeach(@RequestParam(value = "page", defaultValue = "1") Integer pageNo,
                          @RequestParam(value = "limit", defaultValue = "6") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content, Model model){
        Page<Teacher>page=new Page<>(pageNo,pageSize);
        Map<String,Object> map = new HashMap<>();
        if (content != null && !"".equals(content)) {
            teacherService.findAllTeacher(page,content);
        }else {
            teacherService.findAllTeacher(page,null);
        }

        map.put("code",0);
        map.put("msg","");
        map.put("data",page.getRecords());
        map.put("count",page.getTotal());

        return map;
    }

    @RequestMapping("/toTeach")
    public String toTeach(){

        return "/teach/listTeacher";
    }

    @RequestMapping("/toAddTeacher")
    public String toAddTeacher(){
        return "/teach/addTeacher";
    }

    @RequestMapping("/addTeacher")
    @ResponseBody
    public String addTeacher(Teacher teacher,String birthday){
        LocalDate parse = LocalDate.parse(birthday);
        teacher.setTeacherBirthday(parse);
        Boolean flag=teacherService.save(teacher);
        if(!flag){
            return "添加成功!!!";
        }
        return "添加成功!!!";
    }

    @RequestMapping("/toUpdTeacher")
    public String toUpdTeacher(Integer id,Model model){
        Teacher teacher=teacherService.getById(id);
        //System.out.println(teacher);
        model.addAttribute("teacher",teacher);
        return "/teach/updTeacher";
    }

    @RequestMapping("/updTeacher")
    @ResponseBody
    public String updTeacher(Teacher teacher,String birthday){
        LocalDate parse = LocalDate.parse(birthday);
        teacher.setTeacherBirthday(parse);
        Boolean flag=teacherService.saveOrUpdate(teacher);
        if(!flag){
            return "修改成功!!!";
        }
        return "修改成功";
    }

    @RequestMapping("/delete")
    @ResponseBody
    public void delete(Integer teacherNum){
        teacherService.removeById(teacherNum);
    }
}

