<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


	<title>审核管理</title>

	<link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
	<link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
	<link href="${projectPath }/js/plugins/viewer/css/viewer.min.css" rel="stylesheet">
	<link href="${projectPath }/css/animate.min.css" rel="stylesheet">
	<link href="${projectPath }/css/style.min.css" rel="stylesheet">
	<link href="${projectPath }/js/plugins/viewer/css/viewer.min.css" rel="stylesheet">

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

<body class="gray-bg" id="bodyid">
<div class="wrapper wrapper-content animated fadeInRight">

	<!-- Panel Other -->
	<div class="ibox float-e-margins">
		<div class="ibox-title">
			<h5>个人信息</h5>
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
					<input type="text" name="name" class="form-control" value="${name}" readonly>
				</div>
				<div class="form-group" style="width: 20%;">
					<label>身份证号：</label>
					<input type="text" name="certIdNum" class="form-control" value="${certIdNum}" readonly>
				</div>
				<div class="form-group" style="width: 20%;">
					<label>公司：</label>
					<input type="text" name="businessName" class="form-control" value="${businessName}" readonly>
				</div>
				<div class="form-group" style="width: 20%;">
					<label>行业：</label>
					<input type="text" name="businessName" class="form-control" value="${industryName}" readonly>
				</div>
				<%-- <div class="form-group" style="width: 20%;">
				  <label>所属分局：</label>
				  <input type="text" name="businessName" class="form-control"  value="${name}"   readonly>
				</div> --%>
				<div class="form-group" style="width: 14%;">
					<label>照片：</label>
					<img alt="用户照片" style="height: 100px; cursor: zoom-in;" class="img-thumbnail"
						 src="${fileServerUrl}${imgUrl }">
				</div>
			</form>
			<form id="videosearch-form" class="form-inline" role="form">
			</form>
		</div>
		<div class="ibox-content">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li role="presentation" class="active">
					<a href="#home" aria-controls="home" role="tab" data-toggle="tab" id="tabOneA">视频</a></li>
				<li role="presentation">
					<a href="#profile" aria-controls="profile" role="tab" data-toggle="tab" id="tabTwoA">测评</a></li>
				<li role="presentation">
					<a href="#innerTrain" aria-controls="innerTrain" role="tab" data-toggle="tab"
					   id="innerTrainaA">内训</a></li>
				<li role="presentation"><a href="#govTrain" aria-controls="govTrain" role="tab" data-toggle="tab">专训</a></li>
			<%--	<li role="presentation"><a href="#remoteMeeting" aria-controls="remoteMeeting" role="tab" data-toggle="tab">开会</a></li>--%>
				<li role="presentation"><a href="#goodCourse" aria-controls="goodCourse" role="tab" data-toggle="tab">精品课程</a></li>
			</ul>
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
										<div class="btn-group hidden-xs" id="exampleToolbar1" role="group">
											<button id="video" type="button" class="btn btn-outline btn-default"
													title="视频审核不通过操作">
												<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 视频审核不通过操作
											</button>
										</div>
										<table id="studyTimeListTableOne"
											   data-toggle="table"
											   data-method="post"
											   data-url="${projectPath }/StudySummaryForCompany/studyTimeVideoListData.action?studySummaryId=${studySummaryId }"
											   data-content-type="application/x-www-form-urlencoded"
											   data-query-params-type=""
											   data-pagination="true"
											   data-side-pagination="server"
											   data-toolbar="#exampleToolbar1"
											   data-show-export="true"
											   data-id-field="id"
											   data-show-refresh="true"
											   data-click-to-select="true"
											   data-single-select="true"
											   data-icon-size="outline"
											   data-query-params="queryParamsvideo"
											   data-show-footer="false"
											   data-mobile-responsive="true">
											<thead>
											<tr>
												<th data-checkbox="true" data-align="center"></th>
												<th data-field="createTime" data-align="center">学时生成日期</th>
												<th data-field="videoName" data-align="center">视频名</th>
												<th data-field="displayRealPlayTime" data-align="center">学时时长</th>
												<th data-field="name" data-align="center">姓名</th>
												<!-- <th data-field="certIdNum" data-align="center">身份证号</th>
												<th data-field="businessName" data-align="center">所属公司</th>
												<th data-field="industryName" data-align="center">行业</th>
												<th data-field="substationName" data-align="center">所属分局</th> -->
												<th data-field="status" data-align="center"
													data-formatter="videoFormatter">状态
												</th>
												<th data-field="url" data-align="center" data-formatter="urlFormatter">
													照片
												</th>
												<!--  <th data-field="videotype" data-align="center" data-formatter="VideoOpertion">审核操作</th> -->

											</tr>
											</thead>
										</table>
									</div>
								</div>
								<!-- End Example Card View -->
							</div>
						</div>
					</div>
				</div><!-- end -->
				<div role="tabpanel" class="tab-pane" id="profile">
					<div class="ibox-content">
						<div class="row row-lg">
							<div class="col-sm-12">
								<!-- Example Card View -->
								<div class="example-wrap">
									<h4 class="example-title"></h4>
									<div class="example">
										<form id="examsearch-form" class="form-inline" role="form">
										</form>
										<div class="btn-group hidden-xs" id="exampleToolbar2" role="group">
											<button id="exam" type="button" class="btn btn-outline btn-default"
													title="测评审核不通过操作">
												<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 测评审核不通过操作
											</button>
										</div>
										<table id="studyTimeListTableTwo"
											   data-toggle="table"
											   data-method="post"
											   data-url="${projectPath }/StudySummaryForCompany/studyTimeExamListData.action?studySummaryId=${studySummaryId }"
											   data-content-type="application/x-www-form-urlencoded"
											   data-query-params-type=""
											   data-pagination="true"
											   data-side-pagination="server"
											   data-toolbar="#exampleToolbar2"
											   data-show-export="true"
											   data-id-field="id"
											   data-show-refresh="true"
											   data-click-to-select="true"
											   data-single-select="true"
											   data-icon-size="outline"
											   data-query-params="queryParamsExam"
											   data-show-footer="false"
											   data-mobile-responsive="true">
											<thead>
											<tr>
												<th data-checkbox="true" data-align="center"></th>
												<th data-field="createTime" data-align="center">学时生成日期</th>
												<th data-field="score" data-align="center">考核分数</th>
												<!-- <th data-field="displayExamTime" data-align="center">考核时长</th> -->
												<th data-field="name" data-align="center">姓名</th>
												<!--  <th data-field="certIdNum" data-align="center">身份证号</th>
												 <th data-field="businessName" data-align="center">所属公司</th>
												 <th data-field="industryName" data-align="center">行业</th>
												 <th data-field="substationName" data-align="center">所属分局</th> -->
												<th data-field="status" data-align="center"
													data-formatter="studyTimeFormatter">状态
												</th>
												<th data-field="url" data-align="center" data-formatter="urlFormatter">
													照片
												</th>
												<!--  <th data-field="examtype" data-align="center" data-formatter="CheckOpertion">审核操作</th> -->
											</tr>
											</thead>
										</table>
									</div>
								</div>
								<!-- End Example Card View -->
							</div>
						</div>
					</div>
				</div><!-- end -->
				<div role="tabpanel" class="tab-pane" id="innerTrain">
					<div class="ibox-content">
						<div class="row row-lg">
							<div class="col-sm-12">
								<!-- Example Card View -->
								<div class="example-wrap">
									<h4 class="example-title"></h4>
									<div class="example">
										<form id="innerTrainsearch-form" class="form-inline" role="form">
										</form>
										<div class="btn-group hidden-xs" id="exampleToolbar3" role="group">
											<button id="innerTrainB" type="button" class="btn btn-outline btn-default"
													title="内训审核不通过操作">
												<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 内训审核不通过操作
											</button>
										</div>
										<table id="innerTrainListTable"
											   data-toggle="table"
											   data-method="post"
											   data-url="${projectPath }/StudySummaryForCompany/innerTrainListData.action?studySummaryId=${studySummaryId }"
											   data-content-type="application/x-www-form-urlencoded"
											   data-query-params-type=""
											   data-pagination="true"
											   data-side-pagination="server"
											   data-toolbar="#exampleToolbar3"
											   data-show-export="true"
											   data-id-field="id"
											   data-show-refresh="true"
											   data-click-to-select="true"
											   data-single-select="true"
											   data-icon-size="outline"
											   data-query-params="queryParamsInnerTrain"
											   data-show-footer="false"
											   data-mobile-responsive="true">
											<thead>
											<tr>
												<th data-checkbox="true" data-align="center"></th>
												<th data-field="createTime" data-align="center">参加内训日期</th>
												<th data-field="itName" data-align="center">内训名称</th>
												<th data-field="coursewareName" data-align="center">课件名称</th>
												<th data-field="displayStudyTime" data-align="center">学时时长</th>
												<th data-field="status" data-align="center"
													data-formatter="innerTrainFormatter">状态
												</th>
												<th data-field="wxurl" data-align="center"
													data-formatter="urlFormatter">照片
												</th>
												<!--   <th data-field="innerTraintype" data-align="center" data-formatter="innerTrainOpertion">审核操作</th> -->
											</tr>
											</thead>
										</table>
									</div>
								</div>
								<!-- End Example Card View -->
							</div>
						</div>
					</div>

				</div><!-- end -->

				<div role="tabpanel" class="tab-pane" id="govTrain">
					<div class="ibox-content">
						<div class="row row-lg">
							<div class="col-sm-12">
								<!-- Example Card View -->
								<div class="example-wrap">
									<h4 class="example-title"></h4>
									<div class="example">
										<div class="btn-group hidden-xs" id="exampleToolbar4" role="group">
											<button id="govTrainAudit" type="button" class="btn btn-outline btn-default" title="专训审核不通过操作">
												<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 专训审核不通过操作
											</button>
										</div>
										<table id="govTrainListTable"
											   data-toggle="table"
											   data-method="post"
											   data-url="${projectPath }/govStudySummary/innerTrainListData.action?studySummaryId=${studySummaryId }&employeeId=${employeeId}"
											   data-content-type="application/x-www-form-urlencoded"
											   data-query-params-type=""
											   data-pagination="true"
											   data-side-pagination="server"
											   data-toolbar="#exampleToolbar4"
											   data-show-export="true"
											   data-id-field="id"
											   data-show-refresh="true"
											   data-click-to-select="true"
											   data-single-select="true"
											   data-icon-size="outline"
											   data-query-params="queryParamsInnerTrain"
											   data-show-footer="false"
											   data-mobile-responsive="true">
											<thead>
											<tr>
												<th data-checkbox="true" data-align="center"></th>
												<th data-field="createTime" data-align="center">参加专训日期</th>
												<th data-field="itName" data-align="center">专训名称</th>
												<th data-field="displayStudyTime" data-align="center">学时时长</th>
												<th data-field="status" data-align="center"
													data-formatter="innerTrainFormatter">状态
												</th>
												<th data-field="wxurl" data-align="center"
													data-formatter="urlFormatter">照片
												</th>
												<!--   <th data-field="innerTraintype" data-align="center" data-formatter="innerTrainOpertion">审核操作</th> -->
											</tr>
											</thead>
										</table>
									</div>
								</div>
								<!-- End Example Card View -->
							</div>
						</div>
					</div>

				</div><!-- end -->
				<%--<div role="tabpanel" class="tab-pane" id="remoteMeeting">
					<div class="ibox-content">
						<div class="row row-lg">
							<div class="col-sm-12">
								<!-- Example Card View -->
								<div class="example-wrap">
									<h4 class="example-title"></h4>
									<div class="example">
										<div class="btn-group hidden-xs" id="exampleToolbar5" role="group">
											<button id="remoteMeetingAudit" type="button" class="btn btn-outline btn-default" title="开会审核不通过">
												<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 开会审核不通过
											</button>
										</div>
										<table id="remoteMeetingListTable"
											   data-toggle="table"
											   data-method="post"
											   data-url="${projectPath }/remoteMeeting/recordListData.action?remoteMeetingRecord.employeeId=${employeeId}"
											   data-content-type="application/x-www-form-urlencoded"
											   data-query-params-type=""
											   data-pagination="true"
											   data-side-pagination="server"
											   data-toolbar="#exampleToolbar5"
											   data-show-export="true"
											   data-id-field="id"
											   data-show-refresh="true"
											   data-click-to-select="true"
											   data-single-select="true"
											   data-icon-size="outline"
											   data-query-params="queryParamsInnerTrain"
											   data-show-footer="false"
											   data-mobile-responsive="true">
											<thead>
											<tr>
												<th data-checkbox="true" data-align="center"></th>
												<th data-field="createTime" data-align="center">创建日期</th>
												<th data-field="title" data-align="center">生成事由</th>
												<th data-field="displayStudyTime" data-align="center">学时时长</th>
												<th data-field="dataStatus" data-align="center"
													data-formatter="innerTrainFormatter">状态
												</th>
												<th data-field="imgUrl" data-align="center"
													data-formatter="urlFormatter">照片
												</th>
												<!--   <th data-field="innerTraintype" data-align="center" data-formatter="innerTrainOpertion">审核操作</th> -->
											</tr>
											</thead>
										</table>
									</div>
								</div>
								<!-- End Example Card View -->
							</div>
						</div>
					</div>

				</div><!-- end -->
