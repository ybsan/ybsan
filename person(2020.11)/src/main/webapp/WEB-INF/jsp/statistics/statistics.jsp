<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>

    <!-- 导入jquery插件 -->
    <script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/china.js"></script>
    <style type="text/css">
        p {
            font-family: "宋体", "仿宋", sans-serif;
            text-align: left;
            font-size: 14px;
        }
    </style>
</head>
<body>

<div style="width:100%;height:190%;margin-top:-30px; border:0;">
    <h1 align="center" style="color:  rgb(26,160,147); font-size:30px; margin-top:30px">数据统计报表</h1>
    <hr>

    <div style="height:320px;width:320px;margin-top: 50px;margin-left:50px;">
        <div id="mainChart" style="border: 2px solid rosybrown; width:100%; height:100%;"></div>
    </div>

    <div style="height:320px;width:660px;margin-left:400px;margin-top:-320px;">
        <div id="mainChart1" style="border: 2px solid rosybrown; width:100%; height:100%;"></div>
    </div>

    <div style="width: 480px;height: 400px; border:2px solid rosybrown;margin-top:50px;margin-left:50px;">
        <div id="mainChart2" style="border: 2px solid rosybrown; width:100%; height:100%;"></div>
    </div>

    <div style="width: 500px;height: 400px; border:2px solid rosybrown;margin-top:-404px;margin-left:560px;margin-bottom: 15px;">
        <div id="mainChart3" style="border: 2px solid rosybrown; width:100%; height:100%;"></div>
    </div>

</div>

<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('mainChart'));
    myChart.setOption({
        title: {
            text: '员工男女比例统计',
            subtext: '内部数据',
            x: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: [
                {
                    "value": 3,
                    "name": "女"
                },
                {
                    "value": 1,
                    "name": "男"
                }
            ]
        },
        series: [
            {
                name: '访问来源',
                type: 'pie',    // 设置图表类型为饼图
                radius: '55%',  // 饼图的半径，外半径为可视区尺寸（容器高宽中较小一项）的 55% 长度。
                data: [
                    {
                        "value": 3,
                        "name": "女"
                    },
                    {
                        "value": 1,
                        "name": "男"
                    }
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    })
</script>

</script>
<script type="text/javascript">

    // 基于准备好的dom，初始化echarts实例
    var myChart2 = echarts.init(document.getElementById('mainChart1'),'light');

    var emps = [{"value": 10, "name": "职员"}, {"value": 18, "name": "Java中级开发工程师"}, {
        "value": 5,
        "name": "主管"
    }, {"value": 1, "name": "总经理"}];
//map方法把元素分开的
    var names = emps.map(e => e.name)
    var values = emps.map(v => v.value)

    // 指定图表的配置项和数据
    var option2 = {
        title: {
            text: '各职位员工人数',
            subtext: '内部数据',
            x: 'center'
        },
        tooltip: {},
        legend: {
            orient: 'vertical',
            left: 'left'
        },
        itemStyle: {
            normal: {
                // 随机显示
                color:function(d){return "#"+Math.floor(Math.random()*(256*256*256-1)).toString(16);
                }
            },
        },
        xAxis: {
            data: names,
            axisLabel: {
                interval: 0,
                rotate: -25
            }
        },
        yAxis: {},
        series: [{
            name: '员工人数',
            type: 'bar',
            data: values
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart2.setOption(option2);
</script>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart3 = echarts.init(document.getElementById('mainChart2'));

    // 指定图表的配置项和数据
    var option3 = {
        title: {
            text: ''
        },
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data: ['邮件营销', '联盟广告', '视频广告', '直接访问', '搜索引擎']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name: '邮件营销',
                type: 'line',
                stack: '总量',
                data: [120, 132, 101, 134, 90, 230, 210]
            },
            {
                name: '联盟广告',
                type: 'line',
                stack: '总量',
                data: [220, 182, 191, 234, 290, 330, 310]
            },
            {
                name: '视频广告',
                type: 'line',
                stack: '总量',
                data: [150, 232, 201, 154, 190, 330, 410]
            },
            {
                name: '直接访问',
                type: 'line',
                stack: '总量',
                data: [320, 332, 301, 334, 390, 330, 320]
            },
            {
                name: '搜索引擎',
                type: 'line',
                stack: '总量',
                data: [820, 932, 901, 934, 1290, 1330, 1320]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart3.setOption(option3);
</script>


<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart4 = echarts.init(document.getElementById('mainChart3'));

    // 指定图表的配置项和数据
    var option4 = option = {
        title: {
            text: '人员分布',
            subtext: '纯属虚构',
            left: 'center'
        },
        tooltip: {
            trigger: 'item'
        },
        legend: {
            orient: 'vertical',
            left: 'left',
            data: ['人员']
        },
        visualMap: {
            min: 0,
            max: 2500,
            left: 'left',
            top: 'bottom',
            text: ['高', '低'],           // 文本，默认为数值文本
            calculable: true
        },
        toolbox: {
            show: true,
            orient: 'vertical',
            left: 'right',
            top: 'center',
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '人员',
                type: 'map',
                mapType: 'china',
                roam: false,
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: true
                    }
                },
                data: [
                    {name: '北京', value: Math.round(Math.random() * 1000)},
                    {name: '天津', value: Math.round(Math.random() * 1000)},
                    {name: '上海', value: Math.round(Math.random() * 1000)},
                    {name: '重庆', value: Math.round(Math.random() * 1000)},
                    {name: '河北', value: Math.round(Math.random() * 1000)},
                    {name: '河南', value: Math.round(Math.random() * 1000)},
                    {name: '云南', value: Math.round(Math.random() * 1000)},
                    {name: '辽宁', value: Math.round(Math.random() * 1000)},
                    {name: '黑龙江', value: Math.round(Math.random() * 1000)},
                    {name: '湖南', value: Math.round(Math.random() * 1000)},
                    {name: '安徽', value: Math.round(Math.random() * 1000)},
                    {name: '山东', value: Math.round(Math.random() * 1000)},
                    {name: '新疆', value: Math.round(Math.random() * 1000)},
                    {name: '江苏', value: Math.round(Math.random() * 1000)},
                    {name: '浙江', value: Math.round(Math.random() * 1000)},
                    {name: '江西', value: Math.round(Math.random() * 1000)},
                    {name: '湖北', value: Math.round(Math.random() * 1000)},
                    {name: '广西', value: Math.round(Math.random() * 1000)},
                    {name: '甘肃', value: Math.round(Math.random() * 1000)},
                    {name: '山西', value: Math.round(Math.random() * 1000)},
                    {name: '内蒙古', value: Math.round(Math.random() * 1000)},
                    {name: '陕西', value: Math.round(Math.random() * 1000)},
                    {name: '吉林', value: Math.round(Math.random() * 1000)},
                    {name: '福建', value: Math.round(Math.random() * 1000)},
                    {name: '贵州', value: Math.round(Math.random() * 1000)},
                    {name: '广东', value: Math.round(Math.random() * 1000)},
                    {name: '青海', value: Math.round(Math.random() * 1000)},
                    {name: '西藏', value: Math.round(Math.random() * 1000)},
                    {name: '四川', value: Math.round(Math.random() * 1000)},
                    {name: '宁夏', value: Math.round(Math.random() * 1000)},
                    {name: '海南', value: Math.round(Math.random() * 1000)},
                    {name: '台湾', value: Math.round(Math.random() * 1000)},
                    {name: '香港', value: Math.round(Math.random() * 1000)},
                    {name: '澳门', value: Math.round(Math.random() * 1000)}
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChart4.setOption(option4);
</script>


</body>

</html>