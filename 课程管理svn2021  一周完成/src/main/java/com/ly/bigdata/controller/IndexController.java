package com.ly.bigdata.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ly.bigdata.entity.Admin;
import com.ly.bigdata.entity.Student;
import com.ly.bigdata.entity.Teacher;
import com.ly.bigdata.service.AdminService;
import com.ly.bigdata.service.StudentService;
import com.ly.bigdata.service.TeacherService;
import com.ly.bigdata.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class IndexController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private StudentService studentService;

    @RequestMapping("/index")
    public String index() {
        return "index";
    }


    @RequestMapping("/")
    public String toLogin() {
        return "login";
    }

    @RequestMapping("/adminlogin")
    @ResponseBody
    public Object adminlogin(String adminName, String adminPwd, String role, HttpServletRequest request){

        DataGridView dataGridView =new DataGridView();
        HttpSession session = request.getSession();

        switch (role){
            case "Admin":{
                QueryWrapper<Admin> wrapper =new QueryWrapper<Admin>().eq("admin_name",adminName).eq("admin_pwd",adminPwd);
                Admin admin = adminService.getOne(wrapper);
                if(admin!=null){
                    admin.setAdminPwd("");
                    dataGridView.setData(admin);
                    session.setAttribute("type","admin");
                    session.setAttribute("loginName",admin.getAdminName());
                    session.setAttribute("id",admin.getAdminNo());
                    return dataGridView;
                }else {
                    return new DataGridView(0L,"登录失败",null);
                }
            }
            case "Teacher":{
                QueryWrapper<Teacher> wrapper =new QueryWrapper<Teacher>().eq("TeacherName",adminName).eq("TeacherPassword",adminPwd);
                Teacher teacher = teacherService.getOne(wrapper);
                if(teacher!=null){
                    teacher.setTeacherPassword("");
                    dataGridView.setData(teacher);
                    session.setAttribute("type","teacher");
                    session.setAttribute("loginName",teacher.getTeacherName());
                    session.setAttribute("id",teacher.getTeacherNum());

                    return dataGridView;
                }else {
                    return new DataGridView(0L,"登录失败",null);
                }
            }
            case "Student":{
                QueryWrapper<Student> wrapper =new QueryWrapper<Student>().eq("name",adminName).eq("password",adminPwd);
                Student student = studentService.getOne(wrapper);
                if(student!=null){
                    student.setPassword("");
                    session.setAttribute("type","student");
                    session.setAttribute("loginName",student.getName());
                    session.setAttribute("id",student.getId());

                    return new DataGridView(student);
                }else {
                    return new DataGridView(0L,"登录失败",null);
                }
            }
            default:{
                return new DataGridView("登陆失败");
            }
        }
    }
}
