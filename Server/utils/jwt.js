const jwt = require('jsonwebtoken')
// token生成的密匙，根据自己需求定义
const jwtKey = 'sivan';

// token生成函数(jwtSign)，有效时间为一个小时
const jwtSign = (data) => { 
  const token = jwt.sign(data, jwtKey, {expiresIn: 60 * 60})
  return token
}

// token验证函数(jwtCheck)
const jwtCheck = (req, res, next) => { 
  //前端headers传来的token值:
  const token = req.headers.authorization;
  jwt.verify(token, jwtKey, (err, data) => {
    if (err) {
      res.send({
        code: 401,
        msg: 'token无效'
      })
    } else {
      req.jwtInfo = data
      next()
    }
  })
}

module.exports = {
  jwtSign,
  jwtCheck
}