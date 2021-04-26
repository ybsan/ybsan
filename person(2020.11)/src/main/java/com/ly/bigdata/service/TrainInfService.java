package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.SalaryInf;
import com.ly.bigdata.po.TrainInf;
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
public interface TrainInfService extends IService<TrainInf> {

    public List<TrainInf> selectTraAll(Page<TrainInf> page, String content);
    public List<TrainInf> selectTraById(Integer empId);
}
