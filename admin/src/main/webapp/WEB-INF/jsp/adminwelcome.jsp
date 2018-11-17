<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tld/cm" prefix="cm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>H+ 后台主题UI框架 - 首页示例二</title>
<meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
<meta name="description"
	content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

<link rel="shortcut icon" href="favicon.ico">
<link
	href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.staticfile.org/font-awesome/4.4.0/css/font-awesome.css?v=4.4.0"
	rel="stylesheet">

<!-- Morris -->
<link href="/static/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="/static/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

<link
	href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/static/css/style.min.css?v=4.1.0" rel="stylesheet">
<link
	href="/static/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">

	<style>
		.eyes.invisible{background-image: url(/static/images/eye.png);}
	</style>
</head>

<body class="gray-bg">
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-success pull-right">总</span>
						<h5>收费款</h5>
					</div>
					<div class="ibox-content">
						<%--<h1 class="no-margins">${totalIncome }</h1>--%>
						<h1 id="income" class="no-margins">*****</h1>
							<%--<a href="javascript:void(0);" class="eyes invisible"></a>--%>
						<small>总收入</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-primary pull-right">总</span>
						<h5>总人数</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins">${employeeCount }</h1>
						<%--<div class="stat-percent font-bold text-navy">44% <i class="fa fa-level-up"></i>
					</div>--%>
						<small>人数</small>
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<span class="label label-danger pull-right">最近一周</span>
						<h5>活跃用户</h5>
					</div>
					<div class="ibox-content">
						<h1 class="no-margins">${activeUser }</h1>
						<!-- <div class="stat-percent font-bold text-danger">
							38% <i class="fa fa-level-down"></i>
						</div>
						<small>12月</small> -->
					</div>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="ibox">
					<div class="ibox-content">
						<h5>本周访问量</h5>
						<h2>65 000</h2>
						<div id="sparkline2"></div>
					</div>
				</div>
			</div>


		</div>

		<div class="row">

			<div class="col-sm-12">

				<div class="row">
					<div class="col-sm-4">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>活跃用户列表</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a> <a class="close-link"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>
						</div>
					</div>

					<div class="col-sm-4">
						<div class="ibox float-e-margins">
							<div class="ibox-title">
								<h5>学时排行</h5>
								<div class="ibox-tools">
									<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
									</a> <a class="close-link"> <i class="fa fa-times"></i>
									</a>
								</div>
							</div>
							<div class="ibox-content">
								 <table class="table table-hover no-margins">
								<thead>
								<tr>
									<th width="25%" style="text-align: center;">用户</th>
									<th width="35%" style="text-align: center;">时长</th>
									<th width="40%" style="text-align: center;">所属企业</th>
								</tr>
								</thead>
							</table> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/bootstrap.min.js"></script>
	<script src="/static/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="/static/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="/static/js/plugins/layui/layer/layer.js"></script>
	<script src="/static/js/hplus.min.js"></script>
	<script src="/static/js/contabs.min.js"></script>
	<script src="/static/js/plugins/pace/pace.min.js"></script>
	<script
		src="/static/js/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="/static/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="/static/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="/static/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script src="/static/js/common.js"></script>
	<script>
		$(document).ready(function() {
			$("#sparkline2").sparkline([ 24, 43, 43, 55, 44, 62, 44, 72 ], {
				type : "line",
				width : "100%",
				height : "35",
				lineColor : "#1ab394",
				fillColor : "#ffffff"
			});
		});
		 function queryParams(params) {
			var b = $.extend({}, params, $("#search-form").serializeJson());
			return b;
		} 
		/* function ltFormatter(value, row, index) {
			return '<span style="color:red">'+"<i class='fa fa-clock-o'>"+value+'</span>';
			 }  */
		 function ltFormatter(value, row, index) {
			return "<i class='fa fa-clock-o'>"+value;
			 }  
		/* function bnFormatter(value, row, index) {
			return '<span style="color:#1ab394">'+value+'</span>';
			 }  */
        function clickHandler1(){
            if ($(this).html().indexOf("*")>-1){
                $(this).html(${totalIncome});
			}else{
                $(this).html("*****");
			}

        }
        $("#income").click( clickHandler1);
	</script>

</body>

</html>
