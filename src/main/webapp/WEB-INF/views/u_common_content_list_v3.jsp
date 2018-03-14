<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1' name='viewport' />
<meta content='yes' name='apple-mobile-web-app-capable' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' /> 
<meta content='telephone=no' name='format-detection' />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/images/engine/style.css'/>" media="screen" />
<script type="text/javascript" src="<c:url value='/resources/images/engine/jquery.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script> --%>
<script type="text/javascript" src="<c:url value='/resources/js/flipsnap.js'/>"></script>
<title>${menuType.name }</title>
<style type="text/css">
body{
  font-family:Microsoft Yahei;
  padding:0px;
  margin:0px;
}
.ui-content{
 margin-top:35px;
}
.carditems {
clear: both;
background: #fff;
}
/* a:active {
color: #aaa;
}
a:hover, a:active, a:focus {
color: #3990e6;
text-decoration: none;
} */
a {
text-decoration: none;
color: #1a1a1a;
}
.carditems a:visited .carditems_list {
display: block !important;
}
.carditems_list {
clear: both;
border-bottom: 1px solid #ececec;
padding: 10px 0;
margin: 0 8px;
background: #fff;
}
.carditems_list_dt {
float: left;
width: 80px;
height: 60px;
border: 1px solid #efefef;
background-color: #e4f0f9;
background-image: url(<c:url value='/resources/images/logo.png'/>);
background-position: center center;
background-size: 42px auto;
background-repeat: no-repeat;
margin-right: 8px;
position: relative;
}
.carditems_list_dd {
overflow: hidden;
}
.carditems_list_dt img {
width: 80px;
height: 60px;
font-size: 0;
}
/* .carditems a:visited h3 {
color: #8b8b8b;
} */
.carditems_list_h3.pic_t_44 {
height: 42px;
overflow: hidden;
}
.carditems_list_h3 {
clear: both;
color: #2f2f2f;
line-height: 21px;
font-size: 15px;
font-weight: 600;
}
.carditems_list_op {
clear: both;
overflow: hidden;
height: 20px;
color: #8b8b8b;
}
html, body, form, fieldset, p, div, h1, h2, h3, h4, h5, h6 {
-webkit-text-size-adjust: none;
}
.op_ico.time_num {
padding-left: 0;
margin-left: 0;
background: 0;
}

.op_ico {
display: inline-block;
font-size: 10px;
height: 20px;
line-height: 26px;
padding-left: 24px;
margin-left: 3px;
}

.op_ico.num_ico {
background-position: -12px -268px;
}

.op_ico{
background: url(<c:url value='/resources/images/channel_icon.png'/>) no-repeat 0 0;
background-size: 50px auto;
}
.fr {
float: right;
}
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
margin: 0;
padding: 0;
border: 0;
outline: 0;
}
.carditems_list_op {
color: #8b8b8b;
}
.ui-btn-inline{
  display:inline-block;
  padding: 10px 20px;
}
.loadmore{
  text-align:center;
}

