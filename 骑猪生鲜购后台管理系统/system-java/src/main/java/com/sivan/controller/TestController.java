package com.sivan.controller;

import com.sivan.common.lang.Result;
import com.sivan.service.AdminListService;
import com.sivan.service.GoodsListService;
import com.sivan.service.OrderListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @Autowired
    AdminListService adminListService;
//      OrderListService orderListService;

    @GetMapping("/test")
    public Result test() {
        return Result.succ(adminListService.list());
    }

}
