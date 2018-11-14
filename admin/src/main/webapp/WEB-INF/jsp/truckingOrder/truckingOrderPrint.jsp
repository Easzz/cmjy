<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%request.setAttribute("vEnter", "\n");%>  

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>${business.businessName }派车单报表</title>
	<link href="${projectPath }/css/bootstrap.min.css" rel="stylesheet">
	<link href="${projectPath }/css/style.min.css" rel="stylesheet">
	<script src="${projectPath }/js/jquery.min.js"></script>
	<script src="${projectPath }/js/jQuery.print.min.js"></script>
	<style type="text/css">
		td {
			text-align: center;
		}

		th {
			text-align: center;
		}
	</style>
</head>
<body>
<script type="text/javascript">
	$(document).on('click', '#print', function () {
		$(".container").print({
			noPrintSelector: ".no-print",
			iframe: false
		});
	})
</script>
<div>
	<p style="text-align: center;font-size: 20px">派车单</p>
	<button id="print" type="button" class="btn btn-success pull-right no-print">打印</button>
	<br/>
	<br/>
	<br/>
</div>

<div style="margin-right: 30px;margin-left:30px;border:1px solid #e7e7e7;">
	<div style="margin-left: 10px;">
		<c:forEach items="${truckingOrderPromptCustoms }" var="truckingOrderPromptCustom" varStatus="index">
				${fn:replace(truckingOrderPromptCustom.promptContent, vEnter, '<br>')}
		</c:forEach>
	</div>
</div>
<div style="margin-left: 30px;margin-right: 30px;">
	<div>
		<br>
		<div class="clearfix"></div>
	</div>

	<table class="table table-bordered">
		<thead>
		<tr>
			<th width="5%">编号</th>
			<th width="10%">核准签发人</th>
			<th width="15%">发车时间</th>
			<th width="10%">车牌号</th>
			<th width="15%">营运路线</th>
			<th width="10%">牌证情况</th>
			<th width="7%">里程</th>
			<th width="7%">途径</th>
			<th width="6%">驾驶员</th>
			<th width="5%">天气情况</th>
			<th width="5%">道路状况</th>
			<th width="5%">备注</th>
		</tr>
		</thead>
		<c:forEach items="${truckingOrderCustoms }" var="truckingOrderCustom" varStatus="index">
			<tr>
				<td>${index.count }</td>
				<td>${truckingOrderCustom.suName }</td>
				<td><fmt:formatDate value="${truckingOrderCustom.departTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				<td>${truckingOrderCustom.carNum }</td>
				<td>${truckingOrderCustom.transportRouteDisplayName }</td>
				<td name="statusFormat">${truckingOrderCustom.certificateStatus }</td>
				<td>${truckingOrderCustom.mileage }</td>
				<td>${truckingOrderCustom.passWay }</td>
				<td>${truckingOrderCustom.employeeName }</td>
				<td>${truckingOrderCustom.weatherStatus }</td>
				<td>${truckingOrderCustom.wayStatus }</td>
				<td>${truckingOrderCustom.remark }</td>
			</tr>
		</c:forEach>
	</table>

</div>
<script>
	$("td[name='statusFormat']").each(function () {
		if ($(this).text() == 'true') {
			$(this).text("正常");
		}
		if ($(this).text() == 'false') {
			$(this).text("异常");
		}
	});
</script>
</body>
</html>