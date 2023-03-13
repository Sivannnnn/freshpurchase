const Mock = require('mockjs');
const Random = Mock.Random;

let Result = {
    code: 200,
    msg: '操作成功',
    data: null
}

Mock.mock(RegExp('/getcaptcha'),'get',() => {
    Result.data = {
        token: Random.string(32),
        captchaImg: Random.dataImage('120x40','6nfu')
    }
    return Result;
})

Mock.mock(RegExp('/login*'), 'post', () => {
    return Result;
})

Mock.mock('/logout', 'post', () => {
    return Result;
})

Mock.mock('/getgoodscategory', 'get', () => {
    Result.data = [{
        type: 'pie',
        roseType: 'area',
        data: [
            {value: 6, name: '为你推荐'},
            {value: 12, name: '超低折扣'},
            {value: 10, name: '新品上架'},
            {value: 5, name: '水果鲜花'},
            {value: 8, name: '蔬菜豆制品'},
            {value: 7, name: '肉禽蛋'},
            {value: 12, name: '海鲜水产'},
            {value: 13, name: '乳品烘培'},
            {value: 7, name: '冻品面点'},
            {value: 10, name: '粮油调味'},
            {value: 7, name: '酒水饮料'},
            {value: 9, name: '休闲零食'},
            {value: 11, name: '熟食预制菜'},
            {value: 6, name: '打边炉'},
            {value: 9, name: '方便速食'},
            {value: 7, name: '纸品家清'},
            {value: 8, name: '家居百货'},
            {value: 4, name: '个护母婴'},
        ]
    }];
    return Result;
})

Mock.mock('/getgoodssales', 'get', () => {
    Result.data = [
        {
            data: [131, 183, 131, 170, 39, 159, 157, 71, 42, 79, 59, 35],
            name: "2020",
            type: "line"
        },
        {
            data: [75, 56, 143, 181, 9, 188, 3, 84, 100, 166, 166, 155],
            name: "2021",
            type: "line"
        },
        {
            data: [99, 135, 110, 122, 111, 156, 126, 89, 14, 86, 68, 118],
            name: "2022",
            type: "line"
        }
    ];
    return Result;
})

Mock.mock('/getgoodsinfo', 'get', () => {
    Result.data = [
        {
            id: 0,
            title: '泰国香水椰青单粒800g起',
            src: 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E6%B3%B0%E5%9B%BD%E6%A4%B0%E9%9D%92.png?versionId=CAEQBxiBgID84pD0oBgiIDJiMGFkZjdkYzM4ZDRiZDU4ZDhhNzQ3ZWFhNzlkYWI3',
            newPrice: 8.80,
            oldPrice: 13.90,
            classify_id: 0,
            sales: 77
        },
        {
            id: 1,
            title: '上海青 300g',
            src: 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E4%B8%8A%E6%B5%B7%E9%9D%92.png?versionId=CAEQBxiBgMDr4pD0oBgiIDExYzU5MWVhYjJkYjRjZjU4YjBlNjY0NDhkOGI0NWM3',
            newPrice: 1.98,
            oldPrice: 5.59,
            classify_id: 0,
            sales: 154
        },
        {
            id: 2,
            title: '绿色和美精选鸡腿肉 330g',
            src: 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E9%B8%A1%E8%85%BF%E8%82%89.png?versionId=CAEQBxiBgMD94pD0oBgiIGFiOWY4MmRkOTA0MzQxYTQ4ODYzNmQyNTNkMjBkNzE3',
            newPrice: 9.90,
            oldPrice: 14.80,
            classify_id: 0,
            sales: 16
        },
        {
            id: 3,
            title: '罗非鱼 1条400g起',
            src: 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E7%BD%97%E9%9D%9E%E9%B1%BC.png?versionId=CAEQBxiBgICa45D0oBgiIDEwZjE3N2U1ZTkwNTRiOTlhNGI0NjVlZDkyNTcyZWY1',
            newPrice: 9.90,
            oldPrice: 10.80,
            classify_id: 0,
            sales: 38
        },
        {
            id: 4,
            title: '大杏鲍菇约 250g',
            src: 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E5%A4%A7%E6%9D%8F%E9%B2%8D%E8%8F%87.png?versionId=CAEQBxiBgIDV36H0oBgiIGJhNWUzZTRiZmRlNzQyMWY5NzFlNTMxMDBiODI1OWYy',
            newPrice: 3.99,
            oldPrice: 4.99,
            classify_id: 0,
            sales: 87
        },
        {
            id: 5,
            title: '精选香葱约 50g',
            src: 'https://fresh-supermarket.oss-cn-shenzhen.aliyuncs.com/classify/content/为你推荐/%E7%B2%BE%E9%80%89%E9%A6%99%E8%91%B1.png?versionId=CAEQBxiBgICa36H0oBgiIDhhNTNlY2JhYWZjODQzMGQ5MjFhYTYyYjU0MTlmODZi',
            newPrice: 0.98,
            oldPrice: 2.19,
            classify_id: '0',
            sales: 180
        },
    ];
    return Result;
})

Mock.mock('/getadmininfo', 'get', () => {
    Result.data = [
        {
            id: 0,
            username: 'admin',
            password: 'asdmin',
            avatarUrl: 'https://tuchuangs.com/imgs/2022/11/20/38d3952f6aabeb88.jpg'
        },
        {
            id: 1,
            username: 'root',
            password: 'root',
            avatarUrl: 'https://tuchuangs.com/imgs/2022/11/20/38d3952f6aabeb88.jpg'
        },
        {
            id: 2,
            username: 'Sivan',
            password: 'qwer1234',
            avatarUrl: 'https://tuchuangs.com/imgs/2022/11/20/38d3952f6aabeb88.jpg'
        },
    ];
    return Result;
})

Mock.mock('/getorderinfo', 'get', () => {
    Result.data = [
        {
            id: 0,
            orderNumber: '21qw31qwe1',
            name: '李先生',
            telNumber: '110110110',
            address: '广州南方学院',
            createTime: '2022-11-17 09:08:35'
        },
        {
            id: 1,
            orderNumber: '21qw31qwe1',
            name: '方女士',
            telNumber: '1234567894',
            address: '中山大学南方学院',
            createTime: '2022-11-18 18:26:49'
        },
        {
            id: 3,
            orderNumber: 'cgzftmb5v3',
            name: '陈先生',
            telNumber: '987654321',
            address: '广州市从化区广州南方学院',
            createTime: '2022-11-17 15:52:14'
        },
    ];
    return Result;
})