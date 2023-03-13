import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import {
    Message
} from 'element-ui'

Vue.use(Vuex)

export default new Vuex.Store({
    state: {
        token: '',
        userInfo: [],
    },
    getters: {},
    mutations: {
        SET_TOKEN: (state, token) => {
            state.token = token;
            localStorage.setItem("token", token)
        },
    },
    actions: {
        deleteSubmit(store,payload){
            let {method,params,url} = payload;
            axios({method,params,url});
        },
        successSubmitTip() {
            Message({
                message: '恭喜你，操作成功',
                type: 'success'
            })
        },
        failureSubmitTip(store, message) {
            Message({
                message,
                type: 'warning'
            })
        }
    },
    modules: {}
})