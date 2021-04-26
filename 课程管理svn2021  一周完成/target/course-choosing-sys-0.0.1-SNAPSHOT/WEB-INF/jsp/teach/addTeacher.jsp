<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>表单组合</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>

<div class="layui-fluid">
    <div class="layui-card">
        <div class="layui-card-header">添加教师信息</div>
        <div class="layui-card-body" style="padding: 15px;">
            <form class="layui-form" action="" lay-filter="component-form-group">


                <div class="layui-form-item">
                    <label class="layui-form-label">教师号</label>
                    <div class="layui-input-block">
                        <input type="text" name="teacherNum" lay-verify="required" placeholder="请输入教师号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">院系</label>
                    <div class="layui-input-block">
                        <input type="text" name="deptNum" lay-verify="required" placeholder="请输入院系" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="teacherName" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="teacherPassword" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="teacherSex" value="男" title="男" ${teach.TeacherSex=='男'?'checked':''}>
                        <input type="radio" name="teacherSex" value="女" title="女" ${teach.TeacherSex=='女'?'checked':''}>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">生日</label>
                    <div class="layui-input-inline">
                        <input type="text" name="birthday" lay-verify="date" id="LAY-component-form-group-date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                    </div>

                </div>
                <br><br>

                <div class="layui-form-item">
                    <label class="layui-form-label">职称</label>
                    <div class="layui-input-block">
                        <input type="text" name="teacherTitle" lay-verify="required" placeholder="请输入职称" autocomplete="off" class="layui-input" value="${teach.name}">
                    </div>
                </div>
                <div class="layui-form-item layui-layout-admin">
                    <div class="layui-input-block">
                        <div class="layui-footer" style="left: 0;">
                            <button class="layui-btn" lay-submit="" lay-filter="component-form-demo1">立即提交</button>
                            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                        </div>
                    </div>
                </div>

            </form>
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
    }).use(['index', 'form', 'laydate'], function(){
        var $ = layui.$
            ,laydate = layui.laydate
            ,form = layui.form;

        form.render(null, 'component-form-group');

        laydate.render({
            elem: '#LAY-component-form-group-date',
            type:'date',
            trigger:'click'
        });

        /* 自定义验证规则 */
        form.verify({
            pass: [/(.+){5,12}$/, '密码必须5到12位']
        });

        /* 监听提交 */
        form.on('submit(component-form-demo1)', function(data){
            var studentObj=data.field;

            $.post("/teacher/addTeacher", studentObj,function (result) {
                parent.layer.alert(result, {
                    title: '结果'
                })
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);//关闭当前弹窗页面
            })

            return false;
        });
    });
</script>
</body>
</html>

