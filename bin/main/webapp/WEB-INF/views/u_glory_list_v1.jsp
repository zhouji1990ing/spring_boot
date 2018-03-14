<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<title>巢籍官兵</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1;' name='viewport' />
<meta content='yes' name='apple-mobile-web-app-capable' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta content='telephone=no' name='format-detection' />
<link href="../images/apple-touch-icon.png" rel="apple-touch-icon-precomposed" />
<link rel="stylesheet" href="<c:url value='/resources/css/jquery.mobile-1.4.3.css'/>" />
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.mobile-1.4.3.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
<meta content="authenticity_token" name="csrf-param" />
<meta content="krU46SplE2o5KXqeHMJtdGKrjPHBbKeA/yU8ZG3REoU=" name="csrf-token" />
<style>
.pager-container{
   
}
.img-container {
position: absolute;
left: 0;
top: 0;
margin:.5em;
max-height: 4em;
max-width: 4em;
overflow:hidden;
}
.img-container img{
 width:4em;

}
</style>
</head>
<body>
<div data-role="page"  id="demo-page" class="my-page" data-url="demo-page">
<div data-role="header">
<h1>巢籍官兵</h1>
</div> 
    <div role="main" class="ui-content">
        <ul data-role="listview"  data-inset="true">
            <c:forEach items="${list }" var="list"  varStatus="status">
            <li class="ui-li-has-thumb">
            <a href="<c:url value="/u/uGlory/detail?gid=${list.gid}"/>" data-ajax="false">
                <div class="img-container"><img src="<c:url value="${weburl }${list.logopath }"/>" ></div>
                <h2>${list.title}</h2>
            </a>
            </li>
            </c:forEach>            
            <li></li>             
        </ul>
         <center class="pager-container" >${pageBar}</center>
    </div><!-- /content -->
</div>
</body>
</html>