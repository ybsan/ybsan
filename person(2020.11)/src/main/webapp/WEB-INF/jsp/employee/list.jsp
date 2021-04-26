<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/logo.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/lib/layui/layui.js"
            charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>
    <script type="text/javascript">
        $(function () {
            if (${count}!=
            0
        )
            {
                $("#count1").show();
                $("#count2").show();
            }
            var username = "${sessionScope.user_session.loginname}";
            if (username == "admin" || username == "manager") {
                $("#aaa").show();
                $("#bbb").show();
                $("#do").css("display", "block");
                $("#ID").show();

                $('tr').find('td:eq(11)').show();
            } else {
                $("#aaa").hide();
                $("#bbb").hide();
                $("#do").css("display", "none");
                $("#ID").hide();
                $('tr').find('td:eq(11)').hide();
            }
            ;
        })
    </script>
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>员工列表</cite></a>
      </span>
    <button id="aaa" type="button" onclick="location.href='${pageContext.request.contextPath}/emp/toassociation'"
            class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:innert;margin-left:75%;;"><i
            class="layui-icon"></i>增加
    </button>
    <a id="bbb" class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="${pageContext.request.contextPath}/emp/list" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row" style="" align="center">
        <form class="layui-form layui-col-md12 x-so" method="get"
              action="${pageContext.request.contextPath}/emp/list">
            <input type="text" name="content" style="width:50%;" placeholder="请输入查找内容" autocomplete="off"
                   class="layui-input">
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <table class="layui-table">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>姓名</th>
            <th>关联用户</th>
            <th>性别</th>
            <th>手机号码</th>
            <th>邮箱</th>
            <th>职位</th>
            <th>部门</th>
            <th>学历</th>
            <th>身份证号码</th>
            <th>联系地址</th>
            <th>建档日期</th>
            <th id="do">操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="employee" varStatus="stat">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
                </td>
                <td>${employee.name }</td>
                <td>${employee.user.loginname}</td> <!--方便知道谁和谁关联  -->
                <td>
                    <c:choose>
                        <c:when test="${employee.sexId==1}">男</c:when>
                        <c:otherwise>女</c:otherwise>
                    </c:choose>
                </td>
                <td>${employee.phone }</td>
                <td>${employee.user.email }</td>
                <td>${employee.job.name }</td>
                <td>${employee.dept.name }</td>
                <td>${employee.education.name }</td>
                <td>${employee.cardId }</td>
                <td>${employee.address }</td>
                <td>
                    <fmt:formatDate value="${employee.createdate}"></fmt:formatDate>
                </td>
                <td class="td-manage">
                    <a title="编辑"  href='${pageContext.request.contextPath}/emp/toupd?id=${employee.id}'>
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="member_del(this,'${employee.id}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <!-- 分页标签 -->
    <div style="margin-left: 400px;" id="count1"></div>

    <div style="margin-left: 500px;" id="count2">
        <p style="color: rgb(0,97,222)">共查询到${count}条数据</p>
    </div>

</div>

<script  type="text/javascript">

    layui.use('laypage', function () {
        var laypage = layui.laypage;
        //执行一个laypage实例
        laypage.render({
            elem: 'count1' //注意，这里的 test1 是 ID，不用加 # 号
            , count: ${count} //数据总数，从服务端得到
            , curr:  ${pageNo}  //当前页
            , limit: ${pageSize}
            , jump: function (obj, first) {
                //obj包含了当前分页的所有参数，比如：
                console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                console.log(obj.limit); //得到每页显示的条数
                //首次不执行
                if (!first) {
                    //do something
                    window.location.href = "${pageContext.request.contextPath}/emp/list?pageNo=" + obj.curr + "&pageSize=" + obj.limit;
                }
            }
        });
    });

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            //等以后再使用异步，这里先使用
            $.get("${pageContext.request.contextPath}/employee/delete?id="+id);
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }



    function delAll (argument) {

        var data = tableCheck.getData();

        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
        });
    }
</script>
</body>

</html>




