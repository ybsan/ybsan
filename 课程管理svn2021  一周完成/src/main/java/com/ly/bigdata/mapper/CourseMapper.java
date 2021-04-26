package com.ly.bigdata.mapper;

import com.ly.bigdata.entity.Course;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ly.bigdata.entity.Statistics;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
public interface CourseMapper extends BaseMapper<Course> {

   List<Statistics> staticsSelectCourse();

}
