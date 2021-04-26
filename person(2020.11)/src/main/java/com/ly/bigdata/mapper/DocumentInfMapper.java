package com.ly.bigdata.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.DocumentInf;
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
public interface DocumentInfMapper extends BaseMapper<DocumentInf> {

    public List<DocumentInf> selectDoAll(Page<DocumentInf> page, @Param("content") String content);

}
