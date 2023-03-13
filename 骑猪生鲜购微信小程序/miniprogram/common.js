function addCarts(arr) {
    // 1.获取缓存进购物车
    let carts = wx.getStorageSync('carts') || [];
    // 2.判断 商品对象是否存在于购物车中
    let index = carts.findIndex(v => v.title === arr.title);
    if (index === -1){
        // 3.不存在 第一次添加
        arr.num = 1;  // 数量
        arr.checked = false; // 默认不被选择
        arr.totalSingleNewPrice = arr.newPrice; // 单品总价
        arr.totalSingleoldPrice = arr.oldPrice; // 单品总价
        carts.push(arr);
        wx.setStorageSync('carts', carts)
        wx.showToast({
            title: '添加购物车成功',
            icon: 'succes',
            duration: 1000,
            mask: true
        })
    } else {
        // 4.已经存在购物车数据
        wx.showToast({
            title: '购物车已存在',
            icon: 'error',
            duration: 1000,
            mask: true
        })
    }
}
export {addCarts}