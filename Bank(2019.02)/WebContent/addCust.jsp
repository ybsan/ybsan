<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加客戶</title>
<style type="text/css">
form {
	text-align: center;
	width: 90%;
	margin: 40px auto;
}
</style>
</head>
<body>
	<h1>添加客戶</h1>
	<hr>
	<form action="CustServlet" method="get">
		<fieldset>
			<h1>添加客戶</h1>
			<input type="hidden" value="add" name="type">
			客户账号<input type="text" name="custname" size="60"> <br><br> 
			客户密码<input type="password" name="password" size="60"> <br><br> 
			省份证号<input type="text" name="idcard" size="60"> <br><br> 
			客户余额<input type="text" name="money" size="60"> <br><br> 
			<input type="submit" value="保存">
		</fieldset>
	</form>
</body>
</html>