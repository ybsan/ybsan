package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.DocumentInf;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-26
 */
public interface DocumentInfService extends IService<DocumentInf> {
    public List<DocumentInf> selectDoAll(Page<DocumentInf> page, String content);
}
