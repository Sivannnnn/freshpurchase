import {request} from "../../request/index.js";
import { addCarts } from "../../common.js";
Page({
    data: {
        cartsNumber: 0,
    },
    onLoad(options) {
        this.sendSearchRequest(options.value);
        this.getCartsNumber();
    },
    // 获取购物车数量
    getCartsNumber(){
        let cartsNumber = wx.getStorageSync('carts').length;
        this.setData({ cartsNumber })
    },
    // 发送搜索请求
    async sendSearchRequest(value) {
        let res1 = await request({
            url: "/goods/goods_detail?value=" + value
        })
        let res2 = await request({
            url: "/classify/banner"
        })
        let swiper_list = [];
        swiper_list.push(...res1,...res2);
        this.setData({ goods_Info: res1,swiper_list})
    },
    // 点击轮播图 放大
    handlePreviewImage(e){
        // 1 先构造要预览的图片数组
        let urls = this.data.swiper_list.map(v => v.src);
        let arrs = []
        for (const key in urls) {
            arrs.push(urls[key])
        }
        // 2 接收传递过来的图片url
        let current = e.currentTarget.dataset.index;
        wx.previewImage({
            current:urls[current],
            urls
        })
    },
    // 添加购物车
    add(e){
        addCarts(this.data.goods_Info[0]);
        this.getCartsNumber();
    },
    // 立即抢购
    handleBuyNow(){
        // 判断是否登录
        let userInfo = wx.getStorageSync('userInfo');
        if(!userInfo){
            let modal = this.selectComponent('#modal'); // 页面获取自定义组件实例
            let info = '请先登录再进行购物！';
            modal.showModal(info); // 通过实例调用组件事件
        }else{
            // 获取详情数据
            let {goods_Info} = this.data;
            // 生成原价、折后价、总数量
            let totalNewPrice = goods_Info[0].newPrice;
            let totalOldPrice = goods_Info[0].oldPrice;
            let totalNum = 1;
            let payOrder = [{totalNewPrice,totalOldPrice,totalNum}];
            payOrder.push(goods_Info[0]);
            wx.setStorageSync('payOrder', payOrder)
            wx.navigateTo({ url: '/pages/payment/payment' })
        }
    },
})