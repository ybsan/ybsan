<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>教师管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">教师管理</a>
        <a><cite>教师管理</cite></a>
    </div>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
                <div class="layui-card-body">

                    <div class="layui-inline">内容：
                        <div class="layui-inline">
                            <input class="layui-input" type="text" id="content_content" name="content" placeholder="请输入搜索内容" autocomplete="off" />
                        </div>
                        <button class="layui-btn" lay-submit="" lay-filter="reload" id="search">搜索</button>
                    </div>

                    <table class="layui-hide" id="major-table" lay-filter="major-table"></table>

                    <script type="text/html" id="major-table-toolbarDemo">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-sm" lay-event="add">添加老师</button>
                        </div>
                    </script>

                    <script type="text/html" id="major-table-barDemo">
                        <a class="layui-btn layui-btn-sm" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del">删除</a>
                    </script>
                </div>

        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table'], function(){
        var admin = layui.admin
            ,table = layui.table;

        var tableIns=table.render({
            elem: '#major-table'
            ,url: '${pageContext.request.contextPath}/teacher/teachList'
            ,toolbar: '#major-table-toolbarDemo'
            ,title: '教师信息表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'teacherNum', align:'center',title:'教师号',  fixed: 'left', unresize: true, sort: true}
                ,{field:'departName', align:'center',title:'院系',  edit: 'text',templet: function(res){
                        return res.dept.departName}}
                ,{field:'teacherName',align:'center', title:'教师姓名',  edit: 'text'}
                ,{field:'teacherPassword',align:'center', title:'密码',  edit: 'text'}
                ,{field:'teacherSex', align:'center',title:'性别',  edit: 'text'}
                ,{field:'teacherBirthday',align:'center', title:'出生日期',  edit: 'text'}
                ,{field:'teacherTitle',align:'center',title:'职称',  edit: 'text'}
                ,{fixed: 'right', title:'操作', toolbar: '#major-table-barDemo', width:190}
            ]]
            ,page: true
            , limit: 6
            , limits: [1, 2, 6, 8, 10, 15]
        });


        //头工具栏事件
        table.on('toolbar(major-table)', function (obj) {
            if (obj.event === 'add') {
                layer.open({
                    type: 2,
                    title: false,
                    closeBtn: 0,
                    shadeClose: true,
                    skin: 'yourClass',
                    area: ['700px', '600px'],
                    end:function(){
                        tableIns.reload();
                    },
                    content: "/teacher/toAddTeacher"
                });
            };
        });

        //监听行工具事件
        table.on('tool(major-table)', function(obj){
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                    $.post("/teacher/delete", {teacherNum: data.teacherNum}, function (result) {
                        $('#search').trigger("click","5");
                    })
                });
            } else if (obj.event === 'edit') {
                layer.open({
                    type: 2,
                    title: false,
                    closeBtn: 0,
                    shadeClose: true,
                    skin: 'yourClass',
                    area: ['893px', '600px'],
                    end:function(){
                        tableIns.reload();
                    },
                    content: "/teacher/toUpdTeacher?id="+data.teacherNum
                });
            }

        });

        $('#search').on('click',function (event,n) {
            var content=$("#content_content").val();
           // alert(content)
            if(n){
                tableIns.reload({
                    url:'${pageContext.request.contextPath}/teacher/teachList?content='+content
                })
                return;
            }
            tableIns.reload({
                url:'${pageContext.request.contextPath}/teacher/teachList?content='+content
                ,page:{
                    curr:1
                }
            })

        });

    });
</script>
</body>
</html>