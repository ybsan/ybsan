package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.ly.bigdata.po.LeaveInf;
import com.ly.bigdata.mapper.LeaveInfMapper;
import com.ly.bigdata.service.LeaveInfService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ybsan
 * @since 2021-03-28
 */
@Service
public class LeaveInfServiceImpl extends ServiceImpl<LeaveInfMapper, LeaveInf> implements LeaveInfService {
    @Autowired
    private LeaveInfMapper leaveInfMapper;

    @Override
    public List<LeaveInf> selectLeaAll(Page<LeaveInf> page, String content) {
        if (content != null && !"".equals(content)) {
            List<LeaveInf> list = leaveInfMapper.selectLeaAll(page, "%" + content + "%");
            page.setRecords(list);
            return list;
        } else {
            List<LeaveInf> list = leaveInfMapper.selectLeaAll(page, "%");
            page.setRecords(list);
            return list;
        }
    }

    @Override
    public List<LeaveInf> selectLeaById(Integer empId) {
        return leaveInfMapper.selectLeaById(empId);
    }
}
