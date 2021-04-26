package com.ly.bigdata.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.EmployeeInf;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-25
 */
public interface EmployeeInfService extends IService<EmployeeInf> {
    public List<EmployeeInf> selectEmployeeAll(Page<EmployeeInf> page,String content);

    public  EmployeeInf findEmpById(Integer id) ;
}
