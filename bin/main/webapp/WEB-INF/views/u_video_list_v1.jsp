<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1;' name='viewport' />
<meta content='yes' name='apple-mobile-web-app-capable' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' /> 
<meta content='telephone=no' name='format-detection' />
<title>微电视</title>
<link rel="stylesheet" href="<c:url value='/resources/css/jquery.mobile-1.4.3.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/video-js.css'/>" />
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.mobile-1.4.3.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/video.js'/>"></script>
<meta content="authenticity_token" name="csrf-param" />
<meta content="krU46SplE2o5KXqeHMJtdGKrjPHBbKeA/yU8ZG3REoU=" name="csrf-token" />
<style>
.img-container {
position: absolute;
left: 0;
top: 0;
padding:.5em;
max-height: 5em;
max-width: 5em;
}
.img-container img{
 width:4em;
 height:4em;
}
.video-container{
 width:95%;
 margin:10px auto;
}
.video-container video{
width:100%;
}
#my-page{background:url("<c:url value='/resources/images/micai.gif'/>");}
</style>
<meta content="authenticity_token" name="csrf-param" />
<meta content="krU46SplE2o5KXqeHMJtdGKrjPHBbKeA/yU8ZG3REoU=" name="csrf-token" />
</head>
<body>
<div data-role="page"  id="demo-page" class="my-page" data-url="demo-page">
<div data-role="header">
<h1>${type.name }</h1>
</div> 

    <div role="main" class="ui-content">  
    <c:forEach items="${list }" var="info"  varStatus="infoStatus">
        <ul data-role="listview" data-inset="true">
           <li>
             <div class="video-container">
                <h2><a href="<c:url value='/u/uVideo/detail?videoid=${info.videoid }'/>" data-ajax="false">${info.videoname}</a></h2>
                <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="100%" poster="<c:url value="${WEBURL }${info.logopath }"/>" data-setup="{}">
                    <source src="<c:url value="${WEBURL }${info.videopath }"/>" type='video/mp4' />
                </video> 
              </div>
             </li>
        </ul> 
    </c:forEach>
        ${pager}
    </div><!-- /content -->
</div>
</body>
</html>