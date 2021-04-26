package com.ly.bigdata.mapper;

import com.ly.bigdata.po.DeptInf;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ly.bigdata.vo.DeptNum;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author ybsan
 * @since 2021-03-23
 */
@Repository
public interface DeptInfMapper extends BaseMapper<DeptInf> {


    public List<DeptNum> getDeptNumbers();

}
