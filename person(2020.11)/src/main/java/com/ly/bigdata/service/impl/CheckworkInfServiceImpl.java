package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.CheckworkInf;
import com.ly.bigdata.mapper.CheckworkInfMapper;
import com.ly.bigdata.po.NoticeInf;
import com.ly.bigdata.service.CheckworkInfService;
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
public class CheckworkInfServiceImpl extends ServiceImpl<CheckworkInfMapper, CheckworkInf> implements CheckworkInfService {


    @Autowired
 private    CheckworkInfMapper checkworkInfMapper;

    @Override
    public List<CheckworkInf> selectCheckAll(Page<CheckworkInf> page, String content) {

        if(content!=null&& !"".equals(content)){
            List<CheckworkInf> list=checkworkInfMapper.selectCheckAll(page,"%"+content+"%");
            page.setRecords(list);
            return list;
        }else{
            List<CheckworkInf> list=checkworkInfMapper.selectCheckAll(page,"%");
            page.setRecords(list);
            return list;
        }

    }

    @Override
    public CheckworkInf findCheById(Integer empId) {
        return checkworkInfMapper.findCheById(empId);
    }




}
