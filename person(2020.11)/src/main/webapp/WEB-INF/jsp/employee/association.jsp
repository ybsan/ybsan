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
      <script type="text/javascript">
          setTimeout(function(){document.getElementById("essage").style.display="none";},5000);
      </script>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" method="POST" id="deptForm"  action="${pageContext.request.contextPath}/emp/association">
        
          <div class="layui-form-item" >
              <label for="loginname" class="layui-form-label">
                  <span class="x-red">*</span>用户关联
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="loginname" name="loginname" required lay-verify="required"  placeholder="请输入登录名" 
                  autocomplete="off" class="layui-input" value="">
                  <p style="color: red">${message}</p>
              </div>
             
          </div>
         
          <div class="layui-form-item">
              <label  class="layui-form-label">
              </label>
              <input type="submit" value="提交关联"  class="layui-btn" lay-filter="add" lay-submit=""/>
                 
          </div>
      </form>

  </body>

</html>