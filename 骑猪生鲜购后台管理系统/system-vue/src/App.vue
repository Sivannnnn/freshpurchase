<template>
    <div id="app">
        <router-view/>
    </div>
</template>

<style lang="less">
    html,
    body,
    #app {
        height: 100%;
        width: 100%;
        margin: 0;
        padding: 0;
        border: 0;
    }

    #app {
        font-family: 'Helvetica Neue', 'Hiragino Sans GB', 'WenQuanYi Micro Hei', 'Microsoft Yahei', sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
    }

    .router-link-active, a {
        text-decoration: none
    }

    .themeFontColor {
        color: #00BFFF;
    }

    .clearfix::after {
        content: '';
        clear: both;
        display: block;
    }

    .left {
        float: left;
    }

    .right {
        float: right;
    }
</style>
