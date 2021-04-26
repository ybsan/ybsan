package com.ly.bigdata.service.impl;

import com.ly.bigdata.po.DeptInf;
import com.ly.bigdata.mapper.DeptInfMapper;
import com.ly.bigdata.service.DeptInfService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ly.bigdata.vo.DeptNum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-23
 */
@Service
public class DeptInfServiceImpl extends ServiceImpl<DeptInfMapper, DeptInf> implements DeptInfService {

    @Autowired
    private DeptInfMapper deptInfMapper;


    @Override
    public List<DeptNum> getDeptNumbers() {
        return deptInfMapper.getDeptNumbers();
    }
}
