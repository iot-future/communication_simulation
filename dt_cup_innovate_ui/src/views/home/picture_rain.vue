<template>
    <div style="width: 100%; height: 400px;">
        <div id="mychart6" style="width: 1100px; height: 400px; box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
    </div>

    <div style="width: 100%; height: 400px;">
        <div id="mychart7" style="width: 1100px; height: 400px; box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
    </div>
</template>


<script>
    import * as echarts from "echarts";

    export default {
        name: 'picture_rain',
        data() {
            return {
                data1: [
                    [300, 0.015],
                    [1000, 0.043],
                    [1500, 0.069],
                    [2000, 0.08]
                ],
                data2: [
                    [300, 0.02],
                    [1000, 0.056],
                    [1500, 0.092],
                    [2000, 0.13]
                ],
                data3: [
                    [300, 0.051],
                    [1000, 0.15],
                    [1500, 0.21],
                    [2000, 0.31]
                ],
                data4: [
                    [0, 0.2454],
                    [5, 0.1999],
                    [10, 0.1766],
                    [15, 0.1667],
                    [20, 0.1652],
                    [25, 0.1596]
                ],
                data5: [
                    [0, 0.2404],
                    [5, 0.1932],
                    [10, 0.1466],
                    [15, 0.0483],
                    [20, 0.0119],
                    [25, 0.00507]
                ],
            };
        },
        mounted() {
            this.Draw();
        },
        methods: {
            Draw() {
                let myChart6 = echarts.init(document.getElementById('mychart6'));
                let myChart7 = echarts.init(document.getElementById('mychart7'));
                myChart6.setOption({
                    title: {
                        text: '雨衰减值与距离关系',
                        left: 'center',
                    },
                    tooltip: {
                        trigger: 'axis',
                    },
                    legend: {
                        bottom: 10,
                    },
                    xAxis: {
                        type: 'value',
                        name: '覆盖距离(m)',
                        min: 300,  // 设置起始坐标值为 200
                    },
                    yAxis: {
                        type: 'value',
                        name: '衰减值(dB)',
                    },
                    series: [
                        {
                            name: '16mm(4.9GHz)',
                            type: 'line',
                            data: this.data1,
                            symbol: 'circle',
                            symbolSize: 8,
                            lineStyle: {
                                width: 2,
                            },
                        },
                        {
                            name: '50mm(3.5GHz)',
                            type: 'line',
                            data: this.data2,
                            symbol: 'circle',
                            symbolSize: 8,
                            lineStyle: {
                                width: 2,
                            },
                        },
                        {
                            name: '50mm(4.9GHz)',
                            type: 'line',
                            data: this.data3,
                            symbol: 'circle',
                            symbolSize: 8,
                            lineStyle: {
                                width: 2,
                            },
                        },
                    ],
                });
                myChart7.setOption({
                    title: {
                        text: '导频数为32时LS算法与OMP算法的性能仿真数据',
                        left: 'center',
                    },
                    tooltip: {
                        trigger: 'axis',
                    },
                    legend: {
                        bottom: 10,
                    },
                    xAxis: {
                        type: 'value',
                        name: '信噪比 ',
                    },
                    yAxis: {
                        type: 'value',
                        name: '误比特率',
                    },
                    series: [
                        {
                            name: 'LS算法',
                            type: 'line',
                            data: this.data4,
                            symbol: 'circle',
                            symbolSize: 8,
                            lineStyle: {
                                width: 2,
                            },
                        },
                        {
                            name: 'OMP算法',
                            type: 'line',
                            data: this.data5,
                            symbol: 'circle',
                            symbolSize: 8,
                            lineStyle: {
                                width: 2,
                            },
                        },
                    ],
                });
            },
        },
    };
</script>
