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
      <a><cite>任课查询</cite></a>
      <a><cite>任课列表</cite></a>
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
              <input class="layui-input" name="id" id="test-table-demoReload" autocomplete="off">
            </div>
            <button class="layui-btn" data-type="reload">搜索</button>
          </div>
          <div class="layui-card-body">
            <table class="layui-hide" id="test-table-checkbox" style="text-align: center"></table>
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
      ,url: '/course/tlist'
      ,cols: [[
        {checkbox: true, fixed: true}
        ,{field:'teacherName', title: '教师', width:620}
        ,{field:'teacherTitle', title: '课程', width:620}
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
