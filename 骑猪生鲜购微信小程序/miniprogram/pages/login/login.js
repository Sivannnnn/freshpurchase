Page({
    data: {
        isChecked: false, // 阅读协议勾选
    },
    login() {
        let isChecked = this.data.isChecked
        if (isChecked) {
            wx.getUserProfile({
                desc: '获取用户基础信息',
                success: (res) => {
                    let {
                        userInfo
                    } = res
                    console.log(res);
                    // 页面获取自定义组件实例
                    let loadingModal = this.selectComponent('#loadingModal');
                    let info = '登录中';
                    // 通过实例调用组件事件
                    loadingModal.showLoadModal(info);
                    setTimeout(() => {
                        wx.setStorageSync('userInfo', userInfo);
                        wx.navigateBack({
                            delta: 1
                        });
                        loadingModal.hiddenLoadModal();
                    }, 500);
                },
                fail: (res) => {
                    wx.showToast({
                        title: '登陆失败',
                        icon: 'error',
                        duration: 1500,
                        mask: true
                    })
                }
            })
        } else {
            wx.showToast({
                title: '请阅读用户协议并打勾勾',
                icon: 'none',
                duration: 1500,
                mask: true
            })
        }
    },
    checked() {
        let isChecked = !this.data.isChecked
        this.setData({
            isChecked
        })
    }
})