import { request } from "../../request/index.js";
Page({
    data: {
        isFocus: false, // 控制清空按钮 
        hotWord: '鱼', // 热搜
        inpValue: '', // 搜索框内容
        searchData: [], // 搜索结果
        historySearch: [], //历史数据
        isShow: false, // 控制历史搜索 
    },
    onLoad(){
       let historySearch = wx.getStorageSync('historySearch');
       if(historySearch){ this.setData({ historySearch }) }
    },
    // 控制清空按钮
    handleCancel(){
        this.setData({
            isFocus : '!isFocus',
            searchData: [] 
        })
    },
    // 清空输入框内容
    handleClear(){
        console.log(11);
        this.setData({
            inpValue : ''
        })
    },
    timer:-1,
    // 输入文字搜索
    inputFocus(e){
        let {value} = e.detail;
        if(!value.trim()){
            this.setData({
                searchData: [],
                inpValue: ''
            })
            return
        }   
        this.setData({ inpValue:value })  
        clearTimeout(this.timer)
        this.timer = setTimeout(() => {
            this.sendSearchRequest(value)
        }, 1000);
    },
    // 点击搜索
    handleSearch(){
        let value = this.data.inpValue;
        if(!value.trim()){
            value = this.data.hotWord;
        }else{
            let historySearch = this.data.historySearch;
            historySearch.push(value)
            wx.setStorageSync('historySearch', historySearch)
            this.setData({ historySearch,inpValue:value })
        }
        wx.navigateTo({
            url: '/pages/goods_list/goods_list?value=' + value
        });
    },
    // 发送搜索请求
    async sendSearchRequest(value){
        let res = await request({url:"/goods/search?value=" + value })
        // console.log(res);
        this.setData({ searchData : res })
    }
})