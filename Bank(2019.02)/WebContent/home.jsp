<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

#outer {
	width: 1535px;
	height: 800px margin: 0 auto;
}

#outer h1 {
	padding-top: 40px;
	text-align: center;
}

#header {
	width: 1535px;
	height: 150px;
}

#header h3 {
	padding-left: 20px;
}

#header a {
	padding-right: 20px;
	float: right;
}

#left {
	width: 260px;
	height: 540px;
	float: left;
}

#left ul {
	padding: 20px;
	list-style-type: none;
}

#left ul li {
	padding: 20px;
}

#left ul li a {
	text-decoration: none;
	font-size: 30px;
}

#left ul li a:hover {
	text-decoration: underline;
	background-color: green;
}

#main {
	width: 1275px;
	height: 540px;
	float: left;
}

</style>
</head>
<body>
		<div id="outer">
		<div id="header">
			<h1>銀行管理系統</h1>
			<h3>
				欢迎:${sessionScope.ADMIN_NAME}
			</h3>
			<a href="doLogout">退出登录</a>
		</div>
		<hr>
	<div id="left">
			<ul>
				<li><a href="adminList?pageNo=1&pageSize=10" target="show">管理员列表</a></li>
				<li><a href="addAdmin.jsp" target="show">添加管理员</a></li>
				<li><a href="custList?pageNo=1&pageSize=10" target="show">客户列表</a></li>
				<li><a href="addCust.jsp" target="show">添加客户</a></li>
			</ul>
		</div>
		<div id="main">
			<iframe src="adminList" name="show"
				style="width: 99%; height: 99%"></iframe>
		</div>
	</div>

</body>
</html>