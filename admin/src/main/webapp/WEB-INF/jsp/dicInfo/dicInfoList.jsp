<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="contextPath"></c:set>
<!DOCTYPE HTML>
<html>
  <head>
  	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>数据字典信息列表</title>
    <link href="${contextPath }/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath }/css/font-awesome.min.css" rel="stylesheet">
    <link href="${contextPath }/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${contextPath }/css/animate.min.css" rel="stylesheet">
    <link href="${contextPath }/css/style.min.css" rel="stylesheet">
  </head>
  <body class="gray-bg">  
    <div class="wrapper wrapper-content animated fadeInRight">

        <!-- Panel Other -->
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>数据字典信息列表</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div class="row row-lg">
                    <div class="col-sm-12">
                        <!-- Example Card View -->
                        <div class="example-wrap">
                            <h4 class="example-title"></h4>
                            <div class="example">
                            	<form id="search-form" class="form-inline" role="form">
								    <div class="form-group">
						    		    <label>数据字典类型：</label>
						    		    <select class="form-control" name="dicInfo.dicTypeId">
						    		    	<option value="">请选择</option>
						    		    	<c:forEach items="${dicTypeList }" var="dicType">
						    		    	<option value="${dicType.id }">${dicType.typeValue }</option>
						    		    	</c:forEach>
						    		    </select>
						  		    </div>
						  		    <button id="search" type="button" class="btn btn-success">搜索</button>
								</form>
                            	<div id="toolbar" class="btn-group hidden-xs" role="group">
							        <button id="add" class="btn btn-outline btn-default">
							            <i class="glyphicon glyphicon-plus"></i> 添加
							        </button>
							        <button id="edit" class="btn btn-outline btn-default">
							            <i class="glyphicon glyphicon-edit"></i> 编辑
							        </button>
							        <button id="refreshDictionaryCache" class="btn btn-outline btn-default">
							            <i class="glyphicon glyphicon-refresh"></i> 刷新数据字典缓存
							        </button>
							    </div>
							    <table id="dicInfo-list-table"
							    	data-toggle="table"
							    	data-method="post"
							    	data-url="${contextPath}/dicInfo/dicInfoListData.action"
							    	data-content-type="application/x-www-form-urlencoded"
							    	data-query-params-type=""
							    	data-pagination="true"
							    	data-side-pagination="server"
							        data-show-refresh="true"
							        data-toolbar="#toolbar"
							        data-id-field="id"
							        data-click-to-select="true"
							       	data-single-select="true"
							       	data-icon-size="outline"
							       	data-query-params="queryParams"
							        data-show-footer="false"
							        data-mobile-responsive="true">
							        <thead>
								    	<tr>
								            <th data-checkbox="true" data-align="center"></th>
								            <th data-field="typeValue" data-align="center" >类型值</th>
								            <th data-field="infoName" data-align="center" >数据字典名称</th>
								            <th data-field="infoValue" data-align="center" >数据字典值</th>
								            <th data-field="sort" data-align="center" >排序值</th>
								            <th data-field="dataStatus" data-align="center" data-formatter="statusFormatter">数据状态</th>
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
    <script src="${contextPath }/js/jquery.min.js"></script>
    <script src="${contextPath }/js/bootstrap.min.js"></script>
    <script src="${contextPath }/js/content.min.js"></script>
    <script src="${contextPath }/js/plugins/layui/layer/layer.js" ></script>
    <script src="${contextPath }/js/plugins/bootstrap-table/bootstrap-table.min.js" ></script>
    <script src="${contextPath }/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
    <script src="${contextPath }/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
    <script src="${contextPath }/js/common.js"></script>
    <script type="text/javascript">
    	var $dicInfoListTable = $('#dicInfo-list-table');
	   
		$(document).on('click','#add',function(){
			layer.open({
   				type: 2, 
   				title:'添加数据字典信息',
   				area: ['800px', '450px'],
   				content: '${contextPath}/dicInfo/dicInfoAdd.action'
   			});
		});
		
		$(document).on('click','#edit',function(){
			var rows = $dicInfoListTable.bootstrapTable('getSelections');
			if(rows.length==0){
				layer.alert('请选择一行',{icon:0});
				return false;
			}
			layer.open({
   				type: 2, 
   				title:'编辑数据字典信息',
   				area: ['800px', '450px'],
   				content: '${contextPath}/dicInfo/dicInfoEdit.action?id='+rows[0].id
   			});
		});
		
		$(document).on('click','#refreshDictionaryCache',function(){
			$.post('${contextPath}/dicInfo/reloadDicInfo.action',function(data){
				if(data.resultInfo.success){
					layer.alert(data.resultInfo.message,{icon: 1});
				}
			});
		});
		
	    function queryParams(params){
	    	var b= $.extend({},params,$("#search-form").serializeJson());
	    	return b;
	    }
	    
	    $(document).on('click','#search',function(){
	    	$dicInfoListTable.bootstrapTable("refresh");
	    });
	    
	    function statusFormatter(value,row,index){
    		return analysisDicData("${dicInfoMap.dataStatus}",value);
    	}
    </script>
  </body> 
</html>
