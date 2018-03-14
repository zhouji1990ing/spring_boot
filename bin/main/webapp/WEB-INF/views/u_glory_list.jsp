<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
  <head>
    <title>${type.name }</title>
    <meta name="keywords" content="" />
	<meta name="description" content="" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap -->
    <link href="<c:url value='/resources/template/photo/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/template/photo/css/font-awesome.min.css'/>" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/resources/template/photo/css/templatemo_misc.css'/>">
    <link href="<c:url value='/resources/template/photo/css/templatemo_style.css'/>" rel="stylesheet">
      
    <script src="<c:url value='/resources/template/photo/js/jquery-1.10.2.min.js'/>"></script> 
	<script src="<c:url value='/resources/template/photo/js/jquery.lightbox.js'/>"></script>
	<script src="<c:url value='/resources/template/photo/js/templatemo_custom.js'/>"></script>

  </head>
  <body>
  	<div class="site-header">
		<div class="main-navigation">
			
			<div class="container">
				<div class="row templatemo_gallerygap">

				</div> <!-- /.row -->
			</div> <!-- /.container -->
		</div> <!-- /.main-navigation -->
	</div> <!-- /.site-header -->
    <div id="menu-container">
    <!-- gallery start -->
    <div class="content homepage" id="menu-1">
    <div class="container">
	    <div class="row templatemorow">
	        <c:forEach items="${list }" var="list"  varStatus="status">	        
	             <c:if test="${status.count%9 == 1 || status.count%9 == 2}">
	             <c:set var="class" value="hex col-sm-6"/>                  
	             </c:if>
	             <c:if test="${status.count%9 == 3}">
	             <c:set var="class" value="hex col-sm-6  templatemo-hex-top2"/>                  
	             </c:if>
	             <c:if test="${status.count%9 == 4}">
	             <c:set var="class" value="hex col-sm-6  templatemo-hex-top3"/>                  
	             </c:if>
	             <c:if test="${status.count%9 == 5}">
	             <c:set var="class" value="hex col-sm-6  templatemo-hex-top3"/>                  
	             </c:if>
	             <c:if test="${status.count%9 == 6}">
	             <c:set var="class" value="hex col-sm-6 hex-offset templatemo-hex-top1 templatemo-hex-top2"/>                  
	             </c:if>
	             <c:if test="${status.count%9 == 7}">
	             <c:set var="class" value="hex col-sm-6 templatemo-hex-top1 templatemo-hex-top3"/>                  
	             </c:if>
	             <c:if test="${status.count%9 == 8}">
	             <c:set var="class" value="hex col-sm-6 templatemo-hex-top1  templatemo-hex-top3"/>                  
	             </c:if>
	             <c:if test="${status.count%9 == 0}">
	             <c:set var="class" value="hex col-sm-6 templatemo-hex-top1  templatemo-hex-top2"/>                  
	             </c:if>
	             
	 <div class="<c:out value="${class}"/>">
    	<div>
          <div class="hexagon hexagon2 gallery-item">
            <div class="hexagon-in1">
              <div class="hexagon-in2" style="background-image: url(<c:url value="${weburl }${list.logopath }"/>);">
             	 	<div class="overlay" data-url="<c:url value="/u/uGlory/detail?gid=${list.gid}"/>">
						<a href="<c:url value="${weburl }${list.logopath }"/>" data-rel="lightbox" class="fa fa-expand"></a>						
					</div>
					<div class="overlay templatemo_overlaytxt2 link" data-url="<c:url value="/u/uGlory/detail?gid=${list.gid}"/>" >${list.title}</div>
              </div>
            </div>
          </div>
        </div>
    </div>	             
            </c:forEach>   
    
    	</div>   
    	</div>
	</div>
   
    </div>
      <!-- gallery end -->
      	<script>
	$('.link').click(function(event){
		event.stopPropagation();
		var $this = $(this);
		var url = $(this).attr("data-url");
		location.href = url;
		
	});
    </script>
  </body>
</html>