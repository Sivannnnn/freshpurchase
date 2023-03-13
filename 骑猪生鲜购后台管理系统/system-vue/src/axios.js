import axios from 'axios'
import router from './router'
import Element from 'element-ui'

// axios.defaults.baseURL = "https://www.sivan.asia/admin";
axios.defaults.baseURL = "http://localhost:3000/admin";
const request = axios.create({
    timeout: 5000,
    headers: {
        'Content-Type': "application/json;charset=UTF-8"
    }
})

request.interceptors.request.use(config => {
    const token = localStorage.getItem("token")
    config.headers.Authorization = token
    return config;
})

request.interceptors.response.use(
    response => {
        let res = response.data;
        if (res.code === 200) {
            return response;
        } else if(res.code === 401) {
            Element.Message.error('会话已过期，请重新登录');
            router.push("/login")
        }else{
            Element.Message.error(res.msg ? res.msg : '系统异常');
            return Promise.reject(response.data.msg);
        }
        error => {
            if (error.response.data) {
                error.message = error.response.data.msg;
            }
            if (error.response.status === 401) {
                router.push("/login")
            }
            Element.Message.error(error.message, {duration: 3000})
            return Promise.reject(error)
        }
    })

export default request;