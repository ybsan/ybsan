<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

div {
	width: 1535px;
	height: 800px margin: 0 auto;
}

form {
	text-align: center;
	width: 30%;
	margin: 240px auto;
}
</style>
</head>
<body>
	<div>
		<form action="doLogin" method="get">
			<fieldset>
				<legend>登录</legend>
				用户名称:<input type="text" name="username" value="zhangsan"> <br><br> 
				用户密码:<input type="password" name="password" value="123456"><br><br> 			
				<input type="checkbox" name="rememberme"> 记住用户名一周<br><br> 
				<input type="submit" value="登录">
			</fieldset>
		</form>
	</div>
</body>
</html>