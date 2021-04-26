package com.ly.bigdata.service.impl;

import com.ly.bigdata.entity.Student;
import com.ly.bigdata.mapper.StudentMapper;
import com.ly.bigdata.service.StudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
@Service
public class StudentServiceImp extends ServiceImpl<StudentMapper, Student> implements StudentService {

}
