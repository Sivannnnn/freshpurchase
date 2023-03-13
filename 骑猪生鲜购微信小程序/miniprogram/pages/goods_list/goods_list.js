import {request} from "../../request/index.js";
import { addCarts } from "../../common.js";
Page({
    data: {
        tabList: [
            { id: 0, title: '综合'},
            { id: 1, title: '销量'},
            { id: 2, title: '价格', icon1: 'cuIcon-fold', icon2: 'cuIcon-unfold'
            },
        ],
        TabCur: 0, // 导航栏索引
        goods_list: [], // 商品数据
        hotWords: '', // 搜索结果
        sort_list: [], // 最后展示的排列顺序
        cangotop: false,
    },
    onLoad(options) {
        console.log(options.value);
        if(options.value === "饮料酒水"){
            this.sendBeveragesRequest();
        }else{
            this.sendSearchRequest(options.value)
        }
        this.setData({
            hotWords: options.value
        })
    },
    // 切换导航栏
    tabSelect(e) {
        let {id} = e.currentTarget.dataset;
        let {tabList,goods_list} = this.data;
        let {icon1,icon2} = tabList[2];
        let icon1Str = 'tabList[2].icon1';
        let icon2Str = 'tabList[2].icon2';
        if (id == 0) {
            console.log('综合排序');
            console.log(this.data.goods_list);
            this.setData({
                [icon1Str]: 'cuIcon-fold text-white',
                [icon2Str]: 'cuIcon-unfold text-white',
                sort_list: JSON.parse(JSON.stringify(this.data.goods_list))
            })
        } else if (id == 1) {
            console.log('销量排序');

            this.setData({
                [icon1Str]: 'cuIcon-fold text-white',
                [icon2Str]: 'cuIcon-unfold text-white'
            })
            this.sortBySales();
        } else {
            if (tabList[2].icon1 == "cuIcon-fold text-black") {
                console.log('降序');
                this.setData({
                    [icon1Str]: 'cuIcon-fold text-white',
                    [icon2Str]: 'cuIcon-unfold text-black'
                });
                this.sortByPricDesc();
            } else {
                console.log('升序');
                this.setData({
                    [icon1Str]: 'cuIcon-fold text-black',
                    [icon2Str]: 'cuIcon-unfold text-white'
                })
                this.sortByPriceAsc();
            }
        }
        this.setData({
            TabCur: id
        })
    },
    // 发送搜索请求
    async sendSearchRequest(value) {
        let res = await request({
            url: "/goods/search?value="+value
        })
        console.log("搜索请求")
        this.setData({
            goods_list: JSON.parse(JSON.stringify(res)),
            sort_list: res
        })
    },
    // 发送搜索饮料酒水内容请求
    async sendBeveragesRequest() {
        let res = await request({
            url: "/goods/goods_detail/beverages"
        });
        this.setData({
            goods_list: JSON.parse(JSON.stringify(res)),
            sort_list: res
        })
    },
    // 销量排序
    sortBySales(){
        let sort_list = this.data.sort_list;
        let temp;
        for (let i = 0; i < sort_list.length - 1; i++) {
            for (let j = 0; j < sort_list.length - 1; j++) {
                if (sort_list[j].sales > sort_list[j+1].sales) {
                    temp = sort_list[j];
                    sort_list[j] = sort_list[j+1];
                    sort_list[j+1] = temp;
                }
            }
        }
        this.setData({sort_list: sort_list})
    },
    // 价格升序
    sortByPriceAsc() {
        let sort_list = this.data.sort_list;
        let temp;
        for (let i = 0; i < sort_list.length - 1; i++) {
            for (let j = 0; j < sort_list.length - 1; j++) {
                if (sort_list[j].newPrice > sort_list[j+1].newPrice) {
                    temp = sort_list[j];
                    sort_list[j] = sort_list[j+1];
                    sort_list[j+1] = temp;
                }
            }
        }
        this.setData({sort_list: sort_list})
    },
    // 价格降序
    sortByPricDesc() {
        let sort_list = this.data.sort_list;
        let temp;
        for (let i = 0; i < sort_list.length - 1; i++) {
            for (let j = 0; j < sort_list.length - 1; j++) {
                if (sort_list[j].newPrice < sort_list[j+1].newPrice) {
                    temp = sort_list[j];
                    sort_list[j] = sort_list[j+1];
                    sort_list[j+1] = temp;
                }
            }
        }
        this.setData({sort_list: sort_list})
    },
    // 滚动条滚动
    scrolltoupper(e){
        if(e.detail.scrollTop > 600 ){
            this.setData({ cangotop: true })
        }
        if(e.detail.scrollTop <500 ){
            this.setData({ cangotop: false })
        }
    },
    // 回到顶部
    handleToTop(){
        this.setData({ topNum:0 })
    },
    // 添加购物车
    add(e){
        addCarts(e.currentTarget.dataset.item)
    },
})