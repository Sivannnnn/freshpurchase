import Vue from 'vue'
import VueRouter from 'vue-router'
import Element from "element-ui"
import Login from '../views/Login.vue'
import Home from '../views/Home.vue'
import GoodsCharts from '../views/tabbars/GoodsCharts.vue'
import GoodsInfo from '../views/tabbars/GoodsInfo.vue'
import AdminInfo from '../views/tabbars/AdminInfo.vue'
import OrderInfo from '../views/tabbars/OrderInfo.vue'
import PersonalCenter from '../views/tabbars/PersonalCenter.vue'

Vue.use(VueRouter)

const routes = [{
    path: '/',
    name: 'default',
    component: Home,
    redirect: '/home/goodscharts'
},
    {
        path: '/login',
        name: 'login',
        component: Login
    },
    {
        path: '/home',
        name: 'home',
        component: Home,
        redirect: '/home/goodscharts',
        children: [{
            path: 'goodscharts',
            name: 'goodscharts',
            component: GoodsCharts
        },
            {
                path: 'goodsinfo',
                name: 'goodsinfo',
                component: GoodsInfo
            },
            {
                path: 'admininfo',
                name: 'admininfo',
                component: AdminInfo
            },
            {
                path: 'orderinfo',
                name: 'orderinfo',
                component: OrderInfo
            },
            {
                path: 'personalcenter',
                name: 'personalcenter',
                component: PersonalCenter
            },
        ]
    },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

router.beforeEach((to, from, next) => {
    let token = localStorage.getItem('token');
    if (to.path === '/login') {
        next();
    } else if(to.path === '/logout') {
        localStorage.removeItem('token');
        next();
    }else{
        if (token) {
            next();
        } else {
            Element.Message.error('请先登录', {duration: 3000})
            next({path: "/login"})
        }
    }
})

export default router