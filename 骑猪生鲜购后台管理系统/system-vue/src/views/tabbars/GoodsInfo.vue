<template>
  <div class="AdminInfo">
    <div class="btn">
      <el-button type="primary" @click="dialogFormVisible = true">添加商品</el-button>
      <el-button type="danger" @click="handleDeleteSelections">批量删除</el-button>
    </div>
    <el-table
      :data="
        currentList.filter(
          (data) => !search || data.title.toLowerCase().includes(search.toLowerCase())
        )
      "
      class="el-table"
      @select="onRowClick"
      @select-all="onRowClick"
      row-key="id"
    >
      <el-table-column
        :reserve-selection="true"
        type="selection"
        width="55"
        align="center"
      ></el-table-column>
      <el-table-column label="id" prop="id" width="55" align="center"></el-table-column>
      <el-table-column label="商品名" prop="title" align="center"></el-table-column>
      <el-table-column
        label="折扣后价格"
        prop="newPrice"
        align="center"
      ></el-table-column>
      <el-table-column
        label="折扣前价格"
        prop="oldPrice"
        align="center"
      ></el-table-column>
      <el-table-column label="分类id" prop="classify_id" align="center"></el-table-column>
      <el-table-column label="月销售量" prop="sales" align="center"></el-table-column>
      <el-table-column align="center" min-width="150">
        <template slot="header" slot-scope="scope">
          <el-input v-model="search" placeholder="输入商品名搜索" />
        </template>
        <template slot-scope="scope">
          <el-button
            size="mini"
            @click="handleEdit(scope.$index, scope.row)"
            style="margin-right: 10px"
            >编辑
          </el-button>
          <el-popconfirm
            title="确定移除此商品吗？"
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
      :total="goodsInfoList.length"
    >
    </el-pagination>
    <el-dialog
      class="dialog"
      title="商品信息表"
      :visible.sync="dialogFormVisible"
      @close="closeDialog"
    >
      <el-form :model="form">
        <el-form-item label="id" :label-width="formLabelWidth">
          <el-input type="number" v-model="form.id" autocomplete="off" :disabled="isEdit"></el-input>
        </el-form-item>
        <el-form-item label="商品名" :label-width="formLabelWidth">
          <el-input v-model="form.title" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="商品图片地址" :label-width="formLabelWidth">
          <el-input v-model="form.src" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="折扣后价格" :label-width="formLabelWidth">
          <el-input type="number" v-model="form.newPrice" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="折扣前价格" :label-width="formLabelWidth">
          <el-input type="number" v-model="form.oldPrice" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="分类id" :label-width="formLabelWidth">
          <el-input type="number" v-model="form.classify_id" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="月销售量" :label-width="formLabelWidth">
          <el-input type="number" v-model="form.sales" autocomplete="off"></el-input>
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
  name: "GoodsInfo",
  data() {
    return {
      goodsInfoList: [],
      currentList: [],
      selectedGoodsList: [],
      search: "",
      currentPage: 1,
      size: 5,
      total: 100,
      dialogTableVisible: false,
      dialogFormVisible: false,
      resetForm: {
        id: null,
        title: null,
        src: null,
        newPrice: null,
        oldPrice: null,
        classify_id: null,
        sales: null,
      },
      form: {
        id: null,
        title: null,
        src: null,
        newPrice: null,
        oldPrice: null,
        classify_id: null,
        sales: null,
      },
      formLabelWidth: "120px",
      isEdit: false,
    };
  },
  methods: {
    getGoodsInfoList() {
      this.$axios.get("/getgoodsinfo").then((res) => {
        this.goodsInfoList = res.data.data;
        this.handleCurrentChange(this.currentPage);
      });
    },
    handleDeleteSelections() {
      let arr = this.selectedGoodsList;
      if (arr.length < 1) {
        this.$store.dispatch("failureSubmitTip", "请筛选商品再批量删除!");
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
          url: "/deleteselectedgoods",
          params: { str },
        }).then((res) => {
          this.$store.dispatch("successSubmitTip");
          this.getGoodsInfoList();
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
      this.currentList = this.goodsInfoList.slice(
        (this.currentPage - 1) * val,
        this.currentPage * val
      );
    },
    handleCurrentChange(currentIndex) {
      let size = this.size;
      this.currentPage = currentIndex;
      this.currentList = this.goodsInfoList.slice(
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
      if (isEdit) {
        this.$axios({
          method: "post",
          url: "/editgoodone",
          params,
        }).then(() => {
          this.isEdit = false;
        });
      } else {
        let goods = this.goodsInfoList;
        for (let i = 0; i < goods.length; i++) {
          if (goods[i].id === Number(params.id)) {
            this.idExistTip();
            return;
          }
        }
        this.$axios({
          method: "post",
          url: "/addgood",
          params,
        });
      }
      this.submitResetFrom();
      this.dialogFormVisible = false;
      this.$store.dispatch("successSubmitTip");
      this.getGoodsInfoList();
    },
    onRowClick(rows, event, column) {
      this.selectedGoodsList = rows;
    },
    handleDeleteOne(index, rows) {
      this.$axios({
        method: "post",
        url: "/deletegoodone",
        params: { title: rows[index].title },
      }).then((res) => {
        this.$store.dispatch("successSubmitTip");
        this.getGoodsInfoList();
      });
    },
    idExistTip() {
      this.$alert("商品id已存在", "Tips", {
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
    this.getGoodsInfoList();
  },
};
</script>
<style lang="less">
.AdminInfo {
  margin: 0 auto;
  width: 80%;

  .btn {
    text-align: left;
  }
}
</style>
