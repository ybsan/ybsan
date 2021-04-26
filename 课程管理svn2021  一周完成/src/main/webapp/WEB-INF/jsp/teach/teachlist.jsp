<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>专业管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/layuiadmin/style/admin.css" media="all">
    <script type="text/javascript" src="/layuiadmin/jquery/jquery.min.js"></script>
</head>
<body>

<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">专业管理</a>
        <a><cite>专业管理</cite></a>
    </div>
</div>

<table class="layui-hide" id="test" lay-filter="test"></table>



<script type="text/html" id="major-table-barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script src="/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table'], function(){
        var admin = layui.admin
            ,table = layui.table;

        table.render({
            elem: '#test'
            ,url: '${pageContext.request.contextPath}/teach/toteachlist'
            ,toolbar: 'default' //开启头部工具栏，并为其绑定左侧模板
            ,defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                ,layEvent: 'LAYTABLE_TIPS'
                ,icon: 'layui-icon-tips'
            }]
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'teacherName', title:'任课老师',}
                ,{field:'courseName', title:'任教课程',}
                ,{fixed: 'right', title:'操作', toolbar: '#major-table-barDemo', width:150}
            ]]
            ,page: true
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            console.log(data)
            if(obj.event === 'del'){
                layer.confirm('确定删除吗？', function(index){
                    $.post('/teach/teachdel', {id: obj.data.id}, function (data) {
                        table.reload("test");
                        layer.msg('已删除');
                        layer.close(index);
                    });
                });
            }else if(obj.event === 'edit'){
                layer.open({
                    type: 2
                    ,title: '修改信息'
                    ,content: '/teach/teachedit?id='+data.id
                    ,maxmin: true
                    ,area: ['500px', '450px']
                    ,btn: ['确定', '取消']
                    ,yes: function(index, layero){

                        var iframeWindow = window['layui-layer-iframe'+ index]
                            ,submitID = 'LAY-user-front-submit'
                            ,submit = layero.find('iframe').contents().find('#'+ submitID);

                        submit.trigger('click');

                        layer.close(index); //关闭弹层

                        layer.msg('修改成功', {
                            icon: 1,
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        });

                        setTimeout(function () {
                            table.reload('test');
                        },200)
                    }
                });

            }
        });

        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据
            switch(obj.event){
                case 'add':
                    layer.open({
                        type: 2
                        ,title: '添加用户'
                        ,content: '/teach/teachedit?id='
                        ,maxmin: true
                        ,area: ['500px', '450px']
                        ,btn: ['确定', '取消']
                        ,yes: function(index, layero){

                            var iframeWindow = window['layui-layer-iframe'+ index]
                                ,submitID = 'LAY-user-front-submit'
                                ,submit = layero.find('iframe').contents().find('#'+ submitID);

                            submit.trigger('click');

                            layer.close(index); //关闭弹层

                            layer.msg('修改成功', {
                                icon: 1,
                                time: 1000 //2秒关闭（如果不配置，默认是3秒）
                            });

                            setTimeout(function () {
                                table.reload('test');
                            },200)
                        }
                    });
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：'+ checkStatus.data[0].id);


                        layer.open({
                            type: 2
                            ,title: '修改用户'
                            ,content: '/teach/teachedit?id='+checkStatus.data[0].id
                            ,maxmin: true
                            ,area: ['500px', '450px']
                            ,btn: ['确定', '取消']
                            ,yes: function(index, layero){

                                var iframeWindow = window['layui-layer-iframe'+ index]
                                    ,submitID = 'LAY-user-front-submit'
                                    ,submit = layero.find('iframe').contents().find('#'+ submitID);

                                submit.trigger('click');

                                layer.close(index); //关闭弹层

                                layer.msg('修改成功', {
                                    icon: 1,
                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                });

                                setTimeout(function () {
                                    table.reload('test');
                                },200)
                            }
                        });


                    }
                    break;
                case 'delete':
                    console.log(data)
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');

                        layer.confirm('确定删除吗？', function(index){
                            data.forEach(function (e) {
                                $.post('/teach/teachdel', {id: e.id}, function (data) {
                                });
                            })

                            setTimeout(function () {
                                table.reload("test");
                            },100)
                            layer.msg('已删除', {
                                icon: 1,
                                time: 1000 //2秒关闭（如果不配置，默认是3秒）
                            });

                            layer.close(index);

                        });

                    }
                    break;
            };
        });
    });
</script>
</body>
