<template>
  <div style="width: 100%;height: 400px;">
    <!-- <div id="mychart" style=" width: 100%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div> -->
    <!-- <div id="mychart2" style=" width: 100%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div> -->
    <div id="mychart4" style=" width: 1300px; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
    <!-- <div id="mychart3" style=" width: 100%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div> -->
    <!-- <div id="mychart5" style=" width: 100%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div> -->
    <!-- <div id="mychart" style=" float: 'left';width: 50%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
    <div id="mychart2" style=" float: 'right';width: 50%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
    <div id="mychart4" style="float: 'left'; width: 50%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
    <div id="mychart3" style=" float: 'right';width: 50%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div> -->
  </div>
</template>

<script>
import * as echarts from "echarts";
import 'echarts-gl';
import { parameter } from "../../api/apis.js";
import { bottom } from "@popperjs/core";
export default {
  data() {
    return {
      data: [],
      actual_SINR: [],
      theory_SINR: [],
      througthput1: [],
      througthput2: [],
      MU_MUMO: [],
    };
  },
  mounted() {
    parameter.picture_zaibo().then((res) => {
      const data = JSON.parse(res.data)
      this.througthput1 = data.througthput1
      this.througthput2 = data.througthput2
      this.MU_MUMO = data.MU_MUMO
      this.througthput = data.througthput
      this.Draw3()
    });
  },
  methods: {
    Draw3() {
      // 基于准备好的dom，初始化echarts实例
      let myChart = echarts.init(document.getElementById('mychart4'))
      const colors = ['#5470C6', '#91CC75', '#EE6666'];
      // 绘制图表
      myChart.setOption({
        color: colors,
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'cross'
          }
        },
        grid: {
          left: '20%',
          right: '30%',
          bottom: '5%'
        },
        toolbox: {
          feature: {
            dataView: { show: true, readOnly: false },
            restore: { show: true },
            saveAsImage: { show: true }
          }
        },
        legend: {
          // data: ['吞吐量', '吞吐量']
        },
        xAxis: [
          {
            type: 'category',
            name: 'MU-MIMO',
            axisTick: {
              alignWithLabel: true
            },
            axisLabel: {
              formatter: '{value} 个'
            },
            // prettier-ignore
            data: this.MU_MUMO
          }
        ],
        yAxis: [
          {
            type: 'value',
            name: 'FR1吞吐量',
            position: 'right',
            alignTicks: true,
            offset: 80,
            axisLine: {
              show: true,
              lineStyle: {
                color: colors[0]
              }
            },
            axisLabel: {
              formatter: '{value} Mbps'
            },

          },
          {
            type: 'value',
            name: 'FR2吞吐量',
            position: 'right',
            alignTicks: true,
            offset: 170,
            axisLine: {
              show: true,
              lineStyle: {
                color: colors[1]
              }
            },
            axisLabel: {
              formatter: '{value} Mbps'
            }
          },
          {
            type: 'value',
            name: '载波聚合吞吐量',
            position: 'left',
            alignTicks: true,
            axisLine: {
              show: true,
              lineStyle: {
                color: colors[2]
              }
            },
            axisLabel: {
              formatter: '{value} Mbps'
            }
          }
        ],
        series: [
          {
            name: 'FR1吞吐量',
            type: 'bar',
            data: this.througthput1,
            markLine: {
              data: [{
                name: '需求',
                yAxis: 74082.73406
              }]
            }
          },
          {
            name: 'FR2吞吐量',
            type: 'bar',
            yAxisIndex: 1,
            data: this.througthput2,
            markLine: {
              data: [{
                name: '需求',
                yAxis: 74082.73406
              }]
            }
          },
          {
            name: '载波聚合吞吐量',
            type: 'line',
            yAxisIndex: 2,
            data: this.througthput
          }
        ]
      })
    },
  }
};
</script>
  
  