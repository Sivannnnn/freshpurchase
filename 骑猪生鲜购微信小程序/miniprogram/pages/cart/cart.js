Page({
    data: {
        cartList: [], //购物车数据
        totalNewPrice: 0, // 总价格
        totalNum: 0, // 总数量
        allChecked: false, // 全选
    },
    onLoad(){
        this.getUserInfo();
    },
    onShow(options) {
        let cartList = wx.getStorageSync('carts');
        this.setData({cartList})
        this.getUserInfo();
    },
    // 获取登录信息
    getUserInfo(){
        let userInfo = wx.getStorageSync('userInfo');
        this.setData({ userInfo });
    },
    // 清空购物车
    async handleClearCarts(){
        // 获取购物车数组
        let {cartList} = this.data;
        // 弹窗访问是否清空购物车
        const res = await wx.showModal({ content:'确定要清空购物车么？' });
        if(res.confirm){
            cartList = []
            this.refreshCart(cartList);
        }
    },
    // 长按删除商品
    handleLongPressDelGood(e){
        // 获取传递过来的参数
        let { id } = e.currentTarget.dataset;
        this.delGood(id)
    },
    // 删除商品
    async delGood(id){
        // 获取购物车数组
        let {cartList} = this.data;
        // 弹窗访问是否删除该商品
        const res = await wx.showModal({ content:'确定要删除该商品么？' });
        if(res.confirm){
            cartList.splice(id,1);
            console.log(cartList);
            this.refreshCart(cartList);
        }
    },
    // 触发事件后 刷新购物车数据
    refreshCart(cartList){
        wx.setStorageSync('carts', cartList);
        let allChecked = true;
        // 1.总价格 总数量
        let totalNewPrice = 0;
        let totalOldPrice = 0;
        let totalNum = 0;
        cartList.forEach(v => {
            if(v.checked){
                v.totalSingleNewPrice = v.num * v.newPrice
                v.totalSingleoldPrice = v.num * v.oldPrice
                totalNewPrice += v.totalSingleNewPrice;
                totalOldPrice += v.totalSingleoldPrice;
                totalNewPrice = Math.floor(totalNewPrice * 100) / 100;
                totalOldPrice = Math.floor(totalOldPrice * 100) / 100;
                totalNum += v.num;
            } else{
                allChecked = false;
            }
        })
        // 判断数组是否为空
        allChecked = cartList.length != 0 ? allChecked :false
        this.setData({ cartList,allChecked,totalNewPrice,totalOldPrice,totalNum })
    },
    // 勾选单个商品
    handleCheckedOne(e){
        // 1. 获取被修改的商品的id
        let { id } = e.currentTarget.dataset;
        // 2. 获取购物车数组
        let { cartList } = this.data;
        // 3. 选中状态取反
        cartList[id].checked = !cartList[id].checked;
        this.refreshCart(cartList);
    },
    // 修改商品数量
    async handleEditNum(e){
        // 1. 获取传递过来的参数
        let { id,type } = e.currentTarget.dataset;
        // 2. 获取购物车数组
        let { cartList } = this.data;
        // 3. 判断修改商品数量的类型：1——加 -1——减
        if(type == 1){
            cartList[id].num++;
            this.refreshCart(cartList);
        }else{
            if(cartList[id].num < 2){
                this.delGood(id);
            }else{
                cartList[id].num--;
                this.refreshCart(cartList);
            }
        }
    },
    // 全选
    checkAll(){
        // 1. 获取data数据
        let {cartList,allChecked} = this.data;
        // 2，修改值————取反
        allChecked = !allChecked;
        // 3. 循环修改cartList数组钟商品被选中的状态
        cartList.forEach(v => v.checked = allChecked)
        // 4. 把修改后的值填充回data或缓存中
        this.refreshCart(cartList)
    },
    // 结算
    async handlePay(){
        // 获取用户信息和购物车数组
        let {userInfo,cartList,totalNewPrice,totalOldPrice,totalNum} = this.data;   
        let modal = this.selectComponent('#modal'); // 页面获取自定义组件实例
        let payOrder = [{totalNewPrice,totalOldPrice,totalNum}];
        cartList.forEach(
            v => {
                if(v.checked === true){
                    payOrder.push(v);
                }
            }
        )
        if(userInfo.length==0){
            let info = '请先登录！';
            modal.showModal(info); // 通过实例调用组件事件
        }else if(totalNewPrice == 0){ 
            let info = '请勾选商品哦';
            modal.showModal(info); // 通过实例调用组件事件
        }else {
            wx.setStorageSync('payOrder', payOrder)
            wx.navigateTo({ url: '/pages/payment/payment'});
        }
    }
})