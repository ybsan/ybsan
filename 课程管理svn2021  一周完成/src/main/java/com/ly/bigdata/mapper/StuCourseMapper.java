package com.ly.bigdata.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.StuCourse;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
@Repository
public interface StuCourseMapper extends BaseMapper<StuCourse> {

    public List<StuCourse> selectAll(Page<StuCourse> page, @Param("content") String content);

}
