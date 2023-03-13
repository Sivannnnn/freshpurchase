<template>
  <div class="GoodsCharts">
    <div class="statistic">
      <el-row :gutter="20">
        <el-col :span="8">
          <div>
            <el-statistic
              group-separator=","
              :precision="2"
              :value="userNumbers"
              title="用户数量"
            ></el-statistic>
          </div>
        </el-col>
        <el-col :span="8">
          <div>
            <el-statistic title="商品销售总量" :value="goodsSalesTotal"> </el-statistic>
          </div>
        </el-col>
        <el-col :span="8">
          <div>
            <el-statistic :precision="2" :value="profit" title="盈利金额">
              <template slot="suffix">
                <i class="el-icon-caret-top" style="color: #00bfff"></i>
              </template>
            </el-statistic>
          </div>
        </el-col>
      </el-row>
    </div>
    <div id="goodsCategory"></div>
    <div id="goodsSales"></div>
  </div>
</template>
<script>
export default {
  name: "GoodsCharts",
  data() {
    return {
      userNumbers: 2222,
      goodsSalesTotal: 200,
      profit: 69999,
      goodsCategoryList: [],
      goodsSalesList: [],
    };
  },
  mounted() {
    this.getGoodsCategory();
    this.getGoodsSales();
  },
  methods: {
    // 获取分类数据
    getGoodsCategory() {
      this.$axios.get("/getgoodscategory").then((res) => {
        this.goodsCategoryList = res.data.data;
        this.drawGoodsCategory();
      });
    },
    drawGoodsCategory() {
      let data = Object.values(this.goodsCategoryList);
      let myChart = this.$echarts.init(document.getElementById("goodsCategory"));
      myChart.setOption({
        title: {
          text: "商品分类",
          left: "center",
          textStyle: {
            color: "#00BFFF",
            fontStyle: "oblique",
            fontWeight: "normal",
            fontSize: 24,
            lineHeight: 20,
          },
        },
        tooltip: {
          trigger: "item",
          formatter: "{b} : {c}件 (占{d}%)",
        },
        series: {
          type: "pie",
          roseType: "area",
          data,
        },
      });
    },
    // 获取商品销售信息
    getGoodsSales() {
      this.$axios.get("/getgoodssales").then((res) => {
        let arr = JSON.parse(JSON.stringify(res.data.data));
        let goodsSalesList = [
            { data:[],name:'2020',type:'line' },
            { data:[],name:'2021',type:'line' },
            { data:[],name:'2022',type:'line' }
        ]
        arr.forEach(v => {
            if(v.year === 2020){
                goodsSalesList[0].data.push(v.value)
            }else if(v.year === 2021){
                goodsSalesList[1].data.push(v.value)
            }else{
                goodsSalesList[2].data.push(v.value)
            }
        });
        this.goodsSalesList = goodsSalesList;
        this.drawGoodsSales();
      });
    },
    drawGoodsSales() {
      let series = this.goodsSalesList;
      let myChart = this.$echarts.init(document.getElementById("goodsSales"));
      myChart.setOption({
        title: {
          text: "商品销售信息",
          left: "center",
          textStyle: {
            color: "#00BFFF",
            fontStyle: "oblique",
            fontWeight: "normal",
            fontSize: 24,
            lineHeight: 20,
          },
        },
        tooltip: {
          trigger: "axis",
        },
        legend: {
          data: ["2020", "2021", "2022"],
          left: "right",
        },
        xAxis: {
          type: "category",
          name: "月份",
          data: [
            "一月",
            "二月",
            "三月",
            "四月",
            "五月",
            "六月",
            "七月",
            "八月",
            "九月",
            "十月",
            "十一月",
            "十二月",
          ],
          nameTextStyle: {
            fontWeight: 600,
            fontSize: 18,
          },
        },
        yAxis: {
          type: "value",
          name: "销售量", // y轴名称
          // y轴名称样式
          nameTextStyle: {
            fontWeight: 600,
            fontSize: 18,
          },
        },
        series,
      });
    },
  },
};
</script>
<style lang="less">
.GoodsCharts {
  .statistic {
    margin-bottom: 50px;
  }

  #goodsCategory,
  #goodsSales {
    display: inline-block;
    width: 1000px;
    height: 450px;
  }
}
</style>
