<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${one.name }</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1;' name='viewport' />
<meta content='yes' name='apple-mobile-web-app-capable' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta content='telephone=no' name='format-detection' />
<link href="../images/apple-touch-icon.png" rel="apple-touch-icon-precomposed" />
<style type="text/css">
html {
   font-size:100%;
}
body{
-ms-word-break: break-all;
word-break: break-all;
word-break: break-word;
word-wrap: break-word;
overflow-wrap: break-word;
background: #fff;
color: #000;
font-family: "Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;

}
td {
	line-height: 55px;
	text-align: center;
}
.video {
width:90%;
margin:20px auto;
}
.video-desc{
width:95%;
margin:20px auto;
}
input {
}
.information{
  width:95%;
  margin:0px auto;
}
.title{
font-size: 2.2rem;
font-weight: bold;
line-height: 1.5;
padding:20px 0px;
color: #38485a;
}
.article{
font-size: 2.8rem;
color: #333332;
line-height: 1.8;
}
 p{
margin: 0;
padding: 0;
border: 0;
font-weight: inherit;
font-style: inherit;
font-size: 100%;
font-family: inherit;
vertical-align: baseline;
background: transparent;
}
a {
background: transparent;
border: 0;
font-size: 100%;
margin: 0;
padding: 0;
vertical-align: baseline;
-webkit-transition: all 0.2s ease;
-moz-transition: all 0.2s ease;
transition: all 0.2s ease;
}
.article a {
color: #51aded;
border-bottom: 2px solid #eaeaea;
}
a:hover, a:focus, a:active {
outline: 0;
}
.article a:hover {
border-bottom: 2px solid #48a9ec;
}
a:hover {
text-decoration: none;
color: #51aded;
}
a {
text-decoration: none;
color: #38485a;
}
</style>
</head>
<body>
<header> </header>
<div class="information">
<img src="<c:url value='/resources/images/station_logo.jpg'/>" width="100%"/>
</div>
<div class="video-desc">
    <c:forEach items="${list }" var="info"  varStatus="infoStatus">

<blockquote class="f" style="padding: 5px 15px; margin: 0px; font-family: 微软雅黑; font-size: 12px; white-space: normal; max-width: 100%; color: rgb(255, 255, 255); line-height: 25px; font-weight: bold; background-color: rgb(0, 187, 236); border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 0px; border-bottom-left-radius: 0px; border: 0px;">
<span class="ue_t">${info.name }</span>
</blockquote>
<blockquote class="l" style="padding: 10px 15px 20px; margin: 0px; color: rgb(51, 51, 51); font-family: 微软雅黑; font-size: 12px; white-space: normal; max-width: 100%; border-top-left-radius: 0px; border-top-right-radius: 0px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; border: 0px; background-color: rgb(239, 239, 239); line-height: 25px;">
<p class="ue_t" style="padding: 0px; margin-top: 0px; margin-bottom: 0px;">
${info.adrees }
</p>
</blockquote>
<p>
<br/>
</p>
    </c:forEach>
    </div>
</div>

</body>
</html>