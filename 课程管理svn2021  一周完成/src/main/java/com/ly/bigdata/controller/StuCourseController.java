package com.ly.bigdata.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.Course;
import com.ly.bigdata.entity.StuCourse;
import com.ly.bigdata.entity.Student;
import com.ly.bigdata.service.CourseService;
import com.ly.bigdata.service.StuCourseService;
import com.ly.bigdata.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/stucourse")
public class StuCourseController {

    @Autowired
    private StuCourseService stuCourseService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private StudentService studentService;

    @RequestMapping("/studata")
    @ResponseBody
    public Object stulist(@RequestParam(value = "page", defaultValue = "1") Integer pageNum,
                          @RequestParam(value = "limit", defaultValue = "6") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content){

        Page<Course> page = new Page<Course>(pageNum,pageSize);

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

        return map;
    }

    @RequestMapping("/list")
    public String toList(){
        return "student/list";
    }

    @RequestMapping("/checkcourse")
    @ResponseBody
    public String usercourse(Integer courseId,String name){
        QueryWrapper<Student> stuwrapper=new QueryWrapper<>();
        stuwrapper.eq("name",name);
        Student student=studentService.getOne(stuwrapper);
        StuCourse stuCourse=new StuCourse();
        stuCourse.setCourseId(courseId);
        stuCourse.setStuId(student.getId());
        QueryWrapper<StuCourse> wrapper=new QueryWrapper<>();
        wrapper.eq("stu_id",stuCourse.getStuId()).eq("course_id",stuCourse.getCourseId());
        StuCourse course=stuCourseService.getOne(wrapper);
        if (course!=null){
            return "已选择该课程";
        }else {
            stuCourseService.save(stuCourse);
            return "选择成功";
        }

    }

    @RequestMapping("/drop")
    @ResponseBody
    public String drop(String courseName,String name){

        QueryWrapper<Course> cwrapper = new QueryWrapper<>();
        cwrapper.eq("CourseName", courseName);
        Course c=courseService.getOne(cwrapper);

        QueryWrapper<Student> swrapper = new QueryWrapper<>();
        swrapper.eq("name", name);
        Student s=studentService.getOne(swrapper);


        QueryWrapper<StuCourse> wrapper=new QueryWrapper<>();
        wrapper.eq("stu_id",s.getId()).eq("course_id",c.getCourseNum());
        StuCourse course=stuCourseService.getOne(wrapper);
        if (course!=null){
            stuCourseService.remove(wrapper);
            return "退课成功";
        }else {
            return "退课失败";
        }

    }

    @RequestMapping("/checkeddata")
    @ResponseBody
    public Object checkeddata(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                          @RequestParam(value = "pageSize", defaultValue = "6") Integer pageSize,
                          @RequestParam(value = "content", required = false) String content){

        Page<StuCourse> page=new Page<>(pageNum,pageSize);
        stuCourseService.selectAll(page,content);
        Map<String,Object> map = new HashMap<>();

        map.put("code",0);
        map.put("msg","");
        map.put("count",page.getTotal());
        map.put("data",page.getRecords());

        return map;
    }



    @RequestMapping("/checked")
    public String checked() {
        return "student/checked";
    }



}
