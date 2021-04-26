<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>课程信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">

</head>
<body>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">

            <div class="layui-card">

                <div class="x-nav" style="margin-left: 20px;margin-right: 20px">
                    <span class="layui-breadcrumb">
                     <a href="">首页</a>
                    <a>
                    <cite>课程信息</cite></a>
                    </span>
                    <button type="button"  onclick="addCourse()" class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:inherit;margin-left:75%;;"  ><i class="layui-icon"></i>增加</button>
                    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${pageContext.request.contextPath}/course/listPage" title="刷新">
                        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
                </div>


                <div class="layui-card-body">

                    <div class="layui-row" align="center" style="height: 40px">

                        <form class="layui-form layui-col-md12 x-so" method="get" action="#">
                            <input type="text" id="queryContent" name="content" style="width:50%;"  placeholder="请输入地址或专业查找用户" autocomplete="off" class="layui-input" >
                            <button type="button"   class="layui-btn" style="margin-top: -65px;margin-left: 50%"  data-type="reload" id="queryRole"><i class="layui-icon">&#xe615;</i></button>
                        </form>

                    </div>


                    <table class="layui-hide" id="test-table-toolbar" lay-filter="test-table-toolbar"></table>


                    <script type="text/html" id="test-table-toolbar-barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                    </script>

                </div>


            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>

