package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.SalaryInf;
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
public interface SalaryInfService extends IService<SalaryInf> {

    public List<SalaryInf> selectSalAll(Page<SalaryInf> page, String content);


    public SalaryInf findSalById(Integer empId) ;
}
