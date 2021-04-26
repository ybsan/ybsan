<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

</head>
<body>
<div id="main" style="width: 1200px;height:600px;"></div>
<script type="text/javascript">

    //使用ajax加载数据
    //使用ajax加载数据
    $.ajax({
        method:'post',
        url:'${pageContext.request.contextPath}/dept/getDeptNum',
        dataType:'json',
        success:function(data){
            console.log(data);
            let names= data.map(d =>d.name);
            let nums= data.map(d =>d.num);

            // 基于准备好的dom，初始化echarts实例
            var myChart = echarts.init(document.getElementById('main'));

            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '各部门的员工数'
                },
                tooltip: {},
                legend: {
                    data:['人数']
                },
                xAxis: {
                    data: names
                },
                yAxis: {},
                series: [{
                    name: '销量',
                    type: 'bar',
                    data: nums
                }]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }
    });




</script>
</body>
</html>
