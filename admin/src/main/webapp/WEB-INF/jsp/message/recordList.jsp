<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


	<title>发送记录</title>

	<link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
	<link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	<link href="${projectPath }/css/animate.min.css" rel="stylesheet">
	<link href="${projectPath }/css/style.min.css" rel="stylesheet">

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

	<!-- Panel Other -->
	<div class="ibox float-e-margins">
		<div class="ibox-title">
			<h5>发送记录</h5>
			<div class="ibox-tools">
				<a class="collapse-link">
					<i class="fa fa-chevron-up"></i>
				</a>
			</div>
		</div>

		<div class="ibox-content">
			<form id="search-form" class="form-inline" role="form">
				<div class="form-group" style="float:left;margin-right: 40px">
					<label>手机号：</label>
					<input type="text" style="width: 160px" name="message.mobilePhone" class="form-control">
				</div>
				<div class="form-group" style="float:left;margin-right: 40px">
					<label>发送时间：</label>
					<input type="text" style="width: 160px" name="beginTime" id="beginTime" class="form-control">
				</div>
				<div class="form-group" style="float:left;">
					<label>至</label>
					<input type="text" style="width: 160px;margin-left: 40px" name="endTime" id="endTime" class="form-control">
				</div>
				<c:if test="${not empty superSu}">
					<div class="form-group" style="width: 24%;">
						<label>企业名称：</label>
						<select name="businessId" id="businessId" class="form-control">
							<option value="">请选择</option>
							<c:forEach items="${businessList }" var="business">
								<option value="${business.id }">${business.businessName }</option>
							</c:forEach>
						</select>
					</div>
				</c:if>
				<button id="search" type="button" class="btn btn-success">搜索</button>
			</form>
		</div>
		<div class="ibox-content">
			<div class="row row-lg">
				<div class="col-sm-12">
					<!-- Example Card View -->
					<div class="example-wrap">
						<h4 class="example-title"></h4>
						<div class="example">
							<table id="recordListTable"
								   data-toggle="table"
								   data-method="post"
								   data-url="${projectPath }/message/messageRecordListData.action"
								   data-content-type="application/x-www-form-urlencoded"
								   data-query-params-type=""
								   data-pagination="true"
								   data-side-pagination="server"
								   data-toolbar="#exampleToolbar"
								   data-show-export="true"
								   data-id-field="id"
								   data-show-refresh="true"
								   data-click-to-select="true"
								   data-single-select="false"
								   data-icon-size="outline"
								   data-query-params="queryParams"
								   data-show-footer="false"
								   data-mobile-responsive="true">
								<thead>
								<tr>
									<th data-checkbox="true" data-align="center"></th>
									<th data-field="employeeName" data-align="center">姓名</th>
									<th data-field="mobile" data-align="center">手机号</th>
									<th data-field="content" data-align="center">内容</th>
									<th data-field="sendTime" data-align="center">发送时间</th>
								<%--	<th data-field="dataStatus" data-align="center" data-formatter="statusFormatter">
										状态
									</th>--%>
									<c:if test="${not empty superSu}">
										<th data-field="businessName" data-align="center">企业</th>
									</c:if>
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
<script src="${projectPath }/js/common.js"></script>
<script src="${projectPath }/js/plugins/layui/laydate/laydate.js"></script>
<script src="${projectPath }/js/plugins/layui/laydate-v5.0.9/laydate.js"></script>
<script type="text/javascript">
	laydate.render({
		elem: '#beginTime'
		, type: 'datetime'
	});
	laydate.render({
		elem: '#endTime'
		, type: 'datetime'
	});

	var $recordListTable = $("#recordListTable");

	function statusFormatter(value, row, index) {
		if (value == 1) return '启用';
		else if (value == 0) return '禁用';
	}

	function queryParams(params) {
		var b = $.extend({}, params, $("#search-form").serializeJson());
		return b;
	}

	$(document).on('click', '#search', function () {
		$recordListTable.bootstrapTable('refreshOptions', {pageNumber: 1});
		$recordListTable.bootstrapTable("refresh");
	});
</script>
</body>

</html>