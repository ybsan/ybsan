package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.EmployeeInf;
import com.ly.bigdata.mapper.EmployeeInfMapper;
import com.ly.bigdata.service.EmployeeInfService;
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
 * @since 2021-03-25
 */
@Service
public class EmployeeInfServiceImpl extends ServiceImpl<EmployeeInfMapper, EmployeeInf> implements EmployeeInfService {


    @Autowired
    private EmployeeInfMapper employeeInfMapper;


    @Override
    public List<EmployeeInf> selectEmployeeAll(Page<EmployeeInf> page, String content) {
        if(content!=null&& !"".equals(content)){
            List<EmployeeInf> list=employeeInfMapper.selectEmployeeAll(page,"%"+content+"%");
            page.setRecords(list);
            return list;
        }else{
            List<EmployeeInf> list=employeeInfMapper.selectEmployeeAll(page,"%");
            page.setRecords(list);
            return list;
        }
    }

    @Override
    public EmployeeInf findEmpById(Integer id) {

        return employeeInfMapper.findEmpById(id);

    }

}
