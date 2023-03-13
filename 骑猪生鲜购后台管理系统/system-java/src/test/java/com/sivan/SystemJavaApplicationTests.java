package com.sivan;

import com.sivan.entity.AdminList;
import com.sivan.service.AdminListService;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import javax.annotation.Resource;
import java.util.List;

@SpringBootTest
class SystemJavaApplicationTests {

    @Resource
    private AdminListService adminListService;

    @Test
    void contextLoads() {
        List<AdminList> list = adminListService.list();
        for (AdminList adminList : list) {
            System.out.println(adminList);
        }
    }

}
