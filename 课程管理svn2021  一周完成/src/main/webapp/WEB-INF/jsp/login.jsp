<%--
  Created by IntelliJ IDEA.
  User: lidongge
  Date: 2021/4/14
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登入 - layuiAdmin</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../../layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="../../layuiadmin/style/login.css" media="all">
</head>
<body>

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">

    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>layuiAdmin</h2>
            <p>layui 官方出品的单页面后台管理模板系统</p>
        </div>
        <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                <input type="text" name="adminName" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                <input type="password" name="adminPwd" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
            </div>
            <div class="layui-form-item">


                <div id="slider"></div>

            </div>
            <div class="layui-form-item" style="margin-bottom: 20px;">
                <input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
                <a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
            </div>
            <div class="layui-form-item">
                <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">登 入</button>
            </div>
            <div class="layui-trans layui-form-item layadmin-user-login-other">
                <div>
                    <input type="radio" name="role" value="Admin" title="Admin" checked>
                    <input type="radio"  name="role" value="Teacher" title="Teacher" >
                    <input type="radio"  name="role" value="Student" title="Student" >
                </div>

                <a href="reg.html" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
            </div>
        </div>
    </div>


    <video src=""></video>

    <!--<div class="ladmin-user-login-theme">
      <script type="text/html" template>
        <ul>
          <li data-theme=""><img src="{{ layui.setter.base }}style/res/bg-none.jpg"></li>
          <li data-theme="#03152A" style="background-color: #03152A;"></li>
          <li data-theme="#2E241B" style="background-color: #2E241B;"></li>
          <li data-theme="#50314F" style="background-color: #50314F;"></li>
          <li data-theme="#344058" style="background-color: #344058;"></li>
          <li data-theme="#20222A" style="background-color: #20222A;"></li>
        </ul>
      </script>
    </div>-->

</div>

<script src="../../layuiadmin/layui/layui.js"></script>
<script>
    if(window.top !== window){
        window.top.location = window.location;
    }
    layui.config({
        base: '../../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'user','sliderVerify','jquery'], function(){
        var $ = layui.$
            ,setter = layui.setter
            ,admin = layui.admin
            ,form = layui.form
            ,router = layui.router()
            ,search = router.search
            ,sliderVerify=layui.sliderVerify;

        var slider = sliderVerify.render({
            elem: '#slider',
            onOk: function(){//当验证通过回调
                layer.msg("滑块验证通过");
            }
        })
        //监听提交
        form.on('submit(formDemo)', function(data) {
            if(slider.isOk()){//用于表单验证是否已经滑动成功
                layer.msg(JSON.stringify(data.field));
            }else{
                layer.msg("请先通过滑块验证");
            }
            return false;
        });

        form.render();
        //提交
        form.on('submit(LAY-user-login-submit)', function(obj){

            if($('input:radio[name="role"]:checked').size()==0){
                layer.msg("请选择角色");
            }
            //请求登入接口
            admin.req({
                url: '/adminlogin' //实际使用请改成服务端真实接口
                ,data: obj.field
                ,done: function(res){


                    sessionStorage.setItem("users",JSON.stringify(res.data));
                   if(res.code==0){
                       var role = 'Admin'
                   }else if(res.code==1){
                       var role = 'Teacher'
                   }



                    if(res.data!=null){
                        //登入成功的提示与跳转
                        layer.msg('登入成功', {
                            offset: '15px'
                            ,icon: 1
                            ,time: 1000
                        }, function(){
                            location.href = '/index'; //后台主页
                        });
                    }  else{
                        //登入成功的提示与跳转
                        layer.msg('登入失败', {
                            offset: '15px'
                            ,icon: 2
                            ,time: 1000
                        }, function(){
                            location.href = '/'; //后台主页
                        });
                    }

                }
            });

        });


    });
</script>
</body>
</html>