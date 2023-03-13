Page({
    data: {
        userInfo: {}, // 用户数据信息
        // 我的订单
        orderList: [
            { id: 0,title: '全部订单',icon: 'cuIcon-form' },
            { id: 1,title: '待付款',icon: 'cuIcon-send'},
            { id: 2,title: '待收货',icon: 'cuIcon-deliver_fill'},
            { id: 3,title: '待评价',icon: 'cuIcon-evaluate_fill'}
        ]
    },
    onShow(options) {
        let userInfo = wx.getStorageSync('userInfo')
        this.setData({
            userInfo
        })
    },
    // 关于我
    handleAboutMe(){
        let modal = this.selectComponent('#modal'); // 页面获取自定义组件实例
        let info = '骑猪学前端';
        modal.showModal(info); // 通过实例调用组件事件
    }
})