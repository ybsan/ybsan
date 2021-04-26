package com.ly.bigdata.service.impl;

import com.ly.bigdata.entity.Admin;
import com.ly.bigdata.mapper.AdminMapper;
import com.ly.bigdata.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2021-04-14
 */
@Service
public class AdminServiceImp extends ServiceImpl<AdminMapper, Admin> implements AdminService {

}
