<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>${type.name }</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/bootstrap.css'/>" type="text/css" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/font-awesome.min.css'/>" type="text/css" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/app.css'/>" type="text/css" />  
    <!--[if lt IE 9]>
    <script src="<c:url value='/resources/template/bootstrap/js/ie/html5shiv.js'/>"></script>
    <script src="<c:url value='/resources/template/bootstrap/js/ie/respond.min.jss'/>"></script>
    <script src="<c:url value='/resources/template/bootstrap/js/ie/excanvas.js'/>"></script>
  <![endif]-->
</head>
<body class="">
<%--   <section class="vbox">
    <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
      <div class="navbar-header aside bg-info dk">
        <a href="#" class="navbar-brand text-lt">
          <i class="icon-earphones"></i>
          <img src="<c:url value='/resources/template/bootstrap/images/logo.png'/>" alt="." class="hide">
          <span class="hidden-nav-xs m-l-sm">Musik</span>
        </a>        
      </div>                
    </header>
    <section> --%>
      <section class="hbox stretch">

        <section id="content">
          <section class="vbox" id="bjax-el">
            <section class="scrollable padder-lg">
              <h2 class="font-thin m-b">视频</h2>
              <div class="row row-sm">
                <c:forEach items="${list }" var="info"  varStatus="infoStatus">
                 <div class="col-xs-12 col-sm-4">
                  <div class="item">
                    <div class="pos-rlt">
                      <div class="item-overlay opacity r r-2x bg-black">
                        <div class="center text-center m-t-n">
                          <a href="<c:url value='/u/uVideo/detail?videoid=${info.videoid }'/>"><i class="fa fa-play-circle i-2x"></i></a>
                        </div>
                      </div>
                      <div class="top">
                        <span class="badge bg-dark m-l-sm m-t-sm">03:20</span>
                      </div>
                      <a href="<c:url value='/u/uVideo/detail?videoid=${info.videoid }'/>"><img src="<c:url value="${WEBURL }${info.logopath }"/>" alt="" class="r r-2x img-full"></a>
                    </div>
                    <div class="padder-v">
                      <a href="<c:url value='/u/uVideo/detail?videoid=${info.videoid }'/>" class="text-ellipsis">${info.videoname}</a>
                      <a href="<c:url value='/u/uVideo/detail?videoid=${info.videoid }'/>" class="text-ellipsis text-xs text-muted">chaohuzb</a>
                    </div>
                  </div>
                </div> 
                </c:forEach>
              
             
              <ul class="pagination pagination">
              ${pager }
<!--                 <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#"><i class="fa fa-chevron-right"></i></a></li> -->
              </ul>
            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>
      </section>
    </section>    
  </section>



</body>
</html>