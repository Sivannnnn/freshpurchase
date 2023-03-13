var express = require('express');
const svgCaptcha = require('svg-captcha');
var router = express.Router();
//引入数据库配置文件
const db = require('./database')

//引入token生成函数
const {jwtSign} = require('../utils/jwt')
//引入token验证函数
const {jwtCheck} = require('../utils/jwt')
// 用引入的jwtSign方法生成token并返回
const token = jwtSign({token: 'token'}) 

let Result = {
  code: 200,
  msg: '操作成功'
}
let Err = {
  code: 400,
  msg: '操作失败'
}

//获取验证码
router.get('/getcaptcha', (req, res) => {
  const captcha = svgCaptcha.create({
    inverse: false, // 翻转颜色
    fontSize: 40, // 字体大小
    noise: 2, // 干扰线条数
    width: 100, // 宽度
    height: 40, // 高度
    size: 4, // 验证码长度
    color: true, // 验证码是否有彩色
    background: '#ccc', // 验证码图片背景颜色
  })
  //保存到cookie,忽略大小写
  res.cookie('captcha', captcha.text.toLowerCase())
  res.type('svg')
    let Result = {
      code: 200,
      msg: '操作成功',
      src: captcha.data,
      text: captcha.text
    }
    res.json(Result)
})

// 登录
router.get('/login', (req, res) => {
  const sql = 'select username,avatarUrl,telNumber,homeAddress,contactAddress from admin_list where username="' + req.query.username + '" and password="' + req.query.password + '"';
  db.query(sql, (request, response) => {
    if (response.length < 1) {
      Err.msg = '账号或密码错误'
      res.json(Err)
    } else {
      Result.data = response[0];
      Result.token = token;
      res.json(Result)
    }
  })
})

router.post('/logout', (req, res) => {
  res.json(Result)
})

// 获取商品分类
router.get('/getgoodscategory',jwtCheck, (req, res) => {
  const sql = 'select title as name,sales as value from classify_name';
  db.query(sql, (request, response) => {
    if (response) {
      Result.data = response;
      res.json(Result)
    }
  })
})

// 获取商品信息
router.get('/getgoodssales',jwtCheck, (req, res) => {
  const sql = 'select * from sales_list';
  db.query(sql, (request, response) => {
    Result.data = response;
    res.json(Result)
  })
})

// 获取商品信息
router.get('/getgoodsinfo',jwtCheck, (req, res) => {
  const sql = 'select * from goods_list';
  db.query(sql, (request, response) => {
    if (response.length > 0) {
      Result.data = response;
      res.json(Result)
    }
  })
})

// 获取管理员信息
router.get('/getadmininfo',jwtCheck, (req, res) => {
  const sql = 'select id,username,avatarUrl,telNumber,homeAddress,contactAddress from admin_list';
  db.query(sql, (request, response) => {
    if (response) {
      Result.data = response;
      res.json(Result)
    }
  })
})

// 获取订单信息
router.get('/getorderinfo',jwtCheck, (req, res) => {
  const sql = 'select * from order_list';
  db.query(sql, (request, response) => {
    if (response) {
      Result.data = response;
      res.json(Result)
    }
  })
})

// 添加商品
router.post('/addgood',jwtCheck, (req, res) => {
  let {
    id,
    title,
    src,
    newPrice,
    oldPrice,
    classify_id,
    sales
  } = req.query
  const sql = `insert into goods_list values(` + id + `,'` + title + `','` + src + `',` + newPrice + `,` + oldPrice + `,` + classify_id + `,` + sales + `)`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})

// 删除单个商品
router.post('/deletegoodone',jwtCheck, (req, res) => {
  let {
    title
  } = req.query
  const sql = `delete from goods_list where title='` + title + `'`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})

// 编辑单个商品
router.post('/editgoodone',jwtCheck, (req, res) => {
  let {
    id,
    title,
    src,
    newPrice,
    oldPrice,
    classify_id,
    sales
  } = req.query
  const sql = `update goods_list set id=` + id + `,title='` + title + `',src='` + src + `',newPrice=` + newPrice + `,oldPrice=` + oldPrice + `,classify_id=` + classify_id + ',sales=' + sales + ` where id=` + id;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})

// 批量删除商品
router.post('/deleteselectedgoods',jwtCheck, (req, res) => {
  let arr = req.query.str;
  const sql = `delete from goods_list where id in (` + arr + `)`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})

// 添加管理员
router.post('/addadmin',jwtCheck, (req, res) => {
  let {
    id,
    username,
    password,
    avatarUrl,
    telNumber,
    homeAddress,
    contactAddress
  } = req.query
  const sql = `insert into admin_list values(` + id + `,'` + username + `',` + password + `,'` + avatarUrl + `',` + telNumber + `,'` + homeAddress + `','` + contactAddress + `')`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})

// 删除单个管理员
router.post('/deleteadminone',jwtCheck, (req, res) => {
  let {
    id
  } = req.query
  const sql = `delete from admin_list where id='` + id + `'`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})

// 编辑单个管理员信息
router.post('/editadminone',jwtCheck, (req, res) => {
  let {
    id,
    username,
    avatarUrl,
    telNumber,
    homeAddress,
    contactAddress
  } = req.query
  const sql = `update admin_list set id=` + id + `,username='` + username +  `',avatarUrl='` + avatarUrl + `',telNumber=` + telNumber + `,homeAddress='` + homeAddress + `',contactAddress='` + contactAddress + `' where id=` + id;
  console.log(sql);
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})

// 批量删除管理员
router.post('/deleteselectedadmins',jwtCheck, (req, res) => {
  let arr = req.query.str;
  const sql = `delete from admin_list where id in (` + arr + `)`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})

// 删除单个订单
router.post('/deleteorderone',jwtCheck, (req, res) => {
  let {
    id
  } = req.query
  const sql = `delete from order_list where id='` + id + `'`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})
// 批量删除订单
router.post('/deleteselectedorders',jwtCheck, (req, res) => {
  let arr = req.query.str;
  const sql = `delete from order_list where id in (` + arr + `)`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})
// 判断管理员密码是否匹配
router.post('/judgeuserpassword',jwtCheck, (req, res) => {
  let psd = req.query.password;
  const sql = `select * from admin_list where password ='` + psd + `'`;
  db.query(sql, (request, response) => {
    if (response.length < 1) {
      Err.msg = '旧密码不正确！'
      res.json(Err)
    } else {
      res.json(Result)
    }
  })
})
// 修改管理员密码
router.post('/changeuserpassword',jwtCheck, (req, res) => {
  let psd = req.query.password;
  let usm = req.query.username;
  const sql = `update admin_list set password ='` + psd + `' where username ='` + usm + `'`;
  db.query(sql, (request, response) => {
    res.json(Result)
  })
})
module.exports = router;