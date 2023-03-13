<template>
  <div class="OrderInfo">
    <div class="btn">
      <el-button type="danger" @click="handleDeleteSelections">批量删除</el-button>
    </div>
    <el-table
      :data="
        currentList.filter(
          (data) =>
            !search || data.orderNumber.toLowerCase().includes(search.toLowerCase())
        )
      "
      class="el-table"
      @select="onRowClick"
      @select-all="onRowClick"
      row-key="id"
    >
      <el-table-column type="selection" align="center"></el-table-column>
      <el-table-column label="id" prop="id" align="center"></el-table-column>
      <el-table-column label="订单号" prop="orderNumber" align="center"></el-table-column>
      <el-table-column label="姓名" prop="name" align="center"></el-table-column>
      <el-table-column label="联系电话" prop="telNumber" align="center"></el-table-column>
      <el-table-column label="收货地址" prop="address" align="center"></el-table-column>
      <el-table-column
        label="订单时间"
        prop="createTime"
        align="center"
      ></el-table-column>
      <el-table-column align="center" min-width="120">
        <template slot="header" slot-scope="scope">
          <el-input v-model="search" placeholder="输入订单号搜索" />
        </template>
        <template slot-scope="scope">
          <el-popconfirm
            title="确定移除此订单吗？"
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
      :total="orderInfoList.length"
    >
    </el-pagination>
  </div>
</template>
<script>
export default {
  data() {
    return {
      orderInfoList: [],
      currentList: [],
      selectedOrdersList: [],
      search: "",
      currentPage: 1,
      size: 5,
      total: 100,
      formLabelWidth: "120px",
    };
  },
  methods: {
    getOrderInfoList() {
      this.$axios.get("/getorderinfo").then((res) => {
        this.orderInfoList = res.data.data;
        this.handleCurrentChange(this.currentPage);
      });
    },
    handleDeleteSelections() {
      let arr = this.selectedOrdersList;
      if (arr.length < 1) {
        this.$store.dispatch("failureSubmitTip", "请筛选订单号再批量删除!");
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
          url: "/deleteselectedorders",
          params: { str },
        }).then((res) => {
          this.$store.dispatch("successSubmitTip");
          this.getOrderInfoList();
        });
      }
    },
    handleSizeChange(val) {
      this.size = val;
      this.currentList = this.orderInfoList.slice(
        (this.currentPage - 1) * val,
        this.currentPage * val
      );
    },
    handleCurrentChange(currentIndex) {
      let size = this.size;
      this.currentPage = currentIndex;
      this.currentList = this.orderInfoList.slice(
        (currentIndex - 1) * size,
        currentIndex * size
      );
    },
    onRowClick(rows, event, column) {
      this.selectedOrdersList = rows;
    },
    handleDeleteOne(index, rows) {
      this.$axios({
        method: "post",
        url: "/deleteorderone",
        params: { id: rows[index].id },
      }).then((res) => {
        this.$store.dispatch("successSubmitTip");
        this.getOrderInfoList();
      });
    },
  },
  created() {
    this.getOrderInfoList();
  },
};
</script>
<style lang="less">
.OrderInfo {
  margin: 0 auto;
  width: 80%;

  .btn {
    text-align: left;
  }
}
</style>
