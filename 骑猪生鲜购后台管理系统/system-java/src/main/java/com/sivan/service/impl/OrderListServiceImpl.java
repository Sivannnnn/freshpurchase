package com.sivan.service.impl;

import com.sivan.entity.OrderList;
import com.sivan.mapper.OrderListMapper;
import com.sivan.service.OrderListService;
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
public class OrderListServiceImpl extends ServiceImpl<OrderListMapper, OrderList> implements OrderListService {

}
