package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.ContractInf;
import com.ly.bigdata.mapper.ContractInfMapper;
import com.ly.bigdata.service.ContractInfService;
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
public class ContractInfServiceImpl extends ServiceImpl<ContractInfMapper, ContractInf> implements ContractInfService {

    @Autowired
    private ContractInfMapper contractInfMapper;

    @Override
    public List<ContractInf> selectConAll(Page<ContractInf> page, String content) {
        if (content != null && !"".equals(content)) {
            List<ContractInf> list = contractInfMapper.selectConAll(page, "%" + content + "%");
            page.setRecords(list);
            return list;
        } else {
            List<ContractInf> list = contractInfMapper.selectConAll(page, "%");
            page.setRecords(list);
            return list;
        }
    }

    @Override
    public ContractInf findConById(Integer empId) {
        return contractInfMapper.findConById(empId);
    }
}
