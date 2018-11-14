<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>编辑派车单</title>
	<link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
	<link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/iCheck/custom.css" rel="stylesheet">
	<link href="${projectPath }/css/animate.min.css" rel="stylesheet">
	<link href="${projectPath }/css/style.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/webuploader/webuploader.css" rel="stylesheet">
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">

	<form class="form-horizontal m-t" id="truckingOrderForm" action="${projectPath }/truckingOrder/edit.action"
		  method="post">
		<input type="hidden" value="${truckingOrder.id}" name="id"/>
		<div class="form-group">
			<label class="col-sm-3 control-label">发车时间</label>
			<div class="col-sm-3">
				<input type="text" name="departTime"
					   value="<fmt:formatDate value="${truckingOrder.departTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"
					   id="departTime" class="form-control" required="required">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label">车牌号：</label>
			<div class="col-sm-3">
				<select name="carId" class="form-control" required="required">
					<c:forEach items="${cars}" var="car">
						<option value="${car.id}"
								<c:if test="${truckingOrder.carId==car.id}">
									selected
								</c:if>
						>${car.carNum}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label">营运路线：</label>
			<div class="col-sm-3">
				<select name="transportRouteId" class="form-control" required="required">
					<c:forEach items="${transportRouteCustoms}" var="transportRouteCustom">
						<option value="${transportRouteCustom.id}"
								<c:if test="${truckingOrder.transportRouteId==transportRouteCustom.id}">
									selected
								</c:if>
						>
								${transportRouteCustom.displayName}
						</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label">途径：</label>
			<div class="col-sm-3">
				<input id="passWay" name="passWay" value="${truckingOrder.passWay}" class="form-control" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">牌证情况：</label>
			<div class="col-sm-3">

				<label class="radio-inline i-checks">
					<input type="radio" name="certificateStatus" value="1" required="required"
					<c:if test="${truckingOrder.certificateStatus==true }"> checked="checked" </c:if> >正常
				</label>
				<label class="radio-inline i-checks">
					<input type="radio" name="certificateStatus" value="0"
						   <c:if test="${truckingOrder.certificateStatus==false }">checked="checked"</c:if>>异常
				</label>

			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">里程：</label>
			<div class="col-sm-3">
				<input id="mileage" value="${truckingOrder.mileage}" name="mileage" class="form-control" type="text">
			</div>
		</div>


		<div class="form-group">
			<label class="col-sm-3 control-label">驾驶员：</label>
			<div class="col-sm-3">
				<select name="employeeId" class="form-control" required="required">
					<c:forEach items="${employees}" var="employee">
						<option value="${employee.id}"
								<c:if test="${truckingOrder.employeeId==employee.id}">
									selected
								</c:if>
						>${employee.name}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-3 control-label">天气情况：</label>
			<div class="col-sm-3">
				<label class="radio-inline i-checks"><input type="radio" name="weatherStatus" value="晴"
															required="required"
															<c:if test="${truckingOrder.weatherStatus=='晴' }">checked="checked"</c:if>>晴</label>
				<label class="radio-inline i-checks"><input type="radio" name="weatherStatus" value="阴"
															<c:if test="${truckingOrder.weatherStatus=='阴' }">checked="checked"</c:if>>阴</label>
				<label class="radio-inline i-checks"><input type="radio" name="weatherStatus" value="雨"
															<c:if test="${truckingOrder.weatherStatus=='雨' }">checked="checked"</c:if>>雨</label>
				<label class="radio-inline i-checks"><input type="radio" name="weatherStatus" value="雾"
															<c:if test="${truckingOrder.weatherStatus=='雾' }">checked="checked"</c:if>>雾</label>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">道路情况：</label>
			<div class="col-sm-3">
				<label class="radio-inline i-checks"><input type="radio" name="wayStatus" value="干燥" required="required"
															<c:if test="${truckingOrder.wayStatus=='干燥' }">checked="checked"</c:if>>干燥</label>
				<label class="radio-inline i-checks"><input type="radio" name="wayStatus" value="湿润"
															<c:if test="${truckingOrder.wayStatus=='湿润' }">checked="checked"</c:if>>湿润</label>
			</div>
		</div>
		<%-- <div class="form-group">
			<label class="col-sm-3 control-label">温馨提示：</label>
			<div class="col-sm-3">
				<select name="promptId" class="form-control" required="required">
					<c:forEach items="${truckingOrderPromptCustoms}" var="truckingOrderPromptCustom">
						<option value="${truckingOrderPromptCustom.id}"
								<c:if test="${truckingOrder.promptId==truckingOrderPromptCustom.id}">
									selected
								</c:if>
						>
								${truckingOrderPromptCustom.title}
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
 --%>
		<div class="form-group">
			<label class="col-sm-3 control-label">备注：</label>
			<div class="col-sm-3">
				<input id="remark" value="${truckingOrder.remark}" name="remark" class="form-control" type="text">
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-8 col-sm-offset-3">
				<button id="truckingOrderFormSubmit" class="btn btn-primary" type="submit">提交</button>
			</div>
		</div>
	</form>
</div>
<script src="${projectPath }/js/jquery.min.js"></script>
<script src="${projectPath }/js/bootstrap.min.js"></script>
<script src="${projectPath }/js/content.min.js"></script>
<script src="${projectPath }/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${projectPath }/js/plugins/validate/messages_zh.min.js"></script>
<script src="${projectPath }/js/jquery.form.js"></script>
<script src="${projectPath }/js/demo/form-validate-demo.js"></script>
<script src="${projectPath }/js/plugins/layui/layer/layer.js"></script>
<script src="${projectPath }/js/common.js"></script>
<script src="${projectPath }/js/plugins/layui/laydate/laydate.js"></script>
<script src="${projectPath }/js/plugins/layui/laydate-v5.0.9/laydate.js"></script>
<script src="${projectPath }/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
	$(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
	laydate.render({
		elem: '#departTime',
		type: 'datetime'
	});
	$("#truckingOrderForm").validate({
		submitHandler: function (form) {
			$("#truckingOrderFormSubmit").button('loading');

			$(form).ajaxSubmit({
				type: "POST",
				url: $(form).attr("action"),
				success: function (data) {
					if (data.resultInfo.success) {
						parent.$truckingOrderListTable.bootstrapTable("refresh");
						parent.layer.alert(data.resultInfo.message, {icon: 1});
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					} else {
						$("#truckingOrderFormSubmit").button('reset');
					}
				}
			});
			return false;
		}
	});
</script>
</body>

</html>