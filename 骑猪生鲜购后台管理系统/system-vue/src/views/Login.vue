<template>
  <div class="login">
    <el-row>
      <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
        <el-avatar :size="100">
          <img src="../assets/logo.png" />
        </el-avatar>
        <span class="title themeFontColor">骑猪生鲜购后台管理系统</span>
      </el-col>
      <el-col :xs="12" :sm="12" :md="12" :lg="12" :xl="12">
        <el-form
          :model="loginForm"
          :rules="rules"
          ref="loginForm"
          label-width="100px"
          class="demo-ruleForm"
        >
          <el-form-item label="用户名" prop="username">
            <el-input v-model="loginForm.username"></el-input>
          </el-form-item>
          <el-form-item label="密码" prop="password">
            <el-input type="password" v-model="loginForm.password"></el-input>
          </el-form-item>
          <el-form-item class="code" label="验证码" prop="code">
            <el-input class="input" v-model="loginForm.code" maxlength="4"></el-input>
            <div v-html="captchaImg" class="captchaImg" @click="getCaptcha"></div>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('loginForm')">登录</el-button>
            <el-button @click="resetForm('loginForm')">重置</el-button>
          </el-form-item>
        </el-form>
      </el-col>
    </el-row>
  </div>
</template>
<script>
import qs from "qs";
export default {
  name: "Login",
  data() {
    return {
      loginForm: {
        username: "",
        password: "",
        code: "",
        token: "",
      },
      code: '',
      captchaImg: '',
      rules: {
        username: [{ required: true, message: "请输入用户名", trigger: "blur" }],
        password: [{ required: true, message: "请输入密码", trigger: "blur" }],
        code: [
          { required: true, message: "请输入验证码", trigger: "blur" },
          { min: 4, max: 4, message: "请输入 4 个字符", trigger: "blur" },
        ],
      },
    };
  },
  created() {
    this.getCaptcha();
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid && this.code === this.loginForm.code) {
          this.$axios({
            methods: "post",
            url: "/login",
            params: this.loginForm,
          }).then((res) => {
            const jwt = res.data.token;
            this.$store.commit("SET_TOKEN", jwt);
            this.$store.state.userInfo = res.data.data;
            this.$router.push("/home");
          });
        } else {
          this.$store.dispatch("failureSubmitTip",'验证码错误')
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
    getCaptcha() {
      this.$axios.get("/getcaptcha").then((res) => {
        this.captchaImg  = res.data.src
        this.code = res.data.text;
      });
    },
  },
};
</script>
<style lang="less">
.login {
  width: 100%;
  height: 100%;
  background: url("../assets/login_bg.gif");
  background-size: 100% 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  user-select: none;

  .title {
    display: block;
    text-align: center;
    font-size: 40px;
  }

  .el-form {
    width: 400px;

    .code {
      .input {
        float: left;
        width: 185px;
        margin-right: 15px;
      }

      .captchaImg {
        display: inline-block;
        width: 100px;
        height: 40px;
        border-radius: 8px;
        overflow: hidden;
      }
    }
  }
}
</style>