--%>


				<div role="tabpanel" class="tab-pane" id="goodCourse">
					<div class="ibox-content">
						<div class="row row-lg">
							<div class="col-sm-12">
								<!-- Example Card View -->
								<div class="example-wrap">
									<h4 class="example-title"></h4>
									<div class="example">
										<div class="btn-group hidden-xs" id="exampleToolbar6" role="group">
											<button id="goodCourseAudit" type="button" class="btn btn-outline btn-default" title="精品课程审核不通过操作">
												<i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 精品审核不通过操作
											</button>
										</div>
										<table id="goodCourseListTable"
											   data-toggle="table"
											   data-method="post"
											   data-url="${projectPath }/StudySummaryForCompany/goodCourseRecordListData.action?studySummaryId=${studySummaryId }&employeeId=${employeeId}"
											   data-content-type="application/x-www-form-urlencoded"
											   data-query-params-type=""
											   data-pagination="true"
											   data-side-pagination="server"
											   data-toolbar="#exampleToolbar6"
											   data-show-export="true"
											   data-id-field="id"
											   data-show-refresh="true"
											   data-click-to-select="true"
											   data-single-select="true"
											   data-icon-size="outline"
											   data-query-params="queryParamsInnerTrain"
											   data-show-footer="false"
											   data-mobile-responsive="true">
											<thead>
											<tr>
												<th data-checkbox="true" data-align="center"></th>
												<th data-field="createTime" data-align="center">日期</th>
												<th data-field="courseName" data-align="center">课程名称</th>
												<th data-field="displayVideoTime" data-align="center">学时时长</th>
												<th data-field="dataStatus" data-align="center"
													data-formatter="innerTrainFormatter">状态
												</th>
												<th data-field="wxurl" data-align="center"
													data-formatter="urlFormatter">照片
												</th>
												<!--   <th data-field="innerTraintype" data-align="center" data-formatter="innerTrainOpertion">审核操作</th> -->
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
			</div><!-- End Panel Other -->
		</div>
	</div>
