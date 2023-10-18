<template>
    <div style="width: 100%;height: 1200px;">
        <div id="mychart" style=" width: 100%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
        <div id="mychart2" style=" width: 100%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
        <!-- <div id="mychart4" style=" width: 100%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div> -->
        <div id="mychart3" style=" width: 100%; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
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
    // import { bottom } from "@popperjs/core";
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
            setInterval(() => {
                this.new_Array = this.$store.state.Scene;
            }, 2000); // 每隔1秒执行一次
            // alert(this.new_Array);

            this.timer = setInterval(() => {

                parameter.picture_3d(JSON.stringify(this.new_Array)).then((res) => {
                    this.data = res;
                    console.log(res);
                    this.Draw();
                })
                parameter.picture_bar(JSON.stringify(this.new_Array)).then((res) => {
                    console.log('1111')
                    // theory_SINR=res.data.theory_SINR
                    const data = JSON.parse(res.data)
                    this.actual_SINR = data.actual_SINR
                    this.theory_SINR = data.theory_SINR
                    this.Draw1()
                })
                parameter.picture_sinr(JSON.stringify(this.new_Array)).then((res) => {
                    const data = JSON.parse(res.data)
                    this.data_d = data.data_d
                    this.data_2_6 = data.data_2_6
                    this.data_3_5 = data.data_3_5
                    this.data_28 = data.data_28
                    this.Draw2()
                })
                parameter.picture_zaibo().then((res) => {
                    const data = JSON.parse(res.data)
                    this.througthput1 = data.througthput1
                    this.througthput2 = data.througthput2
                    this.MU_MUMO = data.MU_MUMO
                    this.througthput = data.througthput
                    this.Draw3()
                });
            }, 2000);
            // this.Draw4();
        },
        methods: {
            Draw() {
                // 基于准备好的dom，初始化echarts实例
                let myChart = echarts.init(document.getElementById('mychart'))

                // 绘制图表
                myChart.setOption({
                    title: {
                        text: '理论SINR',
                        left: '50%'
                    },
                    tooltip: {},
                    visualMap: {
                        min: 25,
                        max: 39,
                        inRange: {
                            color: [
                                '#313695',
                                '#4575b4',
                                '#74add1',
                                '#abd9e9',
                                '#e0f3f8',
                                '#ffffbf',
                                '#fee090',
                                '#fdae61',
                                '#f46d43',
                                '#d73027',
                                '#a50026'
                            ]
                        }
                    },
                    xAxis3D: {
                        name: '距离',
                        type: 'category',
                        axisLabel: {
                            formatter: '{value} m'
                        },
                        nameLocation: 'end'
                    },
                    yAxis3D: {
                        name: '基站发射功率(dbm)',
                        type: 'category',
                        axisLabel: {
                            formatter: '{value} '
                        }
                    },
                    zAxis3D: {
                        type: 'value',
                        name: '       信噪比      ',
                        min: '25',
                        max: '39',
                        axisLabel: {
                            formatter: '{value}db'
                        },
                    },
                    grid3D: {
                        boxWidth: 200,
                        boxDepth: 80,
                        viewControl: {
                            // projection: 'orthographic'
                        },
                        light: {
                            main: {
                                intensity: 1.2,
                                shadow: true
                            },
                            ambient: {
                                intensity: 0.3
                            }
                        }
                    },
                    series: [
                        {
                            type: 'bar3D',
                            data: this.data.map(function (item) {
                                return {
                                    value: [item[0], item[1], item[2]]
                                };
                            }),
                            shading: 'lambert',
                            label: {
                                fontSize: 16,
                                borderWidth: 1
                            },
                            emphasis: {
                                label: {
                                    fontSize: 20,
                                    color: '#900'
                                },
                                itemStyle: {
                                    color: '#900'
                                }
                            }
                        }
                    ]
                })
            },
            Draw1() {
                // 基于准备好的dom，初始化echarts实例
                let myChart = echarts.init(document.getElementById('mychart2'))

                // 绘制图表
                myChart.setOption({
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            crossStyle: {
                                color: '#999'
                            }
                        }
                    },
                    toolbox: {
                        feature: {
                            dataView: { show: true, readOnly: false },
                            magicType: { show: true, type: ['line', 'bar'] },
                            restore: { show: true },
                            saveAsImage: { show: true }
                        }
                    },
                    legend: {
                        data: ['实际值SINR', '理论值SINR']
                    },
                    xAxis: [
                        {
                            type: 'category',
                            data: ['传感器', '监控', '手机', '无人机'],
                            axisPointer: {
                                type: 'shadow'
                            },

                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            name: 'SINR',
                            min: -5,
                            max: 40,
                            interval: 5,
                            axisLabel: {
                                formatter: '{value} db'
                            }
                        }
                    ],
                    series: [
                        {
                            itemStyle: {
                                normal: {
                                    color: '#3B6291'
                                }
                            },
                            name: '实际值SINR',
                            type: 'bar',
                            tooltip: {
                                valueFormatter: function (value) {
                                    return value;
                                }
                            },
                            data: this.actual_SINR
                        },
                        {
                            itemStyle: {
                                normal: {
                                    color: '#ffa510'
                                }
                            },
                            name: '理论值SINR',
                            type: 'bar',
                            tooltip: {
                                valueFormatter: function (value) {
                                    return value;
                                }
                            },
                            data: this.theory_SINR
                        },
                    ]
                })
            },
            Draw2() {
                // 基于准备好的dom，初始化echarts实例
                let myChart = echarts.init(document.getElementById('mychart3'))

                // 绘制图表
                myChart.setOption({
                    title: {
                        // text: 'Stacked Line'
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['频率2.6GHz', '频率3.5GHz', '频率28GHz'],
                        top: '5%'
                    },
                    grid: {
                        left: '3%',
                        right: '10%',
                        bottom: '3%',
                        containLabel: true
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    xAxis: {
                        name: '距离',
                        type: 'category',
                        boundaryGap: false,
                        data: this.data_d,
                        axisLabel: {
                            formatter: '{value} m'
                        }
                    },
                    yAxis: {
                        name: '实际SINR',
                        type: 'value',
                        axisLabel: {
                            formatter: '{value} db'
                        }
                    },
                    series: [
                        {
                            name: '频率2.6GHz',
                            type: 'line',
                            data: this.data_2_6
                        },
                        {
                            name: '频率3.5GHz',
                            type: 'line',
                            data: this.data_3_5
                        },
                        {
                            name: '频率28GHz',
                            type: 'line',
                            data: this.data_28
                        },
                    ]
                })
            },

        },

    }

</script>

