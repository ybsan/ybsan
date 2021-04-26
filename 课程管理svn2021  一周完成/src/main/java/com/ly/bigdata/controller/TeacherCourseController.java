package com.ly.bigdata.controller;

import com.ly.bigdata.entity.TeacherCourse;
import com.ly.bigdata.service.TeacherCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2021-04-15
 */
@Controller
@RequestMapping("/teach")
public class TeacherCourseController {
    @Autowired
    private TeacherCourseService teacherCourseService;

    @ResponseBody
    @RequestMapping("/toteachlist")
    public Map<String,Object> teachlist(){

        Map<String,Object> map = new HashMap<>();
        List<TeacherCourse> list = teacherCourseService.list();

        map.put("msg","");
        map.put("code",0);
        map.put("count",10);
        map.put("data",list);

        return map;
    }

    @RequestMapping("/teachlist")
    public String toTeachList(Map map) {
        List<TeacherCourse> list = teacherCourseService.list();
        map.put("cols",list);
        return "teach/teachlist";
    }
    @RequestMapping("/toTeachEdit")
    public String teachedit(TeacherCourse teacherCourse){
        teacherCourseService.saveOrUpdate(teacherCourse);
        return "redirect:/teach/teachlist";
    }

    @RequestMapping("/teachedit")
    public String toTeachEdit(Integer id, Model model){
        model.addAttribute("teach",teacherCourseService.getById(id));
        return "teach/teachedit";
    }

    @RequestMapping("/toTeachAdd")
    public String teachadd(){
        return "redirect:/teach/teachlist";
    }

    @RequestMapping("/teachadd")
    public String toTeachAdd(){
        return "teach/teachedit";
    }
    @RequestMapping("/teachdel")
    public String teachdel(Integer id){
        teacherCourseService.removeById(id);
        return "redirect:/teach/teachlist";
    }
}

