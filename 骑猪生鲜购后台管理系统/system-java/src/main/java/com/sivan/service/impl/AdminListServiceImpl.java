package com.sivan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sivan.entity.AdminList;
import com.sivan.mapper.AdminListMapper;
import com.sivan.service.AdminListService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Sivan
 * @since 2022-11-21
 */
@Service
public class AdminListServiceImpl extends ServiceImpl<AdminListMapper, AdminList> implements AdminListService {

    @Override
    public AdminList getByUsername(String username) {
        return this.getOne(new QueryWrapper<AdminList>().eq("username", username));
    }

    @Override
    public String getUserAuthorityInfo(Long userId) {
        return null;
    }
}
