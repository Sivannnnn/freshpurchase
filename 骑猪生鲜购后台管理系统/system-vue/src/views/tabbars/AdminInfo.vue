<template>
  <div class="GoodsInfo">
    <div class="btn">
      <el-button type="primary" @click="dialogFormVisible = true">添加管理员</el-button>
      <el-button type="danger" @click="handleDeleteSelections">批量删除</el-button>
    </div>
    <el-table
      :data="
        currentList.filter(
          (data) => !search || data.username.toLowerCase().includes(search.toLowerCase())
        )
      "
      class="el-table"
      @select="onRowClick"
      @select-all="onRowClick"
      row-key="id"
    >
      <el-table-column type="selection" align="center"></el-table-column>
      <el-table-column label="id" prop="id" align="center"></el-table-column>
      <el-table-column label="用户名" prop="username" align="center"></el-table-column>
      <el-table-column label="联系电话" prop="telNumber" align="center"></el-table-column>
      <el-table-column
        label="家庭地址"
        prop="homeAddress"
        align="center"
      ></el-table-column>
      <el-table-column
        label="通讯地址"
        prop="contactAddress"
        align="center"
      ></el-table-column>
      <el-table-column align="center" min-width="100">
        <template slot="header" slot-scope="scope">
          <el-input v-model="search" placeholder="输入用户名搜索" />
        </template>
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="handleEdit(scope.$index, scope.row)"
            style="margin-right: 10px"
            >编辑
          </el-button>
          <el-popconfirm
            title="确定移除此管理员吗？"
            icon-color="#00BFFF"
            icon="el-icon-warning"
            @confirm="handleDeleteOne(scope.$index, currentList)"
          >
            <el-button size="mini" type="danger" slot="reference">删除</el-button>
          </el-popconfirm>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="[5, 10]"
      :page-size="size"
      layout="total, sizes, prev, pager, next, jumper"
      :total="adminInfoList.length"
    >
    </el-pagination>
    <el-dialog
      class="dialog"
      title="管理员信息"
      :visible.sync="dialogFormVisible"
      @close="closeDialog"
    >
      <el-form :model="form">
        <el-form-item label="id" :label-width="formLabelWidth">
          <el-input v-model="form.id" autocomplete="off" :disabled="isEdit"></el-input>
        </el-form-item>
        <el-form-item label="用户名" :label-width="formLabelWidth">
          <el-input
            v-model="form.username"
            autocomplete="off"
            :disabled="isEdit"
          ></el-input>
        </el-form-item>
        <el-form-item label="密码" :label-width="formLabelWidth" v-show="!isEdit">
          <el-input type="password" v-model="form.password" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="头像地址" :label-width="formLabelWidth">
          <el-input v-model="form.avatarUrl" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="联系电话" :label-width="formLabelWidth">
          <el-input v-model="form.telNumber" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="家庭住址" :label-width="formLabelWidth">
          <el-input v-model="form.homeAddress" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="通讯地址" :label-width="formLabelWidth">
          <el-input v-model="form.contactAddress" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="handleSubmit">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
export default {
  name: "AdminInfo",
  data() {
    return {
      adminInfoList: [],
      currentList: [],
      selectedAdminsList: [],
      search: "",
      currentPage: 1,
      size: 5,
      total: 100,
      dialogTableVisible: false,
      dialogFormVisible: false,
      resetForm: {
        id: null,
        username: null,
        password: null,
        avatarUrl: null,
        telNumber: null,
        homeAddress: null,
        contactAddress: null,
      },
      form: {},
      formLabelWidth: "120px",
      isEdit: false,
    };
  },
  methods: {
    getAdminInfoList() {
      console.log("我被调用了");
      this.$axios.get("/getadmininfo").then((res) => {
        this.adminInfoList = res.data.data;
        this.handleCurrentChange(this.currentPage);
      });
    },
    handleDeleteSelections() {
      let arr = this.selectedAdminsList;
      if (arr.length < 1) {
        this.$store.dispatch("failureSubmitTip","请筛选管理员再批量删除!");
      } else {
        let str = "";
        for (let i = 0; i < arr.length; i++) {
          if (i == 0) {
            str += arr[i].id;
          } else {
            str = str + "," + arr[i].id;
          }
        }
        this.$axios({
          method: "post",
          url: "/deleteselectedadmins",
          params: { str },
        }).then((res) => {
          this.$store.dispatch("successSubmitTip");
          this.getAdminInfoList();
        });
      }
    },
    handleEdit(index, row) {
      this.form = row;
      this.dialogFormVisible = true;
      this.isEdit = true;
    },
    handleSizeChange(val) {
      this.size = val;
      this.currentList = this.adminInfoList.slice(
        (this.currentPage - 1) * val,
        this.currentPage * val
      );
    },
    handleCurrentChange(currentIndex) {
      let size = this.size;
      this.currentPage = currentIndex;
      this.currentList = this.adminInfoList.slice(
        (currentIndex - 1) * size,
        currentIndex * size
      );
    },
    handleSubmit() {
      let params = this.form;
      for (const key in params) {
        if (params[key] === null) {
          let str = key + "不能为空";
          this.$store.dispatch("failureSubmitTip", str);
          return;
        }
      }
      let isEdit = this.isEdit;
      let admins = this.adminInfoList;
      if (isEdit) {
        this.$axios({
          method: "post",
          url: "/editadminone",
          params,
        });
      } else {
        for (let i = 0; i < admins.length; i++) {
          let str;
          if (admins[i].id === Number(params.id)) {
            str = "id已存在";
            this.existTips(str);
            return;
          } else if (admins[i].username === params.username) {
            str = "用户名已存在";
            this.existTips(str);
            return;
          }
        }
        this.$axios({
          method: "post",
          url: "/addadmin",
          params,
        });
      }
      this.submitResetFrom();
      this.dialogFormVisible = false;
      this.$store.dispatch("successSubmitTip");
      this.getAdminInfoList();
    },
    onRowClick(rows, event, column) {
      this.selectedAdminsList = rows;
    },
    handleDeleteOne(index, rows) {
      this.$axios({
        method: "post",
        url: "/deleteadminone",
        params: { id: rows[index].id },
      }).then((res) => {
        this.$store.dispatch("successSubmitTip");
        this.getAdminInfoList();
      });
    },
    existTips(str) {
      this.$alert(str, "Tips", {
        confirmButtonText: "确定",
      });
    },
    closeDialog() {
      this.submitResetFrom();
    },
    submitResetFrom() {
      this.isEdit = false;
      this.form = this.resetForm;
    },
  },
  created() {
    this.getAdminInfoList();
  },
};
</script>
<style lang="less">
.GoodsInfo {
  margin: 0 auto;
  width: 80%;

  .btn {
    text-align: left;
  }
}
</style>
