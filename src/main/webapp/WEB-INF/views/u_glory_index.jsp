<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
  <head>
    <title>巢籍官兵</title>
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
    <div id="menu-container">
    <!-- gallery start -->
<!-- service start -->
    <div class=" services" id="menu-3">
    <div class="container">
    	<div class="row templatemo_servicerow">
    	
<c:forEach items="${list }" var="info"  varStatus="infoStatus">      
        	<div class="templatemo_hexservices col-sm-6">
            	<div class="blok text-center">
                  <div class="hexagon-a">
                     <a class="hlinktop" href="<c:url value='/u/uGlory/list?gtid=${info.gloryTypeId }'/>">
                     	 <div class="hexa-a">
                         	<div class="hcontainer-a">
                          <div class="vertical-align-a">
                            <span class="texts-a link" date-url="<c:url value='/u/uGlory/list?gtid=${info.gloryTypeId }'/>">${info.name}</span>
                          </div>
                        </div>
                         </div>
                     </a>
                  </div>  
                     <div class="hexagonservices">
                     	<a class="hlinkbott" href="<c:url value='/u/uGlory/list?gtid=${info.gloryTypeId }'/>">
                        <div class="hexa">
                      	  <div class="hcontainer">
                          <div class="vertical-align">
                          <span class="texts"></span>
                          </div>
                        </div>
                      </div>
                        </a>
                     </div>
                     </div>
                     <div class="templatemo_servicetext">
                    
                    </div>
              </div>
</c:forEach>


              
        </div>
    </div>
    </div>
    <!-- service end -->
   
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