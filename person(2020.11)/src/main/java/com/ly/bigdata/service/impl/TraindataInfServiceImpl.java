package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.mapper.TrainInfMapper;
import com.ly.bigdata.po.TrainInf;
import com.ly.bigdata.po.TraindataInf;
import com.ly.bigdata.mapper.TraindataInfMapper;
import com.ly.bigdata.service.TraindataInfService;
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
public class TraindataInfServiceImpl extends ServiceImpl<TraindataInfMapper, TraindataInf> implements TraindataInfService {

    @Autowired
    private TraindataInfMapper traindataInfMapper;

    @Override
    public List<TraindataInf> selectTrdAll(Page<TraindataInf> page, String content) {
        if (content != null && !"".equals(content)) {
            List<TraindataInf> list = traindataInfMapper.selectTrdAll(page, "%" + content + "%");
            page.setRecords(list);
            return list;
        } else {
            List<TraindataInf> list = traindataInfMapper.selectTrdAll(page, "%");
            page.setRecords(list);
            return list;
        }
    }
}
