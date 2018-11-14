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
    <link href="${projectPath }/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="${projectPath }/css/animate.min.css" rel="stylesheet">
    <link href="${projectPath }/css/style.min.css" rel="stylesheet">
    <link href="${projectPath }/js/plugins/select2-4.0.3/css/select2.css" rel="stylesheet">
	<link href="${projectPath }/css/plugins/webuploader/webuploader.css" rel="stylesheet">
</head>
<script type="text/javascript">
	var fileServerUrl = "${fileServerUrl }";
	var uploadUrl = "${uploadUrl }";
</script>
<body>
    <div class="wrapper wrapper-content animated fadeInRight">

        <form class="form-horizontal m-t" id="employeeForm" action="${projectPath }/employee/employeeAdd.action" method="post">
            <div class="form-group">
                <label class="col-sm-3 control-label">从业人员名：</label>
                <div class="col-sm-8">
                    <input id="name" name="name" class="form-control" type="text" required="required">
                </div>
            </div>
             <div class="form-group">
                <label class="col-sm-3 control-label">所属企业：</label>
                <div class="col-sm-8">
                  <select name="buinessId" id="buinessId" class="form-control" required="required" onChange="selectChange(this.value)" >
                    	<option value="">请选择</option>
                    	<c:forEach items="${businessList }" var="business">
                    		<option value="${business.id }">${business.businessName }</option>
                    	</c:forEach>
                    </select>
                </div>
            </div>
           <%-- <div class="form-group">
                <label class="col-sm-3 control-label">所属行业：</label>
                <div class="col-sm-8">
                  <select name="industryId" id="industryId" class="form-control" required="required">
                    	<option value="">请选择</option>
                    	<c:forEach items="${industryList }" var="industry">
                    		<option value="${industry.id }">${industry.name }</option>
                    	</c:forEach>
                    </select>
                </div>
            </div> --%>
        	<div class="form-group">
                <label class="col-sm-3 control-label">行业角色：</label>
                <div class="col-sm-8">
                  <select name="industryRoleId" id="industryRoleId" class="form-control" required="required">
                    	<option value="">请选择</option>
                    	<c:forEach items="${industryList }" var="industryRole">
                    		<option value="${industryRole.id }">${industryRole.name }</option>
                    	</c:forEach>
                    </select>
                </div>
            </div>
           
            <div class="form-group">
                <label class="col-sm-3 control-label">身份证号码：</label>
                <div class="col-sm-8">
                    <input id="certIdNum" name="certIdNum" class="form-control" type="text" required="required">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">手机号码：</label>
                <div class="col-sm-8">
                    <input id="mobilePhone" name="mobilePhone" class="form-control" type="text" required="required">
                </div>
            </div>
          <!--   <div class="form-group">
                <label class="col-sm-3 control-label">密码：</label>
                <div class="col-sm-8">
                    <input id="password" class="form-control" type="text"  value="默认是身份证的后6位" readonly>
                </div>
            </div> -->  
          <div class="form-group">
                <label class="col-sm-3 control-label">照片：</label>
                <div class="col-sm-8">
                    <div id="uploader_imgUrl" class="wu-example">
					    <!--用来存放文件信息-->
					    <div id="thelist_imgUrl" class="uploader-list"></div>
					    <div class="btns">
					        <div id="picker_imgUrl">选择文件</div>
					        <a id="ctlBtn_imgUrl" class="btn btn-white" role="button">开始上传</a>
					    </div>
					</div>
					<img id="img_imgUrl" src="" alt="..." class="img-thumbnail" style="display: none;height:100px;margin-top: 10px;">
	                <input id="imgUrl" type="hidden" name="imgUrl">    
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">员工类型：</label>
                <div class="col-sm-8">
                    <label class="radio-inline i-checks"><input type="radio"  name="employeeType" value="1" required="required" >新员工</label>
                    <label class="radio-inline i-checks"><input type="radio" name="employeeType" value="2" >老员工</label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">状态：</label>
                <div class="col-sm-8">
                    <label class="radio-inline i-checks"><input type="radio"  name="dataStatus" value="1" required="required" >启用</label>
                    <label class="radio-inline i-checks"><input type="radio" name="dataStatus" value="0" >禁用</label>
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
    <script src="${projectPath }/js/plugins/iCheck/icheck.min.js"></script>
    <script src="${projectPath }/js/plugins/validate/jquery.validate.min.js" ></script>
    <script src="${projectPath }/js/plugins/validate/messages_zh.min.js" ></script>
    <script src="${projectPath }/js/jquery.form.js" ></script>
    <script src="${projectPath }/js/demo/form-validate-demo.js" ></script>
    <script src="${projectPath }/js/common.js"></script>
    <script src="${projectPath }/js/plugins/webuploader/webuploader.min.js"></script>
    <script src="${projectPath }/js/demo/questionImgUpload.js"></script>
    <script src="${projectPath }/js/plugins/select2-4.0.3/js/select2.full.js"></script>
    <script type="text/javascript">
        $("#buinessId").select2();
    $(".i-checks").iCheck({checkboxClass:"icheckbox_square-green",radioClass:"iradio_square-green",})
     $("#employeeForm").validate({
    	 rules:{
             certIdNum:{
                 required : true,
                 IsIDCard : true
             },
             mobilePhone:{
                 required : true,
                 IsMobilePhoneNumber : true
             }
         },
    	submitHandler:function(form){
    		$("#employeeFormSubmit").button('loading');
    		$(form).ajaxSubmit({
				type:"POST",
				url:$(form).attr("action"),
				success:function(data){
					if(data.resultInfo.success){
						parent.$employeeListTable.bootstrapTable("refresh");
						parent.layer.alert(data.resultInfo.message,{icon: 1});
						var index = parent.layer.getFrameIndex(window.name); 
						parent.layer.close(index); 
					}else{
						$("#employeeFormSubmit").button('reset');
					}
				}
			}); 
			return false;
        }   
    }); 
    
    function selectChange(businessId){
    	//var industryId=$("#industryId").val();
    	//alert(businessId);
    	$.ajax({
			type:"GET",
			url:'${projectPath}/employee/employeeIndustryRolesByBusinessId.action?businessId=' + businessId,
			success:function(data){
				//alert(data);
				$("#industryRoleId").empty();
				for(var i=0; i< data.length;i++){
				var name=data[i].roleName;
				$("#industryRoleId").append( 
					 "<option value='" + data[i].id + "'>" + data[i].roleName + "</option>"); 
						
				}
			}
		}); 
    }
    
    /*  $("#industryId").change(function(){
	     $.ajax({  
	         type : "GET",  //提交方式  
	         url : "${projectPath}/employee/employeeIndustryRoles.action",//路径  
	         data : {  
	        	 industryId : $(this).val()  
	         },//数据，这里使用的是Json格式进行传输  
	         success : function(result) {//返回数据根据结果进行相应的处理  
	             if ( result.success ) {  
	            	var industryRoleHtml = "<option value=''>请选择</option>";
	            	var contentFrameworkHtml = "<option value=''>请选择</option>";
	            	 
	            	$.each(result.industryRoles, function(index, industryRole){
	            		industryRoleHtml += "<option value='"+industryRole.id+"'>"+industryRole.roleName+"</option>";
	            	});
	            	
	            	$.each(result.contentFrameworks, function(index, contentFramework){
	            		contentFrameworkHtml += "<option value='"+contentFramework.id+"'>"+contentFramework.name+"</option>";
	            	});
	            	 
	            	$("#industryRoleId").html(industryRoleHtml);
	            	$("#typeId").html(contentFrameworkHtml);
	             } else {  
	            	 layer.alert("数据加载异常",{icon: 0});
	             }  
	         }  
	     }); 
     }); */
    </script>
</body>

</html>