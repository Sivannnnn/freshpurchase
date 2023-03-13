<template>
    <div class="home">
        <el-container class="el-container">
            <el-header class="el-header">
                <div class="left">
                    <span class="username">您好!{{username}}</span>
                    <span>{{currentTime}}</span>
                </div>
                <span class="title">骑猪生鲜购后台管理系统</span>
                <div class="right">
                    <div class="switch">
                        <i class="el-icon-switch-button"></i>
                        <span @click="centerDialogVisible = true">退出登录</span>
                    </div>
                </div>
            </el-header>
            <el-container class="el-container">
                <el-aside class="el-aside" width="200px">
                    <img
                            class="logo"
                            src="../assets/logo.png"
                            v-on:click="isCollapse = !isCollapse"
                    />
                    <el-menu
                            default-active="1"
                            class="el-menu-vertical-demo"
                            @open="handleOpen"
                            @close="handleClose"
                            :collapse="isCollapse"
                    >
                        <router-link to="/home/goodscharts">
                            <el-menu-item index="1">
                                <i class="el-icon-pie-chart"></i>
                                <span slot="title">骑猪统计</span>
                            </el-menu-item>
                        </router-link>
                        <router-link to="/home/goodsinfo">
                            <el-menu-item index="2">
                                <i class="el-icon-s-goods"></i>
                                <span slot="title">商品信息</span>
                            </el-menu-item>
                        </router-link>
                        <router-link to="/home/admininfo">
                            <el-menu-item index="3">
                                <i class="el-icon-user"></i>
                                <span slot="title">管理员信息</span>
                            </el-menu-item>
                        </router-link>
                        <router-link to="/home/orderinfo">
                            <el-menu-item index="4">
                                <i class="el-icon-s-order"></i>
                                <span slot="title">订单信息</span>
                            </el-menu-item>
                        </router-link>
                        <router-link to="/home/personalcenter">
                            <el-menu-item index="5">
                                <i class="el-icon-setting"></i>
                                <span slot="title">个人中心</span>
                            </el-menu-item>
                        </router-link>
                    </el-menu>
                </el-aside>
                <el-main class="el-main">
                    <router-view/>
                </el-main>
            </el-container>
        </el-container>
        <el-dialog title="提示" :visible.sync="centerDialogVisible" width="30%" center>
            <span>确定要退出登录吗？</span>
            <span slot="footer" class="dialog-footer">
        <el-button @click="centerDialogVisible = false">取 消</el-button>
        <el-button type="primary" @click="logout">确 定</el-button>
      </span>
        </el-dialog>
    </div>
</template>
<script>
    export default {
        name: 'Home',
        data() {
            return {
                isCollapse: true,
                centerDialogVisible: false,
                currentTime: "",
            };
        },
        computed:{
            username(){
                return this.$store.state.userInfo.username;
            }
        },
        methods: {
            getCurrentTime() {
                let date = new Date();
                let sign2 = ":";
                let year = date.getFullYear(); // 年
                let month = date.getMonth() + 1; // 月
                let day = date.getDate(); // 日
                let hour = date.getHours(); // 时
                let minutes = date.getMinutes(); // 分
                let seconds = date.getSeconds(); //秒
                let weekArr = [
                    "星期一",
                    "星期二",
                    "星期三",
                    "星期四",
                    "星期五",
                    "星期六",
                    "星期天",
                ];
                let week = weekArr[date.getDay()];
                // 给一位数的数据前面加 “0”
                if (month >= 1 && month <= 9) {
                    month = "0" + month;
                }
                if (day >= 0 && day <= 9) {
                    day = "0" + day;
                }
                if (hour >= 0 && hour <= 9) {
                    hour = "0" + hour;
                }
                if (minutes >= 0 && minutes <= 9) {
                    minutes = "0" + minutes;
                }
                if (seconds >= 0 && seconds <= 9) {
                    seconds = "0" + seconds;
                }
                this.currentTime = year + "-" + month + "-" + day + " " + hour + sign2 + minutes + sign2 + seconds;
            },
            logout() {
                this.$axios.post('/logout')
                    .then(() => {
                        localStorage.removeItem('token');
                        this.$router.push("/login");
                    })
            },
            handleOpen(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose(key, keyPath) {
                console.log(key, keyPath);
            },
        },
        mounted() {
            setInterval(() => {
                this.getCurrentTime();
            }, 1000);
        },
    };
</script>
<style lang="less">
    .home {
        height: 100%;
        overflow: hidden;

        .el-container {
            height: 100%;

            .el-header {
                background-image: linear-gradient(45deg, #6495ed, #00bfff, #1e90ff);
                display: flex;
                justify-content: space-between;
                user-select: none;
                .left {
                    align-self: center;
                    height: 100%;
                    display: flex;
                    justify-content: center;
                    flex-direction: column;
                    text-align: left;
                    .username {
                        margin-right: 10px;
                        font-size: 20px;
                        color: #fff;
                        letter-spacing: 3px;
                    }
                }

                .title {
                    align-self: center;
                    font-size: 32px;
                }

                .right {
                    display: flex;
                    font-size: 18px;
                    .switch {
                        align-self: center;
                        i {
                            margin-right: 5px;
                        }
                    }
                }
            }

            .el-container {

                .el-aside {
                    user-select: none;
                    .logo {
                        margin: 10px;
                        width: 50px;
                        height: 50px;
                    }

                    .el-menu {
                    }
                }

                .el-main {
                    padding-bottom: 100px;
                    height: 100%;
                    .dialog {
                        top: -80px;
                    }
                }
            }
        }
    }
</style>
