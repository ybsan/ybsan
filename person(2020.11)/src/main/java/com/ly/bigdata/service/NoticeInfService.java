package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.NoticeInf;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-26
 */
public interface NoticeInfService extends IService<NoticeInf> {

    public List<NoticeInf> selectNoticeAll(Page<NoticeInf> page,String content);
}
