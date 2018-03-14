<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html>    
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="dns-prefetch" href="//res.wx.qq.com">
<link rel="dns-prefetch" href="//mmbiz.qpic.cn">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0" />
<!-- <link rel="shortcut icon" type="image/x-icon" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/images/icon/common/favicon22c41b.ico"> -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">        
<title>${commonContent.title }</title>        
<link rel="stylesheet" type="text/css" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve251980.css">
<link rel="stylesheet" type="text/css" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/not_in_mm24ed02.css">

<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.lazyload.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/main.js'/>"></script>
<style>         
</style>
<!--[if lt IE 9]><link rel="stylesheet" type="text/css" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_pc24ed02.css"><![endif]-->    
</head>    
<body id="activity-detail" class="zh_CN mm_appmsg" ontouchstart="">            
 
	<div id="js_article" class="rich_media">
	<div id="js_top_ad_area" class="top_banner">  
	<div class="rich_media_thumb_wrp" id="media">                        
     <img class="rich_media_thumb" id="js_cover" onerror="this.parentNode.removeChild(this)" data-s="300,640" src="${LOGOURL}">                    
    </div>         
	</div>                        
	<div class="rich_media_inner">            
	<div id="page-content">                
	<div id="img-content" class="rich_media_area_primary">                    
	<h2 class="rich_media_title" id="activity-name">                        
	${commonContent.title }                  
	</h2>                    
	<div class="rich_media_meta_list">                                                
	<em id="post-date" class="rich_media_meta rich_media_meta_text">${commonContent.createTimeStr }</em>                                                
	<a class="rich_media_meta rich_media_meta_link rich_media_meta_nickname" href="javascript:void(0);" id="post-user">巢湖征兵</a>                        
	<span class="rich_media_meta rich_media_meta_text rich_media_meta_nickname">巢湖征兵</span>                        
	<div id="js_profile_qrcode" class="profile_container" style="display:none;">                            
	<div class="profile_inner">                                
	<strong class="profile_nickname">巢湖征兵</strong>                                
	<img class="profile_avatar" id="js_profile_qrcode_img" src="http://mp.weixin.qq.com/mp/qrcode?scene=10000005&size=102&__biz=MzAwNTMxNDQyMw==" alt="">                                
	<p class="profile_meta">                                
	<label class="profile_meta_label">微信号</label>                                
	<span class="profile_meta_value">chaohuzb</span>                                
	</p>                                
	<p class="profile_meta">
	<label class="profile_meta_label">功能介绍</label>                                
	<span class="profile_meta_value">全市国防教育、征兵宣传、兵役法规、征兵初登记、应征青年沟通交流</span> 
	</p>                                                            
	</div>                            
	<span class="profile_arrow_wrp" id="js_profile_arrow_wrp">                                
	<i class="profile_arrow arrow_out"></i>                                
	<i class="profile_arrow arrow_in"></i>                            
	</span>                        
	</div>                    
	</div>                                                                                                                                                               
	<div class="rich_media_content" id="js_content">${commonContent.content }</div>                    
 <link rel="stylesheet" type="text/css" href="http://res.wx.qq.com/mmbizwap/zh_CN/htmledition/style/page/appmsg/page_mp_article_improve_combo251980.css">                                                                                                    
 <div class="rich_media_tool" id="js_toobar">                                                
 <a class="media_tool_meta meta_primary" id="js_view_source" href="javascript:void(0);">阅读原文</a>                                                
 <div id="js_read_area" class="media_tool_meta tips_global meta_primary" >阅读 <span id="readNum">${commonContent.pv}</span></div>                     
    <span style="display:none;" class="media_tool_meta meta_primary tips_global meta_praise" id="like">                            
    <i class="icon_praise_gray"></i><span class="praise_num" id="likeNum"></span>                        
    </span>                        
    <a id="js_report_article" style="display:none;" class="media_tool_meta tips_global meta_extra" href="javascript:void(0);">举报</a>                    
    </div>                
    </div>               
     <div class="rich_media_area_extra">                                        
     <div class="mpda_bottom_container" id="js_bottom_ad_area">
     </div>                                       
      <div id="js_iframetest" style="display:none;">
      </div>                                                        
      </div>                           
      </div>            
      <div id="js_pc_qr_code" class="qr_code_pc_outer" style="display:none;">                
      <div class="qr_code_pc_inner">                    
      <div class="qr_code_pc">                        
      <img id="js_pc_qr_code_img" src="http://mp.weixin.qq.com/mp/qrcode?scene=10000004&size=102&__biz=MzAwNTMxNDQyMw==" class="qr_code_pc_img">                        
      <p>微信扫一扫<br>关注该公众号</p>                    
      </div>                
      </div>            
      </div>        
      </div>    
      </div>  
  </body>
  </html>