</div>
<script src="${projectPath }/js/jquery.min.js"></script>
<script src="${projectPath }/js/bootstrap.min.js"></script>
<script src="${projectPath }/js/content.min.js"></script>
<script src="${projectPath }/js/plugins/layui/layer/layer.js"></script>
<script src="${projectPath }/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${projectPath }/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${projectPath }/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${projectPath }/js/plugins/viewer/js/viewer-jquery.min.js"></script>
<script src="${projectPath }/js/common.js"></script>
<script src="${projectPath }/js/plugins/layui/laydate/laydate.js"></script>
<script src="${projectPath }/js/plugins/viewer/js/viewer-jquery.min.js"></script>
<script type="text/javascript">
	//$('body').viewer();
	var $studyTimeListTableOne = $("#studyTimeListTableOne");
	var $studyTimeListTableTwo = $("#studyTimeListTableTwo");
	var $innerTrainListTable = $("#innerTrainListTable");
    var $govTrainListTable = $("#govTrainListTable");
    var $remoteMeetingListTable = $("#remoteMeetingListTable");
    var $goodCourseListTable = $("#goodCourseListTable");


	//内训无效按钮
	$(document).on('click', '#innerTrainB', function () {
		var row = $innerTrainListTable.bootstrapTable('getSelections');
		if (row.length != 1) {
			layer.alert('请选择一行', {icon: 0});
			return false;
		}
		var id = row[0].id;

		layer.confirm("确认要置为不通过吗?确定后不能恢复", {title: "不通过确认"}, function (index) {
			layer.close(index);
			$.get("${projectPath}/innerTrainEmployee/innerTrainCheck.action", {id: id}, function (data) {
				layer.alert(data.msg, {
						title: "不通过操作",
						btn: ['确定']
					},
					function (index, item) {
						layer.close(index);
						$("#innerTrainListTable").bootstrapTable("refresh");
						parent.$("#businessListTable").bootstrapTable("refresh");
					});
			});
		});
	});
	//视频无效按钮
	$(document).on('click', '#video', function () {
		var row = $studyTimeListTableOne.bootstrapTable('getSelections');
		if (row.length != 1) {
			layer.alert('请选择一行', {icon: 0});
			return false;
		}
		var id = row[0].id;
		layer.confirm("确认要置为不通过吗?确定后不能恢复", {title: "不通过确认"}, function (index) {
			layer.close(index);
			$.get("${projectPath}/StudySummaryForCompany/studyTimeCheckVideo.action", {id: id}, function (data) {
				layer.alert(data.msg, {
						title: "不通过操作",
						btn: ['确定']
					},
					function (index, item) {
						layer.close(index);
						$("#studyTimeListTableOne").bootstrapTable("refresh");
						parent.$("#businessListTable").bootstrapTable("refresh");
					});
			});
		});
	});
	//测评无效按钮
	$(document).on('click', '#exam', function () {
		var row = $studyTimeListTableTwo.bootstrapTable('getSelections');
		if (row.length != 1) {
			layer.alert('请选择一行', {icon: 0});
			return false;
		}
		var id = row[0].id;
		layer.confirm("确认要置为不通过吗?确定后不能恢复", {title: "不通过确认"}, function (index) {
			layer.close(index);
			$.get("${projectPath}/StudySummaryForCompany/studyTimeCheckExam.action", {id: id}, function (data) {
				layer.alert(data.msg, {
						title: "不通过操作",
						btn: ['确定']
					},
					function (index, item) {
						layer.close(index);
						$("#studyTimeListTableTwo").bootstrapTable("refresh");
						parent.$("#businessListTable").bootstrapTable("refresh");
					});
			});
		});
	});

    //专训无效按钮
    $(document).on('click', '#govTrainAudit', function () {
        var row = $govTrainListTable.bootstrapTable('getSelections');
        if (row.length != 1) {
            layer.alert('请选择一行', {icon: 0});
            return false;
        }
        var id = row[0].id;
        if (row[0].status == 0) {
            layer.alert('请勿重复设置', {icon: 0});
            return false;
        }
        layer.confirm("确认要置为不通过吗?确定后不能恢复", {title: "不通过确认"}, function (index) {
            layer.close(index);
            $.get("${projectPath}/govInnerTrainEmployee/innerTrainCheck.action", {id: id}, function (data) {
                layer.alert(data.msg, {
                        title: "不通过操作",
                        btn: ['确定']
                    },
                    function (index, item) {
                        layer.close(index);
                        $("#govTrainListTable").bootstrapTable("refresh");
                        parent.$("#businessListTable").bootstrapTable("refresh");
                    });
            });
        });
    });

    //会议无效按钮
    $(document).on('click', '#remoteMeetingAudit', function () {
        var row = $remoteMeetingListTable.bootstrapTable('getSelections');
        if (row.length != 1) {
            layer.alert('请选择一行', {icon: 0});
            return false;
        }
        var id = row[0].id;
        if (row[0].dataStatus == 0) {
            layer.alert('请勿重复设置', {icon: 0});
            return false;
        }
        layer.confirm("确认要置为不通过吗?确定后不能恢复", {title: "不通过确认"}, function (index) {
            layer.close(index);
            $.get("${projectPath}/remoteMeeting/recordCheck.action", {id: id}, function (data) {
                layer.alert(data.msg, {
                        title: "不通过操作",
                        btn: ['确定']
                    },
                    function (index, item) {
                        layer.close(index);
                        $("#remoteMeetingListTable").bootstrapTable("refresh");
                        parent.$("#businessListTable").bootstrapTable("refresh");
                    });
            });
        });
    });

    //精品课程无效按钮
    $(document).on('click', '#goodCourseAudit', function () {
        var row = $goodCourseListTable.bootstrapTable('getSelections');
        if (row.length != 1) {
            layer.alert('请选择一行', {icon: 0});
            return false;
        }
        var id = row[0].id;
        if (row[0].dataStatus == 0) {
            layer.alert('请勿重复设置', {icon: 0});
            return false;
        }
        layer.confirm("确认要置为不通过吗?确定后不能恢复", {title: "不通过确认"}, function (index) {
            layer.close(index);
            $.get("${projectPath}/StudySummaryForCompany/goodCourseRecordCheck.action", {id: id}, function (data) {
                layer.alert(data.msg, {
                        title: "不通过操作",
                        btn: ['确定']
                    },
                    function (index, item) {
                        layer.close(index);
                        $("#goodCourseListTable").bootstrapTable("refresh");
                        parent.$("#businessListTable").bootstrapTable("refresh");
                    });
            });
        });
    });



    //是否计算学时
	function isCalulationFormatter(value, row, index) {
		if (value == 1) return '是';
		else if (value == 0) return '否';
	}

	//视频
	function videoFormatter(value, row, index) {
		if (value == 1) return '通过';
		else if (value == 0) return '不通过';
	}

	//测评
	function studyTimeFormatter(value, row, index) {
		if (value == 1) return '通过';
		else if (value == 0) return '不通过';
	}

	//内训
	function innerTrainFormatter(value, row, index) {
		if (value == 1) return '通过';
		else if (value == 0) return '不通过';
	}

	////内训
	function queryParamsInnerTrain(params) {
		var b = $.extend({}, params, $("#innerTrainsearch-form").serializeJson());
		return b;
	}

	////视频
	function queryParamsvideo(params) {
		var b = $.extend({}, params, $("#videosearch-form").serializeJson());
		return b;
	}

	////测评
	function queryParamsExam(params) {
		var b = $.extend({}, params, $("#examsearch-form").serializeJson());
		return b;
	}
	function urlFormatter(value, row, index) {
		var str = '${fileServerUrl}' + value;
		return "<img style='height: 50px;cursor: zoom-in;' class='img-thumbnail' src='" + str + "'>";
	}

	$('#tabOneA').click(function (e) {
		$("#studyTimeListTableOne").bootstrapTable("refresh");
	});

	$('#tabTwoA').click(function (e) {
		$("#studyTimeListTableTwo").bootstrapTable("refresh");
	});
	$('#innerTraina').click(function (e) {
		$("#innerTrainListTable").bootstrapTable("refresh");
	});

    $('#govInnerTrainTab').click(function (e) {
        $("#govTrainListTable").bootstrapTable("refresh");
    });
    $('#remoteMeetingTab').click(function (e) {
        $("#remoteMeetingListTable").bootstrapTable("refresh");
    });


	$studyTimeListTableOne.on("post-body.bs.table", function () {
		$('body').viewer("destroy");
		$('body').viewer();
	});
	$studyTimeListTableTwo.on("post-body.bs.table", function () {
		$('body').viewer("destroy");
		$('body').viewer();
	});
	$innerTrainListTable.on("post-body.bs.table", function () {
		$('body').viewer("destroy");
		$('body').viewer();
	});
    $govTrainListTable.on("post-body.bs.table", function () {
        $('body').viewer("destroy");
        $('body').viewer();
    });
    $remoteMeetingListTable.on("post-body.bs.table", function () {
        $('body').viewer("destroy");
        $('body').viewer();
    });
    $goodCourseListTable.on("post-body.bs.table", function () {
        $('body').viewer("destroy");
        $('body').viewer();
    });


</script>
</body>

</html>