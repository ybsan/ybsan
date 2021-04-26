package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.entity.Major;
import com.ly.bigdata.mapper.MajorMapper;
import com.ly.bigdata.service.MajorService;
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
public class MajorServiceImp extends ServiceImpl<MajorMapper, Major> implements MajorService {

    @Autowired
    private MajorMapper mapper;

    @Override
    public List<Major> selectAll(Page<Major> page, String content) {
        if(content!=null&&!"".equals(content)){
            List<Major> list =   mapper.selectAll(page,"%"+content+"%");
            page.setRecords(list);
            return list;
        }else {
            List<Major> list =   mapper.selectAll(page,"%");
            page.setRecords(list);
            return list;
        }
    }
}
