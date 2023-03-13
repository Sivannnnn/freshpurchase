Page({
    data: {
        isUseWechatPayment: true, //是否使用微信支付
        remarks:'', // 备注
        deliveryTimeArray: [], // 预计时间列表
        index: 0, // 用户设置日期的索引
        // 相关配置
        aboutSetting:[
            { 
                id: 0,title: '联系不上放门口', description: '联系不上时，可直接放门口；疫情或小区管控可放自提点。',isChecked: false,
                info:{
                    title:'联系不上放门口',
                    introduce:{
                        title:'服务介绍：',
                        description:'开启后，当骑手联系不上您时，把订单放在门口（若小区管控或疫情，将放自提点），避免带回仓库二次配送，耽误您收货。'
                    },
                    other:{
                        title:'其他说明：',
                        description:'若有指定其他放置位置，建议使用备注进行说明，如前台/电梯口货架...'
                    }
                }
            },
            { 
                
                id: 1,title: '号码保护', description: '选择后，将对骑手隐藏您的真实手机号',isChecked: false,
                info:{
                    title:'号码保护',
                    introduce:{
                        title:'服务介绍：',
                        description:'对骑手隐藏您的真实手机号、保护您的隐私。'
                    },
                    other:{
                        title:'其他说明：',
                        description:'号码保护服务不会向您额外收费，费用由骑猪承担。'
                    }
                }
            }
        ],
    },
    onShow() {
        // 获取当前时间
        this.getDeliveryTime();
        // 获取缓存的订单数据、用户信息、收货地址信息、订单信息
        let payOrder = wx.getStorageSync('payOrder');
        let userInfo = wx.getStorageSync('userInfo');
        let address  = wx.getStorageSync('address');
        let orderList  = wx.getStorageSync('orderList') || [];
        // 操作订单信息获取总数量和总额
        let {totalNewPrice,totalOldPrice,totalNum} = payOrder[0];
        payOrder.shift();
        this.setData({ totalNewPrice,totalOldPrice,totalNum,payOrder,userInfo,address,orderList })
    },
    // 获取当前时间
    getDeliveryTime(){
        let timestamp = Date.parse(new Date());
        let date = new Date(timestamp);
        let hours = date.getHours();
        let nextHours = hours + 1;
        let minutes = date.getMinutes() + 30;
        let deliveryTime;  // 尽快送达预计时间
        let judge = hours / 10; // 用于判断小时是否为个位数
        if(judge < 1){hours = '0' + hours;}
        if(minutes >= 60){
            minutes = minutes % 60; // 取模运算
            let judge = minutes / 10; // 用于判断分钟是否为个位数
            if(judge < 1){minutes = '0' + minutes;}
            deliveryTime = "【尽快到达】 预计" + nextHours + ":" + minutes;
        }else{
            deliveryTime = "【尽快到达】 预计" + hours + ":" + minutes;
        }
        let {deliveryTimeArray} = this.data;
        deliveryTimeArray.push(deliveryTime);
        let timeInterval = 24 - hours;  // 计算当前时间点到24点还有多少个小时
        hours++;
        for (let i = 1; i < timeInterval; i++) {
            nextHours = hours+1;
            let otherDeliveryTime = hours + ":00 -- " + nextHours + ":00";
            hours++;
            deliveryTimeArray.push(otherDeliveryTime);
        }
        this.setData({deliveryTime,deliveryTimeArray});
    },
    // 修改送达时间
    handleChangeDeliveryTime(e){
        // 获取当前时间
        let { deliveryTime,deliveryTimeArray } = this.data;
        // 获取索引
        let value = parseInt(e.detail.value);
        this.setData({ deliveryTime : deliveryTimeArray[value] });
    },
    // 输入备注信息
    writeRemarks(e){
        // 获取备注信息
        let {remarks} = this.data;
        // 获取文本框内容
        let {value} = e.detail;
         // 页面获取自定义组件实例
        let modal = this.selectComponent('#modal');
        // 判断输入的内容是否大于100字
        if(value.length > 100){
            let info = '备注不能超过100字！';
            modal.showModal(info); // 通过实例调用组件事件
            value = remarks;
        }
        this.setData({ remarks:value })
    },
    // 修改支付方式
    handleChangePayStyle(){
        let { isUseWechatPayment } = this.data;
        this.setData({ isUseWechatPayment: !isUseWechatPayment })
    },
    // 打开模态窗
    showModal(e){
        let { info } = e.currentTarget.dataset
         // 页面获取自定义组件实例
        let aboutModal = this.selectComponent('#aboutModal');
         // 通过实例调用组件事件
        aboutModal.showModal(info);
    },
    // 支付
    handlePay(){
        // 获取数据
        let { totalNewPrice,totalOldPrice,totalNum,address,deliveryTime,payOrder,isUseWechatPayment,remarks,aboutSetting,orderList} = this.data;
        // 获取购物车数据
        let carts = wx.getStorageSync('carts')
         // 页面获取自定义组件实例
        let modal = this.selectComponent('#modal');
        let loadingModal = this.selectComponent('#loadingModal');
        if(isUseWechatPayment == false){
            let info = '请选择支付方式！';
             // 通过实例调用组件事件
            modal.showModal(info);
        }else if(address.length == 0){
            let info = '请选择填写收货地址！';
             // 通过实例调用组件事件
            modal.showModal(info);
        }else{
            let userInfo = '正在支付';// 通过实例调用组件事件
            loadingModal.showLoadModal(userInfo);
            setTimeout(()=> {
              // 删除支付在购物车里的数据
              let newCarts = carts.filter(v => v.checked === false);
              wx.setStorageSync('carts', newCarts);
              // 创建订单
              let order = { totalNewPrice,totalOldPrice,totalNum,address,deliveryTime,payOrder,isUseWechatPayment,remarks,aboutSetting,}
              orderList.push(order);
              wx.setStorageSync('orderList', orderList);
              wx.setStorageSync('order', order);
              loadingModal.hiddenLoadModal();
              let info = '支付成功';
              // 通过实例调用组件事件
              modal.showModal(info);
            }, 2000)
        }
    }
})