<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>添加派车单提示</title>
	<link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
	<link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/iCheck/custom.css" rel="stylesheet">
	<link href="${projectPath }/css/animate.min.css" rel="stylesheet">
	<link href="${projectPath }/css/style.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/webuploader/webuploader.css" rel="stylesheet">
</head>
<body>
<div class="wrapper wrapper-content animated fadeInRight">

	<form class="form-horizontal m-t" id="truckingOrderPromptForm" action="${projectPath }/truckingOrder/truckingOrderPromptAdd.action"
		  method="post">

		<div class="form-group">
			<label class="col-sm-2 control-label">提示标题：</label>
                <div class="col-sm-10">
                    <input type="text" id="title"   name="title" class="form-control" required="required"></input>
                </div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">提示内容：</label>
                <div class="col-sm-10">
                    <textarea rows="10" cols="" name="promptContent" class="form-control"></textarea>
                </div>
		</div>

		<div class="form-group">
			<div class="col-sm-8 col-sm-offset-3">
				<button id="truckingOrderPromptFormSubmit" class="btn btn-primary" type="submit">提交</button>
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
	$("#truckingOrderPromptForm").validate({
		submitHandler: function (form) {
			$("#truckingOrderPromptFormSubmit").button('loading');

			$(form).ajaxSubmit({
				type: "POST",
				url: $(form).attr("action"),
				success: function (data) {
					if (data.resultInfo.success) {
						parent.$truckingOrderPromptListTable.bootstrapTable("refresh");
						parent.layer.alert(data.resultInfo.message, {icon: 1});
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					} else {
						$("#truckingOrderPromptFormSubmit").button('reset');
					}
				}
			});
			return false;
		}
	});
</script>
</body>

</html>