<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>开启头部工具栏 - 数据表格</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<style>
    .layui-table-page {
        text-align: center;
    }
</style>
<body>

<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">主页</a>
        <a><cite>组件</cite></a>
        <a><cite>数据表格</cite></a>
        <a><cite>开启头部工具栏</cite></a>
    </div>
</div>



<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">管理员信息列表</div>
                <div class="layui-card-body">

                    <div class="layui-row" align="center" style="height: 40px">

                        <form class="layui-form layui-col-md12 x-so" method="get" action="#">
                            <input type="text" id="queryContent" name="content" style="width:50%;"  placeholder="请输入..." autocomplete="off" class="layui-input" >
                            <button type="button"  class="layui-btn" style="margin-top: -65px;margin-left: 50%"  data-type="reload" id="queryRole"><i class="layui-icon">&#xe615;</i></button>
                        </form>

                    </div>




                    <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>
                    <script type="text/html" id="test-table-toolbar-toolbarDemo">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-sm" lay-event="getCheckData">添加学生</button>
                            <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
                            <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
                        </div>
                    </script>

                    <script type="text/html" id="test-table-toolbar-barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table'], function () {
        var admin = layui.admin
            , table = layui.table;

        var tableIns= table.render({
            elem: '#test-table-toolbar'
            , url: '${pageContext.request.contextPath}/student/list'
            , toolbar: '#test-table-toolbar-toolbarDemo'
            , title: '管理员信息列表'
            , cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 180, fixed: 'left', unresize: true, sort: true}
                , {field: 'name', title: '姓名', width: 180, edit: 'text'}
                , {field: 'sex', title: '性别', width: 180, edit: 'text'}
                , {field: 'birth', title: '生日', width: 180, edit: 'text'}
                , {field: 'password', title: '密码', width: 180, edit: 'text',templet:function (res) {
                        return '*******'
                    }}
                , {fixed: 'right', title: '操作', toolbar: '#test-table-toolbar-barDemo'}
            ]]
            , page: true
            , limit: 6
            , limits: [1, 2, 6, 8, 10, 15]
        });

        //头工具栏事件
        table.on('toolbar(test-table-toolbar)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    /* var data = checkStatus.data;*/
                    //JSON.stringify(data)
                    // layer.alert('添加学生信息');
                    layer.open({
                        type: 2,
                        title: false,
                        closeBtn: 0,
                        shadeClose: true,
                        skin: 'yourClass',
                        area: ['600px', '400px'],
                        end:function(){
                            /* tableIns.reload()*/
                        },
                        content: "/student/toAdd"
                    });
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test-table-toolbar)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                    $.post("/student/delete", {id: data.id}, function (result) {
                    })


                });
            } else if (obj.event === 'edit') {

                layer.open({
                    type: 2,
                    title: false,
                    closeBtn: 0,
                    shadeClose: true,
                    skin: 'yourClass',
                    area: ['600px', '400px'],
                    end:function(){
                        /* tableIns.reload()*/
                    },

                    content: "/student/toUpd?id="+data.id

                });
            }
        });

        $('#queryRole').on('click',function (event,n) {
            var queryContent=$("#queryContent").val();
            if(n){
                tableIns.reload({
                    url:'${pageContext.request.contextPath}/student/list?content='+queryContent
                })
                return;
            }
            // alert(queryContent)
            tableIns.reload({
                url:'${pageContext.request.contextPath}/student/list?content='+queryContent
                ,page:{
                    curr:1
                }

            })

        });
    });
</script>
</body>
</html>
