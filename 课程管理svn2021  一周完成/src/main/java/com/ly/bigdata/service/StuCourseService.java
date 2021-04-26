package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.StuCourse;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
public interface StuCourseService extends IService<StuCourse> {

    public List<StuCourse> selectAll(Page<StuCourse> page, @Param("content") String content);

}
