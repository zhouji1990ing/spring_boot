<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>江苏省地震局防震减灾制度文件管理系统</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>


</head>
<body>
	
	<div class="top">
	<div class="top_left">  江苏省地震局防震减灾制度文件管理系统</div>
		<ul>
			<li></li>
		</ul>
		<div class="top_right">当前用户：<strong>[ ${loginUser.username} ]</strong> &nbsp;
		<a  href="<c:url value="/admin/editPwd"/>" target="main_right">修改密码</a>
		<a onClick="return confirm('确认退出？');" href="<c:url value="/admin/loginOut"/>" target="_top">退出</a>
		</div>
	</div>
</body>
</html>
