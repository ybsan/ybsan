package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.*;
import com.ly.bigdata.service.*;
import com.ly.bigdata.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
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
@RequestMapping("/course")
public class CourseController {
    //课程列表数据库
    @Autowired
    private CourseService courseService;
    //专业列表数据库
    @Autowired
    private MajorService majorService;
    @Autowired
    //学生列表
    private StudentService studentService;
    //选课列表
    @Autowired
    private StuCourseService stuCourseService;
    //任课列表
    @Autowired
    private TeacherService teacherService;

    //到课程列表
    @RequestMapping("/CLis")
    public String CList(){
        return "component/table/CList";
    }
    //到专业列表
    @RequestMapping("/MList")
    public String MList(){
        return "component/table/MList";
    }
    //到学生列表
    @RequestMapping("/xuesheng")
    public String xue(){
        return "component/table/SList";
    }
    //到选课查询
    @RequestMapping("/xuanke")
    public String xuanke(){
        return "component/table/CSelection";
    }
    //到任课列表
    @RequestMapping("/renke")
    public String renke(){
        return "component/table/TList";
    }

    //提供课程列表数据和查询
    @ResponseBody
    @RequestMapping("/list")
    public Map<String,Object> toList(@RequestParam(value = "page",defaultValue = "1") Integer pageNo,
                                     @RequestParam(value = "limit",defaultValue = "10") Integer pageSize,
                                     @RequestParam(value = "content",required = false) String content){
        Page<Course> page = new Page<Course>(pageNo,pageSize);
        Map<String,Object> map = new HashMap<>();
        if(content == null || content.equals("")){
            courseService.page(page,null);
        }else {
            QueryWrapper<Course> wrapper = new QueryWrapper<Course>();
            wrapper.like("courseName",content)
                    .or().like("courseDesc",content);
            courseService.page(page,wrapper);
        }
        map.put("code",0);
        map.put("msg","");
        map.put("count",page.getTotal());
        map.put("data",page.getRecords());
        System.out.println(page.getRecords());
        return map;
    }

    @RequestMapping("/listPage")
    public String toList(){

        return "course/list";
    }

    @ResponseBody
    @RequestMapping("/delete")
    public boolean delete(Integer id){
        System.out.println(id);

        return  courseService.removeById(id);
    }


    @ResponseBody
    @RequestMapping("/deleteIds")
    public boolean deleteIds(@RequestParam(value = "ids[]") Integer[] ids){
        System.out.println(Arrays.toString(ids));

        return  courseService.removeByIds(Arrays.asList(ids));
    }

    @RequestMapping("/toadd")
    public String toadd(){

        return "course/add";
    }

    @ResponseBody
    @RequestMapping("/add")
    public String add(Course course){
        System.out.println(course);

        return "course/add";
    }

    @RequestMapping("/toedit")
    public String toedit(Integer id, Model model){
        System.out.println(id);

        model.addAttribute("course",courseService.getById(id));

        return "course/edit";
    }

    @ResponseBody
    @RequestMapping("/edit")
    public String edit(Course course){
        System.out.println(course);
        courseService.saveOrUpdate(course);
        return "redirect:/course/toedit?id="+course.getCourseNum();
    }


    @RequestMapping("/statics")
    public String statics(){


        return "course/statics";
    }

    @ResponseBody
    @RequestMapping("/staticsCourse")
    public List<Statistics> staticsCourse(){

        List<Statistics> staList = courseService.staticsSelectCourse();

        return staList;
    }


    //提供专业列表数据和查询
    @ResponseBody
    @RequestMapping("/mlist")
    public Map<String,Object> list(@RequestParam(value="page",defaultValue = "1")Integer pageNo,
                                   @RequestParam(value="limit",defaultValue = "10")Integer pageSize,
                                   @RequestParam(value="content",required = false)String content){
        Page<Major> page1=new Page<Major>(pageNo,pageSize);
        System.out.println(page1);
        Map<String,Object> map = new HashMap<>();
        if(content == null || content.equals("")){
            majorService.page(page1,null);
        }else {
            QueryWrapper<Major> wrapper = new QueryWrapper<Major>();
            wrapper.like("major_name",content)
                    .or().like("major_duidance",content);
            majorService.page(page1,wrapper);
        }
        map.put("code",0);
        map.put("msg","");
        map.put("count",page1.getTotal());
        map.put("data",page1.getRecords());
        return map;
    }
    //
    @ResponseBody
    @RequestMapping("sList")
    public Map<String,Object> list2(@RequestParam(value="page",defaultValue = "1")Integer pageNo,
                                    @RequestParam(value="limit",defaultValue = "10")Integer pageSize,
                                    @RequestParam(value="content",required = false)String content){
        Page<Student> page1=new Page<Student>(pageNo,pageSize);
        System.out.println(page1);
        Map<String,Object> map = new HashMap<>();
        if(content == null || content.equals("")){
            studentService.page(page1,null);
        }else {
            QueryWrapper<Student> wrapper = new QueryWrapper<Student>();
            wrapper.like("name",content)
                    .or().like("sex",content);
            studentService.page(page1,wrapper);
        }
        map.put("code",0);
        map.put("msg","");
        map.put("count",page1.getTotal());
        map.put("data",page1.getRecords());
        return map;
    }
    //选课
    @ResponseBody
    @RequestMapping("cslist")
    public Map<String,Object> list4(@RequestParam(value="page",defaultValue = "1")Integer pageNo,
                                    @RequestParam(value="limit",defaultValue = "10")Integer pageSize,
                                    @RequestParam(value="content",required = false)String content){
        Page<StuCourse> page1=new Page<StuCourse>(pageNo,pageSize);
        System.out.println(page1);
        Map<String,Object> map = new HashMap<>();
        if(content == null || content.equals("")){
            stuCourseService.page(page1,null);
        }else {
            QueryWrapper<StuCourse> wrapper = new QueryWrapper<StuCourse>();
            wrapper.like("course_id",content)
                    .or().like("teacher_id",content);
            stuCourseService.page(page1,wrapper);
        }
        map.put("code",0);
        map.put("msg","");
        map.put("count",page1.getTotal());
        map.put("data",page1.getRecords());
        return map;
    }
    //任课数据
    @ResponseBody
    @RequestMapping("tlist")
    public Map<String,Object> list3(@RequestParam(value="page",defaultValue = "1")Integer pageNo,
                                    @RequestParam(value="limit",defaultValue = "10")Integer pageSize,
                                    @RequestParam(value="content",required = false)String content){
        Page<Teacher> page1=new Page<Teacher>(pageNo,pageSize);
        System.out.println(page1);
        Map<String,Object> map = new HashMap<>();
        if(content == null || content.equals("")){
            teacherService.page(page1,null);
        }else {
            QueryWrapper<Teacher> wrapper = new QueryWrapper<Teacher>();
            wrapper.like("teacherName",content)
                    .or().like("TeacherTitle",content);
            teacherService.page(page1,wrapper);
        }
        map.put("code",0);
        map.put("msg","");
        map.put("count",page1.getTotal());
        map.put("data",page1.getRecords());
        return map;
    }









}

