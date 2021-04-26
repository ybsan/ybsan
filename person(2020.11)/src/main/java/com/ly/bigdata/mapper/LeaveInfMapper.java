package com.ly.bigdata.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.CheckworkInf;
import com.ly.bigdata.po.LeaveInf;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ly.bigdata.po.SalaryInf;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ybsan
 * @since 2021-03-28
 */
@Repository
public interface LeaveInfMapper extends BaseMapper<LeaveInf> {


    public List<LeaveInf> selectLeaAll(Page<LeaveInf> page, @Param("content") String content);


    public List<LeaveInf> selectLeaById(Integer empId);
}
