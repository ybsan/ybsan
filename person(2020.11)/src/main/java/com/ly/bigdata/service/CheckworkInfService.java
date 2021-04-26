package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.CheckworkInf;
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
public interface CheckworkInfService extends IService<CheckworkInf> {


    public List<CheckworkInf> selectCheckAll(Page<CheckworkInf> page, String content);


    public CheckworkInf findCheById(Integer empId) ;

}
