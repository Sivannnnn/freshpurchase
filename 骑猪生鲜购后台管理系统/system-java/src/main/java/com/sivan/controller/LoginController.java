package com.sivan.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.sivan.common.lang.Const;
import com.sivan.common.lang.Result;
import com.sivan.entity.AdminList;
import com.sivan.entity.request.LoginParam;
import com.sivan.service.AdminListService;
import com.sivan.utils.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
public class LoginController {

    @Resource
    private AdminListService adminListService;

    @Autowired
    RedisUtil redisUtil;

    @PostMapping("/login")
    public Result login(LoginParam loginParam) {
        String username = loginParam.getUsername();
        QueryWrapper<AdminList> queryWrapper =
                new QueryWrapper<AdminList>().eq("username", username);
        AdminList one = adminListService.getOne(queryWrapper);
        if(one == null) {
            return Result.fail("登录失败");
        }
        String code = loginParam.getCode();
        String token = loginParam.getToken();
        String hget = (String) redisUtil.hget(Const.CAPTCHA_KEY, token);
        if(!code.equals(hget)) {
            return Result.fail("验证码错误");
        }
        System.out.println(one);
        return Result.succ(one);
    }

//    @GetMapping("/getadmininfo")
//    public Result getadmininfo() {
//        List<AdminList> list = adminListService.list();
//        return Result.succ(list);
//    }

}
