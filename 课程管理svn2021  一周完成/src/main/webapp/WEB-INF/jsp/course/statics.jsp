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
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
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


    <div style="height:320px;width:660px;margin-left:200px;">
        <div id="mainChart1" style="border: 2px solid rosybrown; width:100%; height:100%;"></div>
    </div>




</div>

<script type="text/javascript">

    $.ajax({
        method:'post',
        url:'${pageContext.request.contextPath}/course/staticsCourse',
        dataType:'json',
        success:function(data) {
            console.log(data);



            // 基于准备好的dom，初始化echarts实例
            var myChart2 = echarts.init(document.getElementById('mainChart1'),'light');

            var emps = data

            var names = emps.map(e => e.name)
            var values = emps.map(v => v.value)

            var option2 = {
                title: {
                    text: '各课程选课人数',
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
                        rotate: -25,
                        formatter:function(value){
                            var result = "";//拼接加\n返回的类目项
                            var maxLength = 10;//每项显示文字个数
                            var valLength = value.length;//X轴类目项的文字个数
                            var rowNumber = Math.ceil(valLength / maxLength); //类目项需要换行的行数
                            if (rowNumber > 1)//如果文字大于3,
                            {
                                for (var i = 0; i < rowNumber ; i++) {
                                    var temp = "";//每次截取的字符串
                                    var start = i * maxLength;//开始截取的位置
                                    var end = start + maxLength;//结束截取的位置
                                    temp = value.substring(start, end) + "\n";
                                    result += temp; //拼接生成最终的字符串
                                }
                                return result ;
                            }
                            else {
                                return value;
                            }
                        }
                    }


                },
                yAxis: {/*max:4*/},
                series: [{
                    name: '选课人数',
                    type: 'bar',
                    data: values
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart2.setOption(option2);




        }
    })



</script>


</body>

</html>