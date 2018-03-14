<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="common/common_tags.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>江苏省地震局防震减灾制度文件管理系统</title>
<%@ include file="common/common_resource.jsp" %>
<style type="text/css">
html { overflow: hidden; } 
</style>
</head>
<frameset rows="86px,*" frameborder="NO" border="0" framespacing="0">  
    <frame src="<c:url value="/admin/index_top"/>"  scrolling="no">  
    <frameset cols="240px,*" rows="850,*">  
        <frame src="<c:url value="/dictionary/index_left"/>" scrolling="auto" marginwidth="0" marginheight="0" frameborder="0">   
        <frame src="<c:url value="/admin/index_right"/>" name="main_right" scrolling="auto" >  
    </frameset>  
</frameset>
<noframes></noframes>  
<%-- <body>
<div class="head">
	<div class="inner"><iframe src="<c:url value="/admin/index_top"/>" scrolling="no"></iframe></div>
</div>
</body> --%>
</html>
