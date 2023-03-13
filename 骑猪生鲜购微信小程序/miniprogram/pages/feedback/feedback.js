Page({

    /**
     * 页面的初始数据
     */
    data: {
        tabs: [{
                id: 0,
                value: "体验问题",
                isActive: true
            },
            {
                id: 1,
                value: "商品、商家投诉",
                isActive: false
            }
        ],
        chooseImgs: [],
        // 文本域的内容
        textVal: ""
    },
    // 外网的图片的路径数组
    UpLoadImgs: [],
    handletabsItemTap(e) {
        // 1 获取被点击的标题索引
        const {
            index
        } = e.detail;
        // 2 修改源数组
        let {
            tabs
        } = this.data;
        tabs.forEach((v, i) => i === index ? v.isActive = true : v.isActive = false);
        // 3 赋值到data中
        this.setData({
            tabs
        })
    },
    // 点击 “+” 选择图片
    handleChooseImg() {
        // 2 调用小程序内置的选择图片api
        wx.chooseImage({
            // 同时选中的图片数量
            count: 9,
            // 图片的格式 原图 压缩
            sizeType: ['original', 'compressed'],
            // 图片的来源 相册 照相机
            sourceType: ['album', 'camera'],
            success: (result) => {
                // console.log(result);
                this.setData({
                    // 图片数组 进行拼接
                    chooseImgs: [...this.data.chooseImgs, ...result.tempFilePaths]
                })
            }
        });
    },
    // 点击 自定义图片组件
    handleRemoveImg(e) {
        // 2 获取被点击的组件的索引
        const {
            index
        } = e.currentTarget.dataset;
        // 3 获取data中的图片数组
        let {
            chooseImgs
        } = this.data;
        // 4 删除元素
        chooseImgs.splice(index, 1);
        this.setData({
            chooseImgs
        })
    },
    // 文本域的输入事件
    handleTextInput(e) {
        this.setData({
            textVal: e.detail.value
        })
    },
    // 提交按钮的点击
    handleFormSubmit() {
        let modal = this.selectComponent('#modal'); // 页面获取自定义组件实例
        // 1 获取文本域的内容
        const {
            textVal,
            chooseImgs
        } = this.data;
        // 2 合法性的验证
        if (!textVal.trim()) {
            // 不合法
            let info = '写点内容再提交叭！！';
            modal.showModal(info); // 通过实例调用组件事件
            return;
        }
        // 3 准备上传图片 到专门的图片服务器
        // 上传文件的 api 不支持 多个文件同时上传 遍历数组 挨个上传
        // 显示正在等待的图片
        // 页面获取自定义组件实例
         let loadingModal = this.selectComponent('#loadingModal');
         let userInfo = '正在上传';// 通过实例调用组件事件
         loadingModal.showLoadModal(userInfo);
        if (chooseImgs.length != 0) {
            chooseImgs.forEach((v, i) => {
                var upTask = wx.uploadFile({
                    // 图片要上传到哪里
                    url: 'https://media.mogu.com/image/scale?appKey=15m&w=500&h=500&quality=100',
                    // 被上传的文件的路径
                    filePath: v,
                    // 上传的文件的名称 后台来获取文件 file
                    name: "image",
                    // 顺带的文本信息
                    formData: {},
                    success: (result) => {
                        let url = JSON.parse(result.data).url;
                        this.UpLoadImgs.push(url);

                        // 所有的图片都上传完毕了才触发
                        if (i === chooseImgs.length - 1) {
                            setTimeout(() => {
                                // 关闭弹窗
                                loadingModal.hiddenLoadModal();
                                // 重置页面
                                this.setData({
                                    textVal: "",
                                    chooseImgs: []
                                })
                                // 返回上一个页面
                                wx.navigateBack({
                                    delta: 1
                                });
                            }, 1000);
                        }
                    }
                });
            })
        } else {
            setTimeout(() => {
                loadingModal.hiddenLoadModal();
                wx.navigateBack({
                    delta: 1
                });
            }, 1000);
        }
    }
})