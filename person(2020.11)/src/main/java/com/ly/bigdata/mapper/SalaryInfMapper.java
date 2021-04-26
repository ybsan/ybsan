package com.ly.bigdata.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.EmployeeInf;
import com.ly.bigdata.po.SalaryInf;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ybsan
 * @since 2021-03-26
 */
@Repository
public interface SalaryInfMapper extends BaseMapper<SalaryInf> {

    public List<SalaryInf> selectSalAll(Page<SalaryInf> page, @Param("content") String content);

    public SalaryInf findSalById(Integer empId) ;
}
