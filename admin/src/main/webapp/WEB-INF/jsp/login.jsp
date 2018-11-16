<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="projectPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="shortcut icon" type="image/ico" href="${pageContext.request.contextPath}/favicon.ico"/>

	<link rel="bookmark" href="${pageContext.request.contextPath}/favicon.ico"/>
	<script src="static/js/jquery.min.js"></script>
<script>
$(function(){
	var loginHeight = $(window).height()-100;
	$(".login").height(loginHeight);
});
</script>
<title>登录</title>

<script>if(window.top !== window.self){ window.top.location = window.location;}</script>
<style type="text/css">
*{margin: 0; padding: 0;}
.login{background: url(/static/img/background.png) center no-repeat;}
.login .loginbox{width: 363px; position: fixed; top: 50%; margin-top: -250px; right: 260px; background: #fff; box-sizing: border-box; padding: 0 25px 50px; border: solid #4095ff 10px;}
.login .loginbox .loginTop{font-size: 24px; color: #3987ec; text-align: center; line-height: 76px; border-bottom: solid #e6e6e6 1px; font-family: "Microsoft Yahei";}
.login .loginbox .inputList{height: 50px; border: solid #e6e6e6 1px; margin-top: 28px;}
.login .loginbox .inputList i{width: 50px; height: 50px; float: left; border-right: solid #e6e6e6 1px;}
.login .loginbox .inputList i.user{background: url(/static/img/user1.png) center no-repeat;}
.login .loginbox .inputList i.password{background: url(/static/img/lock.png) center no-repeat;}
.login .loginbox .inputList input{width: 230px; height: 50px; padding-left: 10px; float: right; border: none; font-size: 18px; color: #333; font-family: "Microsoft Yahei"; outline: none;}
.login .loginbox .imgbox{height: 35px; margin-top: 30px; background: url(/static/img/decoration.png) center top no-repeat;}
.login .loginbox .errorTips{height: 30px; line-height: 30px; font-size: 16px; color: #f66; margin-top: 20px;}
.login .loginbox .button{margin-top: 10px;}
.login .loginbox .button input{width: 100%; height: 42px; font-size: 18px; border: none; background: #176fff; border-radius: 5px; color: #fff; font-family: "Microsoft Yahei"; cursor: pointer; outline: none;}
.login .loginbox .button input:active{box-shadow: 0 2px 10px #ddd;}
.footer{height: 100px; line-height: 100px; text-align: center; font-size: 16px; color: #999; background: url("img/footer_bg.png") center 45px no-repeat #fff;}
.footer img{vertical-align: middle; margin: -5px 20px 0 0;}
</style>
</head>
<body>
<div class="login">
	<div class="loginbox">
		<form action="${projectPath }/login" method="post">
		<div class="loginTop">用户登录</div>
		<div class="inputList">
			<i class="user"></i>
			<input type="text" name="username" value="${username }" autocomplete="off">
		</div>
		<div class="inputList">
			<i class="password"></i>
			<input type="password" name="password" value="">
		</div>
		<div class="errorTips">${msg }</div>
		<div class="button"><input type="submit" value="登 录"></div>
		</form>
	</div>
</div>
</body>
</html>