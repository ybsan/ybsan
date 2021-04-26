package com.ly.bigdata.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.EmployeeInf;
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
 * @since 2021-03-25
 */
@Repository
public interface EmployeeInfMapper extends BaseMapper<EmployeeInf> {


  public List<EmployeeInf> selectEmployeeAll(Page<EmployeeInf> page,@Param("content") String content);

  public  EmployeeInf findEmpById(Integer id) ;
}
