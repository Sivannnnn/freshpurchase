var mysql = require('mysql')
//连接配置信息
var pool = mysql.createPool({
    host: 'localhost',
    port: 3307,
    user: 'root',
    password: 'root',
    database: 'freshpurchase'
})
//对数据库增删改查的基础
function query(sql,callback){
    pool.getConnection((err,connection)=>{
        connection.query(sql,(err,rows)=>{
            callback(err,rows)
            connection.release()
        })
    })
}
exports.query = query