import { request } from "../../request/index.js";
import { addCarts } from "../../common.js";
Page({
    data: {
        advertising: true, //开屏广告
        time: 5, //倒计时 秒
        message: '欢迎光临骑猪生鲜购！喜欢您来！', // 横幅公告跑马灯信息
        catesList: [], // 分类
        hotWords: '搜索'
    },
    onLoad(options) {
        this.getCate(); // 获取分类
        this.countTime(); // 开启倒计时
        this.getTimeLimit(); //获取限时秒杀信息
        this.getNav1(); // 获取导航栏1内容
        this.loadAdv(); // 载入页面广告
    },
    // 载入页面广告
    loadAdv() {
        wx.hideTabBar(); // 隐藏底部按钮
        this.x = setInterval(() => {
            this.setData({
                time: this.data.time - 1
            })
            if (this.data.time == 0)
                this.jmp()
        }, 1000) //每秒执行一次  
    },
    // 跳过广告
    jmp() {
        this.setData({
            advertising: false
        });
        wx.showTabBar({
            animation: true //动画效果
        });
        clearInterval(this.x); //清除定时器
    },
    // 获取分类信息
    getCate() {
        request({
                url: '/index/cate'
            })
            .then(result => {
                this.setData({
                    catesList: result
                })
            })
    },
    // 跳转到分类
    toClassify(e) {
        let classifyId = e.currentTarget.dataset.id;
        wx.setStorageSync('classifyId',classifyId)
        wx.switchTab({
            url: '../../pages/classify/classify'
        });
    },
    // 获取限时秒杀信息
    getTimeLimit() {
        request({
                url: '/index/timeLimit'
            })
            .then(result => {
                this.setData({
                    timeLimitList: result
                })
            })
    },
    // 限时秒杀倒计时
    countTime() {
        let maxTime = 2 * 60 * 60;
        let timer = setInterval(() => {
            if (maxTime >= 0) {
                let hour = Math.floor(maxTime / 60 / 60);
                let minutes = Math.floor(maxTime / 60 / 2);
                let second = Math.floor(maxTime % 60);
                maxTime--;
                let hour1 = Math.floor(hour / 10);
                let hour2 = Math.floor(hour % 10);
                let minutes1 = Math.floor(minutes / 10);
                let minutes2 = Math.floor(minutes % 10);
                let second1 = Math.floor(second / 10);
                let second2 = Math.floor(second % 10);
                this.setData({
                    hour1,
                    hour2,
                    minutes1,
                    minutes2,
                    second1,
                    second2
                })
            } else {
                clearInterval(timer);
                console.log("已截止");
            }
        }, 1000);
    },
    // 获取导航1信息
    getNav1() {
        request({
                url: '/index/nav1'
            })
            .then(result => {
                this.setData({
                    nav1: result
                })
            })
    },
    // 添加购物车
    add(e){
        addCarts(e.currentTarget.dataset.item)
    }
})