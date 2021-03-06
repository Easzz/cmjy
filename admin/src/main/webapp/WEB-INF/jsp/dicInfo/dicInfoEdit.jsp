<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath"></c:set>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>添加数据字典信息</title>

    <link href="${contextPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath }/css/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath }/css/animate.min.css" rel="stylesheet">
    <link href="${contextPath }/css/style.min.css" rel="stylesheet">

</head>

<body>
    <div class="wrapper wrapper-content animated fadeInRight">

        <form class="form-horizontal m-t" id="dicInfoForm" action="${contextPath }/dicInfo/dicInfoEdit.action" method="post">
        	<input type="hidden" name="id" value="${dicInfo.id }">
            <div class="form-group">
                <label class="col-sm-3 control-label">数据字典类型：</label>
                <div class="col-sm-8">
                   	<select name="dicTypeId" class="form-control" required="required">
                   		<option value="">请选择</option>
	        			<c:forEach items="${dicTypes }" var="dictType">
	        				<option value="${dictType.id }" <c:if test="${dictType.id==dicInfo.dicTypeId }">selected="selected"</c:if>>${dictType.typeValue }</option>
	        			</c:forEach>
                   	</select>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">名称：</label>
                <div class="col-sm-8">
                    <input name="infoName" class="form-control" type="text" required="required" value="${dicInfo.infoName }">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">值：</label>
                <div class="col-sm-8">
                    <input  name="infoValue" class="form-control" type="text" required="required" value="${dicInfo.infoValue }">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">排序：</label>
                <div class="col-sm-8">
                    <input name="sort" class="form-control" type="number" required="required" value="${dicInfo.sort }">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <button id="dictInfoFormSubmit" class="btn btn-primary" type="submit">提交</button>
                </div>
            </div>
        </form>
    </div>
    <script src="${contextPath }/js/jquery.min.js"></script>
    <script src="${contextPath }/js/bootstrap.min.js"></script>
    <script src="${contextPath }/js/content.min.js"></script>
    <script src="${contextPath }/js/plugins/validate/jquery.validate.min.js" ></script>
    <script src="${contextPath }/js/plugins/validate/messages_zh.min.js" ></script>
    <script src="${contextPath }/js/jquery.form.js" ></script>
    <script src="${contextPath }/js/demo/form-validate-demo.js" ></script>
    <script src="${contextPath }/js/common.js"></script>
    <script type="text/javascript">
     $("#dicInfoForm").validate({
    	submitHandler:function(form){
    		$("#dicInfoFormSubmit").button('loading');
    		$(form).ajaxSubmit({
				type:"POST",
				url:$(form).attr("action"),
				success:function(data){
					if(data.resultInfo.success){
						parent.$dicInfoListTable.bootstrapTable("refresh");
						parent.layer.alert(data.resultInfo.message,{icon: 1});
						var index = parent.layer.getFrameIndex(window.name); 
						parent.layer.close(index); 
					}else{
						$("#dicInfoFormSubmit").button('reset');
					}
				}
			});
			return false;
        }   
    }); 
    </script>
</body>

</html>
