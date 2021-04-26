package com.ly.bigdata.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.Department;
import com.ly.bigdata.entity.Major;
import com.ly.bigdata.service.DepartmentService;
import com.ly.bigdata.service.MajorService;
import com.ly.bigdata.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/major")
public class MajorController {

    @Autowired
    private MajorService majorService;
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/majorlist")
    public String majorlist() {
        return "/Major/Majorlist";
    }

    @RequestMapping("/tomajorlist")
    @ResponseBody
    public Object tomajorlist(String content, Integer page, Integer limit) {
        DataGridView dataGridView = new DataGridView();
        dataGridView.setLimit(limit);
        dataGridView.setPage(page);
        Page<Major> majorPage = new Page<Major>(page, limit);
        majorService.selectAll(majorPage, content);
        dataGridView.setData(majorPage.getRecords());
        dataGridView.setCount(majorPage.getTotal());
        return dataGridView;
//        if (content != null & !"".equals(content)) {
//            QueryWrapper<Major> wrapper = new QueryWrapper<Major>().like("major_name", "%" + content + "%");
//            Page<Major> majorPage = new Page<Major>(page, limit);
//            majorService.page(majorPage, wrapper);
//            dataGridView.setData(majorPage.getRecords());
//            dataGridView.setCount(majorPage.getTotal());
//            return dataGridView;
//        } else {
//            Page<Major> majorPage = new Page<Major>(page, limit);
//            majorService.page(majorPage, null);
//            dataGridView.setData(majorPage.getRecords());
//            dataGridView.setCount(majorPage.getTotal());
//
//            return dataGridView;
//        }

    }

    @RequestMapping("/addedit")
    @ResponseBody
    public Object addedit(Major major) {
        System.out.println(major.getMajorId());
        majorService.saveOrUpdate(major);

        return new DataGridView("修改成功");


    }


    @RequestMapping("/add")
    @ResponseBody
    public Object add(Major major) {
        System.out.println(major.getMajorId());
        majorService.save(major);
        return new DataGridView("添加成功");

    }

    @RequestMapping("/del")
    @ResponseBody
    public Object del(Integer id) {
        majorService.removeById(id);
        return new DataGridView("删除成功");
    }

    @RequestMapping("/dept")
    @ResponseBody
    public Object dept() {
        List<Department> list = departmentService.list();
        return new DataGridView(list);
    }

}