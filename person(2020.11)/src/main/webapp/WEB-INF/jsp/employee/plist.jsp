<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>编辑员工</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/logo.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>
        
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" method="POST" id="deptForm"  action="${pageContext.request.contextPath}/employee/padd">
        <input type="hidden" name="id" id="id" value="${employee.id }" >
          <div class="layui-form-item" >
              <label for="name" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" required="" lay-verify="required"  disabled="disabled"
                  autocomplete="off" class="layui-input" value="${employee.name }">
                  <p style="color: red">${param.message}</p>  <!-- 返回ModelAndView,数据在mv中 -->
                   <p style="color: red">${requestScope.message}</p><!-- 返回String类型，数据在model中 -->
              </div>
             
          </div>
          <div class="layui-form-item" >
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>身份证号码
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="cardId" name="cardId" required="" lay-verify="required"   disabled="disabled"
                  autocomplete="off" class="layui-input" value="${employee.cardId }">
              </div>
          </div>
          
          <div class="layui-form-item" >
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>性别
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="sexId" name="sexId" required="" lay-verify="required"   disabled="disabled"
                  autocomplete="off" class="layui-input" value="${employee.sex.name}">
              </div>
          </div>
          
          <div class="layui-form-item" >
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>学历
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="ename" name="ename" required="" lay-verify="required"   disabled="disabled"
                  autocomplete="off" class="layui-input" value="${employee.education.name }">
              </div>
          </div>
          
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>手机
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required="" lay-verify="required" disabled="disabled"
                  autocomplete="off" class="layui-input" value="${employee.phone }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>联系地址
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="address" name="address" required="" lay-verify="required"  disabled="disabled"
                  autocomplete="off" class="layui-input" value="${employee.address }">
              </div>
          </div>
          
           <div class="layui-form-item" >
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>职位
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="jname" name="jname" required="" lay-verify="required"   disabled="disabled"
                  autocomplete="off" class="layui-input" value="${employee.job.name }">
              </div>
          </div>
          
          <div class="layui-form-item" >
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>部门
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="dname" name="dname" required="" lay-verify="required"   disabled="disabled"
                  autocomplete="off" class="layui-input" value="${employee.dept.name }">
              </div>
          </div>
          
      </form>
    </div>
    
  </body>

</html>