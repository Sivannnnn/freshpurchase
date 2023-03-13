Page({
    data: {
        appro_address: '', // 大概地址
        detail_address: '', //详细地址
        receiver: '', // 收货人
        sex: true, // true为男士 false为女士
        tel_number: '', // 电话号码
    },
    onLoad(options) {
        let modifyIndex = options.index;
        if (modifyIndex) {
            let modifyAddress = wx.getStorageSync('modifyAddress');
            console.log(modifyAddress);
            this.setData({
                modifyIndex,
                ...modifyAddress
            })
        }
    },
    onShow() {
        // 获取收货地址信息
        let address_list = wx.getStorageSync('address_list') || [];
        this.setData({
            address_list
        });
    },
    onHide() {
        wx.removeStorageSync('modifyAddress')
    },
    // 打开地图获取用户地理信息
    openMap() {
        var that = this;
        wx.chooseLocation({
            success: function (res) {
                that.setData({
                    appro_address: res.address,
                    detail_address: res.name
                })
            }
        })
    },
    // 输入框的值被修改时
    handleInputChange(e) {
        // 获取传来的种类
        let {
            type
        } = e.currentTarget.dataset;
        // 获取按钮的值
        let {
            value
        } = e.detail;
        this.setData({
            [type]: value
        })
    },
    // 性别按钮被改变时
    handleSwitchtChange(e) {
        // 获取按钮的值
        let {
            value
        } = e.detail;
        this.setData({
            sex: value
        })
    },
    // 保存收货地址
    handleSave() {
        let {
            appro_address,
            detail_address,
            receiver,
            sex,
            tel_number,
            address_list,
            modifyIndex
        } = this.data;
        if (!appro_address.trim() ||
            !detail_address.trim() ||
            !receiver.trim() ||
            !tel_number.trim()) {
            let info = '请完整填好收货信息！';
            let modal = this.selectComponent('#modal'); // 页面获取自定义组件实例
            modal.showModal(info); // 通过实例调用组件事件
        } else {
            if (sex == true) {
                sex = '先生'
            } else {
                sex = '女士'
            }
            let address = {
                appro_address,
                detail_address,
                receiver,
                sex,
                tel_number
            }
            if (modifyIndex) {
                // 修改当前的收货地址信息至列表
                address_list[modifyIndex] = address;
            } else {
                // 添加当前的收货地址信息至列表
                address_list.push(address);
            }
            // 存进缓存
            wx.setStorageSync('address', address);
            wx.setStorageSync('address_list', address_list);
            wx.navigateBack({
                delta: 1,
            })
        }
    },
    // 删除地址
    handleDel() {
        let {
            modifyIndex,
            address_list
        } = this.data;
        // 页面获取自定义组件实例
        let loadingModal = this.selectComponent('#loadingModal');
        let info = '正在删除';
        // 通过实例调用组件事件
        loadingModal.showLoadModal(info);
        setTimeout(() => {
            address_list.splice(modifyIndex, 1);
            wx.setStorageSync('address_list', address_list)
            loadingModal.hiddenLoadModal();
            wx.navigateBack({
                delta: 1
            })
        }, 1000);
    }
})