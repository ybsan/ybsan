package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.LeaveInf;
import com.baomidou.mybatisplus.extension.service.IService;


import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-28
 */
public interface LeaveInfService extends IService<LeaveInf> {

    public List<LeaveInf> selectLeaAll(Page<LeaveInf> page, String content);


    public List<LeaveInf> selectLeaById(Integer empId);
}
