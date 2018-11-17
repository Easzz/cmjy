<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>主页</title>
<link href="/static/css/bootstrap.min.css" rel="stylesheet">
<link href="/static/css/font-awesome.min.css" rel="stylesheet">
<link href="/static/css/animate.min.css" rel="stylesheet">
<link href="/static/css/style.min.css" rel="stylesheet">
</head>

<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
    <div class="header">
   		<div>
               <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                   <div style="float: right; height: 70px;">
                    <div style="float: left; width: 160px; padding: 11px 10px 11px 20px;">
                        <span style="float: left; margin-right: 10px;"><img alt="image" class="img-circle" width="48" height="48" src="/static/img/man64.jpg"/></span>
                        <span class="clear">
                           <span class="block" style="font-size: 16px; color: #fff;">${loginUser.realName }</span>
                           <span class="block" style="font-size: 14px; color: #fff;">${loginUser.roleName }</span>
                        </span>
                    </div>
                    <div style="width: 100px; float: right; padding: 24px 0; text-align: center; position: relative;">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void(0);">
                            <i class="fa fa-cog" style="font-size: 20px; color: #fff;"></i>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        	<li><a class="J_menuItem" href="/modifypwd">修改密码</a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/logout">安全退出</a></li>
                        </ul>
                    </div>
                   </div>
               </nav>
           </div>
   	</div>
    

    <div id="wrapper">
    	
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close"><i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                    <c:forEach items="${loginUser.menus }" var="menu">
                    <li>
                        <a href="#">
                            <i class="fa ${menu.cssClass}"></i>
                            <span class="nav-label" style="font-size: 16px;">
                                <c:if test="${loginUser.businessId !=null }">

                                    <c:choose>
                                        <c:when test="${ fn:contains(menu.menuname, '危运_')}">
                                            ${fn:replace(menu.menuname, "危运_", "")}
                                        </c:when>
                                        <c:otherwise>
                                            ${menu.menuname}
                                        </c:otherwise>
                                    </c:choose>

                                </c:if>
                                  <c:if test="${loginUser.businessId ==null }">
                                     ${menu.menuname}
                                  </c:if>

                            </span>
                            <span class="fa arrow"></span>
                        </a>
                        <ul class="nav nav-second-level collapse in">
                        	<c:forEach items="${menu.menus }" var="children">
                            <li>
                                <a class="J_menuItem" href="${children.url}" data-index="0" style="font-size: 14px;">${children.menuname }</a>
                            </li>
                            </c:forEach>
                        </ul>
                    </li>
                    </c:forEach>
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
        	<div class="row content-tabs">
               <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i></button>
               <nav class="page-tabs J_menuTabs">
                   <div class="page-tabs-content">
                       <a href="javascript:;" class="active J_menuTab" data-id="index_v1.html">首页</a>
                   </div>
               </nav>
               <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i></button>
           </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${welcomeUrl}"  frameborder="0" data-id="index_v1.html" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">Copyright &copy; 2017-2018 纯美教育 版权所有
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">
                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i> 主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="#tab-2">
                        通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="#tab-3">
                        项目进度
                    </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> 主题设置</h3>
                            <small><i class="fa fa-tim"></i> 你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu">
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>
                        固定宽度
                    </span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                         <a href="#" class="s-skin-0">
                             默认皮肤
                         </a>
                    </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-1">
                            蓝色主题
                        </a>
                    </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                        <a href="#" class="s-skin-3">
                            黄色/紫色主题
                        </a>
                    </span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3> <i class="fa fa-comments-o"></i> wefwefwwef最新通知</h3>
                            <small><i class="fa fa-tim"></i> 您当前有10条未读信息</small>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
<script src="/static/js/jquery.min.js"></script>
<script src="/js/bootstrap.min.js" ></script>
<script src="/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/js/plugins/slimscroll/jquery.slimscroll.min.js" ></script>
<script src="/static/js/plugins/layui/layer/layer.js" ></script>
<script src="/static/js/hplus.min.js" ></script>
<script src="/static/js/contabs.min.js" ></script>
<script src="/static/js/plugins/pace/pace.min.js" ></script>

</body>
<script>
	var leftmenu = $("body").height();
	$(".navbar-static-side").height(leftmenu - 70);
</script>
</html>