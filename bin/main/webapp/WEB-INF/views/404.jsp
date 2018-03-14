<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0">
    </head>
    <body>
        <script type="text/javascript">
            var sUserAgent = navigator.userAgent.toLowerCase();
            var bIsAndroid = sUserAgent.match(/android/i) == "android";
            function onReady(){
                if(bIsAndroid) {
                    if (history.length && history.length > 1) {
                        history.back();
                    } else {
                        WeixinJSBridge.invoke('closeWindow');
                    }
                }
            }
            document.addEventListener?document.addEventListener("WeixinJSBridgeReady",onReady,!1):document.attachEvent&&document.attachEvent("onWeixinJSBridgeReady",onReady);
          
                document.head.innerHTML = '<title>404</title><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0"><link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/wap_err1a9853.css'/>">';
                document.body.innerHTML = '<div class="page_msg"><div class="inner"><span class="msg_icon_wrp"><i class="icon80_smile"></i></span><div class="msg_content"><h4>您要查看的页面不存在或已删除</h4></div></div></div>';
       
        </script>
    </body>
</html>