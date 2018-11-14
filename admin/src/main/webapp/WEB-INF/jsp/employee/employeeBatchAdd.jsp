<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>从业人员管理-添加从业人员</title>

    <link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
    <link href="${projectPath }/css/plugins/ztree/metroStyle/metroStyle.css" rel="stylesheet"/>
    <link href="${projectPath }/css/animate.min.css" rel="stylesheet">
    <link href="${projectPath }/css/style.min.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/webuploader/webuploader.css" rel="stylesheet">
</head>

<body onload="display()">
    <div class="wrapper wrapper-content animated fadeInRight">
		<div class="form-group">
		<label class="col-sm-3 control-label"></label>
		
		</div>
        <form class="form-horizontal m-t" id="employeeForm" action="${projectPath }/employee/employeeBatchAdd.action" method="post">
        	
        	<div class="form-group">
                <label class="col-sm-3 control-label">所属企业：</label>
                <div class="col-sm-8">
                  <select name="businessId" id="businessId" class="form-control" required="required">
                    	<option value="">请选择</option>
                    	<c:forEach items="${businessList }" var="business">
                    		<option value="${business.id }">${business.businessName }</option>
                    	</c:forEach>
                    </select>
                </div>
            </div>
        
            <div class="form-group">
            
                <!-- <label class="font-noraml">文件选择（单选）</label>
                <input type="file" class="form-control"> -->
            
                <label class="col-sm-3 control-label">员工清单 Excel：</label>
                <div class="col-sm-8">
                    <input id="employeeListExcel" name="employeeListExcel" class="form-control" type="file" required="required">
                    <div  id="danger" ><p class="help-block" ><a href="${projectPath }/download/批量添加从业人员模板(危险品货运).xlsx" target="_blank">模板下载</a></p></div>
                    <div  id="passengerSransport"><p class="help-block" ><a href="${projectPath }/download/批量添加从业人员模板(公路客运).xlsx" target="_blank">模板下载</a></p></div>
                </div>
            </div>
        	
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <button id="employeeFormSubmit" class="btn btn-primary" type="submit">提交</button>
                </div>
            </div>
        </form>
    </div>
    <script src="${projectPath }/js/jquery.min.js"></script>
    <script src="${projectPath }/js/bootstrap.min.js"></script>
    <script src="${projectPath }/js/content.min.js"></script>
    <script src="${projectPath }/js/plugins/validate/jquery.validate.min.js" ></script>
    <script src="${projectPath }/js/plugins/validate/messages_zh.min.js" ></script>
    <script src="${projectPath }/js/jquery.form.js" ></script>
    <script src="${projectPath }/js/demo/form-validate-demo.js" ></script>
    <script src="${projectPath }/js/plugins/ztree/jquery.ztree.all.min.js"></script>
    <script src="${projectPath }/js/common.js"></script>
    <script type="text/javascript">
    
	
     $("#employeeForm").validate({
    	submitHandler:function(form){
    		$("#employeeFormSubmit").button('loading');
    		$(form).ajaxSubmit({
				type:"POST",
				url:$(form).attr("action"),
				success:function(data){
					if(data){
						parent.$employeeListTable.bootstrapTable("refresh");
						var index = parent.layer.getFrameIndex(window.name); 
						parent.layer.close(index);
						parent.layer.alert(data.resultInfo.message,{icon: 1});
					}else{
						parent.$employeeListTable.bootstrapTable("refresh");
						parent.layer.alert("新增失败",{icon: 0});
						$("#employeeFormSubmit").button('reset');
					}
				}
			});
			return false;
        }   
    }); 
     
     $("#businessId").change(function(){
	     $.ajax({  
	         type : "GET",  //提交方式  
	         url : "${projectPath}/employee/employeeEditGetindustryId.action",//路径  
	         data : {  
	        	 businessId : $(this).val()  
	         },//数据，这里使用的是Json格式进行传输  
	         success : function(result) {//返回数据根据结果进行相应的处理  
	        	// alert(result.industryId);
	        	 if(result.industryId==1){
	    	    	 document.getElementById("danger").style.display="none";//隐藏
	    	         document.getElementById("passengerSransport").style.display="";//显
	        	 }
	             if(result.industryId==2){
	            	 document.getElementById("danger").style.display="";//显
	                 document.getElementById("passengerSransport").style.display="none";//隐藏
	             }
	         }  
	     }); 
     });
     function display(){
	    	 document.getElementById("danger").style.display="none";//隐藏
             document.getElementById("passengerSransport").style.display="";
     }
     </script> 
     
</body>

</html>