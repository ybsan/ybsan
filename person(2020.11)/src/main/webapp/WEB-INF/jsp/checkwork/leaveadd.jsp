<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>培训修改页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>
    <script>
        layui.use('laydate', function(){
            var laydate = layui.laydate;
//执行一个laydate实例
            laydate.render({
                elem: '#startdata' //指定元素
            });

            laydate.render({
                elem: '#enddata' //指定元素
            });
        });

        function check(){

            var start=document.getElementById("startdata").value;//获取起始日期
            var end=document.getElementById("enddata").value;//获取结束日期
            if(start==""){
                alert("请输入开始日期！");
                return;
            }
            else if(end==""){
                alert("请输入结束日期！");
            }
            document.getElementById("leavedays").value=getDays(start, end);
        }
        function getDays(startDate,endDate){
            var date1Str = startDate.split("-");//将日期字符串分隔为数组，数组元素分别为年、月、日
//根据年、月、日的值创建Date对象
            var date1Obj = new Date(date1Str[0],(date1Str[1]-1),date1Str[2]);
            var date2Str = endDate.split("-");
            var date2Obj = new Date(date2Str[0],(date2Str[1]-1),date2Str[2]);
            var t1 = date1Obj.getTime();//返回从1970-1-1开始计算到Date对象中的时间之间的毫秒数
            var t2 = date2Obj.getTime();//返回从1970-1-1开始计算到Date对象中的时间之间的毫秒数
            var datetime=1000*60*60*24; //一天时间的毫秒值
            var minusDays = Math.floor(((t2-t1)/datetime));//计算出两个日期天数差
            var days = Math.abs(minusDays);//如果结果为负数，取绝对值
            return days;
        }
    </script>

    <script type="text/javascript">
        $(function(){
            $("#deptForm").submit(function(){
                // var employee_name = $("#empId");

                var msg = "";
                // if (!/^[\u4E00-\u9FA5]{2,4}$/.test($.trim(employee_name.val()))){
                // 	msg = "姓名格式不正确！！！";
                // 	employee_name.focus();
                // }

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
    <form class="layui-form" method="POST" id="deptForm"  action="${pageContext.request.contextPath}/checkwork/leaveadd">
        <!-- id为员工信息id（也就是全局id） -->
        <input type="hidden" name="id" id="id" value="${employee.id}" >

        <div class="layui-form-item" >
            <label for="startdata" class="layui-form-label">
                <span class="x-red">*</span>开始日期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="startdata" name="startdata" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${leave.startdata}">
            </div>
        </div>

        <div class="layui-form-item" >
            <label for="enddata" class="layui-form-label">
                <span class="x-red">*</span>结束日期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="enddata" name="enddata" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${leave.enddata}">
            </div>
        </div>

        <div class="layui-form-item" >
            <label for="leavedays" class="layui-form-label">
                <span class="x-red">*</span>请假天数 <input type="button" value="计算时长" onclick="check()" >
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
            <label for="content" class="layui-form-label">
                <span class="x-red">*</span>请假内容
            </label>
            <div class="layui-input-inline">
                <input type="text" id="content" name="content" required="" lay-verify="required"
                       autocomplete="off" class="layui-input" value="${leave.content}">
            </div>

        </div>

        <div class="layui-form-item">
            <label for="L_repass" class="layui-form-label">
            </label>
            <input type="submit" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/>
        </div>
        <div style="margin-top: 80px;"></div>
    </form>
</div>
</body>



</html>