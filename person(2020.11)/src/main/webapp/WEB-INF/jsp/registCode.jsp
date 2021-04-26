<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>创新创业型小微企业的人力资源管理平台</title>
<meta content="" name="description" />
<meta content="" name="author" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="shortcut icon" href="${pageContext.request.contextPath}/public/logo.ico" type="image/x-icon" />
<link href="${pageContext.request.contextPath}/js/metronic/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/metronic/css/base.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/js/metronic/css/login.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/metronic/css/jquery.slider.css" type="text/css" />


<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-migrate-1.2.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ajax_js/check.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.slider.js"></script>
<script type="text/javascript">
setTimeout(function(){document.getElementById("code_message").style.display="none";},5000);
</script>

<style type="text/css">
body{
       overflow:scroll;
       overflow-x:hidden;
    }
</style>


</head>
<body oncontextmenu="self.event.returnValue=false" onselectstart="return false"  style="overflow: hidden">
<div style="width: 100%;height:58px; background-color:RGB(43,48,59) ">
      <ul style="margin-left: 40px;padding-top:6px">
        <li style="display: inline-block;"><h1><a href="loginForm.html" style="color:white;font-size:20px;">创新创业型小微企业的人力资源管理平台</a></h1></li>
        <li style="display: inline-block; margin-left: 120px;"><a  style="font-size:14px;color:rgb(130,130,130); " >注册码</a></li>
        <li style="display: inline-block; margin-left: 60px;"><a href="loginForm.html" style="font-size:14px;color:rgb(130,130,130); ">首页</a></li>
        <li style="display: inline-block; margin-left: 80px;"><a href="javascript:alert('本系统只提供管理员和公司管理人员登录系统！！！如若注册此系统，请联系部门负责人下发注册码 ！！！');"	  style="font-size:14px;color:rgb(130,130,130); ">帮助与文档</a></li>
        <li style="display: inline-block; margin-left: 64px;"><p  style="font-size:14px;color:rgb(130,130,130);">客服电话：4008864211</p></li>
      </ul>
    </div>
    <div id="main" style="width:100%;height:670px;float:left;">

      <div class="container" style="background-color:rgb(73,74,95);width: 100%;height:664px;float:left;">
       <div class="testSlider" style="margin-left:-15px;"></div>

		 <div id="register"  class="register" style="height:300px;margin-top:150px;margin-left:295px;opacity:0.9;">
            <div class="title">
            </div>
            <form  method="post" action="toregist"?id="${wrapper.id}" name="check-form" id="toLoginForm">
                <div style="color: red">注册码由部门负责人下发，请联系部门负责人！</div>
                <div class="default" style="margin-top:20px;">
                    <input 	data-form="uname" type="text" placeholder="请输入注册码"  id="registCode" name="registCode"  required="required"/>
                </div>
                <div class="submit" style="margin-top: 20px;">
                    <input  id="login-submit-btn" class="s_hover" type="button" onclick="toregistCode()" value="去注册" />
                </div>
            </form>
              <input id="span_id" disabled="disabled"  value="" style= "margin-left:90px;background-color:transparent;border:0;color: red" size="45"/>

            <div id="code_message" style="color: red;margin-left:90px;margin-top:-15px;">${message}</div>
        </div>
       </div>
      </div>
<!-- 底部开始 -->
<div style="width: 100%;height:58px; background-color:RGB(43,48,59) ;margin-top:664px;">
    <div align="center" style="padding-top:15px;color:RGB(153,153,153);">Copyright ©2021</div>
</div>
<!-- 底部结束 -->

<script>
    window.onload = function () {
        var currentIndex = 0;
        $('.testSlider').slider({
            originType: 'tuoyuan'
        });
    }
</script>
<%--<script>--%>
<%--    function toregistCode() {--%>
<%--        var registCode = document.getElementById("registCode").value;--%>
<%--        var params = {--%>
<%--            "registCode": registCode--%>
<%--        }--%>
<%--        $.ajax({--%>
<%--            url: "toregistCode",--%>
<%--            type: "post",--%>
<%--            data: params,--%>
<%--            dataType: "text",--%>
<%--            beforeSend: function () {--%>
<%--            },--%>
<%--            success: function (message) {--%>
<%--                document.getElementById("span_id").value = message;--%>
<%--                if (message != "") {--%>
<%--                    document.getElementById("registCode").focus();--%>
<%--                    $('#registCode')[0].style.border = "1px solid rgb(229,58,49)";--%>
<%--                } else {--%>
<%--                    $('#registCode')[0].style.border = "1px solid #ccc";--%>
<%--                    $("#toLoginForm").submit();--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>

<%--    }--%>
<%--</script>--%>
</body>
</html>