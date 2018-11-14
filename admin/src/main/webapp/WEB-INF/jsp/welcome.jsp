<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>欢迎页</title>
	<style type="text/css">
		html {
			height: 100%;
			margin: 0;
		}

		body {
			height: 100%;
			margin: 0;
		}

		.clear {
			clear: both;
		}

		.index {
			padding: 20px;
		}

		.index .title {
			font-size: 16px;
			line-height: 35px;
		}

		.index .echarts {
			width: 60%;
			height: 230px;
			float: left;
			padding: 5px 20px;
			box-sizing: border-box;
			background: #fff;
			border-top: solid #f2f2f2 2px;
		}

		.index .echarts .echartsList {
			width: 50%;
			height: 185px;
			float: left;
		}

		.index .article {
			width: 38%;
			height: 230px;
			float: right;
			padding: 5px 20px;
			box-sizing: border-box;
			background: #fff;
			border-top: solid #f2f2f2 2px;
		}

		.index .article ol {
			padding: 0 0 0 20px;
			margin: 0;
		}

		.index .article ol li {
			height: 36px;
			line-height: 36px;
			font-size: 14px;
		}

		.index .article ol li a {
			width: 77%;
			float: left;
			color: #333;
			text-decoration: none;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
		}

		.index .article ol li span {
			float: right;
			color: #999;
		}

		.index .barEcharts {
			margin-top: 20px;
		}

		.index .barEcharts .barList {
			width: 49%;
			height: 260px;
			float: left;
			padding: 0 20px;
			box-sizing: border-box;
			background: #fff;
			border-top: solid #f2f2f2 2px;
		}

		.index .barEcharts .barList:nth-child(even) {
			float: right;
		}

		.index .barEcharts .barBox {
			height: 260px;
		}
	</style>
</head>

