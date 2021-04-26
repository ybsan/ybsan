package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.Teacher;
import com.ly.bigdata.mapper.TeacherMapper;
import com.ly.bigdata.service.TeacherService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
@Service
public class TeacherServiceImp extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<Teacher> findAllTeacher(Page<Teacher> page, String content) {
        if(content!=null&& !"".equals(content)){
            List<Teacher> list=teacherMapper.findAllTeacher(page,"%"+content+"%");
            page.setRecords(list);
            return list;
        }else {
            List<Teacher> list=teacherMapper.findAllTeacher(page,"%");
            page.setRecords(list);
            return list;
        }
    }
}
