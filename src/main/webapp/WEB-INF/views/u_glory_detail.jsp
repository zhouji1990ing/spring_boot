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
<title>${glory.title }</title>
<style type="text/css">
html {
   font-size:62.5%;
}
body{
-ms-word-break: break-all;
word-break: break-all;
word-break: break-word;
word-wrap: break-word;
overflow-wrap: break-word;
background: #fff;
color: #747f8c;
font-family: "Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;

}
.title{
font-size: 2.2rem;
font-weight: bold;
line-height: 1.5;
padding:20px 0px;
color: #38485a;
}
.article{
font-size: 1.8rem;
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
<body>




                  <div class="content-wrapper" style="width:100%;margin:0px auto;">
                  <img src="${LOGOURL}" width="100%"/>
                  <h1 class="title">${glory.title }</h1>
                  <div class="article">${glory.content }</div>
                  </div>
</body>
</html>