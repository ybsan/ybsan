<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>学生选课系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="../layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="../layuiadmin/style/admin.css" media="all">

    <script>
        /^http(s*):\/\//.test(location.href) || alert('请先部署到 localhost 下再访问');
    </script>
</head>
<body class="layui-layout-body">

<div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header">
            <!-- 头部区域 -->
            <ul class="layui-nav layui-layout-left">
                <li class="layui-nav-item layadmin-flexible" lay-unselect>
                    <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
                        <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" layadmin-event="refresh" title="刷新">
                        <i class="layui-icon layui-icon-refresh-3"></i>
                    </a>
                </li>

            </ul>
            <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">


                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="theme">
                        <i class="layui-icon layui-icon-theme"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="note">
                        <i class="layui-icon layui-icon-note"></i>
                    </a>
                </li>
                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="fullscreen">
                        <i class="layui-icon layui-icon-screen-full"></i>
                    </a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;">
                        <cite>${loginName}</cite>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a lay-href="/admin/toedit">基本资料</a></dd>
                        <dd><a lay-href="/admin/topassword">修改密码</a></dd>
                        <hr>
                        <dd style="text-align: center;"><a onclick="exit()">退出</a></dd>
                    </dl>
                </li>

                <li class="layui-nav-item layui-hide-xs" lay-unselect>
                    <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
                <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
                    <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
                </li>
            </ul>
        </div>

        <!-- 侧边菜单 -->
        <!-- 侧边菜单 -->
        <div class="layui-side layui-side-menu">
            <div class="layui-side-scroll">
                <div class="layui-logo" lay-href="home/console.html">
                    <span>学生选课系统</span>
                </div>

                <%------------------------------------管理员管理----------------------------------------%>
                <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
                    <div id="Adminrole" style="display: none">
                        <li data-name="home" class="layui-nav-item layui-nav-itemed">
                            <a href="javascript:;" lay-tips="主页" lay-direction="2">
                                <i class="layui-icon layui-icon-read"></i>
                                <cite>课程管理</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="console" >
                                    <a lay-href="course/listPage">课程管理</a>
                                </dd>
                                <dd data-name="console">
                                    <a lay-href="course/statics">选课统计</a>
                                </dd>
                            </dl>
                        </li>
                        <li data-name="home" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="主页" lay-direction="2">
                                <i class="layui-icon layui-icon-form"></i>
                                <cite>专业管理</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="console" >
                                    <a lay-href="/major/majorlist">专业管理</a>
                                </dd>
                            </dl>
                        </li>
                        <li data-name="home" class="layui-nav-item ">
                            <a href="javascript:;" lay-tips="主页" lay-direction="2">
                                <i class="layui-icon layui-icon-user"></i>
                                <cite>学生管理</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="console" >
                                    <a lay-href="student/toList">学生列表</a>
                                </dd>
                                <dd data-name="console">
                                    <a lay-href="course/statics">选课统计</a>
                                </dd>
                            </dl>
                        </li>
                        <li data-name="home" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="主页" lay-direction="2">
                                <i class="layui-icon layui-icon-username"></i>
                                <cite>教师管理</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="console" >
                                    <a lay-href="teacher/toTeach">教师管理</a>
                                </dd>
                                <dd data-name="console">
                                    <a lay-href="teach/teachlist">任课管理</a>
                                </dd>
                            </dl>
                        </li>
                    </div>

                    <%------------------------------------学生管理----------------------------------------%>
                    <div id="Studentrole"  style="display: none">
                        <li data-name="home" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="学生主页" lay-direction="2">
                                <i class="layui-icon layui-icon-home"></i>
                                <cite>课程查询</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="console" >
                                    <a lay-href="${pageContext.request.contextPath}/stucourse/list">选课列表</a>
                                </dd>
                            </dl>
                        </li>
                        <li data-name="home" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="学生主页" lay-direction="2">
                                <i class="layui-icon layui-icon-home"></i>
                                <cite>已选课程</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="console" >
                                    <a lay-href="${pageContext.request.contextPath}/stucourse/checked">已选课程</a>
                                </dd>
                            </dl>
                        </li>
                    </div>
                    <%------------------------------------教师管理----------------------------------------%>
                    <div id="Teacherrole"  style="display: none">
                        <li data-name="component" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="组件" lay-direction="2">
                                <i class="layui-icon layui-icon-component"></i>
                                <cite>课程查询</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="table">
                                <dd data-name="checkbox">
                                    <a lay-href="/course/CLis" lay-text="">课程列表</a>
                                </dd>

                                </dd>

                            </dl>
                        </li>
                        <li data-name="component" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="组件" lay-direction="2">
                                <i class="layui-icon layui-icon-component"></i>
                                <cite>专业查询</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="table">
                                <dd data-name="checkbox">
                                    <a lay-href="course/MList" lay-text="">专业列表</a>
                                </dd>

                                </dd>

                            </dl>
                        </li>
                        <li data-name="component" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="组件" lay-direction="2">
                                <i class="layui-icon layui-icon-component"></i>
                                <cite>学生查询</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="table">
                                    <a lay-href="course/xuesheng" lay-text="">学生列表</a>

                                </dd>
                                <dd data-name="table">
                                    <a lay-href="course/xuanke" lay-text="">选课查询</a>
                                </dd>
                                </dd>

                            </dl>
                        </li>
                        <li data-name="component" class="layui-nav-item">
                            <a href="javascript:;" lay-tips="组件" lay-direction="2">
                                <i class="layui-icon layui-icon-component"></i>
                                <cite>任课查询</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd data-name="table">
                                <dd data-name="checkbox">
                                    <a lay-href="course/renke" lay-text="">任课列表</a>
                                </dd>
                                </dd>
                            </dl>
                        </li>
                    </div>
                    <%------------------------------------权限控制----------------------------------------%>

                </ul>
            </div>
        </div>
        <!-- 页面标签 -->
        <div class="layadmin-pagetabs" id="LAY_app_tabs">
            <div class="layui-icon layadmin-tabs-control layui-icon-prev" layadmin-event="leftPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-next" layadmin-event="rightPage"></div>
            <div class="layui-icon layadmin-tabs-control layui-icon-down">
                <ul class="layui-nav layadmin-tabs-select" lay-filter="layadmin-pagetabs-nav">
                    <li class="layui-nav-item" lay-unselect>
                        <a href="javascript:;"></a>
                        <dl class="layui-nav-child layui-anim-fadein">
                            <dd layadmin-event="closeThisTabs"><a href="javascript:;">关闭当前标签页</a></dd>
                            <dd layadmin-event="closeOtherTabs"><a href="javascript:;">关闭其它标签页</a></dd>
                            <dd layadmin-event="closeAllTabs"><a href="javascript:;">关闭全部标签页</a></dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="layui-tab" lay-unauto lay-allowClose="true" lay-filter="layadmin-layout-tabs">
                <ul class="layui-tab-title" id="LAY_app_tabsheader">
                    <li lay-id="home/console.html" lay-attr="home/console.html" class="layui-this"><i class="layui-icon layui-icon-home"></i></li>
                </ul>
            </div>
        </div>


        <!-- 主体内容 -->
        <div class="layui-body" id="LAY_app_body">
            <div style="display: none" id="loginType">${type}</div>
            <div class="layadmin-tabsbody-item layui-show">
                <iframe src="home/console.html" frameborder="0" class="layadmin-iframe"></iframe>
            </div>
        </div>

        <!-- 辅助元素，一般用于移动设备下遮罩 -->
        <div class="layadmin-body-shade" layadmin-event="shade"></div>
    </div>
</div>

<script>
    var role=document.getElementById("loginType").innerHTML
    if(role==='admin'){
        document.getElementById("Adminrole").style.display="";//显示
    }else if(role==='student'){
        document.getElementById("Studentrole").style.display="";//显示

    }else if(role==='teacher'){
        document.getElementById("Teacherrole").style.display="";//显示
    }
</script>

<script src="../layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '../layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use('index');

    function  exit(){
        sessionStorage.clear()
        window.location.href="/"
    }
</script>

<!-- 百度统计 -->
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?d214947968792b839fd669a4decaaffc";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
</html>


