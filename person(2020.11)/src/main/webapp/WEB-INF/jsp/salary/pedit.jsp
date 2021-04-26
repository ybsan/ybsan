<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>考勤编辑页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>

  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" id="deptForm" ">
        <input type="hidden" name="id" id="id" value="${salary.id }" >
          <div class="layui-form-item" >
              <label for="empId" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="empId" name="empId" required="" lay-verify="required"   disabled="disabled"
                  autocomplete="off" class="layui-input" value="${salary.emp.name}">
                  <p class="x-red">请联系管理员修改姓名等信息</p>
              </div>
             
          </div>
          
           
            <div class="layui-form-item" >
              <label for="jobId" class="layui-form-label">
                  <span class="x-red">*</span>职位
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="jobId" name="jobId" required="" lay-verify="required"  disabled="disabled"
                  autocomplete="off" class="layui-input" value="${salary.job.name}">
                  
              </div>
             
          </div>
          
          
            <div class="layui-form-item" >
              <label for="employee_name" class="layui-form-label">
                  <span class="x-red">*</span>部门
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="employee_name" name="employee_name" required="" lay-verify="required"  disabled="disabled"
                  autocomplete="off" class="layui-input" value="${salary.dept.name}">
                  
              </div>
             
          </div>
          
          
                 
           <div class="layui-form-item" >
              <label for="salaryStation" class="layui-form-label">
                  <span class="x-red">*</span>岗位工资
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="salaryStation" name="salaryStation" required="" lay-verify="required" disabled="disabled"
                  autocomplete="off" class="layui-input" value="${salary.salaryStation}">
              </div>
             
          </div>
          <div class="layui-form-item" >
              <label for="salaryLevel" class="layui-form-label">
                  <span class="x-red">*</span>工资级别
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="salaryLevel" name="salaryLevel" required="" lay-verify="required"   disabled="disabled"
                  autocomplete="off" class="layui-input" value="${salary.salaryLevel}">
              </div>
             
          </div>
          <div class="layui-form-item" >
              <label for="seniorityPay" class="layui-form-label">
                  <span class="x-red">*</span>工龄工资
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="seniorityPay" name="seniorityPay" required="" lay-verify="required"  disabled="disabled"
                  autocomplete="off" class="layui-input" value="${salary.seniorityPay}">
              </div>
             
          </div>
            <div class="layui-form-item" >
              <label for="performance" class="layui-form-label">
                  <span class="x-red">*</span>绩效奖
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="performance" name="performance" required="" lay-verify="required"  disabled="disabled"
                  autocomplete="off" class="layui-input" value="${salary.performance}">
              </div>
             
          </div>
            <div class="layui-form-item" >
              <label for="individualIncome" class="layui-form-label">
                  <span class="x-red">*</span>个人所得税
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="individualIncome" name="individualIncome" required="" lay-verify="required"  disabled="disabled"
                  autocomplete="off" class="layui-input" value="${salary.individualIncome}">
              </div>
          </div>
          
      </form>
    </div>
   
  </body>

</html>