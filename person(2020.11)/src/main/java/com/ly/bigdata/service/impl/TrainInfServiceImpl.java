package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.mapper.SalaryInfMapper;
import com.ly.bigdata.po.SalaryInf;
import com.ly.bigdata.po.TrainInf;
import com.ly.bigdata.mapper.TrainInfMapper;
import com.ly.bigdata.service.TrainInfService;
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
 * @since 2021-03-29
 */
@Service
public class TrainInfServiceImpl extends ServiceImpl<TrainInfMapper, TrainInf> implements TrainInfService {

    @Autowired
    private TrainInfMapper trainInfMapper;



    @Override
    public List<TrainInf> selectTraAll(Page<TrainInf> page, String content) {

        if (content != null && !"".equals(content)) {
            List<TrainInf> list = trainInfMapper.selectTraAll(page, "%" + content + "%");
            page.setRecords(list);
            return list;
        } else {
            List<TrainInf> list = trainInfMapper.selectTraAll(page, "%");
            page.setRecords(list);
            return list;
        }
    }

    @Override
    public List<TrainInf> selectTraById(Integer empId) {
        return trainInfMapper.selectTraById(empId);
    }
}
