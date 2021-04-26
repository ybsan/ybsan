package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.ly.bigdata.entity.Student;
import com.ly.bigdata.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
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
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;


    @RequestMapping("/list")
    @ResponseBody
    public Object getlist(@RequestParam(value = "page", defaultValue = "1") Integer pageNum, @RequestParam(value = "limit", defaultValue = "6") Integer pageSize, @RequestParam(value = "content", required = false) String content){

        Page<Student> page = new Page<>(pageNum, pageSize);

        if (content != null && !"".equals(content)) {
            QueryWrapper<Student> queryWrapper = new QueryWrapper<>();
            queryWrapper.like("name", content).or()
                    .like("sex", content).or()
                    .like("birth", content);
            studentService.page(page, queryWrapper);
        } else {
            studentService.page(page, null);
        }

        Map<String,Object> map=new HashMap<>();

        map.put("data",page.getRecords());
        map.put("count",page.getTotal());
        map.put("code",0);
        map.put("msg","");
        return  map;
    }


    @RequestMapping("/toList")
    public String toList(){
        return "student/list2";
    }







    @RequestMapping("/delete")
    @ResponseBody
    public void delete(Integer id){
        studentService.removeById(id);

    }


    @RequestMapping("/toAdd")
    public String toAdd(){
        return "student/add";
    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Student student,String birthday) throws ParseException {
//        System.out.println(student);
        LocalDate parse = LocalDate.parse(birthday);
        student.setBirth(parse);
        boolean flag=studentService.saveOrUpdate(student);
        if(!flag){
            return "添加成功!!!";
        }
        return "添加成功！！！";
    }

    @RequestMapping("/toUpd")
    public String toUpd(Integer id, Model model){
        Student student=studentService.getById(id);
        model.addAttribute("student",student);
        return "student/upd";
    }

    @RequestMapping("/upd")
    @ResponseBody
    public String upd(Student student,String birthday){
        LocalDate parse = LocalDate.parse(birthday);
        student.setBirth(parse);
        boolean flag=studentService.saveOrUpdate(student);
        if(!flag){
            return "修改成功!!!";
        }
        return "修改成功！！！";
    }


    @RequestMapping("/checked")
    public String checked() {
        return "student/checked";
    }


}
