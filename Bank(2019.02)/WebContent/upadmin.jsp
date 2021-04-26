<%@page import="com.ly.bigdata.bean.Admininfo"%>
<%@page import="com.ly.bigdata.service.impl.AdminServiceimpl"%>
<%@page import="com.ly.bigdata.service.AdminService"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改管理员</title>
<style type="text/css">
form {
	text-align: center;
	width: 90%;
	margin: 40px auto;
}
</style>
</head>
<body>
<h1>修改管理员</h1>
<hr>
<form action="adminservlet" method="get">
<fieldset>
    <legend>修改管理员</legend>
<input type="hidden" name="type" value="upd" >
<input type="hidden" name="id" value="${admin.id}">
           管理员账号：<input type="text" name="username" size="60" value="${admin.adminName}"> <br> 
		   管理员密码：<input type="password" name="password" size="60" value="${admin.password}"><br>
			<input type="submit" value="保存">
</fieldset>
</form>
</body>
</html>