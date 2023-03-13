Component({
    properties: {

    },
    data: {

    },
    methods: {
        showModal(info) {
            this.setData({
              modalName: 'Modal',
              modalInfo: info
            })
        },
        hideModal() {
          let {modalInfo} = this.data;
          this.setData({
            modalName: null
          })
          if(modalInfo == "请先登录再进行收货地址管理！" || modalInfo == "请先登录再查看订单！"){
            wx.navigateBack({delta: 1})
          }
          if(modalInfo == "支付成功"){
            wx.redirectTo({
              url: '/pages/order_detail/order_detail',
            })
          }
        },
    }
})
