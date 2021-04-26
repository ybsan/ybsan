package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.StuCourse;
import com.ly.bigdata.mapper.StuCourseMapper;
import com.ly.bigdata.service.StuCourseService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
public class StuCourseServiceImp extends ServiceImpl<StuCourseMapper, StuCourse> implements StuCourseService {

    @Autowired
    private StuCourseMapper stuCourseMapper;

    @Override
    public List<StuCourse> selectAll(Page<StuCourse> page, String content) {
        if(content!=null && !"".equals(content) ){
            List<StuCourse> list=stuCourseMapper.selectAll(page,"%"+content+"%");
            page.setRecords(list);
            return list;
        }else{
            List<StuCourse> list=stuCourseMapper.selectAll(page,"%");
            page.setRecords(list);
            return list;
        }
    }

}