<body>
<script src="${projectPath }/js/jquery.min.js"></script>
<script src="${projectPath }/js/bootstrap.min.js"></script>
<script src="${projectPath }/js/plugins/echarts/echarts-all.js"></script>
<script src="${projectPath }/js/plugins/layui/layer/layer.js"></script>
<script>
$(document).on('click', '#title', function () {
	var titleId = $(this).attr("data-id");
	layer.open({
		type: 2,
		title: '<i class="glyphicon glyphicon-employee"></i> 站内公告',
		area: ['70%', '80%'],
		content: '${projectPath}/stationAnnouncement/content.action?stationAnnouncementId=' + titleId
	});
});
</script>
<div class="index">
	<div class="echarts">
		<div class="title">实时达标情况</div>
		<div class="echartsList" id="echartsPie"></div>
		<script type="text/javascript">
			var echartsPie = echarts.init(document.getElementById('echartsPie'));
			var option = {
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} 人"
				},
				color: ['#7db4ff', '#5668ff'],
				calculable: false,
				series: [
					{
						name: '学时',
						type: 'pie',
						radius: ['40%', '60%'],//饼图的半径大小
						center: ['50%', '45%'],//饼图的位置
						data: [

							{value: '${businessBackIndexVo.studytimeispass}', name: '学时达标'},
							{value: '${businessBackIndexVo.studytimenopass}', name: '学时不达标'}
						]
					},
				]


			};

			echartsPie.setOption(option);
		</script>
		<div class="echartsList" id="echartsPie2"></div>
		<script type="text/javascript">
			var echartsPie2 = echarts.init(document.getElementById('echartsPie2'));
			var option2 = {
				tooltip: {
					trigger: 'item',
					formatter: "{a} <br/>{b} : {c} 人"
				},
				color: ['#ffe7b3', '#ffbf35'],
				calculable: false,
				series: [
					{
						name: '考核',
						type: 'pie',
						radius: ['40%', '60%'],//饼图的半径大小
						center: ['50%', '45%'],//饼图的位置
						data: [
							{value: '${businessBackIndexVo.examispass}', name: '考核达标'},
							{value: '${businessBackIndexVo.examnopass}', name: '考核不达标'}
						]
					}
				]
			};

			echartsPie2.setOption(option2);
		</script>
	</div>
	<div class="article">
		<div class="title">站内公告</div>

		<ol>
			<c:forEach items="${businessBackIndexVo.stationAnnouncements }" var="stationAnnouncement" varStatus="index">
				<li><a data-id=${stationAnnouncement.id } href="javascript:void(0);"
					   id="title">${stationAnnouncement.title }</a><span><fmt:formatDate
						value="${stationAnnouncement.createTime }" type="date" pattern="yyyy-MM-dd "/></span></li>
			</c:forEach>
		</ol>
	</div>

	<div class="clear"></div>

	<div class="barEcharts">
		<div class="barList">
			<div class="barBox" id="bar1"></div>
			<script type="text/javascript">

				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('bar1'));

				// 指定图表的配置项和数据
				var optionbar = {
					title: {
						text: "隐患排查",
						y: 12,
						textStyle: {
							fontSize: 16,
							fontStyle: 'normal',
							fontWeight: 'normal',
						},
					},
					tooltip: {
						trigger: 'axis',
						axisPointer: {            // 坐标轴指示器，坐标轴触发有效
							type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						}
					},
					grid: {
						x: 20,		//距离左边
						x2: 10,		//距离右边
						y: 50,		//距离顶部
						y2: 40		//距离底部
					},
					color: ["#43cb83", "#ffcc5f", "#2481ff"],
					legend: {
						data: ['正常', '异常', '已处理'],
						x: "right",
						y: 20
					},
					xAxis: {
						data: eval('(' + '${businessBackIndexVo.lately6MonthFormat}' + ')'),
						splitLine: {
							show: false
						}
					},
					yAxis: {
						type: 'value'
					},
					series: [{
						name: '正常',
						type: 'bar',
						barGap: '0%',
						data: eval('(' + '${businessBackIndexVo.hiddenDangerLately6Month_normal}' + ')')
					},
						{
							name: '异常',
							type: 'bar',
							data: eval('(' + '${businessBackIndexVo.hiddenDangerLately6Month_abnormal}' + ')')
						},
						{
							name: '已处理',
							type: 'bar',
							data: eval('(' + '${businessBackIndexVo.hiddenDangerLately6Month_processed}' + ')')
						}
					]
				};

				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(optionbar);
			</script>
		</div>
		<div class="barList">
			<div class="barBox" id="bar2"></div>
			<script type="text/javascript">
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('bar2'));

				// 指定图表的配置项和数据
				var optionbar2 = {
					title: {
						text: "安全行驶日志",
						y: 12,
						textStyle: {
							fontSize: 16,
							fontStyle: 'normal',
							fontWeight: 'normal',
						},
					},
					tooltip: {
						trigger: 'axis',
						axisPointer: {            // 坐标轴指示器，坐标轴触发有效
							type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						}
					},
					grid: {
						x: 20,		//距离左边
						x2: 10,		//距离右边
						y: 50,		//距离顶部
						y2: 40		//距离底部
					},
					color: ["#2481ff", "#1ecde2"],
					legend: {
						data: ['正常', '异常'],
						x: "right",
						y: 20
					},
					xAxis: {
						data: eval('(' + '${businessBackIndexVo.lately6MonthFormat}' + ')'),
						splitLine: {
							show: false
						}
					},
					yAxis: {
						type: 'value'
					},
					series: [{
						name: '正常',
						type: 'bar',
						barGap: '0%',
						data: eval('(' + '${businessBackIndexVo.driverRecordLately6Month_normal}' + ')')
					},
						{
							name: '异常',
							type: 'bar',
							data: eval('(' + '${businessBackIndexVo.driverRecordLately6Month_abnormal}' + ')')
						}
					]
				};

				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(optionbar2);
			</script>
		</div>
		<div class="clear"></div>
	</div>
	<div class="barEcharts">
		<div class="barList">
			<div class="barBox" id="bar3"></div>
			<script type="text/javascript">
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('bar3'));

				// 指定图表的配置项和数据
				var optionbar3 = {
					title: {
						text: '平均学时(分钟)',
						y: 12,
						textStyle: {
							fontSize: 16,
							fontStyle: 'normal',
							fontWeight: 'normal',
						},
					},
					grid: {
						x: 25,		//距离左边
						x2: 25,		//距离右边
						y: 50,		//距离顶部
						y2: 30		//距离底部
					},
					color: ["#87CEFA"],
					tooltip: {
						trigger: 'axis'
					},
					legend: {
						data: ['平均学时(分钟)'],
						x: "right",
						y: 20
					},
					toolbox: {
						show: true,

					},
					calculable: true,
					xAxis: [
						{
							type: 'category',
							boundaryGap: false,
							data: eval('(' + '${businessBackIndexVo.lately6MonthFormat}' + ')')
						}
					],
					yAxis: [
						{
							type: 'value',

						}
					],
					series: [
						{
							name: '平均学时(分钟)',
							type: 'line',
							data: eval('(' + '${businessBackIndexVo.studySummaryLately6Month_avg}' + ')'),
							markPoint: {
								data: [
									{type: 'max', name: '最大值'},
									{type: 'min', name: '最小值'}
								]
							}
						},

					]
				};

				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(optionbar3);
			</script>
		</div>
		<div class="barList">
			<div class="barBox" id="bar4"></div>
			<script type="text/javascript">
				// 基于准备好的dom，初始化echarts实例
				var myChart = echarts.init(document.getElementById('bar4'));

				// 指定图表的配置项和数据
				var optionbar = {
					title: {
						text: "人员流动数据",
						y: 12,
						textStyle: {
							fontSize: 16,
							fontStyle: 'normal',
							fontWeight: 'normal',
						},
					},
					tooltip: {
						trigger: 'axis',
						axisPointer: {            // 坐标轴指示器，坐标轴触发有效
							type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
						}
					},
					grid: {
						x: 20,		//距离左边
						x2: 10,		//距离右边
						y: 50,		//距离顶部
						y2: 40		//距离底部
					},
					color: ["#43cb83", "#ffcc5f", "#2481ff"],
					legend: {
						data: ['总人数','入职数', '离职数'],
						x: "right",
						y: 20
					},
					xAxis: {
						data: eval('(' + '${businessBackIndexVo.lately6MonthFormat}' + ')'),
						splitLine: {
							show: false
						}
					},
					yAxis: {
						type: 'value'
					},
					series: [{
						name: '总人数',
						type: 'bar',
						barGap: '0%',
						data: eval('(' + '${businessBackIndexVo.employeeCountList}' + ')')
					},
						{
							name: '入职数',
							type: 'bar',
							data:eval('(' + '${businessBackIndexVo.addList}' + ')')
						},
						{
							name: '离职数',
							type: 'bar',
							data:eval('(' + '${businessBackIndexVo.leaveList}' + ')')
						}
					]
				};

				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(optionbar);
			</script>
		</div>
		<div class="clear"></div>
	</div>
</div>
</body>
</html>