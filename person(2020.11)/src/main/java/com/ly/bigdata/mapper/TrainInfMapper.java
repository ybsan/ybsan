package com.ly.bigdata.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.ly.bigdata.po.TrainInf;
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
 * @since 2021-03-29
 */
@Repository
public interface TrainInfMapper extends BaseMapper<TrainInf> {


    public List<TrainInf> selectTraAll(Page<TrainInf> page, @Param("content") String content);

    public List<TrainInf> selectTraById(Integer empId);

}
