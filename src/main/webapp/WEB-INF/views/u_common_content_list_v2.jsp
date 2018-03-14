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
<style type="text/css">
body{
  font-family:Microsoft Yahei;
  padding:0px;
  margin:0px;
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
background-image: url(../images/logo.png);
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
    <div class="carditems">
     <c:forEach items="${list }" var="info"  varStatus="infoStatus">
      <a data-cid="${info.ccid }" href="<c:url value="/u/uCommonContent/detail?ccid=${info.ccid }"/>">
      <dl class="carditems_list  j_imgdelay" data-imgdelay="1">	
      <dt class="carditems_list_dt">		
      <img src="${weburl }${info.logopath }" alt="${info.title}">  </dt>  
      <dd class="carditems_list_dd">	        
      <h3 class="carditems_list_h3 pic_t_44">${info.title}</h3>		
      <p class="carditems_list_op">			
      <span class="op_ico time_num fl">${info.createTimeMstr }</span>			
      <span class="op_ico num_ico fr">${info.pv }</span>		
      </p>	
      </dd>
      </dl>
      </a>
	</c:forEach>     
	</div>
        <center class="pager-container" >${pager}</center>
    </div><!-- /content -->
</div>

</body>
</html>