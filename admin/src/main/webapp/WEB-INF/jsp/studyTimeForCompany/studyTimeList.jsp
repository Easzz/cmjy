<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


	<title>企业学时管理</title>

	<link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
	<link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	<link href="${projectPath }/css/animate.min.css" rel="stylesheet">
	<link href="${projectPath }/css/style.min.css" rel="stylesheet">
	<link href="${projectPath }/js/plugins/select2-4.0.3/css/select2.css" rel="stylesheet">

	<style type="text/css">

		label {
			display: inline-block;
			text-align: right;
			max-width: 100%;
			width: 35%;
			margin-bottom: 5px;
			font-weight: 700;
		}

		.form-inline .form-control {
			display: inline-block;
			width: 60%;
			vertical-align: middle;
		}

	</style>

</head>

<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">

	<!-- Panel Other -->
	<div class="ibox float-e-margins">
		<div class="ibox-title">
			<h5>员工学时列表</h5>
			<div class="ibox-tools">
				<a class="collapse-link">
					<i class="fa fa-chevron-up"></i>
				</a>
			</div>
		</div>


		<div class="ibox-content">
			<form id="search-form" class="form-inline" role="form">
				<div class="form-group" style="width: 18%;padding-top: 5px;padding-bottom: 5px;">
					<label>姓名：</label>
					<input type="text" name="studySummary.name" class="form-control">
				</div>
				<div class="form-group" style="width: 18%;">
					<label>身份证号：</label>
					<input type="text" name="studySummary.cerIdNu" class="form-control">
				</div>

				<div class="form-group" style="width: 18%;">
					<label>年月：</label>
					<input type="text" id="yearMonth" name="studySummary.yearMonth" class="form-control">
				</div>
				<div class="form-group" style="width: 24%;" >
					<label>所属安全员：</label>
					<select name="safetyEmployeeId" id="safetyEmployeeId" class="roles">
						<option value="">请选择</option>
						<c:forEach items="${safetyEmployees }" var="safety">
							<option value="${safety.id }">${safety.name }</option>
						</c:forEach>
					</select>
				</div>
				<button id="search" type="button" class="btn btn-success" style="margin-top: 5px;margin-left: 10px;">
					搜索
				</button>
			</form>
		</div>
		<div class="btn-group hidden-xs" id="exampleToolbar" role="group">
			<input onclick="download()" value="导出Excel" id="downloadExcel" type="button"
				   class="btn btn-outline btn-default" title="导出Excel">
			<input value="一键短信提醒" id="messageSend" type="button" class="btn btn-outline btn-default" title="一键短信提醒">
		</div>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="home">
				<!-- begin -->
				<div class="ibox-content">
					<div class="row row-lg">
						<div class="col-sm-12">
							<!-- Example Card View -->
							<div class="example-wrap">
								<h4 class="example-title"></h4>
								<div class="example">

									<table id="businessListTable"
										   data-toggle="table"
										   data-method="post"
										   data-url="${projectPath }/StudySummaryForCompany/studyTimeListData.action"
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
											<th data-field="name" data-align="center">姓名</th>
											<th data-field="cerIdNu" data-align="center">身份证号</th>

											<th data-field="displayStudyTime" data-align="center">学时</th>

											<th data-field="studyFraction" data-align="center">考核分数</th>
											<th data-field="studyTimeIsPass" data-align="center"
												data-formatter="studyTimeFormatter">学时是否达标
											</th>
											<th data-field="studyFractionIsPass" data-align="center"
												data-formatter="studyFractionFormatter">考核是否达标
											</th>
											<th data-field="yearMonth" data-align="center">年月</th>
											<th data-field="id" data-align="center" data-formatter="optionFormatter">
												操作
											</th>
										</tr>
										</thead>
									</table>
								</div>
							</div>
							<!-- End Example Card View -->
						</div>
					</div>
				</div>
				<!-- end -->
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
<script src="${projectPath }/js/plugins/select2-4.0.3/js/select2.full.js"></script>
<script type="text/javascript">
    $("#safetyEmployeeId").select2();
	$(document).on('click', '.details', function () {
		var id = $(this).data("id");
		layer.open({
			type: 2,
			title: '<i class="glyphicon glyphicon-studyTime"></i>明细--》 学时审核',
			area: ['95%', '95%'],
			content: '${projectPath}/StudySummaryForCompany/studyTimeCheckCheck.action?studySummaryId=' + id
		});
	});

	function studyTimeFormatter(value, row, index) {
		if (value == 1) return '达标';
		else if (value == 0) return '不达标';
	}

	function studyFractionFormatter(value, row, index) {
		if (value == 1) return '达标';
		else if (value == 0) return '不达标';
	}

	function queryParams(params) {
		var b = $.extend({}, params, $("#search-form").serializeJson());
		return b;
	}

	$(document).on('click', '#search', function () {
		$('#businessListTable').bootstrapTable('refreshOptions', {pageNumber: 1});
		$("#businessListTable").bootstrapTable("refresh");
	});

	function optionFormatter(value, row, index) {
		var result = "";
		result += "<button title='明细' data-id='" + row.id + "' class='details btn btn-xs btn-success'>明细</button>";
		return result;
	}

	$(document).on('click', '#messageSend', function () {

		layer.confirm('确定发送短信吗？', function (index) {
			$.ajax({
				type: "POST",
				url: '${projectPath}/message/sendStudyMessage.action',
				success: function (data) {
					if (data.resultInfo.success) {
						layer.alert(data.resultInfo.message, {icon: 1});
					}
				}
			});
		});
	});

</script>

<script type="text/javascript">
	laydate.render({
		elem: '#yearMonth'
		, type: 'month'
	});

	function download() {
		window.open("${projectPath}/StudySummaryForCompany/EmployeeStudyinfoExcel.action?" + $("#search-form").serialize());
	}

</script>
</body>

</html>