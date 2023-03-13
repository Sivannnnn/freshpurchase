Page({
    data: {

    },
    onLoad(options) {
        let order = wx.getStorageSync('order');
        this.setData({ ...order })
    },
    // 再次购买
    repay(){
        wx.navigateTo({
            url: '/pages/payment/payment',
        })
    },
    // 未开放
    unopen(){
        let modal = this.selectComponent('#modal'); // 页面获取自定义组件实例
        let info = '该功能暂未开放噢';
        modal.showModal(info); // 通过实例调用组件事件
    }
})