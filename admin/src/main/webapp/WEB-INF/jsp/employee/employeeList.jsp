<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>从业人员管理</title>

    <link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${projectPath }/css/font-awesome.min.css" rel="stylesheet">
    <link href="${projectPath }/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${projectPath }/css/animate.min.css" rel="stylesheet">
    <link href="${projectPath }/css/style.min.css" rel="stylesheet">
    <link href="${projectPath }/js/plugins/select2-4.0.3/css/select2.css" rel="stylesheet">
	<link href="${projectPath }/js/plugins/viewer/css/viewer.min.css" rel="stylesheet">
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">

        <!-- Panel Other -->
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>从业人员列表</h5>
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
		    		    <input type="text" name="employee.name" class="form-control">
		  		    </div>
				    <div class="form-group" style="width: 18%;">
		    		    <label>身份证号：</label>
		    		    <input type="text" name="employee.certIdNum" class="form-control">
		  		    </div>
				   <div class="form-group" style="width: 18%;">
		    		    <label>手机号：</label>
		    		    <input type="text" name="employee.mobilePhone" class="form-control">
		  		    </div>
		  		    <div class="form-group" style="width: 24%;" >
		    		    <label>企业名称：</label>
		                  <select name="employee.buinessId" id="buinessId" class="form-control" >
		                    	<option value="">请选择</option>
		                    	<c:forEach items="${businessList }" var="business">
		                    		<option value="${business.id }">${business.businessName }</option>
		                    	</c:forEach>
		                  </select>
		  		    </div>
		  		    <button id="search1" type="button" class="btn btn-success" style="margin-top: 5px;margin-left: 10px;">搜索</button>
				</form>
			</div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <!-- Example Card View -->
                        <div class="example-wrap">
                            <h4 class="example-title"></h4>
                            <div class="example">
                            	<div class="btn-group hidden-xs" id="exampleToolbar" role="group">
                                    <button id="add" type="button" class="btn btn-outline btn-default" title="添加">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> 添加
                                    </button>
                                    <button id="batchAdd" type="button" class="btn btn-outline btn-default" title="添加">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> 批量添加
                                    </button>
                                    <button id="batchAdd4Gov" type="button" class="btn btn-outline btn-default" title="添加">
                                        <i class="glyphicon glyphicon-plus" aria-hidden="true"></i> 批量添加forGov
                                    </button>
                                    <button id="edit" type="button" class="btn btn-outline btn-default" title="编辑">
                                        <i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 编辑
                                    </button>
                                    <button id="unbind" type="button" class="btn btn-outline btn-default" title="解除微信绑定">
                                        <i class="glyphicon glyphicon-edit" aria-hidden="true"></i> 解除微信绑定
                                    </button>
                                    <!-- <button id="del" type="button" class="btn btn-outline btn-default" title="删除">
                                        <i class="glyphicon glyphicon-off" aria-hidden="true"></i>
                                    </button> -->
                                </div>
                                <table id="employeeListTable" 
                                data-toggle="table"
                                data-method="post"
                                data-url="${projectPath }/employee/employeeListData.action" 
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
                                        	<th data-checkbox="true" data-align="center"></th>
                                            <th data-field="name" data-align="center">姓名</th>
                                            <th data-field="certIdNum" data-align="center">身份证</th>
                                            <th data-field="mobilePhone" data-align="center">手机号码</th>
                                            <th data-field="industryName" data-align="center">所属行业</th>
                                            <th data-field="businessName" data-align="center">所属企业</th>
                                            <th data-field="industryRoleName" data-align="center">行业角色</th>
                                            <th data-field="imgUrl" data-align="center" data-formatter="urlFormatter">照片</th>
                                            <th data-field="createTime" data-align="center">创建时间</th>
                                            <th data-field="dataStatus" data-align="center" data-formatter="statusFormatter">状态</th>
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
        <!-- End Panel Other -->
    </div>
    <script src="${projectPath }/js/jquery.min.js"></script>
    <script src="${projectPath }/js/bootstrap.min.js"></script>
    <script src="${projectPath }/js/content.min.js"></script>
    <script src="${projectPath }/js/plugins/layui/layer/layer.js" ></script>
    <script src="${projectPath }/js/plugins/bootstrap-table/bootstrap-table.min.js" ></script>
    <script src="${projectPath }/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="${projectPath }/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${projectPath }/js/common.js"></script>
    <script src="${projectPath }/js/plugins/select2-4.0.3/js/select2.full.js"></script>
	<script src="${projectPath }/js/plugins/viewer/js/viewer-jquery.min.js"></script>
    <script type="text/javascript">
    $("#buinessId").select2();
    var $employeeListTable = $("#employeeListTable");
    $(document).on('click','#add',function(){
		layer.open({
			type: 2, 
			title:'<i class="glyphicon glyphicon-employee"></i> 添加从业人员',
			area: ['90%', '85%'],
			content: '${projectPath}/employee/employeeAdd.action'
		});
	});
    $(document).on('click','#batchAdd',function(){
		layer.open({
			type: 2, 
			title:'<i class="glyphicon glyphicon-employee"></i> 批量添加从业人员',
			area: ['800px', '250px'],
			content: '${projectPath}/employee/employeeBatchAdd.action'
		});
	});
    $(document).on('click','#batchAdd4Gov',function(){
        layer.open({
            type: 2,
            title:'<i class="glyphicon glyphicon-employee"></i> 批量添加从业人员',
            area: ['800px', '250px'],
            content: '${projectPath}/employee/employeeBatchAdd4Gov.action'
        });
    });



    $(document).on('click','#edit',function(){
    	var rows = $employeeListTable.bootstrapTable('getSelections');
		if(rows.length!=1){
			layer.alert('请选择一行',{icon:0});
			return false;
		}
		layer.open({
			type: 2, 
			title:'<i class="glyphicon glyphicon-employee"></i> 编辑从业人员',
			area: ['90%', '85%'],
			content: '${projectPath}/employee/employeeEdit.action?id='+rows[0].id
		});
	});
    $(document).on('click','#del',function(){
    	var rows = $employeeListTable.bootstrapTable('getSelections');
		if(rows.length==0){
			layer.alert('请选择一行',{icon:0});
			return false;
		}
		layer.confirm('确定删除选中的从业人员吗？', function(index){
			$.ajax({
				type:"POST",
				url:'${projectPath}/employee/employeeDelete.action?id=' + rows[0].id,
				success:function(data){
					if(data.resultInfo.success){
						$employeeListTable.bootstrapTable("refresh");
						layer.alert(data.resultInfo.message,{icon: 1});
					}
				}
			}); 
		}); 
    });
    $(document).on('click','#unbind',function(){
    	var rows = $employeeListTable.bootstrapTable('getSelections');
		if(rows.length==0){
			layer.alert('请选择一行',{icon:0});
			return false;
		}
		layer.confirm('确定解除选中的员工的微信与手机号的绑定吗？', function(index){
			$.ajax({
				type:"POST",
				url:'${projectPath}/employee/employeeUnbind.action?id=' + rows[0].id,
				success:function(data){
					if(data.resultInfo.success){
						$employeeListTable.bootstrapTable("refresh");
						layer.alert(data.resultInfo.message,{icon: 1});
					}
				}
			}); 
		}); 
    });
    function statusFormatter(value,row,index){
		if(value==1)return '启用';
		else if(value==0)return '离职';
		else if(value==-1)return '离岗';
	}
    
    function queryParams(params){
    	var b= $.extend({},params,$("#search-form").serializeJson());
    	return b;
    }
    
    $(document).on('click','#search',function(){
    	$employeeListTable.bootstrapTable("refresh");
    });
    function urlFormatter(value,row,index){
    	var str = '${fileServerUrl}'+value;
    	return "<img style='height: 50px;cursor: zoom-in;' class='img-thumbnail' src='" + str + "'>";
    }
    
    $(document).on('click','#search1',function(){
        $("#employeeListTable").bootstrapTable('refreshOptions',{pageNumber:1});
    	$("#employeeListTable").bootstrapTable("refresh");
    })
	$employeeListTable.on("post-body.bs.table", function () {
		$('body').viewer("destroy");
		$('body').viewer();
	})

	</script>
</body>

</html>