<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="app">
<head>  
  <meta charset="utf-8" />
  <title>${one.videoname }</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/js/jPlayer/jplayer.flat.css'/>" type="text/css" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/bootstrap.css'/>" type="text/css" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/animate.css'/>" type="text/css" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/font-awesome.min.css'/>" type="text/css" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/simple-line-icons.css'/>" type="text/css" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/font.css'/>" type="text/css" />
  <link rel="stylesheet" href="<c:url value='/resources/template/bootstrap/css/app.css'/>" type="text/css" />  
    <!--[if lt IE 9]>
    <script src="<c:url value='/resources/template/bootstrap/js/ie/html5shiv.js'/>"></script>
    <script src="<c:url value='/resources/template/bootstrap/js/ie/respond.min.jss'/>"></script>
    <script src="<c:url value='/resources/template/bootstrap/js/ie/excanvas.js'/>"></script>
  <![endif]-->
</head>
<body class="">
  <section class="vbox">
     <header class="bg-white-only header header-md navbar navbar-fixed-top-xs">
      <div class="navbar-header aside bg-info dk">
        <a href="#" class="navbar-brand text-lt">
          <i class="icon-earphones"></i>
          <img src="<c:url value='/resources/template/bootstrap/images/logo.png'/>" alt="." class="hide">
          <span class="hidden-nav-xs m-l-sm">微电视</span>
        </a>        
      </div>             
    </header>
    <section>
      <section class="hbox stretch">
       
        <!-- /.aside -->
        <section id="content">
          <section class="vbox">
            <section class="scrollable wrapper-lg">
              <div class="row">
                <div class="col-sm-8">
                  <div class="panel">
                    <!-- video player -->
                    <div id="jp_container_1">
                      <div class="jp-type-single pos-rlt">
                        <div id="jplayer_1" class="jp-jplayer jp-video"></div>
                        <div class="jp-gui">
                          <div class="jp-video-play">
                            <a class="fa fa-5x text-white fa-play-circle"></a>
                          </div>
                          <div class="jp-interface bg-info padder">
                            <div class="jp-controls">
                              <div>
                                <a class="jp-play"><i class="icon-control-play i-2x"></i></a>
                                <a class="jp-pause hid"><i class="icon-control-pause i-2x"></i></a>
                              </div>
                              <div class="jp-progress">
                                <div class="jp-seek-bar dker">
                                  <div class="jp-play-bar dk">
                                  </div>
                                  <div class="jp-title text-lt">
                                    <ul>
                                      <li></li>
                                    </ul>
                                  </div>
                                </div>
                              </div>
                              <div class="hidden-xs hidden-sm jp-current-time text-xs text-muted"></div>
                              <div class="hidden-xs hidden-sm jp-duration text-xs text-muted"></div>
                              <div class="hidden-xs hidden-sm">
                                <a class="jp-mute" title="mute"><i class="icon-volume-2"></i></a>
                                <a class="jp-unmute hid" title="unmute"><i class="icon-volume-off"></i></a>
                              </div>
                              <div class="hidden-xs hidden-sm jp-volume">
                                <div class="jp-volume-bar dk">
                                  <div class="jp-volume-bar-value lter"></div>
                                </div>
                              </div>
                              <div>
                                <a class="jp-full-screen" title="full screen"><i class="fa fa-expand"></i></a>
                                <a class="jp-restore-screen" title="restore screen"><i class="fa fa-compress text-lt"></i></a>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="jp-no-solution hide">
                          <span>Update Required</span>
                          To play the media you will need to either update your browser to a recent version or update your <a href="http://get.adobe.com/flashplayer/" target="_blank">Flash plugin</a>.
                        </div>
                      </div>
                    </div>
                    <!-- / video player -->
                    <div class="wrapper-lg">
                      <h2 class="m-t-none text-black">${one.videoname }</h2>
                      <div class="post-sum">
               
                      </div>
                      <div class="line b-b"></div>
                      <div class="text-muted">
                        <i class="fa fa-user icon-muted"></i> by <a href="#" class="m-r-sm">巢湖征兵</a>
                        <i class="fa fa-clock-o icon-muted"></i> ${one.createTimeMstr }
                     
                      </div>
                    </div>
                  </div>
                 
                  
                </div>

            </section>
          </section>
          <a href="#" class="hide nav-off-screen-block" data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
        </section>
      </section>
    </section>    
  </section>
  <script src="<c:url value='/resources/template/bootstrap/js/jquery.min.js'/>"></script>
  <!-- Bootstrap -->
  <script src="<c:url value='/resources/template/bootstrap/js/bootstrap.js'/>"></script>
  <!-- App -->
  <script src="<c:url value='/resources/template/bootstrap/js/app.js'/>"></script>  
  <script src="<c:url value='/resources/template/bootstrap/js/slimscroll/jquery.slimscroll.min.js'/>"></script>
    <script src="<c:url value='/resources/template/bootstrap/js/app.plugin.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/template/bootstrap/js/jPlayer/jquery.jplayer.min.js'/>"></script>
  <script type="text/javascript" src="<c:url value='/resources/template/bootstrap/js/jPlayer/add-on/jplayer.playlist.min.js'/>"></script>
<script type="text/javascript">
  $(document).ready(function(){


	  // video

	  $("#jplayer_1").jPlayer({
	    ready: function () {
	      $(this).jPlayer("setMedia", {
	        title: "",
	        m4v: "${WEBURL }${one.videopath }",
	        poster: "${WEBURL }${one.logopath }"
	      });
	    },
	    swfPath: "js",
	    supplied: "webmv, ogv, m4v",
	    size: {
	      width: "100%",
	      height: "auto",
	      cssClass: "jp-video-360p"
	    },
	    globalVolume: true,
	    smoothPlayBar: true,
	    keyEnabled: true
	  });

	});
  </script>
</body>
</html>