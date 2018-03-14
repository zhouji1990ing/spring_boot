<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>${one.videoname }</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1;' name='viewport' />
<meta content='yes' name='apple-mobile-web-app-capable' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta content='telephone=no' name='format-detection' />
<link href="../images/apple-touch-icon.png" rel="apple-touch-icon-precomposed" />
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
td {
	line-height: 55px;
	text-align: center;
}
.video {
width:90%;
margin:20px auto;
}
.video-desc{
width:90%;
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
</head>
<body>
<header> </header>
<div class="information">
  <h2 align="center"> ${one.videoname }</h2>

</div>
		<div class="viedo" align="center">
  			<video  id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="100%" 
      				poster='<c:url value="${WEBURL }${one.logopath }" />'
      				data-setup="{}">
    			<source src="${WEBURL }${one.videopath }" type='video/mp4' />
    			<track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    			<track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
  			</video>
  			
	</div>
	<div class="video-desc">
	  <h4>简介</h4>
     <p>${one.videocontent } </p>
	</div>
</div>

</body>
</html>