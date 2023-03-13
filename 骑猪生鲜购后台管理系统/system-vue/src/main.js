import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from './axios'
import Element from 'element-ui'
import "element-ui/lib/theme-chalk/index.css"
// 引入echarts
import * as echarts from 'echarts'

Vue.config.productionTip = false
Vue.prototype.$axios = axios
Vue.prototype.$echarts = echarts

Vue.use(Element)

// require("./mock")
new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app')
