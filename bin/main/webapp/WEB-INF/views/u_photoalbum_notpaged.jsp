<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<meta content="微相册" name="description">
	<meta content="telephone=no" name="format-detection">
	<meta id="myViewPort" content="width=320,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
	<meta content="yes" name="apple-mobile-web-app-capable">
	<meta content="white" name="apple-mobile-web-app-status-bar-style">
		<link rel="stylesheet" type="text/css" href="<c:url value='/resources/weiphoto/photoswipe.css'/>" media="all" />
	<script type="text/javascript" src="<c:url value='/resources/weiphoto/jQuery.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/weiphoto/jquery_imagesloaded.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/weiphoto/jquery_wookmark_min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/weiphoto/klass_min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/weiphoto/code_photoswipe_min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/weiphoto/jquery_lazyload.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/weiphoto/list2.css'/>" media="all" />

	<title>微相册</title>
	<style type="text/css">
		* { -webkit-text-size-adjust: none;}
		.point_list li .pic img {max-width: 170px;min-height: 84px; border-radius: 3px; background-color: #f2f2f2;}
		#theList {height: 100%;}
		#theList li {float: left;height: 100%;}
		.point_nav p {overflow: hidden;text-indent: 15px;padding: 7px 0 0 0;}
		.pop_photo .photo {width: 100%;height: 100%;}
		.pop_photo .photo img {vertical-align: middle;border-radius: 5px;}
		.pop_photo .info {height: 30px;}
		.pop_photo .info .con {text-align: center;}
		.point_list li h2 {line-height: 15px;height: 15px;overflow: hidden;}
		.point_list li h2 .hot {float: left;width: 65px;overflow: hidden;padding-top: 1px;}
		.point_list li h2 .right {float: right;}
		.pop_photo, .photo_mask {margin: 0; padding: 0; background: rgba(0,0,0,0.6);}
		
		img{width:100%!important;}
		.ps-carousel img {width: auto!important;}
		
		.point_list2{margin-right: auto;margin-left: auto;z-index:0;margin:0 auto; margin-top:20px; width:127px;}
		.point_list2 li{position:relative;background:#FFF;width:127px;padding:4px;margin-bottom:12px;border:1px solid #DED9D2;border-radius:5px;box-shadow:0 1px 3px rgba(33,33,33,0.15);}
    </style>
</head>     
<body id="photo" ondragstart="return false;" onselectstart="return false;">
	<script type="text/javascript">
		(function(window){
			document.addEventListener('DOMContentLoaded', function(){
				var PhotoSwipe = window.Code.PhotoSwipe;
				var options = {loop:false},
				instance = PhotoSwipe.attach( window.document.querySelectorAll('#Gallery a'), options );
			}, false);
			})(window);
	</script>
	<div class="wrapper">
				<div id="ulList" class="point_list">
			<div id="Gallery">
			 <ul id="leftLi" class="aa">
			 <c:forEach items="${list }" var="info" begin="0" step ="2"  varStatus="infoStatus">
					<li>
					  <div class="pic">
					    <a href="${info.logoUrl }" target="_blank">
					    <img src="${info.logoUrl }" width="127" height="">
					    </a>
					  </div>
					  <div class="photo"></div>
			   </li>	
			 </c:forEach>
		 
	       </ul>
			
			  <!--左侧结束-->
			  <!--右侧开始-->
			  
			  <ul id="rightLi" class="aa">
			 	<c:forEach items="${list }" var="info" begin="1" step ="2"  varStatus="infoStatus">
					<li>
					  <div class="pic">
					    <a href="${info.logoUrl }" target="_blank">
					    <img src="${info.logoUrl }" width="127" height="">
					    </a>
					  </div>
					  <div class="photo"></div>
			   </li>	
			 </c:forEach>
			</ul>
			  <!--右侧结束-->
			</div>
			<div id="popFail" style="display: none;">
			   <div class="bk"></div>
			   <div class="cont"><img alt="loading..." src="data:image/gif;base64,R0lGODlhgACAAKIAAP///93d3bu7u5mZmQAA/wAAAAAAAAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQFBQAEACwCAAIAfAB8AAAD/0i63P4wygYqmDjrzbtflvWNZGliYXiubKuloivPLlzReD7al+7/Eh5wSFQIi8hHYBkwHUmD6CD5YTJLz49USuVYraRsZ7vtar7XnQ1Kjpoz6LRHvGlz35O4nEPP2O94EnpNc2sef1OBGIOFMId/inB6jSmPdpGScR19EoiYmZobnBCIiZ95k6KGGp6ni4wvqxilrqBfqo6skLW2YBmjDa28r6Eosp27w8Rov8ekycqoqUHODrTRvXsQwArC2NLF29UM19/LtxO5yJd4Au4CK7DUNxPebG4e7+8n8iv2WmQ66BtoYpo/dvfacBjIkITBE9DGlMvAsOIIZjIUAixliv9ixYZVtLUos5GjwI8gzc3iCGghypQqrbFsme8lwZgLZtIc...7x8NDo9fbL+Mzy9/T5+tvUzdN3Zp+GBAAh+QQJBQAEACwCAAIAfAB8AAAD/0i63P4wykmrvTjrzbv/YCiOZGmeaKqubOu+cCzPdArcQK2TOL7/nl4PSMwIfcUk5YhUOh3M5nNKiOaoWCuWqt1Ou16l9RpOgsvEMdocXbOZ7nQ7DjzTaeq7zq6P5fszfIASAYUBIYKDDoaGIImKC4ySH3OQEJKYHZWWi5iZG0ecEZ6eHEOio6SfqCaqpaytrpOwJLKztCO2jLi1uoW8Ir6/wCHCxMG2x7muysukzb230M6H09bX2Nna29zd3t/g4cAC5OXm5+jn3Ons7eba7vHt2fL16tj2+QL0+vXw/e7WAUwnrqDBgwgTKlzIsKHDh2gGSBwAccHEixAvaqTYcFCjRoYeNyoM6REhyZIHT4o0qPIjy5YTTcKUmHImx5cwE85cmJPnSYckK66sSAAj0aNIkypdyrSp06dQo0qdSrWq1atYs2rdyrWr169gwxZJAAA7">正在加载...
			   </div>
			 </div>
		</div>	</div>

	<!--下面是瀑布流js-->
	<script type="text/javascript">
	    (function ($){
	      $('#Gallery').imagesLoaded(function() {
	        var options = {
	          autoResize: true,
	          container: $('#main'),
	          offset: 4,
	          itemWidth: 127
	        var handler = $('#Gallery li');
	        handler.wookmark(options);
	      });
	    })(jQuery);
	</script>        		
	
</body>
</html>