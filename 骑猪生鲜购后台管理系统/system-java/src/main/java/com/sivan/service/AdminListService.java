package com.sivan.service;

import com.sivan.entity.AdminList;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Sivan
 * @since 2022-11-21
 */
public interface AdminListService extends IService<AdminList> {

    AdminList getByUsername(String username);

    String getUserAuthorityInfo(Long userId);

//    void clearUserAuthorityInfo(String username);
//
//    void clearUserAuthorityInfoByRoleId(Long roleId);
//
//    void clearUserAuthorityInfoByRoleMenuId(Long menuId);
}
