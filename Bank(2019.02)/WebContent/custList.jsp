<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员列表</title>
<style type="text/css">
table {
	border: 1px solid gray;
	width: 99%;
	border-collapse: collapse;
}

tr, td, th {
	border: 1px solid gray;
}

div{
	width: 100%;
	margin: auto;
	text-align: center;
}

ul {
	list-style-type: none;
	margin-left: 300px;
}

ul li {
	float: left;
	padding: 20px;
}

ul li a{
	text-decoration: none;
	font-size: 30px;
}
ul li a:hover{
	background-color: silver;
}


#menu a {
	border: 1px solid gray;
	background-color: green;
	color: yellow;
}

tr:hover {
	background-color: pink;
}
</style>
</head>
<body>
	<h1>用户列表</h1>
	<div id="menu">
		<a href="addCust.jsp">添加用户</a>
	</div>
	<hr>
	<table>
		<tr>
			<th>编号</th>
			<th>客户名称</th>
			<th>身份证号</th>
			<th>余额</th>
			<th>创建日期</th>
			<th>修改日期</th>
			<th colspan="2">操作</th>
		</tr>
		
		<c:forEach items="${list}" var="cust">
		<tr>
			<td>${cust.custId}</td>
			<td>${cust.custName}</td>
			<td>${cust.idcard}</td>
			<td>${cust.money}</td>
			<td>${cust.createDate}</td>
			<td>${cust.updateDate}</td>
			<td><a href="toupcust?id=${cust.custId}">编辑</a></td>
			<td><a href="javascript:void(0)"
				onclick="del(${cust.custId})">删除</a></td>
		</tr>
		</c:forEach>
	</table>
<h1>当前页:${pageNo }</h1>
	<div>
		<ul>
			<li><a href="custList?pageNo=1&pageSize=10">首页</a></li>
			<li><a href="custList?pageNo=${pageNo-1 <=1?1:pageNo-1 }&pageSize=10">上一页</a></li>
			<li><a href="custList?pageNo=${pageNo+1 >=lastPage?lastPage:pageNo+1  }&pageSize=10">下一页</a></li>
			<li><a href="custList?pageNo=${lastPage}&pageSize=10">末页</a></li>
		</ul>
	</div>

	<script type="text/javascript">
	
		function del(id) {
			var flag = confirm("您确定要删除这条记录吗?")
			if (flag) {
				location.href = "doDelcustServlet?id=" + id;
			}
		}
	</script>
</body>
</html>