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
<link href="css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

<!-- Gritter -->
<link href="js/plugins/gritter/jquery.gritter.css" rel="stylesheet">

<link
	href="https://cdn.bootcss.com/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link href="css/style.min.css?v=4.1.0" rel="stylesheet">
<link
	href="${projectPath }/css/plugins/bootstrap-table/bootstrap-table.min.css"
	rel="stylesheet">

	<style>
		.eyes.invisible{background-image: url(${projectPath}/images/eye.png);}
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
			<%--<div class="col-sm-4">
			<div class="ibox float-e-margins">
				<div class="ibox-title">
					<h5>消息</h5>
					<div class="ibox-tools">
						<a class="collapse-link">
							<i class="fa fa-chevron-up"></i>
						</a>
						<a class="close-link">
							<i class="fa fa-times"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content ibox-heading">
					<h3><i class="fa fa-envelope-o"></i> 新消息</h3>
					<small><i class="fa fa-tim"></i> 您有22条未读消息</small>
				</div>
				<div class="ibox-content">
					<div class="feed-activity-list">

						<div class="feed-element">
							<div>
								<small class="pull-right text-navy">1月前</small>
								<strong>井幽幽</strong>
								<div>
									有人说：“一辈子很长，要跟一个有趣的人在一起”。我想关注我的人，应该是那种喜欢找乐子也乐意分享乐趣的人，你们一定挺优秀的。所以单身的应该在这条留言，互相勾搭一下。特别有钱人又帅可以直接私信我！
								</div>
								<small class="text-muted">4月11日 00:00</small>
							</div>
						</div>

						<div class="feed-element">
							<div>
								<small class="pull-right">2月前</small>
								<strong>马伯庸 </strong>
								<div>又方便，又防水，手感又好，还可以用手机遥控。简直是拍戏利器，由其是跟老师们搭戏的时候…想想还有点小激动啊，嘿嘿。</div>
								<small class="text-muted">11月8日 20:08</small>
							</div>
						</div>

						<div class="feed-element">
							<div>
								<small class="pull-right">5月前</small>
								<strong>芒果宓 </strong>
								<div>一个完整的梦。</div>
								<small class="text-muted">11月8日 20:08</small>
							</div>
						</div>

						<div class="feed-element">
							<div>
								<small class="pull-right">5月前</small>
								<strong>刺猬尼克索</strong>
								<div>哈哈哈哈 你卖什么萌啊! 蠢死了</div>
								<small class="text-muted">11月8日 20:08</small>
							</div>
						</div>


						<div class="feed-element">
							<div>
								<small class="pull-right">5月前</small>
								<strong>老刀99</strong>
								<div>昨天评论里你见过最“温暖和感人”的诗句，整理其中经典100首，值得你收下学习。</div>
								<small class="text-muted">11月8日 20:08</small>
							</div>
						</div>
						<div class="feed-element">
							<div>
								<small class="pull-right">5月前</small>
								<strong>娱乐小主 </strong>
								<div>你是否想过记录自己的梦？你是否想过有自己的一个记梦本？小时候写日记，没得写了就写昨晚的梦，后来变成了习惯………翻了一晚上自己做过的梦，想哭，想笑…</div>
								<small class="text-muted">11月8日 20:08</small>
							</div>
						</div>
						<div class="feed-element">
							<div>
								<small class="pull-right">5月前</small>
								<strong>DMG电影 </strong>
								<div>《和外国男票乘地铁，被中国大妈骂不要脸》妹子实在委屈到不行，中国妹子找外国男友很令人不能接受吗？大家都来说说自己的看法</div>
								<small class="text-muted">11月8日 20:08</small>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>--%>

			<div class="col-sm-12">

				<div class="row">
				<c:if test="${not empty superSu}">
						<div class="col-sm-4">
							<div class="ibox float-e-margins">
								<div class="ibox-title">
									<h5>在线用户列表</h5>
									<div class="ibox-tools">
										<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
										</a> <a class="close-link"> <i class="fa fa-times"></i>
									</a>
									</div>
								</div>
								<div class="ibox-content">
									<table data-toggle="table" data-method="post"
										   data-url="${projectPath }/infoEmployeeOnlineListData.action"
										   data-content-type="application/x-www-form-urlencoded"
										   data-query-params-type=""
										   data-pagination="true"
										   data-side-pagination="server"
										   data-toolbar="#exampleToolbar"
										   data-show-export="true"
										   data-id-field="id"
										   data-click-to-select="true"
										   data-single-select="true"
										   data-icon-size="outline"
										   data-query-params="queryParams"
										   data-show-footer="false"
										   data-mobile-responsive="true">
										<thead>
										<tr>
											<th data-field="realName" data-align="center">用户</th>
											<th data-field="loginTime" data-align="center" data-formatter="ltFormatter">登录时间</th>
											<th data-field="businessName" data-align="center" >所属企业</th>
										</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
				</c:if>
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
							<div class="ibox-content">
								 <%-- <table class="table table-hover no-margins">
									<thead>
										<tr>
											<th width="25%" style="text-align: center;">用户</th>
											<th width="35%" style="text-align: center;">最近登录时间</th>
											<th width="40%" style="text-align: center;">所属企业</th>
										</tr>
									</thead>
									<!-- <tbody>
										<tr>
											<td><small>进行中...</small></td>
											<td><i class="fa fa-clock-o"></i> 11:20</td>
											<td class="text-navy"><i class="fa fa-level-up"></i> 24%</td>
										</tr>
										<tr>
											<td><span class="label label-warning">已取消</span></td>
											<td><i class="fa fa-clock-o"></i> 10:40</td>
											<td class="text-navy"><i class="fa fa-level-up"></i> 66%</td>
										</tr>
										<tr>
											<td><small>进行中...</small></td>
											<td><i class="fa fa-clock-o"></i> 01:30</td>
											<td class="text-navy"><i class="fa fa-level-up"></i> 54%</td>
										</tr>
										<tr>
											<td><span class="label label-primary">已完成</span></td>
											<td><i class="fa fa-clock-o"></i> 04:10</td>
											<td class="text-navy"><i class="fa fa-level-up"></i> 66%</td>
										</tr>
										<tr>
											<td><small>进行中...</small></td>
											<td><i class="fa fa-clock-o"></i> 12:08</td>
											<td class="text-navy"><i class="fa fa-level-up"></i> 23%</td>
										</tr>
									</tbody> -->
								<c:forEach items="${infoEmployeeOnlines }" var="infoEmployeeOnline" varStatus="index">
								   <tr>
								     <td align="center">${infoEmployeeOnline.realName }</td>
								     <td align="center" ><i class="fa fa-clock-o"></i><fmt:formatDate value="${infoEmployeeOnline.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
								     <td align="center" > ${infoEmployeeOnline.businessName }</td>
								   </tr>
								</c:forEach>
								</table> --%>
								<table data-toggle="table" data-method="post"
									data-url="${projectPath }/infoEmployeeActiveListData.action"
									data-content-type="application/x-www-form-urlencoded"
									data-query-params-type=""
								   data-pagination="true"
								   data-side-pagination="server"
								   data-toolbar="#exampleToolbar"
								   data-show-export="true"
								   data-id-field="id"
								   data-click-to-select="true"
								   data-single-select="true"
								   data-icon-size="outline"
								   data-query-params="queryParams"
								   data-show-footer="false"
								   data-mobile-responsive="true">
									<thead>
										<tr>
											<th data-field="realName" data-align="center">用户</th>
											<th data-field="loginTime" data-align="center" data-formatter="ltFormatter">登录时间</th>
											<th data-field="businessName" data-align="center" >所属企业</th>
										</tr>
									</thead>
								</table> 
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
							<!-- 	<tbody>
								<tr>
									<td>
										张三
									</td>
									<td>23小时</td>
									<td class="text-navy"><i class="fa fa-level-up"></i> 24%</td>
								</tr>
								<tr>
									<td><span class="label label-warning">已取消</span>
									</td>
									<td><i class="fa fa-clock-o"></i> 10:40</td>
									<td class="text-navy"><i class="fa fa-level-up"></i> 66%</td>
								</tr>
								<tr>
									<td>
										<small>进行中...</small>
									</td>
									<td><i class="fa fa-clock-o"></i> 01:30</td>
									<td class="text-navy"><i class="fa fa-level-up"></i> 54%</td>
								</tr>
								<tr>
									<td><span class="label label-primary">已完成</span>
									</td>
									<td><i class="fa fa-clock-o"></i> 04:10</td>
									<td class="text-navy"><i class="fa fa-level-up"></i> 66%</td>
								</tr>
								<tr>
									<td>
										<small>进行中...</small>
									</td>
									<td><i class="fa fa-clock-o"></i> 12:08</td>
									<td class="text-navy"><i class="fa fa-level-up"></i> 23%</td>
								</tr>
								</tbody> -->
								<c:forEach items="${studySummarys }" var="studySummary" varStatus="index">
								   <tr>
								     <td align="center">${studySummary.name }</td>
								     <td align="center" ><i class="fa fa-clock-o"></i><cm:timeString time="${studySummary.sumStudyTime}"/> </td>
								     <td align="center">${studySummary.businessName }</td>
								   </tr>
								</c:forEach>
							</table> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${projectPath }/js/jquery.min.js"></script>
	<script src="${projectPath }/js/bootstrap.min.js"></script>
	<script src="${projectPath }/js/plugins/metisMenu/jquery.metisMenu.js"></script>
	<script
		src="${projectPath }/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="${projectPath }/js/plugins/layui/layer/layer.js"></script>
	<script src="${projectPath }/js/hplus.min.js"></script>
	<script src="${projectPath }/js/contabs.min.js"></script>
	<script src="${projectPath }/js/plugins/pace/pace.min.js"></script>
	<script
		src="${projectPath }/js/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${projectPath }/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
	<script
		src="${projectPath }/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
	<script
		src="${projectPath }/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
		<script src="${projectPath }/js/common.js"></script>
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
