<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>课程列表</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="../../../layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="../../../layuiadmin/style/admin.css" media="all">
</head>
<body>

  <div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
      <a lay-href="">主页</a>
      <a><cite>课程查询</cite></a>
      <a><cite>课程列表</cite></a>
    </div>
  </div>

  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
<br>
          <div class="test-table-reload-btn" style="margin-bottom: 10px;margin-left: 50px">
              内容：
            <div class="layui-inline">
              <input class="layui-input" name="content" id="test-table-demoReload" autocomplete="off">
            </div>
            <button class="layui-btn" data-type="reload">搜索</button>
          </div>
          <div class="layui-card-body">
            <table class="layui-hide" id="test-table-checkbox"></table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="../../../layuiadmin/layui/layui.js"></script>
  <script>
  layui.config({
    base: '../../../layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index', 'table'], function(){
      var table = layui.table;
    table.render({
      elem: '#test-table-checkbox'
      ,url: '/course/list'
      ,cols: [[
        {checkbox: true, fixed: true}
        ,{field:'courseName', title: '课程名称', width:175}
        ,{field:'courseCredit', title: '课程学分', width:100}
        ,{field:'courseTimes', title: '学时', width:100}
        ,{field:'sign', title: '开课学期' ,width:100}
        ,{field:'experience', title: '选课结束时间', width:100}
        ,{field:'courseDesc', title: '类型',  width:175}
        ,{field:'classify', title: '状态', width:100}
      ]]
      ,page: true
      ,id: 'testReload'
    });

      var $ = layui.$, active = {
          reload: function(){
              var demoReload = $('#test-table-demoReload');
              //执行重载
              table.reload('testReload', {
                  page: {
                      curr: 1 //重新从第 1 页开始
                  }
                  ,where: {
                      content: demoReload.val()
                  }
              });
          }
      };

      $('.test-table-reload-btn .layui-btn').on('click', function(){
          var type = $(this).data('type');
          active[type] ? active[type].call(this) : '';
      });


  });
  </script>
</body>
</html>
