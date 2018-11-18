<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>用户管理-添加用户</title>

    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/font-awesome.min.css" rel="stylesheet">
    <link href="/static/css/animate.min.css" rel="stylesheet">
    <link href="/static/css/style.min.css" rel="stylesheet">

</head>

<body>
    <div class="wrapper wrapper-content animated fadeInRight">

        <form class="form-horizontal m-t" id="userForm" action="/user/userAdd.action" method="post">
            <div class="form-group">
                <label class="col-sm-3 control-label">用户名：</label>
                <div class="col-sm-8">
                    <input id="username" name="username" class="form-control" type="text" required="required">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">姓名：</label>
                <div class="col-sm-8">
                    <input id="realName" name="realName" class="form-control" type="text" required="required">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">角色：</label>
                <div class="col-sm-8">
                    <select name="roleId" class="form-control" required="required" onchange="roleIdChange(this.options[this.selectedIndex].value);" >
                    	<option value="">请选择</option>
                    	<c:forEach items="${roles }" var="role">
                    		<option value="${role.id }">${role.roleName }</option>
                    	</c:forEach>
                    </select>
                </div>
            </div>
            <div id="businessInf" style="display: none;">
		            <div class="form-group" id="business">
		                <label class="col-sm-3 control-label">所在企业：</label>
		                <div class="col-sm-8">
		                    <select name="businessId" class="form-control" >
		                    	<option value="">请选择</option>
		                    	<c:forEach items="${business }" var="bus">
		                    		<option value="${bus.id }">${bus.businessName }</option>
		                    	</c:forEach>
		                    </select>
		                </div>
		            </div>
		             <div class="form-group">
		                <label class="col-sm-3 control-label">手机号：</label>
		                <div class="col-sm-8">
		                    <input  name="mobilePhone" class="form-control" type="text" required="required">
		                </div>
		            </div>
		             <div class="form-group">
		                <label class="col-sm-3 control-label">身份证号码：</label>
		                <div class="col-sm-8">
		                    <input name="certIdNum" class="form-control" type="text" required="required">
		                </div>
		            </div>
            </div>
            <div id="cityId" class="form-group" style="display:none">
			<label class="col-sm-3 control-label">所属市局</label>
			<div class="col-sm-8">
				<select name="citySubstationId" id="citySubstationId"  class="form-control" required="required" onchange="selectChange(this.value)">
					 <option value="">请选择</option>
					 <c:forEach items="${citySubstations}" var="citySubstation">
						<option value="${citySubstation.id}">${citySubstation.citySubstationName}</option>
					</c:forEach> 
				</select>
			</div>
		  </div>
          <div id="subId" class="form-group" style="display:none">
			<label class="col-sm-3 control-label">所属分局</label>
			<div class="col-sm-8">
				<select name="substationId" id="substationId" class="form-control" required="required" >
					 <option value="">请选择</option>
					 <c:forEach items="${substationList}" var="substation">
						<option value="${substation.id}">${substation.substationName}</option>
					</c:forEach> 
				</select>
			</div>
		</div> 
            <div class="form-group">
                <label class="col-sm-3 control-label">密码：</label>
                <div class="col-sm-8">
                    <input id="password" name="password" class="form-control" type="password" required="required">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">确认密码：</label>
                <div class="col-sm-8">
                    <input id="confirm_password" name="confirm_password" class="form-control" type="password" required="required" equalTo="#password">
                </div>
            </div>
           <!--  <div class="form-group">
                <label class="col-sm-3 control-label">部门：</label>
                <div class="col-sm-8">
                    <ul id="tree" class="ztree"></ul>
                </div>
            </div> -->
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <button id="userFormSubmit" class="btn btn-primary" type="submit">提交</button>
                </div>
            </div>
        </form>
    </div>
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/bootstrap.min.js"></script>
    <script src="/static/js/content.min.js"></script>
    <script src="/static/js/plugins/validate/jquery.validate.min.js" ></script>
    <script src="/static/js/plugins/validate/messages_zh.min.js" ></script>
    <script src="/static/js/jquery.form.js" ></script>
    <script src="/static/js/demo/form-validate-demo.js" ></script>
    <script src="/static/js/plugins/ztree/jquery.ztree.all.min.js"></script>
    <script src="/static/js/common.js"></script>
    <script type="text/javascript">
     $("#userForm").validate({
    	submitHandler:function(form){
    		$("#userFormSubmit").button('loading');
    		$(form).ajaxSubmit({
				type:"POST",
				url:$(form).attr("action"),
				success:function(data){
					if(data.resultInfo.success){
						parent.$userListTable.bootstrapTable("refresh");
						parent.layer.alert(data.resultInfo.message,{icon: 1});
						var index = parent.layer.getFrameIndex(window.name); 
						parent.layer.close(index); 
					}else{
						$("#userFormSubmit").button('reset');
					}
				}
			});
			return false;
        }   
    }); 
     

     function roleIdChange(value){
    	 if(value==3){
    	    document.getElementById("businessInf").style.display="";//显
    	 }else{
    	    document.getElementById("businessInf").style.display="none";//隐藏

    	 }
    	 if(value==9){
    	     document.getElementById("cityId").style.display="";//显
    	 }else{
    	     document.getElementById("cityId").style.display="none";//隐藏

    	 }
    	 if(value==10){
    		 document.getElementById("cityId").style.display="";
    	     document.getElementById("subId").style.display="";//显
    	 }else{
    	     document.getElementById("subId").style.display="none";//隐藏

    	 }

    	 }


     
    </script>
</body>

</html>