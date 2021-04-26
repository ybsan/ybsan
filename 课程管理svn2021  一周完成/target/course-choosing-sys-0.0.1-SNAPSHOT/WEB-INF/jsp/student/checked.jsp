<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>已选课程</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">已选课程</a>
        <a><cite>已选课程</cite></a>
    </div>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body">
                    <table class="layui-hide" id="major-table" lay-filter="major-table"></table>

                    <script type="text/html" id="major-table-toolbarDemo">
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <div class="layui-input-block layui-col-md10" >
                                    <input type="text" name="content" id="queryContent" placeholder="请输入搜索内容" autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <div class="layui-inline layui-col-sm-offset1">
                                <button class="layui-btn layuiadmin-btn-admin" lay-submit lay-filter="LAY-user-back-search" data-type="reload" id="queryRole">
                                    <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                                </button>
                            </div>
                        </div>
                    </script>

                    <script type="text/html" id="major-table-barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="drop">退选</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../../../layuiadmin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
    layui.config({
        base: '../../../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table'], function(){
        var admin = layui.admin
            ,table = layui.table;

        var tableIns=table.render({
            elem: '#major-table'
            ,url: '/stucourse/checkeddata'
            ,toolbar: '#major-table-toolbarDemo'
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'name', title:'学生'}
                ,{field:'courseName',align:'center', title:'课程名称'}
                ,{field:'courseCredit',align:'center', title:'学分'}
                ,{field:'courseTimes', align:'center',title:'学时'}
                ,{fixed: 'right', title:'操作', toolbar: '#major-table-barDemo'}
            ]]
            , page:{
                layout:["first","prev","page","next","count","limit","skip","last"]
                , limit: 10 //默认分页条数
                , limits: [1,2,3,5,10,15] //自定义分页数据选项
            }
            , id: 'reload' //用于绑定模糊查询条件等等
            , done:function(res){
                $('#layui-table-page1').attr('style','margin-left:300px')
                var data = res.data;
            }
            , loading: false //请求数据时，是否显示loading
        });

        $('#queryRole').on('click', function(event,froms){
            var  queryContent = $('#queryContent').val()
            tableIns.reload({
                url: '/stucourse/checked?content='+queryContent
                ,page: {
                    curr:1
                }
            })
        });

        //监听行工具事件
        table.on('tool(major-table)', function(obj){
            var data = obj.data;
            console.log(data)
            if(obj.event === 'drop'){
                layer.confirm('确定退课？', function(index){
                    $.ajax({
                        url:"/stucourse/drop",
                        type:"get",
                        data:{"courseName":data.courseName,
                            "name":data.name},
                        dataType:"text",
                        beforeSend:function(){},
                        success:function (message) {
                            if (message=="退课成功"){
                                layer.msg(message,{icon:1,time:1000});
                            }else {
                                layer.msg(message,{icon:2,time:1000});
                            }
                            tableIns.reload({
                                url: '/stucourse/checkeddata'
                                ,page: {
                                    curr:1
                                }
                            })
                        }
                    });
                });
            }
        });


    });
</script>
</body>
</html>