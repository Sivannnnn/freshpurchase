import { request } from "../../request/index.js";
import { addCarts } from "../../common.js";
Page({
  data: {
    showed: true,
    viewTop: 0
  },
  onReady() {
    this.getBannerList(); // 获取轮播图
    this.getClassifyName(); // 获取分类名字
  },
  onShow() {
    let classifyId = wx.getStorageSync('classifyId');
    if(classifyId){
      this.getBannerList(); // 获取轮播图
      this.getClassifyName(classifyId); // 获取分类名字
    }
  },
  onHide(){
    wx.removeStorageSync('classifyId');
  },
  // 获取轮播图
  async getBannerList() {
    await request({
        url: '/classify/banner'
      })
      .then(result => {
        this.setData({
          bannerList: result
        })
      })
  },
  // 获取分类名字
  async getClassifyName(classifyId) {
    await request({
        url: '/classify/name'
      })
      .then(result => {
        if(!classifyId) classifyId = 0;
        let name = result[classifyId].title
        this.setData({
          classifyName: result,
          name,
          TabCur: classifyId
        })
        this.getDetailData(classifyId, name)
      })
  },
  // 获取详细数据
  async getDetailData(id, name) {
    // console.log(name);
    let arr = {}
    await request({
        url: '/classify/content?classify_id=' + id,
      })
      .then(result => {
        arr.title = name;
        arr.list = result;
        this.setData({
          TabCur: id,
          name,
          classifyList: arr,
          viewTop: 0
        })
        // console.log(arr)
      })
  },
  // 选中导航栏标题
  tabSelect(e) {
    let id = e.currentTarget.dataset.id;
    let name = this.data.classifyName[id].title;
    this.data.classifyList = [];
    this.getDetailData(id, name);
    this.setData({
      TabCur: id,
      name
    })
  },
  VerticalMain(e) {
    // console.log(e.detail);
    let that = this;
    let list = this.data.classifyName;
    let tabHeight = 0;
    if (this.data.load) {
      for (let i = 0; i < list.length; i++) {
        let view = wx.createSelectorQuery().select("#main-" + list[i].id);
        view.fields({
          size: true
        }, data => {
          list[i].top = tabHeight;
          tabHeight = tabHeight + data.height;
          list[i].bottom = tabHeight;
          console.log(tabHeight);
        }).exec();
      }
    }
    let scrollTop = e.detail.scrollTop + 20;
    for (let i = 0; i < list.length; i++) {
      if (scrollTop > list[i].top && scrollTop < list[i].bottom) {
        that.setData({
          VerticalNavTop: (list[i].id - 1) * 50,
          TabCur: list[i].id
        })
        return false
      }
    }
  },
  // 滑动分类信息到顶部
  scrollTop() {
    let id = this.data.TabCur;
    let name = this.data.name;
    let list = this.data.classifyName;
    if (id < list.length) {
      --id;
      name = list[id].title;
      this.getDetailData(id, name);
    }
  },
  // 滑动分类信息到底部
  scrollButton() {
    let id = this.data.TabCur;
    let name = this.data.name;
    let list = this.data.classifyName;
    if (id < list.length) {
      ++id;
      name = list[id].title;
      this.getDetailData(id, name);
    }
  },
  // 添加购物车
  add(e){
      addCarts(e.currentTarget.dataset.item)
  },
})