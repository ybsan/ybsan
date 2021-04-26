<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加管理员</title>
<style type="text/css">
form {
	text-align: center;
	width: 90%;
	margin: 40px auto;
}
</style>
</head>
<body>
<h1>添加管理员</h1>
<hr>
	<form action="adminservlet" method="get">
		<fieldset>
			<legend>添加管理员</legend>
			<input type="hidden" name="type" value="add"> 
			管理员账号:<input type="text" name="username" size="60"><br><br> 
			管理员密码:<input type="password" name="password" size="60"><br><br> 
			<input type="submit" value="保存">
		</fieldset>
	</form>
</body>
</html>