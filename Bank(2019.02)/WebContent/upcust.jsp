<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ly.bigdata.bean.CustInfo"%>
<%@page import="com.ly.bigdata.service.impl.CustServiceimpl"%>
<%@page import="com.ly.bigdata.service.CustService"%>

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
 
 <form action="CustServlet" method="get">
 <fieldset>
 <legend>修改管理员</legend>
 <input type="hidden" name="type" value="upd">
 <input type="hidden" name="id" value="${cust.custId }"> 
<br>客户账号：<input type="text" name="custname" size="60" value="${cust.custName}">
 <br> <br> 客户密码：<input type="password" name="password"
				size="60" value="${cust.password}"><br> <br> 省份证号：<input
				type="text" name="idcard" size="60" value="${cust.idcard}"><br>
			<br> 客户余额：<input type="text" name="money" size="60"
				value="${cust.money}"><br> <br> <input
				type="submit" value="保存">
 </fieldset> 
 </form>
</body>
</html>