package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.ContractInf;
import com.baomidou.mybatisplus.extension.service.IService;
import com.ly.bigdata.po.SalaryInf;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-26
 */
public interface ContractInfService extends IService<ContractInf> {

    public List<ContractInf> selectConAll(Page<ContractInf> page, String content);

    public ContractInf findConById(Integer empId) ;
}
