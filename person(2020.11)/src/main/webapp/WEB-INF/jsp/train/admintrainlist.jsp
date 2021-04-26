<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page isELIgnored="false" %>
  

  
  
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>所有员工培训信息页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/logo.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>
    <script type="text/javascript">
    $(function(){
    	
    	if(${count}!=0){
    		$("#count1").hide();
    		$("#count2").show();
    	}
    })
  </script>
    
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>培训详情</cite></a>
      </span>
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">

      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox"  lay-skin="primary" ><i class="layui-icon">&#xe605;</i></div>
            </th>
              <th>姓名</th>
			  <th>职位</th>
			  <th>部门</th>
              <th>培训内容</th>
              <th>开始日期</th>
			  <th>结束日期</th>
			  <th>培训时长</th>
			  <th>完成情况</th>
			  <th>成绩评定</th>
			  <th>创建时间</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.train}" var="train" varStatus="stat">
     <tr>
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i>
                </div>
            </td>
         <td>${train.emp.name}</td>
         <td>${train.job.name}</td>
         <td>${train.dept.name}</td>
         <td>${train.content}</td>
         <td>${train.startdata}</td>
         <td>${train.enddata}</td>
         <td>${train.totallength}</td>
         <td>${train.completion}</td>
         <td>${train.grade}</td>
         <td><fmt:formatDate value="${train.traintime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
     </tr>
        </c:forEach>
        </tbody>

      </table>
         <!-- 分页标签 -->

	  	 
	 <div style="margin-left: 500px; display: none;" id="count2">
                <p style="color: rgb(0,97,222)">共查询到<font color="red">${count}</font>条数据</p>
       </div>
    </div>
    <script>
      
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              //等以后再使用异步，这里先使用
              $.get("${pageContext.request.contextPath}/train/delete?id="+id);
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }
    </script>
    
  </body>

</html>