let ajaxTimes = 0;
export const request = (params) => {
    let header={...params.header}
    ajaxTimes++;
    wx.showLoading({
        title: "玩命加载中",
        mask: true
    });

    // 定义公共的url
    // const baseUrl = "http://172.20.10.14:3000";
    const baseUrl = "https://www.sivan.asia/miniprogram"; 
    // const baseUrl = "http://localhost:3000";
    return new Promise((resolve, reject) => {
        wx.request({
            ...params,
            header:header,
            url: baseUrl + params.url,
            success: (result) => {
                resolve(result.data);
            },
            fail: (err) => {
                reject(err);
            },
            complete: () => {
                ajaxTimes--;
                if (ajaxTimes === 0) {
                    // 关闭正在等待的图标
                    wx.hideLoading();
                }
            }
        });
    })
}