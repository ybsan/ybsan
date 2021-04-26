<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>请假修改页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>
    
    <script type="text/javascript">
$(function(){
	$("#deptForm").submit(function(){
		
		var msg = "";
		if (!/^[0-9]*$/.test($.trim(leavedays.val()))){
			msg = "上班天数只能填写数字！";
			leavedays.focus(); 
		}
		if (msg != ""){
			 alert(msg);
			return false;
		}else{
			return true;
			$("#deptForm").submit();
		}
	});
});
</script>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" method="POST" id="deptForm"  action="${pageContext.request.contextPath}/leave/upd">
        <!-- id为员工信息登录名-->
        <input type="hidden" name="leave_id" id="leave_id" value="${leave.id}" >
        
        
          <div class="layui-form-item" >
              <label for="leavedays" class="layui-form-label">
                  <span class="x-red">*</span>请假天数
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="leavedays" name="leavedays" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${leave.leavedays}">
              </div>
             
          </div>
          <div class="layui-form-item" >
              <label for="leavetype" class="layui-form-label">
                  <span class="x-red">*</span>请假类型
              </label>
              <div class="layui-input-inline">
                  <select id="leavetype" name="leavetype" class="valid">
                    <c:forEach items="${requestScope.typ_list}" var="type">
						   		<c:choose>
			    					<c:when test="${leave.leavetype == type.id }">
			    						<option value="${type.id }" selected="selected">${type.name }</option>
			    					</c:when>
			    					<c:otherwise>
			    						<option value="${type.id }">${type.name}</option>
			    					</c:otherwise>
			    				</c:choose>
			    			</c:forEach>
                  </select>
              </div>
          </div>
		<div class="layui-form-item" >
              <label for="leavestatus" class="layui-form-label">
                  <span class="x-red">*</span>审批状态
              </label>
              <div class="layui-input-inline">
                  <select id="leavestatus" name="leavestatus" class="valid">
                    <c:forEach items="${requestScope.sta_list}" var="status">
						   		<c:choose>
			    					<c:when test="${leave.leavestatus == status.id }">
			    						<option value="${status.id }" selected="selected">${status.name }</option>
			    					</c:when>
			    					<c:otherwise>
			    						<option value="${status.id }">${status.name}</option>
			    					</c:otherwise>
			    				</c:choose>
			    			</c:forEach>
                  </select>
              </div>
          </div>
		



          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="submit" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/>
                 
          </div>
      </form>
    </div>
  </body>

</html>