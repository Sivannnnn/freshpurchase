Page({
    data: {
        // 我的订单
        tabList: [
            { id: 0,title: '全部订单' },
            { id: 1,title: '待付款' },
            { id: 2,title: '待收货' },
            { id: 3,title: '待评价' }
        ],
        TabCur: 0, // 导航栏索引
        // orderList: { }
    },
    onLoad(options){
        // 判断登录是否登录
        this.getUserLogin();
        // 获取订单信息
        this.getOrderList();
        this.setData({TabCur: options.id,})
    },
    // 判断登录是否登录
    getUserLogin(){
        let userInfo = wx.getStorageSync('userInfo');
        if(userInfo.length == 0){
            let info = '请先登录再查看订单！';
            let modal = this.selectComponent('#modal'); // 页面获取自定义组件实例
            modal.showModal(info); // 通过实例调用组件事件
        }else{
            this.setData({ userInfo });
        }
        
    },
    // 获取订单信息
    getOrderList(){
        let orderList = wx.getStorageSync('orderList');
        this.setData({ orderList });
    },
    // 切换导航栏
    tabSelect(e) {
        this.setData({ TabCur: e.currentTarget.dataset.id })
    },
    // 删除订单
    async handleDeleteOrder(e) {
        // 弹窗访问是否删除该商品
        const res = await wx.showModal({ content:'确定要删除该订单么？' });
        if(res.confirm){
            wx.showLoading({
              title: '正在删除',
            })
            setTimeout(() => {
                // 获取传过来的index值
                let {index} = e.currentTarget.dataset;
                // 获取订单数组
                let {orderList} = this.data;
                // 删除该订单
                orderList.splice(index,1);
                this.setData({orderList});
                wx.setStorageSync('orderList', orderList);
                wx.hideLoading()
            }, 1000);
        }
    },
    // 再次购买
    async handleRepayOrder(e) {
        // 获取订单数组
        let {orderList,userInfo} = this.data;
        // 获取传过来的index值
        let {index} = e.currentTarget.dataset;
        // 拿出数组中的总价格、总数量、原价
        let { totalNewPrice,totalOldPrice,totalNum,payOrder } = orderList[index];
        // 嵌套放于第一位
        let order = [{totalNewPrice,totalOldPrice,totalNum}];
        order.push(...orderList[index].payOrder);  
        wx.setStorageSync('payOrder', order);  
        wx.setStorageSync('userInfo', userInfo);   
        wx.navigateTo({
          url: '/pages/payment/payment',
        })
    }
})