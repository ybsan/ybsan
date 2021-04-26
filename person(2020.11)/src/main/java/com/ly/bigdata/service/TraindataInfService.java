package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.TrainInf;
import com.ly.bigdata.po.TraindataInf;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-29
 */
public interface TraindataInfService extends IService<TraindataInf> {

    public List<TraindataInf> selectTrdAll(Page<TraindataInf> page, String content);
}
