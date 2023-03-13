var express = require('express');
var router = express.Router();
//引入数据库配置文件
const db = require('./database')

//获取首页中的分类图标
router.get('/index/cate', (err, res) => {
  const sql = 'select * from index_cate';
  db.query(sql, (err, result) => {
    if (err) {
      return
    }
    res.json(result)
  })
})
//获取首页中的timeLimit
router.get('/index/timeLimit', (err, res) => {
  const sql = 'select * from goods_list order by rand() limit 5';
  db.query(sql, (err, result) => {
    if (err) {
      return
    }
    res.json(result)
  })
})
//获取首页中的nav1
router.get('/index/nav1', (err, res) => {
  const sql = 'select * from goods_list order by rand() limit 10';
  db.query(sql, (err, result) => {
    if (err) {
      return
    }
    res.json(result)
  })
})
//获取分类中的banner
router.get('/classify/banner', (err, res) => {
  const sql = 'select * from classify_banner';
  db.query(sql, (err, result) => {
    if (err) {
      return
    }
    res.json(result)
  })
})

//获取分类中的name
router.get('/classify/name', (err, res) => {
  const sql = 'select * from classify_name';
  db.query(sql, (err, result) => {
    if (err) {
      return
    }
    res.json(result)
  })
})

//获取分类中的goods_list
router.get('/classify/content', (rouReq, rouRes) => {
  const sql = 'select * from goods_list where classify_id = ' + rouReq.query.classify_id;
  db.query(sql, (dbReq, dbRes) => {
    rouRes.json(dbRes)
  })
})

// 搜索
router.get('/goods/search', (rouReq, rouRes) => {
  const sql = "select * from goods_list where title like " + "'%" + rouReq.query.value + "%'";
  db.query(sql, (dbReq, dbRes) => {
    rouRes.json(dbRes)
  })
})

// 获取商品详情————默认排序
router.get('/goods/goods_detail', (rouReq, rouRes) => {
  const sql = "select * from goods_list where id = " + rouReq.query.value;
  db.query(sql, (dbReq, dbRes) => {
    rouRes.json(dbRes)
  })
})

// 获取酒水饮料————默认排序
router.get('/goods/goods_detail/beverages', (rouReq, rouRes) => {
  const sql = "select * from goods_list where classify_id = 10";
  db.query(sql, (dbReq, dbRes) => {
    rouRes.json(dbRes)
  })
})
module.exports = router;