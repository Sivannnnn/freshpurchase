<template>
  <div class="PersonalCenter">
    <el-descriptions class="margin-top" title="个人中心" :column="4" direction="vertical">
      <el-descriptions-item label="用户名">{{ userInfo.username }}</el-descriptions-item>
      <el-descriptions-item label="头像">
        <el-avatar :size="30">
          <img :src="userInfo.avatarUrl" />
        </el-avatar>
      </el-descriptions-item>
      <el-descriptions-item label="手机号" :span="2">{{
        userInfo.telNumber
      }}</el-descriptions-item>
      <el-descriptions-item label="居住地">{{
        userInfo.homeAddress
      }}</el-descriptions-item>
      <el-descriptions-item label="联系地址"
        >{{ userInfo.contactAddress }}
      </el-descriptions-item>
      <el-descriptions-item label="备注" :span="2">
        <el-tag size="small">地球</el-tag>
        <el-tag size="small">中国</el-tag>
      </el-descriptions-item>
      <el-descriptions-item label="操作">
        <el-button size="small" type="primary" @click="handleChangePassword"
          >修改密码</el-button
        >
      </el-descriptions-item>
    </el-descriptions>
    <el-dialog title="修改密码" :visible.sync="dialogFormVisible">
      <el-form :model="form">
        <el-form-item label="旧密码" :label-width="formLabelWidth">
          <el-input
            type="password"
            v-model="form.oldPassword"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="新密码" :label-width="formLabelWidth">
          <el-input
            type="password"
            v-model="form.newPassword"
            autocomplete="off"
          ></el-input>
        </el-form-item>
        <el-form-item label="确认新密码" :label-width="formLabelWidth">
          <el-input
            type="password"
            v-model="form.confirmPassword"
            autocomplete="off"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="submitForm">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
export default {
  name: "PersonalCenter",
  data() {
    return {
      dialogFormVisible: false,
      form: {
        oldPassword: "",
        newPassword: "",
        confirmPassword: "",
        code: "",
      },
      formLabelWidth: "120px",
      code: "",
    };
  },
  computed: {
    userInfo() {
      return this.$store.state.userInfo;
    },
  },
  methods: {
    handleChangePassword() {
      this.dialogFormVisible = true;
    },
   async submitForm() {
      if (this.form.newPassword !== this.form.confirmPassword) {
        let str = "确认新密码与新密码不同！";
        this.$store.dispatch("failureSubmitTip", str);
      } else {
        const res = await this.$axios({
          method: "post",
          url: "/judgeuserpassword",
          params: {
            password: this.form.oldPassword,
          }})
          if(res.data.code ===200){
            await this.$axios({
            method: "post",
            url: "/changeuserpassword",
            params: {
              password: this.form.newPassword,
              username: this.userInfo.username
            }}).then(res => {
              this.dialogFormVisible = false;
              this.$store.dispatch("successSubmitTip");
            })
          }
      }
    }
  },
};
</script>
<style lang="less">
.PersonalCenter {
}
</style>
