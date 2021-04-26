package com.ly.bigdata.service;

import com.ly.bigdata.entity.Course;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ly.bigdata.entity.Statistics;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
public interface CourseService extends IService<Course> {

    List<Statistics> staticsSelectCourse();

}
