<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>用户编辑页面</title>
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
    	var n1 ="admin";
    	var n2 = "manager";
    	var n = "${sessionScope.user_session.loginname}";
    	if(n1==n||n2==n){
    		$("#status").css("display", "block");  
    	}else{
    		$("#status").css("display", "none"); 
    	}; 
    });
       
    </script>
    
    
    <script type="text/javascript">
    $(function(){
    	$("#deptForm").submit(function(){
    		var loginname = $("#loginname");
    		var username = $("#username");
    		var email= $("#email");//邮箱
    		var password = $("#password");
    		var msg = "";
    		if (!/^[A-Za-z]{5,15}$/.test($.trim(loginname.val()))){
    			msg = "登录名格式不正确！5-15个英文字母";
    			loginname.focus(); 
    		}
    		 else if (!/^[\u4E00-\u9FA5]{2,4}$/.test($.trim(username.val()))){
    			msg = "用户名格式不正确！！！姓名";
    			username.focus(); 
    	    }
    		 else if (!/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/.test($.trim(email.val()))){
 				msg = "邮箱格式不正确！！！";
 				email.focus(); 
 		    } 
    		 else if (!/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/.test($.trim(password.val()))){
    				msg = "密码格式不正确！！！6-16位字母数字组合";
    				password.focus(); 
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
        <form class="layui-form" method="POST" id="deptForm"  action="${pageContext.request.contextPath}/user/pedit">
        <input type="hidden" name="id" id="id" value="${user.id }" >
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>登录名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="loginname" name="loginname" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${user.loginname }">
              </div>
             
          </div>
         <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>用户名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${user.username }">
              </div>
             
          </div>
          
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>邮箱
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="email" name="email" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${user.email}">
              </div>
             
          </div>
          
           <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>密码
              </label>
              <div class="layui-input-inline">
                  <input type="password" id="password" name="password" required lay-verify="required"
                  autocomplete="off" class="layui-input" value="">
                  <p style="color: red">${requestScope.message}</p>
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