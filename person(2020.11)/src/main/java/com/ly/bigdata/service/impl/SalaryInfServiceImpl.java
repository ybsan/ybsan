package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.ly.bigdata.po.SalaryInf;
import com.ly.bigdata.mapper.SalaryInfMapper;
import com.ly.bigdata.service.SalaryInfService;
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
 * @since 2021-03-26
 */
@Service
public class SalaryInfServiceImpl extends ServiceImpl<SalaryInfMapper, SalaryInf> implements SalaryInfService {
    @Autowired
    private SalaryInfMapper salaryInfMapper;

    @Override
    public List<SalaryInf> selectSalAll(Page<SalaryInf> page, String content) {
        if (content != null && !"".equals(content)) {
            List<SalaryInf> list = salaryInfMapper.selectSalAll(page, "%" + content + "%");
            page.setRecords(list);
            return list;
        } else {
            List<SalaryInf> list = salaryInfMapper.selectSalAll(page, "%");
            page.setRecords(list);
            return list;
        }
    }

    @Override
    public SalaryInf findSalById(Integer empId) {
        return salaryInfMapper.findSalById(empId);
    }
}
