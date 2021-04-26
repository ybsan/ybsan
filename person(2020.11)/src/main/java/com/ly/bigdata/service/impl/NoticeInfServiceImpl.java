package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.EmployeeInf;
import com.ly.bigdata.po.NoticeInf;
import com.ly.bigdata.mapper.NoticeInfMapper;
import com.ly.bigdata.service.NoticeInfService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-26
 */
@Service
public class NoticeInfServiceImpl extends ServiceImpl<NoticeInfMapper, NoticeInf> implements NoticeInfService {


    @Autowired
    private  NoticeInfMapper noticeInfMapper;
    @Override
    public List<NoticeInf> selectNoticeAll(Page<NoticeInf> page, String content) {

        if(content!=null&& !"".equals(content)){
            List<NoticeInf> list=noticeInfMapper.selectNoticeAll(page,"%"+content+"%");
            page.setRecords(list);
            return list;
        }else{
            List<NoticeInf> list=noticeInfMapper.selectNoticeAll(page,"%");
            page.setRecords(list);
            return list;
        }

    }
}
