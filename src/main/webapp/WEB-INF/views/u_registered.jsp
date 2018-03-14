<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1;' name='viewport' />
<meta content='yes' name='apple-mobile-web-app-capable' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta content='telephone=no' name='format-detection' />
<title>微登记</title>
<link rel='stylesheet' href='<c:url value="/resources/css/main.css"/>' />
<link href="<c:url value="/images/apple-touch-icon.png"/>" rel="apple-touch-icon-precomposed" /> 
<link rel="stylesheet" href="<c:url value='/resources/css/jquery.mobile-1.4.3.css'/>" />
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.mobile-1.4.3.min.js'/>"></script>

<style>
td{line-height:45px;height:50px;text-align:center;}
label{ background:#58a6bf;  line-height:37px; padding:8px 15px 8px 15px ; margin-right:10px; border-radius:3px; font-size:16px; color:#FFF;}
input{height:35px;}
input::placeholder{
text-align:center;
}
select{border: 1px #CCC solid;color: #A0A0A0;-webkit-border-radius: 3px;display: inline-block;height: 23px;}
</style>

</head>
<body>

<FORM id="saveForm" name="saveForm" action="<c:url value="/u/fuser/save"/>" method=post data-ajax="false">
<input type="hidden" name="wxcode" value="${wxcode}" />

<header>
  <div id="webtop"><span style="padding-right:8px;"><img src="<c:url value="/resources/images/arrow.png"/>" width="20" height="14"></span>注册</div>
  <div class="login">
       <div style="text-align:center;margin:40px 0px;">您已经注册成功！！</div> 
  </div>
  <div class="refer">
  </div>
  </div>
</header>
</FORM>
</body>
</html>