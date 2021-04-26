<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>考勤添加页面</title>
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
		var employee_name = $("#empname");
		var salaryStation = $("#salaryStation");
		var salaryLevel = $("#salaryLevel");
		var seniorityPay = $("#seniorityPay");
		var performance = $("#performance");
		var individualIncome = $("#individualIncome");
		var msg = "";
		if (!/^[\u4E00-\u9FA5]{2,4}$/.test($.trim(employee_name.val()))){
			msg = "姓名格式不正确！！！";
			employee_name.focus(); 
	    }
		else if (!/^[0-9]*$/.test($.trim(salaryStation.val()))){
			msg = "岗位工资只能填写数字！";
			workingdays.focus(); 
		}
		 else if (!/^[0-9]*$/.test($.trim(salaryLevel.val()))){
				msg = "工资级别只能填写数字！";
				workingdays.focus(); 
			}
		 else if (!/^[0-9]*$/.test($.trim(seniorityPay.val()))){
				msg = "工龄工资只能填写数字！";
				workingdays.focus(); 
			}
		 else if (!/^[0-9]*$/.test($.trim(performance.val()))){
				msg = "绩效奖只能填写数字！";
				workingdays.focus(); 
			}
		 else if (!/^[0-9]*$/.test($.trim(individualIncome.val()))){
				msg = "个人所得税只能填写数字！";
				workingdays.focus(); 
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
        <form class="layui-form" method="POST" id="deptForm"  action="${pageContext.request.contextPath}/salary/add">
        <input type="hidden" name="id" id="id" value="${job.id }" >
          <div class="layui-form-item" >
              <label for="empname" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="empname" name="empname" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${job.name }">
                <p class="x-red">员工必须存在才能添加！！！</p>
                <p style="color: red">${param.message}</p>
              </div>
             
          </div>
           <div class="layui-form-item" >
              <label for="salaryStation" class="layui-form-label">
                  <span class="x-red">*</span>岗位工资
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="salaryStation" name="salaryStation" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${job.salaryStation}">
              </div>
             
          </div>
          <div class="layui-form-item" >
              <label for="salaryLevel" class="layui-form-label">
                  <span class="x-red">*</span>工资级别
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="salaryLevel" name="salaryLevel" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${job.salaryLevel}">
              </div>
             
          </div>
          <div class="layui-form-item" >
              <label for="seniorityPay" class="layui-form-label">
                  <span class="x-red">*</span>工龄工资
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="seniorityPay" name="seniorityPay" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${job.seniorityPay}">
              </div>
             
          </div>
            <div class="layui-form-item" >
              <label for="performance" class="layui-form-label">
                  <span class="x-red">*</span>绩效奖
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="performance" name="performance" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${job.performance}">
              </div>
             
          </div>
            <div class="layui-form-item" >
              <label for="performance" class="layui-form-label">
                  <span class="x-red">*</span>个人所得税
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="individualIncome" name="individualIncome" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${job.individualIncome}">
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