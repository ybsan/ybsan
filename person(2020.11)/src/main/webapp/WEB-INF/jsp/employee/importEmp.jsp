<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>批量导入页面</title>
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
    
   </script> 
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" method="POST" id="deptForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/employee/import">
         <div class="layui-form-item">
         	  <div style="color:red">请从下载中心下载模板</div>
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>上传导入文件
              </label>
              <div class="layui-input-inline">
                  <input type="file" id="file" name="file"  required>
                  <p class="x-red">必须选择上传文件</p>
              </div>
             
          </div>
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="submit" value="导入" class="layui-btn" lay-filter="add" lay-submit=""/>
                 
          </div>
      </form>
    </div>
    
  </body>

</html>