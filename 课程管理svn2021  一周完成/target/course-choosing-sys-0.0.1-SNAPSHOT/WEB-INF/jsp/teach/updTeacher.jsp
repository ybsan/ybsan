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
        <div class="layui-card-header">修改教师信息</div>

            <form class="layui-form" method="post" action="/teacher/updTeacher" id="form_post" lay-filter="component-form-group">
                <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
                <input type="hidden" name="teacherNum" value="${teacher.teacherNum}">

                <div class="layui-form-item">
                    <label class="layui-form-label">院系</label>
                    <div class="layui-input-block">
                        <input type="text" name="deptNum" lay-verify="required" placeholder="请输入院系" autocomplete="off" class="layui-input" value="${teacher.deptNum}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="teacherName" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input" value="${teacher.teacherName}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="teacherPassword" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="${teacher.teacherPassword}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="teacherSex" value="男" title="男" ${teacher.teacherSex=='男'?'checked':''}>
                        <input type="radio" name="teacherSex" value="女" title="女" ${teacher.teacherSex=='女'?'checked':''}>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">生日</label>
                    <div class="layui-input-inline">
                        <input type="text" name="birthday" lay-verify="date" id="LAY-component-form-group-date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" value="${teacher.teacherBirthday}">
                    </div>

                </div>
                <br><br>

                <div class="layui-form-item">
                    <label class="layui-form-label">职称</label>
                    <div class="layui-input-block">
                        <input type="text" name="teacherTitle" lay-verify="required" placeholder="请输入职称" autocomplete="off" class="layui-input" value="${teacher.teacherTitle}">
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
                </div>
            </form>

    </div>
</div>


<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'form', 'laydate'], function(){
        var $ = layui.$
            ,admin = layui.admin
            ,element = layui.element
            ,layer = layui.layer
            ,laydate = layui.laydate
            ,form = layui.form;

        form.render(null, 'component-form-group');

        laydate.render({
            elem: '#LAY-component-form-group-date',
            type:'date',
            trigger:'click',
        });

        /* 自定义验证规则 */
        form.verify({
            pass: [/(.+){6,12}$/, '密码必须6到12位']
        });

        /* 监听提交 */
        form.on('submit(component-form-demo1)', function(data){
            var studentObj=data.field;
            //console.log(data)
            console.log(studentObj)

            $.post("/teacher/updTeacher", studentObj,function (result) {
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

