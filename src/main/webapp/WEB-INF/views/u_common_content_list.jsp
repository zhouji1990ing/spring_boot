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
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<title>${menuType.name }</title>
<style type="text/css">
body{
  font-family:Microsoft Yahei;
  padding:0px;
  margin:0px;
	background:url(<c:url value='/resources/images/award_bg.jpg'/>);
	background-size:100%;
	background-repeat: no-repeat;
	background-position:top left;  
}
.bookshelf{
   width:320px;
	margin:0px auto;
	padding-bottom:30px;
	overflow:hidden;
}

.bookshelf .shelf{
	width:320px;
	min-height:440px;
	
}

.bookshelf .shelf .row{
	position:relative;
	width:300px;
	height:158px;
	margin-left:10px;

}

.bookshelf .shelf .row:after{
	background:url(<c:url value='/resources/images/wall-bookshelf.png'/>);
	background-size:100%;
	background-repeat: no-repeat;
	background-position:bottom left;
	width:320px;
	height:210px;
	display:block;
	content:"";
	margin-left:-10px;
}


.bookshelf .shelf .loc{
	position:absolute;
	bottom:-10px;
	width:100%;
}

.bookshelf .shelf .loc > a{
    display:block;
	width:33%;
	height:100%;
	float:left;
	text-align:center;
	position:relative;
}

.bookshelf .suggestion{
	font:12px 'District Thin', helvetica, arial;
	color:#999;
	text-align:center;
	line-height:40px;
}

.bookshelf .sample,
.bookshelf-row .sample{
	margin:auto;
	position: relative;
	z-index:1;
	width:80px;
	height:100px;
	-webkit-box-shadow:2px 2px 5px rgba(0,0,0,0.6);
	-moz-box-shadow:2px 2px 5px rgba(0,0,0,0.6);
	-ms-box-shadow:2px 2px 5px rgba(0,0,0,0.6);
	-o-box-shadow:2px 2px 5px rgba(0,0,0,0.6);
	box-shadow:2px 2px 5px rgba(0,0,0,0.6);

	-webkit-transition:-webkit-transform 0.1s;
	-webkit-transform:translate(0, 0);
	-moz-transition:-moz-transform 0.1s;
	-moz-transform:translate(0, 0);
	-ms-transition:-ms-transform 0.1s;
	-ms-transform:translate(0, 0);
	-o-transition:-o-transform 0.1s;
	-o-transform:translate(0, 0);
	transition:transform 0.1s;
	transform:translate(0, 0);
}

.sample .loader{
	position:absolute;
	width:32px;
	height:32px;
	top:50%;
	left:50%;
}

.sample .loader i{
	background:white url(../pics/loader.gif) 4px 4px no-repeat;
	position:relative;
	top:-16px;
	left:-16px;
	width:32px;
	height:32px;
	display:block;

	-webkit-border-radius:10px;
	-moz-border-radius:10px;
	-ms-border-radius:10px;
	-o-border-radius:10px;
	border-radius:10px;
}

.bookshelf .shelf .sample:hover{
	z-index:2;
	cursor:none;
	background-color:white;
	-webkit-transform: scale3d(1.1, 1.1, 1) translate3d(0, -5px, 0);
	-moz-transform: scale3d(1.1, 1.1, 1) translate3d(0, -5px, 0);
	-ms-transform: scale3d(1.1, 1.1, 1) translate3d(0, -5px, 0);
	-o-transform: scale3d(1.1, 1.1, 1) translate3d(0, -5px, 0);
	transform: scale3d(1.1, 1.1, 1) translate3d(0, -5px, 0);
}

</style>

</head>
<body>

<div data-role="page" data-theme="a" id="demo-page" class="my-page" data-url="demo-page">
    <div role="main" class="ui-content">
   <div class="bookshelf">
		<div class="shelf">

            <c:forEach items="${list }" var="infos"  varStatus="infoStatus" begin="0"  step="3">
             <div class="row">
				<div class="loc">
                <c:forEach items="${list }" var="info"  varStatus="status" begin="${infoStatus.index }" end = "${infoStatus.index+2 }" step="1">
                   <a href="<c:url value="/u/uCommonContent/detail?ccid=${info.ccid }"/>"> <div class="sample" style="background-image:url(${info.logopath }?imageView/1/w/80/h/100);" sample="docs"></div> </a>
             </c:forEach>
		       </div>
			</div>
            </c:forEach>  
			
		
	</div><!-- /content -->
</div>

</body>
</html>