.nav-menu-container{ background-color:White;height: 68px;position:fixed;left:0px;top:0px;z-index:999;/* box-shadow:0px 3px 2px rgba(0, 0, 0, .16); */}
.nav-menu {width: 100%;height: 34px;background-color:rgba(250, 250, 250, 0.99);font-size: 16px;overflow-x: hidden;top: 0;left: 0;right: 0;z-index: 9999;}
.nav-menu-list {float: left;overflow: hidden;width: 3000px;}
.nav-menu-list ul {list-style: none;margin: 0;padding: 0;}
.nav-menu-list ul li {float: left;}
.nav-menu-list ul li a {display: block;height: 24px;line-height: 24px;text-align: center;padding: 5px 0;color: #555;font-weight: 500;font-size: 14px;}

.nav-menu-list ul li.ui-btn-active {border-bottom: 0px solid rgb(30,165,194);}
.nav-menu-list ul li.ui-btn-active a {padding-bottom: 1px;font-size: 16px;color:rgb(30,165,194)}

.nav-menu-list ul.flip-snap {float: left;}
.nav-menu-list ul.flip-snap li {padding: 0 10px;}

.nav-menu .index-menu {width: 100%;}
.nav-menu .index-menu ul {list-style: none;margin: 0;padding: 0;}
.nav-menu .index-menu ul li {float: left; width: 50%;height: 34px;line-height: 32px;text-align: center;}
.nav-menu .index-menu ul li a {color: #555;font-size: 14px;display: block;}
.nav-menu .index-menu ul li a em{ font-size: 14px;font-style: normal;}
.nav-menu .index-menu ul li.ui-btn-active {border-bottom: 4px solid #67ad03;height: 30px;line-height: 30px;}
.nav-menu .index-menu ul li.ui-btn-active a {padding-bottom: 1px;font-size: 16px;}
.nav-menu .index-menu ul li.ui-btn-active span{color: red;}

.nav-menu-tips{display: none;position: absolute;padding-left:20px;background: #2e3132;right: 0;line-height: 34px;height: 34px;color: white;background-image: linear-gradient(to right,#ccc,#2e3132);font-size: 14px;}
</style>
<meta content="authenticity_token" name="csrf-param" />
<meta content="krU46SplE2o5KXqeHMJtdGKrjPHBbKeA/yU8ZG3REoU=" name="csrf-token" />
<script type="text/javascript">
var keyWords = {};
var keyWordNames = "${commonContent.keyWordNames}";
var keywordIds = "${commonContent.keywordIds}";

if(keywordIds != null && keywordIds != ''){
	var keywordIdArr = keywordIds.split(",");
	var keyWordNameArr = keyWordNames.split(",");
	for(var i = 0; i<keywordIdArr.length;i++){
		keyWords[keywordIdArr[i]]=keyWordNameArr[i];
	}
}

    function onBridgeReady(){
	 WeixinJSBridge.invoke('getNetworkType',{},
	 		function(e){
		        var network = e.err_msg.split(":")[1];
		        document.getElementById('network').innerText=network;
	 	    	WeixinJSBridge.log(e.err_msg);
	 	    });
	// WeixinJSBridge.call('hideOptionMenu');
	 WeixinJSBridge.call('showToolbar');
	}

	if (typeof WeixinJSBridge == "undefined"){
	    if( document.addEventListener ){
	        document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
	    }else if (document.attachEvent){
	        document.attachEvent('WeixinJSBridgeReady', onBridgeReady); 
	        document.attachEvent('onWeixinJSBridgeReady', onBridgeReady);
	    }
	}else{
	    onBridgeReady();
	}
	
	$(function(){
		$("#keywords").change(function(){
			if($("#keywords").val() != null && $("#keywords").val() != ''){
				keyWords[$("#keywords").val()] = $("#keywords").find("option:selected").text();
			}
			keyWordNames = "";
			 for(var key in keyWords) {
				 if(keyWordNames == ""){
					 keyWordNames = keyWords[key];
					 keywordIds = key;
				 }else{
					 keyWordNames = keyWordNames + "," + keyWords[key];
					 keywordIds = keywordIds + "," + key;
				 }
			 }
			 $("#keyWordNames").val(keyWordNames);
		});
	});
</script>
</head>
<body>
<div data-role="page" data-theme="a" id="demo-page" class="my-page" data-url="demo-page" style="margin-top:35px;">
    <div style="position:relative;" class="slideshow grid_12" >
	<div class="holder">
		<!-- 主体部分 -->
		<div id="wowslider-container">
			<div class="ws_images">
				<ul>
				   <c:forEach items="${rList }" var="info" varStatus="status">
				   <li><a href="<c:url value="/u/uCommonContent/detail?ccid="/>${info.ccid}"><img src="${info.logopath }?imageView/1/w/640/h/350" alt="${info.title }" title="" /></a></li>
				   </c:forEach>
					
					
				</ul>
			</div>
			<div class="ws_bullets">
				<div>
				<c:forEach items="${rList }" var="info" varStatus="status">
				<a href="#"></a>
				</c:forEach>

					
				</div>
			</div>
		</div>
		<script type="text/javascript" src="<c:url value='/resources/images/engine/wowslider.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/resources/images/engine/script.js'/>"></script>
		<!-- 主体部分. -->
	</div>
</div>
    <div class="nav-menu-container">
       	<div style="margin:0 auto;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;标题:<input type="text" name="title" id="title" value="${commonContent.title}">
       		&nbsp;&nbsp;文件编号:<input type="text" name="digest" id="digest" value="${commonContent.digest}">
       		&nbsp;&nbsp;部门:<select name="code" id="code" style="height: 22px;">
	                             	 <option value="">--选择部门--</option>
							        <c:forEach items = "${mList }" var="type" varStatus="status">
							     	<option value="${type.code }" <c:if test="${commonContent.code == type.code }">selected</c:if> >${type.name }</option>
							     	</c:forEach>
							        </select>
       		&nbsp;&nbsp;信息来源:<input type="text" name="author" id="author" value="${commonContent.author}">
       		<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			类别:<select name="keywords" id="keywords" style="height: 22px;">
						        <option value="">--请选择--</option>
						        <c:forEach items = "${kList }" var="k" varStatus="status">
						     		<option value="${k.keywordId }">${k.keywordName }</option>
						     	</c:forEach>
						        </select>
						     	<input disabled="disabled" type="text" id="keyWordNames" name="keyWordNames" style="width: 300px"  value="${commonContent.keyWordNames}">
       		&nbsp;&nbsp; <INPUT class=button id=sButton2 type="button" value=" 筛 选 " name=sButton2 onclick="doSearch()" />
                            &nbsp;&nbsp; <INPUT class=button id=sButton type="button" value=" 清 除 " name=sButton onclick="doClear()" />
       	</div>
    </div>
    
    <div role="main" class="ui-content">
    <div class="carditems" id = "carditems"></div>
        <div class="loadmore"><a class="ui-btn-inline" id="loadmore" href="javascript:void(0)">加载更多</a></div>
    </div><!-- /content -->
</div>
<script>


var detail_url = '<c:url value="/u/uCommonContent/detail?ccid="/>';
var link = '<c:url value="/u/uCommonContent/listView?"/>title='+$("#title").val()+'&digest='+$("#digest").val()+'&code='+$("#code").val()+'&author='+$("#author").val()+'&keywordIds='+keywordIds+'&keyWordNames='+keyWordNames;
var pn = 1;
loadlist(link);
flipsnap();
$("#loadmore").bind("click",function(e){
    e.preventDefault();
    var url = link+'&currpage='+pn;
    loadlist(url);
});

function doClear(){
	$("#title").val('');
	$("#digest").val('');
	$("#code").val('');
	$("#author").val('');
	window.location = '<c:url value='/u/uCommonContent/list'/>';
}

function doSearch(){
	window.location = '<c:url value='/u/uCommonContent/list?'/>title='+$("#title").val()
			+'&digest='+$("#digest").val()+'&code='+$("#code").val()+'&author='+$("#author").val()+'&keywordIds='+keywordIds+'&keyWordNames='+keyWordNames;
}

function loadlist(url){
	$.post(url,function(data){	
		if(data.success){
			var obj = data.obj;
			var map = data.map;
			var list = data.list;
			if(map!=null){
				total = map.total;
				pageNo = map.pageNo;
				pageSize = map.pageSize;
				pn = pageNo+1;
				if(total<=pageNo*pageSize){
					$("#loadmore").text("没有更多");
					$("#loadmore").hide();
					$("#loadmore").unbind('click');
	            }else{
	            	
	            }
	            var size = list.length;
	            for(var i = 0;i<size ;i++){
	            	var item = list[i];
	            	var ccid = item['ccid'];
	            	var title = item['title'];
	            	var logopath = item['logopath'];
	            	var digest = item['digest'];
	            	var pv = item['pv'];
	            	if(pv>9999){
	            		pv = "10000+";
	            	}
	            	var time = item['createTimeMstr'];
	            	var code = item['code'];
	            	var url = detail_url+ccid;
	            	var html = '';
	            	if(digest != null && digest != ''){
	            		html = '<a data-cid="'+ccid+'" href="'+url+'" target="_blank"><dl class="carditems_list  j_imgdelay" data-imgdelay="1"><dd class="carditems_list_dd"><h3 class="carditems_list_h3 pic_t_44">'+digest+'&nbsp;&nbsp;&nbsp;'+title+'</h3> <p class="carditems_list_op"><span class="op_ico time_num fl">'+time+'</span><span class="op_ico num_ico fr">'+pv+'</span> </p></dd> </dl></a>';
	            	}else{
	            		html = '<a data-cid="'+ccid+'" href="'+url+'" target="_blank"><dl class="carditems_list  j_imgdelay" data-imgdelay="1"><dd class="carditems_list_dd"><h3 class="carditems_list_h3 pic_t_44">'+title+'</h3> <p class="carditems_list_op"><span class="op_ico time_num fl">'+time+'</span><span class="op_ico num_ico fr">'+pv+'</span> </p></dd> </dl></a>';
	            	}
	            	
	                $('#carditems').append(html);
	            }
			}
			
		}
	});	
}
function flipsnap() {
    if ($('.flip-snap').length > 0) {
        var span = $(window).width() - $(".flip-snap").width();
        var size = $(".flip-snap").children().size();
        var padding = 20;
        var distance = $(".flip-snap").width()/10;
        var maxPoint =  11 - $(window).width()/distance;
        if (span > size && size > 0) {
            padding = padding + span / size;

            $(".flip-snap li").css("padding-left", padding / 2);
            $(".flip-snap li").css("padding-right", padding / 2);
        } else {
            var fs = Flipsnap('.flip-snap',{
            	"padding": padding,
            	"maxPoint": maxPoint,
            	"distance": distance 
            });
            var curi = $(".nav-menu-list .ui-btn-active").index() - 2;
            if (curi > 0) {
                fs.moveToPoint(curi);
            }


        }
    }
}
</script>
</body>
</html>