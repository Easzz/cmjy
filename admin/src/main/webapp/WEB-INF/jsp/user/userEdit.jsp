<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


	<title>用户管理-编辑用户</title>
	<link href="${projectPath }/css/plugins/iCheck/custom.css" rel="stylesheet">
	<link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
	<link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
	<link href="${projectPath }/css/animate.min.css" rel="stylesheet">
	<link href="${projectPath }/css/style.min.css" rel="stylesheet">

</head>

<body>
<div class="wrapper wrapper-content animated fadeInRight">

	<form class="form-horizontal m-t" id="userForm" action="${projectPath }/user/userEdit.action" method="post">
		<input type="hidden" name="id" value="${user.id }">
		<div class="form-group">
			<label class="col-sm-3 control-label">用户名：</label>
			<div class="col-sm-8">
				<p class="form-control-static">${user.username }</p>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">姓名：</label>
			<div class="col-sm-8">
				<input id="realName" name="realName" class="form-control" type="text" value="${user.realName }"
					   required="required">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">角色：</label>
			<div class="col-sm-8">
				<select name="roleId" class="form-control" required="required"
						onchange="roleIdChange(this.options[this.selectedIndex].value);">
					<option value="">请选择</option>
					<c:forEach items="${roles }" var="role">
						<option value="${role.id }"
								<c:if test="${user.roleId==role.id }">selected="selected"</c:if>>${role.roleName }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div id="businessInf" style="display: none;">
			<div class="form-group" id="business">
				<label class="col-sm-3 control-label">所在企业：</label>
				<div class="col-sm-8">
					<select name="businessId" class="form-control">
						<option value="">请选择</option>
						<c:forEach items="${business }" var="busine">
							<option value="${busine.id }"
									<c:if test="${user.businessId==busine.id }">selected="selected"</c:if>>${busine.businessName }</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">手机号：</label>
				<div class="col-sm-8">
					<input id="realName" name="mobilePhone" class="form-control" type="text"
						   value="${user.mobilePhone }" required="required">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">身份证号码：</label>
				<div class="col-sm-8">
					<input id="realName" name="certIdNum" class="form-control" type="text" value="${user.certIdNum }"
						  readonly="readonly" >
				</div>
			</div>
		</div>
		 <div id="cityId" class="form-group">
			<label class="col-sm-3 control-label">所属市局</label>
			<div class="col-sm-8">
				<select name="citySubstationId" id="citySubstationId"  class="form-control" required="required" onchange="selectChange(this.value)">
					 <c:forEach items="${citySubstations}" var="citySubstation">
						<option value="${citySubstation.id}"
						 <c:if test="${user.citySubstationId == citySubstation.id }">selected="selected"</c:if>
						 >
						 ${citySubstation.citySubstationName}
						 </option>
					</c:forEach> 
				</select>
			</div>
		  </div>
          <div id="subId" class="form-group">
			<label class="col-sm-3 control-label">所属分局</label>
			<div class="col-sm-8">
				<%--  <select name="substationId" id="substationId" class="form-control" required="required">
               			<!-- <option value="" >请选择</option> -->
                		<c:forEach items="${substationList }" var="substation" varStatus="substationStatus">
                			<option value="${substation.id }" <c:if test="${user.substationId == substation.id }">selected="selected"</c:if>
                			>${substation.substationName }
                			</option>
                		</c:forEach>
                    </select> --%>
                    <c:if test="${user.substationId == substation.id }">
                    <input disabled="disabled"  id="substationId" name="substationId" class="form-control" type="text" value="${substation.substationName }">
                    </c:if>
			</div>
		</div> 
		<div class="form-group">
			<label class="col-sm-3 control-label">密码：</label>
			<div class="col-sm-8">
				<input id="password" name="password" class="form-control" type="password">
				<p class="help-block">不修改密码,则此项留空.</p>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">确认密码：</label>
			<div class="col-sm-8">
				<input id="confirm_password" name="confirm_password" class="form-control" type="password"
					   equalTo="#password">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label">状态：</label>
			<div class="col-sm-8">
				<label class="radio-inline i-checks"><input type="radio" name="dataStatus" value="1" required="required"
															<c:if test="${user.dataStatus==1 }">checked="checked"</c:if>>启用</label>
				<label class="radio-inline i-checks"><input type="radio" name="dataStatus" value="0"
															<c:if test="${user.dataStatus==0 }">checked="checked"</c:if>>禁用</label>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-8 col-sm-offset-3">
				<button id="userFormSubmit" class="btn btn-primary" type="submit">提交</button>
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
<script src="${projectPath }/js/common.js"></script>
<script src="${projectPath }/js/plugins/iCheck/icheck.min.js"></script>
<script type="text/javascript">
	$(".i-checks").iCheck({checkboxClass: "icheckbox_square-green", radioClass: "iradio_square-green",})
	$("#userForm").validate({
		submitHandler: function (form) {
			$("#userFormSubmit").button('loading');
			$(form).ajaxSubmit({
				type: "POST",
				url: $(form).attr("action"),
				success: function (data) {
					if (data.resultInfo.success) {
						parent.$userListTable.bootstrapTable("refresh");
						parent.layer.alert(data.resultInfo.message, {icon: 1});
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					} else {
						$("#userFormSubmit").button('reset');
					}
				}
			});
			return false;
		}
	});

	function roleIdChange(value) {
		if (value == 3 || value == 4) {
			document.getElementById("businessInf").style.display = "block";//显
		} else {
			document.getElementById("businessInf").style.display = "none";//隐藏

		}
		 if(value==9){
    	     document.getElementById("cityId").style.display="";//显
    	 }else{
    	     document.getElementById("cityId").style.display="none";//隐藏
    		 
    	 }
    	 if(value==10){
    		
    	     document.getElementById("subId").style.display="";//显
    	 }else{
    	     document.getElementById("subId").style.display="none";//隐藏
    		 
    	 }
	}

	roleIdChange(${user.roleId});
</script>
</body>

</html>