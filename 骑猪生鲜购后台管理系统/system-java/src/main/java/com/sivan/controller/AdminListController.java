package com.sivan.controller;


import com.sivan.common.lang.Result;
import com.sivan.entity.AdminList;
import com.sivan.service.AdminListService;
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
public class AdminListController extends BaseController {

    @Resource
    private AdminListService adminListService;

    @GetMapping("/getadmininfo")
    public Result getadmininfo() {
        List<AdminList> list = adminListService.list();
        return Result.succ(list);
    }
}
