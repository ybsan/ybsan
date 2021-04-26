<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/14
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>专业管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../../layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">专业管理</a>
        <a><cite>专业管理</cite></a>
    </div>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-form layui-card-header layuiadmin-card-header-auto">
                    <div class="layui-form-item layui-row layui-col-md-offset3"  >
                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <div class="layui-input-block layui-col-md10" >
                                    <input type="text" name="content" placeholder="输入名称,描述,均可查询" autocomplete="off" class="layui-input">

                                </div>
                            </div>
                            <div class="layui-inline layui-col-sm-offset1">
                                <button class="layui-btn layuiadmin-btn-admin" lay-submit lay-filter="LAY-major-back-search">
                                    <i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="major-table" lay-filter="major-table"></table>

                    <script type="text/html" id="major-table-toolbarDemo">
                        <div class="layui-btn-container">
                            <button class="layui-btn layui-btn-sm" lay-event="add">添加专业</button>

                        </div>
                    </script>

                    <script type="text/html" id="major-table-barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 添加和修改的弹出层-->
<div style="display: none;padding: 20px" id="saveOrUpdateDiv">
    <form class="layui-form layui-row layui-col-space10" lay-filter="dataFrm" id="dataFrm">
        <div class="layui-col-md12 layui-col-xs12">
            <div class="layui-row layui-col-space10">
                <div class="layui-col-md9 layui-col-xs7">

                    <div class="layui-form-item magt3">
                        <label class="layui-form-label">专业名称:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="majorName" id="majorName" autocomplete="off" class="layui-input"
                                   lay-verify="required"
                                   placeholder="请输入专业名称" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-form-item magt3">
                        <label class="layui-form-label">所属院系</label>
                        <div class="layui-input-block">
                            <select name="departId" id="departId" lay-verify="required" lay-filter="xmFilter" >
                                <option value=""></option>
                            </select>
                        </div>
                    </div>
                    <div class="layui-form-item magt3">
                        <label class="layui-form-label">辅导员:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="majorDuidance" id="majorDuidance" autocomplete="off" class="layui-input"
                                   lay-verify="required"
                                   placeholder="请输入辅导员" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>
                    <div class="layui-form-item magt3">
                        <label class="layui-form-label">邮箱:</label>
                        <div class="layui-input-block" style="padding: 5px">
                            <input type="text" name="email" id="email" autocomplete="off" class="layui-input"
                                   lay-verify="email"
                                   placeholder="请输入联系邮箱" style="height: 30px;border-radius: 10px">
                        </div>
                    </div>  <div class="layui-form-item magt3">
                    <label class="layui-form-label">专业介绍:</label>
                    <div class="layui-input-block" style="padding: 5px">
                        <input type="text" name="majorIntroduce" id="majorIntroduce" autocomplete="off" class="layui-input"
                               lay-verify="required"
                               placeholder="请输入专业介绍" style="height: 30px;border-radius: 10px">
                    </div>
                </div>

                    <div hidden>
                        <input type="text" name="majorId" lay-verify=""   class="layui-input " >
                    </div>

                    <div class="layui-form-item magb0">
                        <div class="layui-input-block" style="text-align: center;padding-right: 120px">
                            <button type="button"
                                    class="layui-btn layui-btn-normal layui-btn-md layui-icon layui-icon-release layui-btn-radius"
                                    lay-filter="doSubmit" lay-submit="">提交
                            </button>
                            <button type="reset"
                                    class="layui-btn layui-btn-warm layui-btn-md layui-icon layui-icon-refresh layui-btn-radius">
                                重置
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
<script src="../../../layuiadmin/layui/layui.js"></script>
<script>
    var tableIns
    layui.config({
        base: '../../../layuiadmin/' //静态资源所在路径
    }).extend({

        index: 'lib/index' //主入口模块
    }).use(['index', 'table','jquery','form',], function(){
        var admin = layui.admin
            , form = layui.form
            ,table = layui.table
            , $ = layui.jquery;

        tableIns= table.render({
            elem: '#major-table'
            ,url:'/major/tomajorlist'
            ,toolbar: '#major-table-toolbarDemo'
            ,title: '专业表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'majorId', title:'ID',  fixed: 'left', unresize: true, sort: true}
                ,{field:'majorName', title:'名称', }
                ,{field: 'depart', title: '院系名称',sort: true,templet:function(d){return d.depart.departName}}
                ,{field:'majorDuidance', title:'辅导员', }
                ,{field:'email', title:'email', }
                ,{field:'majorIntroduce', title:'专业介绍', }

                ,{fixed: 'right', title:'操作', toolbar: '#major-table-barDemo', width:150}
            ]]
            ,page: true
        });

        //头工具栏事件
        table.on('toolbar(major-table)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'add':
                    openAddMajor();

            };
        });

        //监听行工具事件
        table.on('tool(major-table)', function(obj){
            var data = obj.data;
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "/major/del",
                        data: {"id": data.majorId},
                        success: function (data) {
                            if (data.code == 0) {
                                // obj.del();
                                table.reload('major-table');
                            }
                            layer.msg(data.msg);
                        }
                    });
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                openUpdateMajor(data);

            }
        });
        var url;
        var mainIndex;

        $.ajax({
            url: '/major/dept',
            dataType: 'json',
            type: 'get',
            success: function (data) {
                console.log(data);//下面会提到这个data是什么值
                //使用循环遍历，给下拉列表赋值
                $.each(data.data, function (index, value) {
                    console.log(value.departId);
                    $('#departId').append(new Option(value.departName,value.departId));// 下拉菜单里添加元素
                });
                layui.form.render("select");//重新渲染 固定写法
            }
        })




//打开修改页面
        function openUpdateMajor(data) {
            mainIndex = layer.open({
                type: 1,
                title: '修改专业',
                content: $("#saveOrUpdateDiv"),
                area: ['600px', '500px'],
                success: function (index) {
                    form.val("dataFrm", data);
                    url = "/major/addedit";

                }
            });
        }
        //模糊查询
        form.on('submit(LAY-major-back-search)', function(data){
            var field = data.field;
            //执行重载
            table.reload('major-table', {
                where: field
            });
        });

        function openAddMajor() {
            $("#dataFrm")[0].reset();
            mainIndex = layer.open({

                type: 1,
                title: '添加专业',
                content: $("#saveOrUpdateDiv"),
                area: ['600px', '500px'],
                success: function (index) {

                    url = "/major/add";

                }
            });
        }

        form.on("submit(doSubmit)", function (obj) {
            //序列化表单数据
            var params = $("#dataFrm").serialize();
            $.post(url, params, function (obj) {
                layer.msg(obj.msg)

                //关闭弹出层
                layer.close(mainIndex)
                //刷新数据 表格
                tableIns.reload();
            })
        });


    });
</script>
</body>
</html>