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
			<h5>派车单提示</h5>
			<div class="ibox-tools">
				<a class="collapse-link">
					<i class="fa fa-chevron-up"></i>
				</a>
			</div>
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
							</div>
							<table id="truckingOrderPromptListTable"
								   data-toggle="table"
								   data-method="post"
								   data-url="${projectPath }/truckingOrder/truckingOrderPromptListData.action"
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
									<th data-field="number" data-align="center"
                                                data-formatter="numberFormatter">编号</th>
									<th data-field="title" data-align="center">提示标题</th>
									<th data-field="createTime" data-align="center">创建时间</th>
									<th data-field="dataStatus" data-align="center" 
									    data-formatter="statusFormatter">状态</th>
									
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

	var $truckingOrderPromptListTable = $("#truckingOrderPromptListTable");

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
			title: '<i class="glyphicon glyphicon-employee"></i> 添加派车单提示',
			area: ['90%', '85%'],
			content: '${projectPath}/truckingOrder/truckingOrderPromptAdd.action'
		});
	});

	$(document).on('click', '#edit', function () {
		var rows = $truckingOrderPromptListTable.bootstrapTable('getSelections');
		if (rows.length != 1) {
			layer.alert('请选择一行', {icon: 0});
			return false;
		}
		layer.open({
			type: 2,
			title: '<i class="glyphicon glyphicon-employee"></i> 编辑派车单提示',
			area: ['90%', '85%'],
			content: '${projectPath}/truckingOrder/truckingOrderPromptEdit.action?truckingOrderPromptId=' + rows[0].id
		});
	});
	function statusFormatter(value, row, index) {
		if (value == 1) return '启用';
		else if (value == 0) return '禁用';
	}
	function numberFormatter(value,row,index){
    	return index+1;
	}

	

	function queryParams(params) {
		var b = $.extend({}, params, $("#search-form").serializeJson());
		return b;
	}

	$(document).on('click', '#search1', function () {
		$truckingOrderPromptListTable.bootstrapTable('refreshOptions', {pageNumber: 1});
		$("#truckingOrderPromptListTable").bootstrapTable("refresh");
	});


</script>
</body>

</html>