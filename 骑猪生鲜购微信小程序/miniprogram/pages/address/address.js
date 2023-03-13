Page({
    data: {
        address_list: [], // 收货地址信息列表
    },
    onLoad(options){
        let {isChoice} = options;
        this.setData({ isChoice }); 
    },
    onShow() {
        // 判断登录是否登录
        this.getUserLogin();
        // 获取收货地址
        let address_list = wx.getStorageSync('address_list');
        this.setData({ address_list });
    },
    onHiden(){
        this.setData({ isChoice: '0' });
    },
    // 判断登录是否登录
    getUserLogin(){
        let userInfo = wx.getStorageSync('userInfo');
        if(userInfo.length == 0){
            let info = '请先登录再进行收货地址管理！';
            let modal = this.selectComponent('#modal'); // 页面获取自定义组件实例
            modal.showModal(info); // 通过实例调用组件事件
        }
    },
    // 修改收货地址信息
    hanleModifyAddress(e){
        let {item,index} = e.currentTarget.dataset;
        wx.setStorageSync('modifyAddress', item);
        wx.navigateTo({
          url: '/pages/add_address/add_address?index=' + index
        })
    },
    // 选择地址填充
    handleChoiceAddress(e){
        // 获取传递过来的索引
        let {index} = e.currentTarget.dataset;
        // 获取是否为选择地址的参数判断和参数列表数组
        let { isChoice,address_list } = this.data;
        if(isChoice === '1'){
           // 页面获取自定义组件实例
           let loadingModal = this.selectComponent('#loadingModal');
           let info = '加载中';
           // 通过实例调用组件事件
           loadingModal.showLoadModal(info);
            setTimeout(() => {
                let address = address_list[index];
                wx.setStorageSync('address', address);
                loadingModal.hiddenLoadModal();
                wx.navigateBack({ delta: 1 });
            }, 300);
        }
    },
})