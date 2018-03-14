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
	
	<title>微相册</title>
	<style type="text/css">
		* { -webkit-text-size-adjust: none;padding:0px;margin:0px;}
		.photoContainer{list-style:none;padding:0px;margin:0px;}
		.loading{width:100px;margin:10px auto;background:#fff;padding:10px;}	
		.pageBar{padding:0px 20px;}
		.pageBar a{color:#000;display:block;padding:10px;margin:10px;text-decoration:none;}
		.ui-btn-prev{float:left;}
		.ui-btn-next{float:right;}
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
			 <ul id="PhotoContainer" class="photoContainer">
			 <c:forEach items="${list }" var="info"  varStatus="infoStatus">
			 		<li>
					  <div class="pic">
					    <a href="${info.filepath }" target="_blank">
					    <img src="${info.filepath }" width="100%" height="">
					    </a>
					  </div>					  
					</li>
			 </c:forEach>
			      
				</ul>
				       
				<!-- <div class="loading" id="loading">加载更多</div>		 -->
			</div>
			<div class="pageBar"> ${pager}</div>

		</div>	
		</div>

	<!--下面是瀑布流js-->
	<script type="text/javascript">
	var page = 1;
	var hasMore = true;
	function insertItem(page){
		$("#loading").text("正在加载...");
		$.post("<c:url value='/u/uPhotoAlbum/syncList?currpage='/>"+page,function(data){
			if(data.status===2000){
				$("#loading").text("加载更多");
			    var items = data['data'];
			    var size = items.length;
			    for(var i = 0;i<size;i++){
	                var item = items[i];
	                var filepath = item['filepath'];
	                var photoname = item['photoname'];
	                var html = $('<li><div class="pic"><a href="'+filepath+'" target="_blank"><img src="'+filepath+'" width="100%" height=""></a></div></li>');
	                $("#PhotoContainer").append(html);
				    }
				}else{
					$("#loading").text("没有更多了");
					hasMore = false;
				}
			
	        
			},"json");
	}
	    (function ($){
	      $('#Gallery').imagesLoaded(function() {
	        var options = {
	          autoResize: true,
	          container: $('#main'),
	          offset: 4,
	          itemWidth: "100%"
	        }
	        var handler = $('#Gallery li');
	        handler.wookmark(options);
	      });
	      
/* 	      $(document).on("scroll",function(){
			  var st = $(document).scrollTop();			  
			  var wh = $(window).height();
			  var dh = $(document).height();
			  if(st >= (dh - wh)){
				  if(hasMore){
					   page++;
					   insertItem(page); 
				  }	  			                 
			 }	 */		 
	});    
	      
	    })(jQuery);
	</script>        		
	
</body>
</html>