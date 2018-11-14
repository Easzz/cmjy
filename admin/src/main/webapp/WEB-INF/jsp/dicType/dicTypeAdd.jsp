<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath"></c:set>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>添加数据字典类型</title>

    <link href="${contextPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath }/css/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath }/css/animate.min.css" rel="stylesheet">
    <link href="${contextPath }/css/style.min.css" rel="stylesheet">

</head>

<body>
    <div class="wrapper wrapper-content animated fadeInRight">

        <form class="form-horizontal m-t" id="dicTypeForm" action="${contextPath }/dicType/dicTypeAdd.action" method="post">
            
            <div class="form-group">
                <label class="col-sm-3 control-label">类型名称：</label>
                <div class="col-sm-8">
                    <input name="typeName" class="form-control" type="text" required="required">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">类型值：</label>
                <div class="col-sm-8">
                    <input  name="typeValue" class="form-control" type="text" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <button id="dictTypeFormSubmit" class="btn btn-primary" type="submit">提交</button>
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
     $("#dicTypeForm").validate({
    	submitHandler:function(form){
    		$("#dicTypeFormSubmit").button('loading');
    		$(form).ajaxSubmit({
				type:"POST",
				url:$(form).attr("action"),
				success:function(data){
					if(data.resultInfo.success){
						parent.$dicTypeListTable.bootstrapTable("refresh");
						parent.layer.alert(data.resultInfo.message,{icon: 1});
						var index = parent.layer.getFrameIndex(window.name); 
						parent.layer.close(index); 
					}else{
						$("#dicTypeFormSubmit").button('reset');
					}
				}
			});
			return false;
        }   
    }); 
    </script>
</body>

</html>
