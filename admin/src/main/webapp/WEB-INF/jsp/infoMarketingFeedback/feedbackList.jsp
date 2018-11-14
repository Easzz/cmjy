<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


	<title>意见反馈</title>

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

		<div class="ibox-content">
			<div class="row row-lg">
				<div class="col-sm-12">
					<!-- Example Card View -->
					<div class="example-wrap">
						<h4 class="example-title"></h4>
						<div class="example">
							<form id="search-form" class="form-inline" role="form">

							</form>
							<div class="btn-group hidden-xs" id="exampleToolbar" role="group">
							</div>
							<table id="feedbackListTable"
								   data-toggle="table"
								   data-method="post"
								   data-url="${projectPath }/infoMarketingFeedback/feedbackListData.action"
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
									<th data-field="businessName" data-align="center">企业名称</th>
									<th data-field="mobilePhone" data-align="center">手机号</th>
									<th data-field="employeeName" data-align="center">填写人</th>
									<th data-field="createTime" data-align="center">创建时间</th>
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
<script type="text/javascript">
	var $feedbackListTable = $("#feedbackListTable");

	function queryParams(params) {
		var b = $.extend({}, params, $("#search-form").serializeJson());
		return b;
	}

	$(document).on('click', '#search', function () {
		$feedbackListTable.bootstrapTable("refresh");
	})
</script>
</body>

</html>