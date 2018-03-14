<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>巢湖微信征兵 | 后台管理系统</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/gold.css'/>">
	<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/menu.css'/>">
<style type="text/css">
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
	width: 99%;
}	
</style>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>


<script>
$(function(){
	$(".menu_item").each(function(i){
		$(this).click(function(){
			$(".menu_item").each(function(i){
				$(this).removeClass("selected");
			});
			$(this).addClass("selected");
		})
		
	})
});
</script>
</head>

<body>
<div class="col_side" >
                    <div class="menu_box" id="menuBar">
                    
<dl class="menu no_extra">
    <dt class="menu_title">
    <i class="icon_menu item_function" ></i>文件管理       </dt> 
	<dd class="menu_item "><a  href="<c:url value="/commonContent/list"/>" target="main_right">文件管理</a></dd>
	<dt class="menu_title">
	<c:if test="${u.post == null || u.post == ''}">
    <i class="icon_menu item_function" ></i>系统管理       </dt> 
    <dd class="menu_item "><a  href="<c:url value="/menuType/list"/>" target="main_right">文件分类管理</a></dd>
    <dd class="menu_item "><a  href="<c:url value="/keyWord/list"/>" target="main_right">类别管理</a></dd>
	<dd class="menu_item "><a  href="<c:url value="/user/list"/>" target="main_right">人员管理</a></dd>
	</c:if>
</dl>
</div>
</div>
</body>
</html>
