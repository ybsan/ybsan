package com.ly.bigdata.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.TrainInf;
import com.ly.bigdata.po.TraindataInf;
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
public interface TraindataInfMapper extends BaseMapper<TraindataInf> {


    public List<TraindataInf> selectTrdAll(Page<TraindataInf> page, @Param("content") String content);
}
