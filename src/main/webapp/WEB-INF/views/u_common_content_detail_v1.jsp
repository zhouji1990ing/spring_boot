<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit">
<title>${commonContent.title }</title>
<style type="text/css">
html {
padding:0px;
margin:0px;
}
body{
-ms-word-break: break-all;
word-break: break-all;
word-break: break-word;
word-wrap: break-word;
overflow-wrap: break-word;
background: #f6f6f4;
font-family: "Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;
padding:0px;
margin:0px;
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
.flow .h2 {
margin: 25px 20px 10px;
line-height: 60px;
color: #3f484b;
text-align: center;
}
.flow .h2 span {
width: 6px;
height: 28px;
margin-top: 2px;
background: #d63131;
display: block;
position: absolute;
left: 0;
}
.flow .h2 h2 {
font-size: 43px;
font-weight: bold;
}
.flow .h3 {
margin: 25px 20px 10px;
line-height: 30px;
color: #3f484b;
text-align: center;
}
.flow .h3 span {
width: 6px;
height: 28px;
margin-top: 2px;
background: #d63131;
display: block;
position: absolute;
left: 0;
}
.flow .h3 h2 {
font-size: 30px;
font-weight: bold;
}
.flow .imgspan {
display: block;
position: relative;
margin: 0px 0px 10px ;
}
.flow .text {
margin: 25px 0 0 0;
}
.banner{
margin: 25px 0 0 0;
}
.banner p{
color: #3f484b;
word-break: break-all;
line-height: 27px;
margin: 0 20px 20px;
}
.tail{
margin: 25px 0 0 0;
}
.tail p{
color: #8D8D8D;
word-break: break-all;
line-height: 27px;
margin: 0 20px 20px;
}
.flow .text p {
color: #3f484b;
word-break: break-all;
line-height: 27px;
margin: 0 20px 20px;
}
img {
display: block;
border: none;
}
.flow .time {
line-height: 15px;
font-size: 20px;
margin: 0 20px;
color: #666;
text-align: right;
}
.flow .from {
line-height: 15px;
font-size: 10px;
margin: 0 20px;
color: #666;
}
</style>

</head>
<body>
<div class = "flow">
 <span class="drop imgspan"><%-- <img class="tag_img" src="${LOGOURL}" /> --%></span> 
   <div class="h2">
   <c:if test="${commonContent.title != null && commonContent.title != ''}"><h2>${commonContent.title }</h2></c:if>
   </div>
   <div class="h3">
   <c:if test="${commonContent.digest != null || commonContent.digest != ''}"><h2>${commonContent.digest }</h2></c:if>
	</div>
    <!-- <div class="time">
    ${commonContent.createTimeStr }
   </div> --> 
   <div class="text">   
    ${commonContent.content }
   </div> 
   <div class="time">
   ${commonContent.author }
   </div>
  <!--  <div class="banner">
   <p>长按下面的二维码然后点识别图片中的二维码就可以关注我们。</p>
   <p><img width="100%" data-type="jpeg" data-src="http://221.226.3.242/files/mpky/ueditor/image/20150407/1428373025809053739.jpg" data-ratio="1" data-w="" src="http://221.226.3.242/files/mpky/ueditor/image/20150407/1428373025809053739.jpg" style=" visibility: visible !important; height: auto !important;"/><br/></p>
   </div> -->
   <div class="tail" style="text-align: right;">
   <p>阅读  ${commonContent.pv}</p>
   </div>
</div>
</body> 
</html>