<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table'], function(){
        var admin = layui.admin
            ,form = layui.form
            ,table = layui.table;

        var tableIns= table.render({
            elem: '#test-table-toolbar'
            ,url: '/course/list'
            ,toolbar: 'default' //开启头部工具栏，并为其绑定左侧模板
            ,title: '用户数据表'
            ,height: 450
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'courseNum', align:'center', title:'课程编号', width:120, fixed: 'left', unresize: true, sort: true}
                ,{field:'courseName',align:'center', title:'课程名称', width:220}
                ,{field:'courseCredit',align:'center', title:'学分', width:180}
                ,{field:'courseTimes', align:'center',title:'学时', width:180}
                ,{field:'courseDesc', align:'center',title:'课程描述'}
                ,{fixed: 'right',align:'center', title:'操作', toolbar: '#test-table-toolbar-barDemo',width:140}
            ]]
            , page:{
                layout:["first","prev","page","next","count","limit","skip","last"]
                , limit: 10 //默认分页条数
                , limits: [1,2,3,5,10,15] //自定义分页数据选项
            }
            , id: 'reload' //用于绑定模糊查询条件等等
            , done:function(res){
                $('#layui-table-page1').attr('style','margin-left:300px')
                var data = res.data;
            }
            , loading: false //请求数据时，是否显示loading
        });

        $('#queryRole').on('click', function(event,froms){
            //当编辑框关闭时，从edit的页面触发的查询方法来刷新table;
            //使用parent.location会是页面整个刷新，使用open弹框的end属性会关闭弹窗就刷新
            var  queryContent = $('#queryContent').val()

            tableIns.reload({
                url: '/course/list?content='+queryContent
                ,page: {
                    curr:1
                }
            })
        });

        var checkedArr=[];
        table.on('checkbox(test-table-toolbar)', function(obj){
            if (obj.type=='all') {
                if(obj.checked){
                    checkedArr = []
                    var leng = ($(".layui-table-view .layui-table tbody tr td[data-field='id']").length)/2
                    for (var i=0; i<leng ; i++){
                        checkedArr.push(i+'');
                    }
                }else {
                    checkedArr = []
                }
                console.log(checkedArr)
                return;
            }

            if (obj.checked){
                checkedArr.push($(obj.tr).attr("data-index"));
            }
            else{
                alert($(obj.tr).attr("data-index"))
                var num = $(obj.tr).attr("data-index")
                alert($.inArray(num,checkedArr))
                checkedArr.splice($.inArray(num,checkedArr),1);
            }
            console.log(checkedArr)
        });


        //头工具栏事件
        table.on('toolbar(test-table-toolbar)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);

            switch(obj.event){
                case 'delete':
                    var data = checkStatus.data;
                    var ids = []
                    data.forEach(function (e) {
                        ids.push(e.courseNum)
                    })
                    if( ids=="" || ids==null){
                        layer.msg('请先选中数据',{icon:2,time:1000,offset: [100]});
                    }else {
                        console.log(checkStatus)
                        layer.confirm('确定删除'+ids.length+'数据', function(index){

                            if (checkStatus.isAll){
                                checkedArr = []
                                for (var i=0; i<data.length ; i++){
                                    checkedArr.push(i+'');
                                }
                                console.log(checkedArr)
                            }
                            $.each(checkedArr, function(k){
                                $(".layui-table-view .layui-table tbody tr[data-index="+checkedArr[k]+"]").remove();
                            });
                            $.post("/course/deleteIds",{ids}, (res) => {
                                console.log(tableIns)
                                // var  queryContent = $('#queryContent').val()
                                // tableIns.reload({
                                //     url: 'http://localhost:8080//course/list?content='+queryContent
                                // })
                            })

                            layer.close(index);
                        });

                    }

                    break;
                case 'update':
                    var data = checkStatus.data;
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else if(data.length > 1){
                        layer.msg('只能同时编辑一个');
                    } else {
                    layer.open({
                        type: 2
                        ,title: '修改用户'
                        ,content: '/course/toedit?id='+data[0].courseNum
                        ,maxmin: true
                        ,area: ['500px', '450px']
                        ,btn: ['确定', '取消']
                        ,yes: function(index, layero){

                            var iframeWindow = window['layui-layer-iframe'+ index]
                                ,submitID = 'LAY-user-front-submit'
                                ,submit = layero.find('iframe').contents().find('#'+ submitID);

                            submit.trigger('click');

                            layer.close(index); //关闭弹层

                            layer.msg('修改成功', {
                                icon: 1,
                                time: 1000 //2秒关闭（如果不配置，默认是3秒）
                            });

                            setTimeout(function () {
                                var  queryContent = $('#queryContent').val()
                                tableIns.reload({

                                    url: '/course/list?content='+queryContent
                                })
                            },200)
                        }
                    });}
                    break;
                case 'add':
                    addCourse()
                    break;
            };
        });


        //监听行工具事件
        table.on('tool(test-table-toolbar)', function(obj){
            var data = obj.data;
            // console.log(data)
            console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('确定删除', function(index){
                    obj.del();
                    $.get("/course/delete?id="+data.courseNum);
                    layer.msg('已删除!',{icon:1,time:1000});
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){


                layer.open({
                    type: 2
                    ,title: '修改用户'
                    ,content: '/course/toedit?id='+data.courseNum
                    ,maxmin: true
                    ,area: ['500px', '450px']
                    ,btn: ['确定', '取消']
                    ,yes: function(index, layero){

                        var iframeWindow = window['layui-layer-iframe'+ index]
                            ,submitID = 'LAY-user-front-submit'
                            ,submit = layero.find('iframe').contents().find('#'+ submitID);

                        submit.trigger('click');

                        layer.close(index); //关闭弹层

                        layer.msg('修改成功', {
                            icon: 1,
                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                        });

                        setTimeout(function () {
                            var  queryContent = $('#queryContent').val()
                            tableIns.reload({

                                url: '/course/list?content='+queryContent
                            })
                        },200)
                    }
                });

            }
        });

    });

    function addCourse(){
        layer.open({
            type: 2
            ,title: '修改用户'
            ,content: '/course/toedit'
            ,maxmin: true
            ,area: ['500px', '450px']
            ,btn: ['确定', '取消']
            ,yes: function(index, layero){

                var iframeWindow = window['layui-layer-iframe'+ index]
                    ,submitID = 'LAY-user-front-submit'
                    ,submit = layero.find('iframe').contents().find('#'+ submitID);

                submit.trigger('click');

                layer.close(index); //关闭弹层

                layer.msg('添加成功', {
                    icon: 1,
                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                });

                setTimeout(function () {
                    $("#queryRole").click()
                },200)
            }
        });
    }

</script>
</body>
</html>
