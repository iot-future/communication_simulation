<template>
    <div style="width: 100%;height: 400px;">
        <div id="mychart5" style=" width: 1300px; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div>
        <!-- <div id="mychart6" style=" width: 1300px; height:400px;box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1)"></div> -->
    </div>
</template>
  
<script>
import * as echarts from "echarts";
export default {
    name: 'picturereduce',
    data() {
        return {
            data: [],
        };
    },
    mounted() {
        setInterval(this.Draw(),2000);
        
        // this.Draw1();
    },
    methods: {
        Draw() {
            // 基于准备好的dom，初始化echarts实例
            let myChart = echarts.init(document.getElementById('mychart5'))
            // 绘制图表
            myChart.setOption({
                title: {
                    text: '节能效果',
                    left: '50%'
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['网页节能效果','文本节能效果','视频流节能效果'],
                    bottom:'5%'
                },
                toolbox: {
                    show: true,
                    feature: {
                        dataZoom: {
                            yAxisIndex: 'none'
                        },
                        dataView: { readOnly: false },
                        magicType: { type: ['line', 'bar'] },
                        restore: {},
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    name: '仿真次数',
                    boundaryGap: false,
                    data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
                },
                yAxis: {
                    type: 'value',
                    name:'节能百分比',
                    axisLabel: {
                        formatter: '{value} %'
                    }
                },
                series: [
                    {
                        name: '网页节能效果',
                        type: 'line',
                        data: [91, 97, 93, 86, 92, 88, 94, 84, 92, 83],
                        markPoint: {
                            data: [
                                { type: 'max', name: 'Max' },
                                { type: 'min', name: 'Min' }
                            ]
                        },
                    },
                    {
                        name: '文本节能效果',
                        type: 'line',
                        data: [75,78,81,78,80,91,99,91,83,90],
                        markPoint: {
                            data: [
                                { type: 'max', name: 'Max' },
                                { type: 'min', name: 'Min' }
                            ]
                        },
                    },
                    {
                        name: '视频流节能效果',
                        type: 'line',
                        data: [87, 87, 90, 83, 89, 82, 99, 91, 95, 87],
                        markPoint: {
                            data: [
                                { type: 'max', name: 'Max' },
                                { type: 'min', name: 'Min' }
                            ]
                        },
                    },
                ]
            })
        },
        // Draw1() {
        //     // 基于准备好的dom，初始化echarts实例
        //     let myChart = echarts.init(document.getElementById('mychart6'))
        //     // 绘制图表
        //     myChart.setOption({
        //         title: {
        //             text: '占比',
        //             left: '50%'
        //         },
        //         tooltip: {
        //             trigger: 'axis'
        //         },
        //         // legend: {},
        //         toolbox: {
        //             show: true,
        //             feature: {
        //                 dataZoom: {
        //                     yAxisIndex: 'none'
        //                 },
        //                 dataView: { readOnly: false },
        //                 magicType: { type: ['line', 'bar'] },
        //                 restore: {},
        //                 saveAsImage: {}
        //             }
        //         },
        //         xAxis: {
        //             type: 'category',
        //             name: '比例',
        //             boundaryGap: false,
        //             data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']
        //         },
        //         yAxis: {
        //             type: 'value',
        //             axisLabel: {
        //                 formatter: '{value} %'
        //             }
        //         },
        //         series: [
        //             {
        //                 name: 'Highest',
        //                 type: 'line',
        //                 data: [87, 87, 90, 83, 89, 82, 99, 91, 95, 87],
        //                 markPoint: {
        //                     data: [
        //                         { type: 'max', name: 'Max' },
        //                         { type: 'min', name: 'Min' }
        //                     ]
        //                 },
        //             },
        //         ]
        //     })
        // },
    }

};
</script>
    
    