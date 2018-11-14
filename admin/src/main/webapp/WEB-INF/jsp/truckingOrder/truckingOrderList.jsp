<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


	<title>派车单</title>

	<link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
	<link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	<link href="${projectPath }/css/animate.min.css" rel="stylesheet">
	<link href="${projectPath }/css/style.min.css" rel="stylesheet">
	<link href="${projectPath }/js/plugins/select2-4.0.3/css/select2.css" rel="stylesheet">
</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

	<!-- Panel Other -->
	<div class="ibox float-e-margins">
		<div class="ibox-title">
			<h5>派车单</h5>
			<div class="ibox-tools">
				<a class="collapse-link">
					<i class="fa fa-chevron-up"></i>
				</a>
			</div>
		</div>

		<div class="ibox-content">
			<form id="search-form" class="form-inline" role="form">
				<div class="form-group" style="float:left;margin-right: 10px">
					<label>车牌号：</label>
					<input type="text" id="carNum" name="carNum" class="form-control">
				</div>
				<div class="form-group" style="float:left;margin-right: 10px">
					<label>发车时间：</label>
					<input type="text" style="width: 160px" name="beginTime" id="beginTime" class="form-control">
				</div>
				<div class="form-group" style="float:left;margin-right: 40px">
					<label>至</label>
					<input type="text" style="width: 160px;margin-left: 10px" name="endTime" id="endTime"
						   class="form-control">
				</div>
				<c:if test="${not empty superSu}">
					<div class="form-group" style="width: 24%;" >
						<label>企业名称：</label>
						<select name="truckingOrder.businessId" id="businessId" class="form-control" >
							<option value="">请选择</option>
							<c:forEach items="${businessList }" var="business">
								<option value="${business.id }">${business.businessName }</option>
							</c:forEach>
						</select>
					</div>
				</c:if>
				<button id="search1" type="button" class="btn btn-success" style="margin-top: 5px;margin-left: 10px;">
					搜索
				</button>
			</form>
		</div>
		<div class="ibox-content">
			<div class="row row-lg">
				<div class="col-sm-12">
					<!-- Example Card View -->
					<div class="example-wrap">
						<h4 class="example-title"></h4>
						<div class="example">
							<div class="btn-group hidden-xs" id="exampleToolbar" role="group">
								<button id="add" type="button" class="btn btn-outline btn-default" title="添加">
									<i class="glyphicon glyphicon-plus" aria-hidden="true"></i> 添加
								</button>
								<button id="edit" type="button" class="btn btn-outline btn-default" title="编辑">
									<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 编辑
								</button>
								<button id="truckingOrderPrint" type="button" class="btn btn-default" aria-label="Left Align">
									<span class="glyphicon glyphicon-print" aria-hidden="true"></span> 打印
								</button>
								<button id="detail" type="button" class="btn btn-outline btn-default" title="派车单提示详情">
									<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 派车单提示详情
								</button>
							</div>
							<table id="truckingOrderListTable"
								   data-toggle="table"
								   data-method="post"
								   data-url="${projectPath }/truckingOrder/truckingOrderListData.action"
								   data-content-type="application/x-www-form-urlencoded"
								   data-query-params-type=""
								   data-pagination="true"
								   data-side-pagination="server"
								   data-toolbar="#exampleToolbar"
								   data-show-export="true"
								   data-id-field="id"
								   data-show-refresh="true"
								   data-click-to-select="true"
								   data-single-select="true"
								   data-icon-size="outline"
								   data-query-params="queryParams"
								   data-show-footer="false"
								   data-mobile-responsive="true">
								<thead>
								<tr>
									<th data-checkbox="true" data-align="center"></th>
								<%--	<th data-field="id" data-align="center">编号</th>--%>
									<th data-field="suName" data-align="center">核准签发人</th>
									<c:if test="${not empty superSu}">
										<th data-field="businessName" data-align="center">企业</th>
									</c:if>
									<th data-field="departTime" data-align="center">发车时间</th>
									<th data-field="carNum" data-align="center">车牌号</th>
									<th data-field="transportRouteDisplayName" data-align="center">运营路线</th>
									<th data-field="passWay" data-align="center">途径
									</th>
									<th data-field="certificateStatus" data-align="center"
										data-formatter="statusFormatter">牌证情况
									</th>
									<th data-field="mileage" data-align="center" >里程
									</th>
									<th data-field="employeeName" data-align="center">
										驾驶员
									</th>
									<th data-field="weatherStatus" data-align="center">
										天气情况
									</th>
									<th data-field="wayStatus" data-align="center">
										道路情况
									</th>
									<th data-field="remark" data-align="center">备注</th>
								</tr>
								</thead>
							</table>
						</div>
					</div>
					<!-- End Example Card View -->
				</div>
			</div>
		</div>
	</div>
	<!-- End Panel Other -->
</div>
<script src="${projectPath }/js/jquery.min.js"></script>
<script src="${projectPath }/js/bootstrap.min.js"></script>
<script src="${projectPath }/js/content.min.js"></script>
<script src="${projectPath }/js/plugins/layui/layer/layer.js"></script>
<script src="${projectPath }/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${projectPath }/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${projectPath }/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${projectPath }/js/plugins/layui/laydate-v5.0.9/laydate.js"></script>
<script src="${projectPath }/js/common.js"></script>
<script type="text/javascript">
	var $truckingOrderListTable = $("#truckingOrderListTable");

	laydate.render({
		elem: '#beginTime'
		, type: 'datetime'
	});
	laydate.render({
		elem: '#endTime'
		, type: 'datetime'
	});
	$(document).on('click', '#add', function () {
		layer.open({
			type: 2,
			title: '<i class="glyphicon glyphicon-employee"></i> 添加派车单',
			area: ['90%', '85%'],
			content: '${projectPath}/truckingOrder/add.action'
		});
	});

	$(document).on('click', '#edit', function () {
		var rows = $truckingOrderListTable.bootstrapTable('getSelections');
		if (rows.length != 1) {
			layer.alert('请选择一行', {icon: 0});
			return false;
		}
		layer.open({
			type: 2,
			title: '<i class="glyphicon glyphicon-employee"></i> 编辑派车单',
			area: ['90%', '85%'],
			content: '${projectPath}/truckingOrder/edit.action?truckingOrderId=' + rows[0].id
		});
	});
	
	$(document).on('click', '#detail', function () {
		var rows = $truckingOrderListTable.bootstrapTable('getSelections');
		layer.open({
			type: 2,
			title: '<i class="glyphicon glyphicon-employee"></i> 派车单提示详情',
			area: ['1300px', '800px'],
			content: '${projectPath}/truckingOrder/truckingOrderPromptList.action'
		});
	});

	function statusFormatter(value, row, index) {
		if (value == 1) return '正常';
		else if (value == 0) return '异常';
	}

	function queryParams(params) {
		var b = $.extend({}, params, $("#search-form").serializeJson());
		return b;
	}

	$(document).on('click', '#search1', function () {
		$truckingOrderListTable.bootstrapTable('refreshOptions', {pageNumber: 1});
		$("#truckingOrderListTable").bootstrapTable("refresh");
	});


	$(document).off('click', '#truckingOrderPrint').on('click', '#truckingOrderPrint', function () {
		var options = $("#carNum");
		var beginTime = $("#beginTime").val();
		var endTime = $("#endTime").val();
		window.open("${projectPath }/truckingOrder/print.action?carNum=" + options.val()+ "&beginTime=" + beginTime + "&endTime=" + endTime, null, 'height=808,width=1000,status=yes,toolbar=no,menubar=no,location=no');
	});
</script>
</body>

</html>