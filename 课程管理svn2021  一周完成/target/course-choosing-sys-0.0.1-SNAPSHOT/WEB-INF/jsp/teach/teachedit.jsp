
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改框</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <script type="text/javascript" src="${pageContext.request.contextPath}/layuiadmin/jquery/jquery.min.js"></script>
</head>
<body>

<form method="post" action="toTeachEdit" id="form_post">
    <div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
        <input type="hidden" name="id" value="${teach.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">任课老师</label>
            <div class="layui-input-inline">
                <input type="text" name="teacherName" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input" value="${teach.teacherName}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">任教课程</label>
            <div class="layui-input-inline">
                <input type="text" name="courseName" lay-verify="courseCredit" placeholder="请输入课程名" autocomplete="off" class="layui-input" value="${teach.courseName}">
            </div>
        </div>


        <div class="layui-form-item layui-hide">
            <%-- <input type="submit" lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">--%>
            <input type="button" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">
        </div>

    </div>
</form>
<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '/layuiadmin/' //静态资源所在路径
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


        /* 监听提交 */
        form.on('submit(LAY-user-front-submit)', function(data){

            $('#form_post').submit();

            /* parent.layer.alert(JSON.stringify(data.field), {
                 title: '最终的提交信息'
             })
 */
            return false;
        });
    });
</script>
</body>
</html>
