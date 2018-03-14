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
<title>瑶海国防在线</title>
<%--<link rel="stylesheet" href="<c:url value='/resources/css/jquery.mobile-1.4.3.css'/>" />
 <script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.mobile-1.4.3.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
 --%>
<style type="text/css">
body{
  font-family:Microsoft Yahei;
  padding:0px;
  margin:0px;
}

.listview{
   list-style:none;
   padding:0px;
   margin:0px;
}
.listview li{
	display: block;
	position: relative;
	overflow: visible;
	padding:0px 8px;
	margin: 0;
list-style: none;
border-width: 0 0 1px 0;
border-style: solid;
border-color: #eee;
}
.listview li a{
color:#000;
text-decoration:none;
min-height: 3.625em;
padding-left: 5.6em;
display: block;
position: relative;
text-align: left;
text-overflow: ellipsis;
overflow: hidden;
white-space: nowrap;
}

.listview li a h3{
font-weight:400;
font-size:16px;
height:25px;
line-height:25px;
color:#000;
text-decoration:none;
margin-top: 0.4em;
display: block;
position: relative;
text-align: left;
text-overflow: ellipsis;
overflow: hidden;
white-space: nowrap;
}

.listview li a div{
  position: absolute;
  left: 0;
  top: .4em;
  max-height: 2.9em;
  max-width: 5em;
  overflow:hidden;
}

.listview li a div img{
   height:5em;
}
</style>
<meta content="authenticity_token" name="csrf-param" />
<meta content="krU46SplE2o5KXqeHMJtdGKrjPHBbKeA/yU8ZG3REoU=" name="csrf-token" />
<script type="text/javascript">
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
	

</script>
</head>
<body>

<div data-role="page" data-theme="a" id="demo-page" class="my-page" data-url="demo-page">
    <div role="main" class="ui-content">
        <ul data-role="listviews" class="listview"  data-inset="false" data-icon="false">
            <c:forEach items="${list }" var="info"  varStatus="infoStatus">
            <li>
             <a  data-ajax="false" href="<c:url value="/u/uCommonContent/detail?ccid=${info.ccid }"/>">
                <div><img  src="${weburl }${info.logopath }" ></div>
                <h3>${info.title}</h3>
                <p></p>
            </a>
            </li>
            </c:forEach>              
        </ul>
        <center class="pager-container" >${pager}</center>
    </div><!-- /content -->
</div>

</body>
</html>