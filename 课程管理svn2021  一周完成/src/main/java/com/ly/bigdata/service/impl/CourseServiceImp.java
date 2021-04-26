package com.ly.bigdata.service.impl;

import com.ly.bigdata.entity.Course;
import com.ly.bigdata.entity.Statistics;
import com.ly.bigdata.mapper.CourseMapper;
import com.ly.bigdata.service.CourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class CourseServiceImp extends ServiceImpl<CourseMapper, Course> implements CourseService {

    @Override
    public List<Statistics> staticsSelectCourse() {
        return baseMapper.staticsSelectCourse();
    }
}
