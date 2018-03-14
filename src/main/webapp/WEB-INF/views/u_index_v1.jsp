<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>微网站-首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1;' name='viewport' />
<meta content='yes' name='apple-mobile-web-app-capable' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta content='telephone=no' name='format-detection' />
<link href="../images/apple-touch-icon.png" rel="apple-touch-icon-precomposed" />
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>

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
color: #747f8c;
font-family: "Open Sans",Arial,"Hiragino Sans GB","Microsoft YaHei","微软雅黑","STHeiti","WenQuanYi Micro Hei",SimSun,sans-serif;
margin:0px;padding:0px;width:100%;height:100%;
background:url("<c:url value='/resources/images/81.jpg'/>");
background-size:100%;
}
.div011{
	
	margin:auto;
    
	
	}
.content-wraper{
   position:relative;
   width: 100%;
   position:absolute;
   top:5em;
   
}
.list{
   overflow: hidden;
   width: 15.6em;
   margin:0px auto;
}

.list-1{
display: block;
background-color: rgba(0, 0, 0, 0.6);
overflow: hidden;
float:left;
width:5em;
float:left;
height:5em;
line-height:4em;
margin:0.1em;
box-shadow: 1px 1px 1px #333333;
}

.list-1-0{
	display:inline-block;
	float:left;
	margin-left:15px;
	margin-top:3%;
	margin-bottom:3%;
}
.list-1-1{
	display:inline-block;
	width:84%;
	padding:9% 8%;
	margin:auto;
	font-family:"微软雅黑";
	font-size:16px;
    color:#fff;;
	text-align:center;
	float:left;
}


a:hover{

text-decoration:none;

}

a{

text-decoration:none;

}
.visible {
	opacity: 1;
	-webkit-transform: scale(0);
	-ms-transform: scale(0);
	transform: scale(0);
}

</style>
<script>
function weixinAddContact(name){
	WeixinJSBridge.invoke("addContact", {webtype: "1",username: name}, function(e) {
		WeixinJSBridge.log(e.err_msg);
		//e.err_msg:add_contact:added 已经添加
		//e.err_msg:add_contact:cancel 取消添加
		//e.err_msg:add_contact:ok 添加成功
		if(e.err_msg == 'add_contact:added' || e.err_msg == 'add_contact:ok'){
		    //关注成功，或者已经关注过
		}
	})
}
</script>

</head>
<body>
<div data-role="page"  >
    <div role="main" class="ui-content">
    <div class="content-wraper">
        <div class="list">	
			<a href="<c:url value='/u/uCommonText?code=weiarmy'/>">											
				<div class="list-1 item visible " style="background-color: #;">
     				
     				<div class="list-1-1">微军队</div>
     			</div>			        			        										
		    </a>
		    <a href="<c:url value='/u/uCommonText?code=weiconscription'/>">											
				<div class="list-1 item visible" style="background-color: #;">
     				
     				<div class="list-1-1">微征兵</div>
     			</div>			        			        										
		    </a>
		    <a href="<c:url value='/u/uCommonText?code=newrecruits'/>">											
				<div class="list-1 item visible" style="background-color: #;">
     				
     				<div class="list-1-1">新兵入伍</div>
     			</div>			        			        										
		    </a>	
		    <a href="<c:url value='/u/uCommonText?code=retiredplacement'/>">											
				<div class="list-1 item visible" style="background-color: #;">
     				
     				<div class="list-1-1">退役安置</div>
     			</div>			        			        										
		    </a>	
		    <a href="<c:url value='/u/uCommonText?code=solutions'/>">											
				<div class="list-1 item visible" style="background-color: #;">
     				
     				<div class="list-1-1">征兵解答</div>
     			</div>			        			        										
		    </a>
		    <a href="<c:url value='/u/uStation'/>">											
				<div class="list-1 item visible" style="background-color: #;">
     				
     				<div class="list-1-1">应征站点</div>
     			</div>			        			        										
		    </a>
		    <div style="clear:both;"></div>			    			    		    		    											   
		</div>
		</div>
    </div><!-- /content -->
</div>
  <script>
  (function () {
	    var appear, delay, disappear, i, offset, _i, _len, _ref;
	    _ref = $('.item');
	    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
	        i = _ref[_i];
	        offset = i.offsetLeft + i.offsetTop;
	        delay = offset / 1000;
	      //  $(i).html("Have you heard about the Web Components revolution?");
	        $(i).css({
	            'transition-delay': '' + delay * 1.318 + 's',
	            'transition-duration': '' + 0.9 + 's'
	        });
	    }
	    appear = function () {
	        return setTimeout(function () {
	            $('.item').addClass('visible');
	            return disappear();
	        }, 1500);
	    };
	    disappear = function () {
	        return setTimeout(function () {
	            $('.item').removeClass('visible');
	            return appear();
	        }, 1500);
	    };
	    $('.item').removeClass('visible');
	}.call(this));
  </script>
</body> 
</html>
