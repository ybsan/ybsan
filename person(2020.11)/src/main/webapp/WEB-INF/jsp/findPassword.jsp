<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>创新创业型小微企业的人力资源管理平台</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.slider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ajax_js/findPassword.js"></script>
<script>
		setTimeout(function(){document.getElementById("password_message").style.display="none";},3000);
		//1000是多久被隐藏，单位毫秒
</script> 
<script>
window.onload = function(){
	var currentIndex = 0;
	$('.testSlider').slider({
		originType:'tuoyuan'
	});
}
</script>
    <script type="text/javascript">
        $(function () {
            $("#rePasswordForm").submit(function () {
                var password = $("#password");
                var repassword = $("#repassword");
                if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/.test($.trim(password.val()))) {
                    msg = "密码格式不正确！！！";
                    password.focus();
                } else if ($.trim(password.val()) != $.trim(repassword.val())) {
                    msg = "两次密码输入不相同，请重新输入！";
                    repassword.focus();
                } else {
                    return true;
                    $("#rePasswordForm").submit();
                }

                if (msg != "") {
                    alert($.trim(password.val()) != $.trim(repassword.val()));
                    alert(msg);
                    return false;
                }
            });
        });

    </script>
<style type="text/css">
body{
       overflow:scroll;
       overflow-x:hidden;
    }
</style>
</head>
<body oncontextmenu="self.event.returnValue=false" onselectstart="return false">
<div style="width: 100%;height:58px; background-color:RGB(43,48,59) ">
      <ul style="margin-left: 40px;padding-top:6px">
        <li style="display: inline-block;"><h1><a href="loginForm.html" style="color:white;font-size:20px;">创新创业型小微企业的人力资源管理平台</a></h1></li>
        <li style="display: inline-block; margin-left: 120px;"><p style="font-size:14px;color: rgb(130,130,130)">重置密码</p></li>
        <li style="display: inline-block; margin-left: 60px;"><a href="loginForm.html" style="font-size:14px;color:rgb(130,130,130); ">首页</a></li>
        <li style="display: inline-block; margin-left: 80px;"><a href="javascript:alert('本系统只提供管理员和公司管理人员登录系统！！！如若注册此系统，请联系部门负责人下发注册码 ！！！');"	 style="font-size:14px;color:rgb(130,130,130); ">帮助与文档</a></li>
        <li style="display: inline-block; margin-left: 64px;"><p  style="font-size:14px;color:rgb(130,130,130);">客服电话：4008864211</p></li>
      </ul>    
    </div> 
    <div id="main" style="width:100%;height:660px;float:left;">
         <div class="container" style="background-color:rgb(73,74,95);width: 100%;height:650px;float:left;">
         <div class="testSlider" style="margin-left:-15px;"></div>
         <!-- <div style="width:1360px;height:610px;"><img src="js/metronic/img/bg/11.jpg" alt="" height="610px;"width="1360px;"/></div> -->
		<div class="register" style="height:360px;margin-top:150px;margin-left:205px; opacity:0.9;" >
            <div class="title">
                <span>重置密码</span>
                <div style="height: 10px;margin-top: 15px;">
                    <input id="updata_message" disabled="disabled" size="50px;" value=""style= "background-color:transparent;border:0;color: red"/> 
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/toPassword?id=${user.id}" method="post" id="rePasswordForm">
            <div style="height: 10px"></div>
            
             <div class="default">
                    <input id="loginname" name="loginname"   data-form="upwd" type="text" placeholder="请输入您的登录名 "  value="${user.loginname}" disabled="disabled"/>
             </div>
             
             <div class="default" style="margin-top: 16px;">
                    <input id="password" name="password" data-form="uname" type="password" placeholder="新密码  6-16位数字和字母的组合" value=""/>

             </div>
             
              <div style="height: 10px;margin-top: -10px;">
                     <input id="psd_message" disabled="disabled"  value="" style= "background-color:transparent;border:0;color: red"/>          
              </div>
             
              <div class="default" style="margin-top: 16px;">
                    <input id="repassword" name="repassword" data-form="uname" type="password" placeholder="请再次输入你的新密码"  value=""/>
             </div>
              <div style="height: 10px;margin-top: -10px;">
                     <input id="repassword_message" disabled="disabled"  value=""style= "background-color:transparent;border:0;color: red"/>
                  <p style="color: red">${message}</p>
                </div>
             
             
            
                <div style="height: 10px"></div>
                <div class="submit">
                    <input type="submit" id="submit" value=" 重置密码" class="layui-btn" lay-filter="add" lay-submit=""/>
                </div>
                <div style="margin-top: -35px;">
                  <div style="height: 10px;margin-top: -10px;">
                    <input id="find_message" disabled="disabled" size="50px;" value="${message}"style= "background-color:transparent;border:0;color: red"/> 
                 </div>
                </div>
            </form>
            
        </div>
        </div>
        </div>
        
        <!-- 底部开始 -->
     <div style="width: 100%;height:58px; background-color:RGB(43,48,59) ;margin-top:650px;">
        <div align="center" style="padding-top:15px;color:RGB(153,153,153);">Copyright ©2019 </div>
    </div>
    <!-- 底部结束 -->
</body>
</html>