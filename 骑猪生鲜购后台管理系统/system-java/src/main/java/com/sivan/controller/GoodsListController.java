package com.sivan.controller;


import com.sivan.common.lang.Result;
import com.sivan.entity.AdminList;
import com.sivan.entity.GoodsList;
import com.sivan.service.AdminListService;
import com.sivan.service.GoodsListService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Sivan
 * @since 2022-11-21
 */
@RestController
public class GoodsListController extends BaseController {

    @Resource
    private GoodsListService goodsListService;

    @GetMapping("/getgoodsinfo")
    public Result getgoodsinfo() {
        List<GoodsList> list = goodsListService.list();
        return Result.succ(list);
    }
}
