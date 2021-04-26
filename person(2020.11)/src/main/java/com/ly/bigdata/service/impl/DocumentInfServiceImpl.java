package com.ly.bigdata.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.ly.bigdata.po.DocumentInf;
import com.ly.bigdata.mapper.DocumentInfMapper;
import com.ly.bigdata.service.DocumentInfService;
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
public class DocumentInfServiceImpl extends ServiceImpl<DocumentInfMapper, DocumentInf> implements DocumentInfService {

    @Autowired
    private DocumentInfMapper documentInfMapper;

    @Override
    public List<DocumentInf> selectDoAll(Page<DocumentInf> page, String content) {

        if(content!=null&& !"".equals(content)){
            List<DocumentInf> list=documentInfMapper.selectDoAll(page,"%"+content+"%");
            page.setRecords(list);
            return list;
        }else{
            List<DocumentInf> list=documentInfMapper.selectDoAll(page,"%");
            page.setRecords(list);
            return list;
        }

    }


}
