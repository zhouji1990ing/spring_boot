<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"> 
   	<meta charset="utf-8">
   	<title>微信编辑器</title>
   	<meta name="Keywords" content="微信编辑器" />
	<meta name="Description" content="微信图文美化编辑器提供美化微信图文消息的功能，有非常多漂亮的样式，可直接插入编辑区域然后修改文字即可，轻松编辑非常美观的微信图文消息。" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
   	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   	<link rel="stylesheet" href="<c:url value='/resources/cache/bootstrap_3.css'/>" />
   	<link rel="stylesheet" href="<c:url value='/resources/css/135.css'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/css/font-awesome.min.css'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/css/jquery.jgrowl.css'/>" />
   	<!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
 	  <![endif]-->
 	<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<style>
* {margin:0;padding:0;box-sizing: border-box!important;-webkit-box-sizing: border-box!important;word-wrap: break-word!important;}
body,h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6{font-family: "Helvetica Neue",Helvetica,"Hiragino Sans GB","Microsoft YaHei","微软雅黑",Arial,sans-serif !important;}
body{margin: 0 0;font-size:14px;background-image:none;background-color:#C9B3A5;line-height:inherit}
.135editor{max-width:100% !important;}
h1,h2,h3,h4,h5,h6{font-weight:400;font-size:18px}

#edui_fixedlayer{z-index:1000000 !important;}
p{clear:both;margin:0 0;font-size:14px;}
::-webkit-scrollbar {
    width: 8px;
}
h1,h2,h3,h4,h5,h6{font-weight:400;font-size:18px}
.otf-poptools{width:200px;}
.otf-poptools span{margin:0 5px;cursor:pointer;}
 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 8px #645654; /*rgba(60,60,60,0.5)*/
}
.popover{max-width:360px;}
.modal-backdrop.in {opacity: 0.9;}
.alert-warning {
	background-color: rgba(255,255,255,0.4);
	border: 0 none;
	color: #3a3332;
}
a {
    color: #2fa4e7;
    text-decoration: none;
}
#header-breadcrumb{display: none;}
.footer-bottom{padding:2px;font-size:80%;}
#maincontent {margin:0;padding:0;}

#left-sidebar .ui-portlet{margin:0px;}
#left-side-affix{box-shadow:0 0 3px rgba(0, 0, 0, 0.15);}
#left-sidebar .btn-group .btn{padding:4px 16px;}

.mix{display: none;}

.cke_reset_all, .cke_reset_all *{
	position: initial;
}
.affix{top:0px;background-color:#FFF;z-index:100;position: fixed;}
.col-xs-6 {width: 49%;}
.color-swatch{width:20px;height:20px;border-radius:3px;cursor: pointer;float:left;margin:4px 2px;}
.color-box {width:16px;height:16px;cursor: pointer;border:solid 1px #ddd;margin-top:3px;float: left;margin-right:5px;}
.color-swatch:hover,.color-swatch.active {	
	-webkit-transform:scale(1.1);-moz-transform:scale(1.1);-ms-transform:scale(1.1);
	-o-transform:scale(1.1);transform:scale(1.1);
	-webkit-box-shadow:inset 1px 1px 1px #5b616d,0 0 5px #45bcda;
	-moz-box-shadow:inset 1px 1px 1px #5b616d,0 0 5px #45bcda;
	box-shadow:inset 1px 1px 1px #5b616d,0 0 5px #45bcda;
}
.col-sm-4,.col-sm-6,.col-sm-2{padding-right: 5px;padding-left: 5px;}
#params-setting ul{padding:0;}
#params-setting .title{font-size:16px;font-weight:bold;padding-bottom:3px;margin-bottom:5px;margin-top:15px;border-bottom:1px solid #DDD;}
#params-setting li{list-style:none;}
#params-setting label{display:block;line-height:18px;font-weight:normal;}
#params-setting input{margin-right:5px;margin-top:3px;float:left;}
.cke_button__source_label{display:none;}
.cke_combo__font .cke_combo_text{padding-left:5px;width:60px;}
.cke_combo__styles .cke_combo_text{width:80px;}
.cke_chrome {border: none;box-shadow: 0 0 1px 1px rgba(172,181,194,0.56);}
#editor-styles .nav > li > a{padding:10px 5px;text-align:center;}

#editor-tpls-list .style-list{margin-top:20px;position: relative;}
#editor-tpls-list .style-list .content, #template-modal-body .style-list .content{cursor: pointer;padding: 0 5px;overflow-x:hidden;overflow-y:hidden;box-shadow: 0 0 3px rgb(170, 170, 170);}
#editor-tpls-list .style-list .tools,#template-modal-body .style-list .tools{display:none;}
#editor-tpls-list .row{margin:0 -5px;}
#editor-tpls-list .col-md-6{padding:0 5px;}
.popover-content .btn{width:70px;margin-top:3px;padding: 1px 5px;}
#more-popover .popover-content{padding: 5px 5px;width:160px;max-width:360px;height:120px;}

#insert-style-list li .btn{display:none;}
#insert-style-list li:hover .btn{display:inline;}
#insert-style-list li {position:relative;}
#insert-style-list .ui-portlet-list > li *{max-width: 100%!important;box-sizing: border-box!important;-webkit-box-sizing: border-box!important;word-wrap: break-word!important;}
#insert-style-list .ui-portlet-list > li p{clear:both;margin:0 0;line-height: 1.6;}
#insert-style-list .origin{position:absolute;top:5px;right:5px;height:20px;color:#FFF;font-weight:bold;font-size:12px;padding:2px}

#editor-tpls-navtab > li {padding:0 0;}

.editor-nav .fa{width:18px;text-align:center;margin:0 auto;}

#bg-choose .default,#bg-choose .chooser{width:20px;height:20px;margin:5px;cursor:pointer;border-radius:2px;}
</style>
<script>
var BASEURL = "";
var current_editor;
var current_active_135item = null;
</script>
</head>
<body style="overflow-y: hidden;"  oncontextmenu="window.event.returnValue=false;">
<div id="full-page" class="bg" style="min-width:1200px;">
    <div class="box p-r"><!--box start-->
      
      <div class="fl w0 p-r">
      	<!-- <div class="p-a" style="width:80px;left:-80px;">
      		<a href="#editor-template" class="filter btn-block btn btn-primary" onclick="return brushOff();" role="tab" data-toggle="tab"  data-filter="all" >样式</a>
          	<a class="filter btn-block btn btn-warning" data-filter=".brush" onclick="return brushOn();" role="tab" data-toggle="tab" href="#editor-template">样式刷</a>
      	</div> -->
      	<!-- 分类栏目 开始 -->
        <div class="w1 fl">
          <div class="n1">分类</div>
          <ul class="n1-1" style="height:503px;">
          		<!-- <li class="active "><a href="#editor-template" class="filter"  data-filter="all" role="tab" data-toggle="tab"> 全部</a></li> -->
          	
			         <li>
					    <a class="filter" data-filter=".tagtpl-107" role="tab" data-toggle="tab" href="#editor-template"> 标题 </a>
					</li>
					<li>
					    <a class="filter" data-filter=".tagtpl-109" role="tab" data-toggle="tab" href="#editor-template"> 正文 </a>
					</li>
					<li>
					    <a class="filter" data-filter=".tagtpl-151" role="tab" data-toggle="tab" href="#editor-template"> 图片样式 </a>
					</li>
					<li>
					    <a class="filter" data-filter=".tagtpl-111" role="tab" data-toggle="tab" href="#editor-template"> 特殊场景 </a>
					</li>	          	
					<li><a href="#editor-template" class="filter"  data-filter=".fav-style" role="tab" data-toggle="tab"> 收藏样式</a></li>
	               	<li><a href="#editor-template" class="filter"  data-filter=".recomment-style" role="tab" data-toggle="tab"> 系统推荐</a></li>
          				<!-- <li><a href="#image-list" role="tab" data-toggle="tab">图片素材</a></li> -->
                    <li id="tab-tpl-trigger"><a href="#editor-tpls" role="tab" data-toggle="tab">模板</a></li>
          </ul>
        </div>
        <!-- 分类栏目 开始 -->
        
        <!-- 展示区  开始 -->
<div class="w2 fl">
          <div class="n2">
          	样式展示区
          </div>
          <div id="insert-style-list" class="item tab-content" style="height: 426px;">
          	          			<div id="editor-template" class="tab-pane active">
          				<div class="alert alert-warning">
          					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
							  <span aria-hidden="true">×</span>
							</button>
          					想要更多样式，<a href="/style-center?cate_id=1" target="_blank">请前往样式中心收藏使用</a>
          				</div>
			  						  			<div class="ui-portlet clearfix ">
			  				<ul class="editor-template-list ui-portlet-list" id="MixItUpCB6ECF">
			  											<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="7170" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiazjsibqzMEbFXfnLK8n31vaKYNADEzM6YvorxHicy8PtfwzrjSXicFvOFN0mAI3JcMsz4n05p2vsl6w/0" style="-webkit-box-shadow:rgb(117, 117, 118) 5px 3px 6px; box-sizing:border-box; color:inherit; height:auto !important; padding:4px 10px; visibility:visible !important; width:100% !important"></fieldset>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340454" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340454" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="5" title="点击插入此内容">
									<section class="135editor">
										<blockquote class="135brush" style="white-space: normal;font-size: 14px; line-height: 25px; margin: 2px 0px; padding: 10px 10px; border: 2px dashed #dedcde;max-width: 100%;"><p placeholder="虚线框内容，作为摘要或段落内容。">虚线框内容，作为摘要或段落内容。</p></blockquote>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340108" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340108" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="4" title="点击插入此内容">
									<section class="135editor">
										<h2 class="135brush" data-bcless="true" placeholder="浅色边框标题" style="margin: 10px 0px; white-space: normal; padding: 10px; max-width: 100%; line-height: 25px; color: rgb(255, 255, 255); font-weight: bold; font-size: 16px; box-shadow: rgb(153, 153, 153) 1px 1px 2px; border-left-style: solid; border-color: rgb(151, 237, 165); border-left-width: 25px; background-color: rgb(64, 222, 90);">浅色边框标题</h2>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340106" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340106" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="2" title="点击插入此内容">
									<section class="135editor">
										<h2 class="135brush" data-bcless="darken" placeholder="深色边框标题" style="margin: 10px 0px; padding: 10px; font-size: 16px; line-height: 25px; text-shadow: rgb(34, 95, 135) 0px 1px 0px; color: rgb(202, 251, 215); border-radius: 4px; box-shadow: rgb(153, 153, 153) 2px 2px 4px; border-left-width: 10px; border-left-style: solid; border-color: rgb(10, 137, 43); background-color: rgb(14, 184, 58);">深色边框标题</h2>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340105" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340105" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="3" title="点击插入此内容">
									<section class="135editor">
										<section style="max-width: 100%; margin: 2px; padding: 0px;"><section style="max-width: 100%;margin-left:1em; line-height: 1.4em;"><span style="font-size:14px"><strong style="color:rgb(62, 62, 62); line-height:32px; white-space:pre-wrap"><span class="135brush" data-brushtype="text" data-mce-style="color: #a5a5a5;" placeholder="关于135编辑器" style="background-color:rgb(86, 159, 8); border-radius:5px; color:rgb(255, 255, 255); padding:4px 10px">关于135编辑器</span></strong></span></section><section class="135brush" data-style="color:rgb(89, 89, 89); font-size:14px; line-height:28px" style="font-size: 1em; max-width: 100%; margin-top: -0.7em; padding: 10px 1em; border: 1px solid rgb(192, 200, 209); border-radius: 0.4em; color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);"><p><span placeholder="提供非常好用的微信文章编辑工具。">非常好用的在线图文编辑工具，欢迎将135推荐给您的朋友，将他/她从痛苦的编辑中解脱出来。</span></p><p></p><p><img alt="" src="http://mmbiz.qlogo.cn/mmbiz/yqVAqoZvDibHUYL1W4jVtKs2cuj8licOibPXibhFokJEACsh91ZicQd2CyFpMkwjX0S2zJLqiaqOgtDRCibEPI9dq6ic2A/0"></p></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340102" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340102" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="6" title="点击插入此内容">
									<section class="135editor">
										<h2 class="135brush" placeholder="请输入标题" style="white-space: normal; font-size: 16px; margin: 10px 0px; padding: 10px; max-width: 100%; border-top:solid 2px;border-left:0px; border-bottom:solid 2px; line-height: 25px; color: rgb(109, 151, 200);font-weight:bold; text-align: center;">请输入标题</h2>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340101" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340101" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="8" title="点击插入此内容">
									<section class="135editor">
										<h2 class="135brush" style="color:#793862;font-weight: bolder;margin: 10px 0 10px;font-size:24px;padding: 0;border-bottom: 1px dotted;padding-bottom: 5px;">请输入标题</h2>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340100" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340100" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="9" title="点击插入此内容">
									<section class="135editor">
										<p class="135brush" data-brushtype="text" placeholder="请输入标题" style="max-width: 100%; line-height: 24px;font-weight:bold; background-color: rgb(244, 156, 4); color: rgb(255, 255, 255); border-radius: 45%; text-align: center; margin:10px 0px;padding: 10px 15px;">请输入标题</p>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340098" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340098" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="10" title="点击插入此内容">
									<section class="135editor">
										<section style="margin:10px 0px; "><span style="font-size:18px"><strong><span class="135brush" data-brushtype="text" style="background-color:rgb(86, 159, 8); border-radius:5px; color:rgb(255, 255, 255); padding:5px 10px"><span placeholder="请输入标题">请输入标题</span> </span></strong></span></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340096" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340096" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="21" title="点击插入此内容">
									<section class="135editor">
										<section class="135title" style="border: 1px solid #cdcecc; box-shadow: 0 0 1px #ccc; margin: 10px 0;padding: 5px 0;"><h2 class="135brush" style="font-size: 16px; margin: 5px 0px; font-weight: bold; padding-bottom: 5px;text-align: center;">标题</h2><section class="135brush" data-style="font-size:14px" style="border-top: 1px solid #cdcecc;padding: 10px;"><p style="font-size:14px">正文内容。</p></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340085" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340085" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="26" title="点击插入此内容">
									<section class="135editor">
										<section style="font-size: 16px; white-space: normal; margin:10px 0px; border: 1px solid rgb(201, 201, 201); text-align: center;"><section style="border: 0.1em solid rgb(255, 202, 0); margin: 1em auto; width: 12em; height: 12em; border-radius: 6em;"><section style="display: table; max-height: 11em; background-color: rgb(255, 202, 0); border-radius: 5.5em; height: 11em; width: 11em; margin: 0.5em;"><section class="135brush" data-brushtype="text" style="display: table-cell; vertical-align: middle; max-height: 11em; margin: 1em; padding: 1em; color: rgb(255, 255, 255); font-size: 1.5em; line-height: 1.2em; ">135<br>编辑器</section></section></section><section class="135brush" data-style="font-size: 1em;" style="display: inline-block; color: white; background-color: rgb(255, 202, 0); line-height: 1em; border-radius: 1em; margin: 1em 1em 2em; max-width: 100%; padding: 0.5em 1em; font-size: 1em;"><p>135编辑器，您的微信文章可以更精彩！</p></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340084" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340084" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="28" title="点击插入此内容">
									<section class="135editor">
										<p class="135brush" style="margin-top: 0px; margin-bottom: 0px; font-size: 15.555556297302246px; padding: 0px; max-width: 100%; min-height: 1.5em; line-height: 2em; word-wrap: break-word; word-break: normal; border-top-left-radius: 5px; border-top-right-radius: 5px; border-bottom-right-radius: 5px; border-bottom-left-radius: 5px; color: rgb(255, 255, 255);text-shadow: rgb(30, 34, 30) 0px 1px 1px; text-align: center; background-color: rgb(89, 150, 235);">↓↓↓ 点击"阅读原文" 【查看更多信息】 &nbsp;</p>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340082" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340082" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="27" title="点击插入此内容">
									<section class="135editor">
										<section style="border-color:transparent transparent rgb(0, 112, 192); border-style:solid; border-width:12px; float:none; font-size:medium; height:0px; margin:-15px auto 0px 90px; orphans:2; text-align:-webkit-auto; widows:2; width:0px"></section><p class="135brush" data-brushtype="text" style="margin-top: -1px; margin-bottom: 0px;orphans: 2; widows: 2; min-height: 30px; visibility: visible; height: 30px; line-height: 30px; color: rgb(255, 255, 255); border-top-left-radius: 3px; border-top-right-radius: 3px; border-bottom-right-radius: 3px; border-bottom-left-radius: 3px; box-shadow: rgba(0, 0, 0, 0.14902) 1px 1px 3px; font-size: 15px; text-align: center; background-color: rgb(0, 112, 192);font-size:14px; font-weight:bold">点击标题下「蓝色微信名」可快速关注</p>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340079" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340079" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="24" title="点击插入此内容">
									<section class="135editor">
										<section class="135brush" style="margin: 3px; padding: 15px;color: rgb(62, 62, 62); line-height: 24px;box-shadow: rgb(170, 170, 170) 0px 0px 3px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); -webkit-box-shadow: rgb(170, 170, 170) 0px 0px 3px;"><p>边框阴影内容区域</p></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340078" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340078" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="29" title="点击插入此内容">
									<section class="135editor">
										<section><strong style="color:rgb(102, 102, 102); line-height:0px; max-width:100%"><span style="background-color:#0070c0; border-bottom-left-radius:1em 3em; border-bottom-right-radius:4em 0.5em; border-top-left-radius:2em 0.5em; border-top-right-radius:1em 3em; box-shadow:rgb(165, 165, 165) 4px 4px 2px; color:rgb(255, 255, 255); margin:0px; max-width:100%; padding:4px 10px">新朋友点上方蓝字“<span class="135brush" data-brushtype="text">135导航</span>”快速关注</span></strong></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340075" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340075" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="31" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="padding: 5px; border: 1px solid rgb(204, 204, 204); line-height: 24px; color: inherit; background-color: rgb(254, 254, 254);"><legend style="margin: 0px 0px 0px 15px; padding: 0px; width: auto; font-size: 16px; color: inherit;"><span style="color:inherit; margin:0px; padding:0px"><strong style="color:rgb(102, 102, 102); margin:15px 8px 0px 0px"><span class="135brush" data-brushtype="text" style="background-color:rgb(145, 168, 252); border-color:rgb(145, 168, 252); border-radius:5px; color:rgb(255, 255, 255); padding:4px 10px">135编辑器</span>&nbsp;&nbsp;</strong><span class="135brush" data-brushtype="text" style="border-color:rgb(145, 168, 252); color:rgb(145, 168, 252); margin:0px; padding:0px">ID:135editor&nbsp;&nbsp;</span></span> </legend><section class="135brush" data-style="text-indent: 2em;;" style="margin: 15px; margin-bottom: 0px; padding: 0px; line-height: 2em; color: rgb(62, 62, 62); font-size: 14px;"><p style="text-indent: 2em; color: inherit;">135编辑器是一个在线图文编辑工具，大量节省您排版的时间，让工作更轻松高效。</p></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340073" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340073" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12  mix  tagtpl-111" data-id="38" title="点击插入此内容">
									<section class="135editor">
										<section style="color: rgb(51, 51, 51); background: url(http://www.17sucai.com/preview/1/2014-04-08/%E6%97%B6%E9%97%B4%E8%BD%B4/images/log/line-bg.png) 104px 30px repeat-y;"><p style="line-height: 40px;font-size:24px;">2014年</p><h1 style="line-height: 40px;margin-top:-40px; margin-left: 85px; padding-left: 60px; top: 0px; color: rgb(88, 166, 251); font-size: 24px; background: url(http://www.17sucai.com/preview/1/2014-04-08/%E6%97%B6%E9%97%B4%E8%BD%B4/images/log/clock.png) 0% 0% no-repeat;">微信135更新日志</h1><section style="clear: both; line-height: 32px;"><p style="line-height: 32px;"></p><p style="font-size: 20px; line-height: 32px;">9月8日</p><p style="margin-top: -42px; margin-left: 90px;"><img src="http://p4.qhimg.com/d/inn/05a63fc5/circle-h.png" style="vertical-align:bottom"></p><section style="margin-left: 140px; margin-top: -32px;"><p style="color: rgb(99, 208, 41); font-size: 20px;">微信图文编辑器上线！</p><p>提供丰富的图文样式</p><p>自由定义颜色，批量更换颜色</p><p></p></section><p style="line-height: 32px; font-size: 20px;">9月3日</p><p style="margin-top: -42px; margin-left: 90px; line-height: 32px;"><img src="http://p4.qhimg.com/d/inn/05a63fc5/circle-h.png" style="vertical-align:bottom"></p><section style="margin-left: 140px; margin-top: -32px;"><p style="color: rgb(99, 208, 41); font-size: 20px;">收录微信公众号增加到5000+！</p><p>新增了一大批收录的微信公众号</p></section><p></p><p></p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340072" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340072" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="34" title="点击插入此内容">
									<section class="135editor">
										<section style="border: 1px solid #e2e2e2; box-shadow: #e2e2e2 0em 1em 0.1em -0.6em;line-height: 1.6em;"><section style="padding: 1em; color:rgb(255, 255, 255);  text-align: center; font-size: 1.4em; font-weight: bold; line-height: 1.4em; box-shadow: 0em 0.2em 0.2em rgb(221, 221, 221); background-color: rgb(249, 110, 87);"><span class="135brush" data-brushtype="text" style="font-size:1.4em; font-style:normal">活动名称</span></section><section style="margin-top: 1.5em; text-align: left;"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0GPLZlicQq2RYNicbDmd1xQT0Gicv1A0tlNRtyWzrwk4Odopjzzpwqo4YJkUl3x7nMbGeLATIszGPJ2Q/640" style="background-color:rgb(249, 110, 87); margin-left:1em; vertical-align:top; width:30px"><section class="135brush" data-brushtype="text" style="display: inline-block; width: 60%; padding: 0.2em; margin-left: 0.5em; font-size: 1em; font-style: normal; color: inherit;">活动时间</section></section><section style="margin-top: 1em; text-align: left;"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0GPLZlicQq2RYNicbDmd1xQT0xTVEAtw1fibKcv7QmGPZ2SPibJyDvCcAI1jgWFZxhxb1XSBViae9ibboJg/640" style="background-color:rgb(249, 110, 87); margin-left:1em; vertical-align:top; width:30px"><section class="135brush" data-brushtype="text" style="display: inline-block; width: 60%; padding: 0.2em; margin-left: 0.5em; font-size: 1em; color: inherit;">活动地点</section></section><section style="display: inline-block;background-color: rgb(249, 110, 87); height: 2em; max-width: 100%;margin-top: 1.5em; line-height: 1em; box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="height: 2em; max-width: 100%; padding: 0.5em 1em;color: rgb(255, 255, 255); white-space: nowrap; text-overflow: ellipsis; font-size: 1em; ">活动介绍</section></section><section class="135brush" style="padding: 1em; font-size: 1em; color: inherit;">请输入活动内容<br>请输入活动内容<br>请输入活动内容<br>......</section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340070" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340070" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="33" title="点击插入此内容">
									<section class="135editor">
										<h2 style="margin: 8px 0px 0px; padding: 0px; font-weight:bold;font-size:16px;line-height:28px;  max-width: 100%;color:rgb(0, 112, 192); min-height: 32px;border-bottom: 2px solid rgb(0, 112, 192); text-align: justify;"><span class="autonum" placeholder="1" style="background-color:rgb(0, 112, 192); border-radius:80% 100% 90% 20%; color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" data-original-title="" title="">1</span><strong class="135brush" data-brushtype="text">第一标题</strong></h2>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340069" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340069" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="39" title="点击插入此内容">
									<section class="135editor">
										<section style="max-width: 100%;margin: 0.8em 0px 0.5em; overflow: hidden; "><section class="135brush" data-brushtype="text" placeholder="请输入标题" style="box-sizing: border-box !important;  height:36px;display: inline-block;color: #FFF; font-size: 16px;font-weight:bold; padding:0 10px;line-height: 36px;float: left; vertical-align: top; background-color: rgb(249, 110, 87); ">请输入标题</section><section style="box-sizing: border-box !important; display: inline-block;height:36px; vertical-align: top; border-left-width: 9px; border-left-style: solid; border-left-color: rgb(249, 110, 87); border-top-width: 18px !important; border-top-style: solid !important; border-top-color: transparent !important; border-bottom-width: 18px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important;"></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340068" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340068" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="40" title="点击插入此内容">
									<section class="135editor">
										<h2 style="white-space: normal; margin: 8px 0px 0px; padding: 0px; font-size: 16px; font-weight: normal; height: 32px; text-align: justify; border-bottom-color: rgb(227, 227, 227); border-bottom-width: 1px; border-bottom-style: solid; "><strong style="color:rgb(102, 102, 102)"><span style="border-bottom-style:solid; border-bottom-width:2px; border-color:rgb(107, 77, 64); color:rgb(107, 77, 64); display:block; float:left; padding:0px 2px 3px"><span class="135brush" data-brushtype="text" placeholder="读而思" style="background-color:rgb(107, 77, 64); border-color:rgb(107, 77, 64); border-radius:150% 40%; color:rgb(224, 209, 202); line-height:28px; margin-right:8px; padding:4px 20px">读而思</span><span class="135brush" data-brushtype="text" style="border-color:rgb(107, 77, 64); color:inherit">deepreader</span></span></strong></h2><blockquote style="white-space: normal; margin: 0px; padding: 0px 10px; border:none"><blockquote class="135brush" style="margin: 5px 0px; padding: 5px 10px; border-radius: 0.5em 4em 3em 0.5em 0.5em 1em 0em 3em; border: 2px solid rgb(241, 241, 241); border-image-source: none; box-shadow: rgb(225, 225, 225) 5px 5px 2px; color: inherit; background-color: rgb(241, 241, 241);"><p placeholder="关注微信号每天收听我们的消息" style="color: inherit;">关注微信号每天收听我们的消息</p><p style="color: inherit;"><span placeholder="读而思为您推送精品阅读。" style="border-color:rgb(107, 77, 64); color:rgb(107, 77, 64)">读而思为您推送精品阅读</span></p></blockquote></blockquote>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340066" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340066" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="43" title="点击插入此内容">
									<section class="135editor">
										<section style="margin: 2px 0.8em 1em 0; text-align: center; font-size: 1em; vertical-align: middle; white-space: nowrap;"><section style="height: 0px; white-space: nowrap; /* margin: 0px 1em; */ border-top: 1.5em solid rgb(71, 193, 168); border-bottom: 1.5em solid rgb(71, 193, 168); border-left-width: 1.5em ! important; border-left-style: solid ! important; border-right-width: 1.5em ! important; border-right-style: solid ! important; border-color: rgb(71, 193, 168);"></section><section style="height: 0; white-space: nowrap; margin: -2.75em 1.65em;border-top: 1.3em solid #ffffff;border-bottom: 1.3em solid #ffffff;border-left: 1.3em solid transparent;border-right: 1.3em solid transparent;"></section><section style="height: 0px; white-space: nowrap; margin: 0.45em 2.1em; vertical-align: middle; border-top: 1.1em solid rgb(71, 193, 168); border-bottom: 1.1em solid rgb(71, 193, 168); border-left-width: 1.1em ! important; border-left-style: solid ! important; border-right-width: 1.1em ! important; border-right-style: solid ! important; border-color: rgb(71, 193, 168);"><section class="135brush" data-ct="fix" placeholder="一行短标题" style="max-height: 1em; padding: 0px; margin-top: -0.5em; color: rgb(254, 255, 253); font-size: 1.2em; line-height: 1em; white-space: nowrap; overflow: hidden; font-style: normal;">一行短标题</section></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340065" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340065" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="41" title="点击插入此内容">
									<section class="135editor">
										<blockquote class="135brush" data-brushtype="text" style="max-width: 100%; margin: 0px; padding: 5px 15px; color: rgb(224, 209, 202); line-height: 25px; font-weight: bold; text-align: left; border-radius: 5px 5px 0px 0px; border: 0px; background-color: rgb(107, 77, 64);">135编辑器</blockquote><blockquote class="135brush" style="max-width: 100%; margin: 0px; border-radius: 0px 0px 5px 5px; border: 0px none; background-color: rgb(239, 239, 239); line-height: 25px; padding: 10px 15px;"><p style="color: inherit;"><span style="color:inherit; font-size:14px">可在这输入内容，135编辑器，做微信图文美化最方便的编辑器。</span></p></blockquote>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340063" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340063" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="42" title="点击插入此内容">
									<section class="135editor">
										<blockquote style="max-width: 100%; margin: 0px; padding: 5px 15px; color: rgb(160, 160, 162); line-height: 25px; font-weight: bold; text-align: left; border-radius: 5px 5px 0px 0px; border: 0px; background-color: rgb(33, 33, 34);"><span class="135brush" data-brushtype="text" style="color:rgb(255, 255, 255)">这输入标题</span></blockquote><blockquote class="135brush" data-style="font-size:14px" style="max-width: 100%; margin: 0px; padding: 10px 15px 20px; border-radius: 0px 0px 5px 5px; border: 1px solid rgb(33, 33, 34); line-height: 25px;"><p style="color: inherit;">可在这输入内容，135编辑器，做微信图文美化最方便的编辑器。</p></blockquote>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340062" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340062" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="46" title="点击插入此内容">
									<section class="135editor">
										<section style="text-align: left;"><section style="display: inline-block; line-height: 20px; vertical-align: top; margin-top: 0.5em; text-align: center;"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EmGultAbZy6tmUIxPWnw9iaLEvswCQUUK0k4rPOicLo8SMm0pJOkgsVHg5qDgb0paoeAmW1YTgQRcQ/640" style="vertical-align:top; width:40px"><br><span class="135brush" data-brushtype="text" placeholder="135编辑器" style="font-size:12px; line-height:30px">135编辑器</span></section><section style="background-image:url(http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EmGultAbZy6tmUIxPWnw9iaIlnFWUEOLQMyRuiaZqhFtx2ria5fDpE1ZJiaPttmsZzlWRkwiamEdRia0Rg/640);background-repeat: no-repeat; display:inline-block; margin-top:1.8em; vertical-align:top; width:20px;padding:10px 0px"></section><section class="135brush" data-ct="fix" style="display: inline-block;width: 65%; margin-top: 0.7em; margin-left: -0.4em; padding: 1em; background-color: rgb(255, 228, 200); border-radius: 1em; font-size: 1em; font-style: normal; color: inherit;"><p placeholder="请输入对话">请输入对话</p></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340061" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340061" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="47" title="点击插入此内容">
									<section class="135editor">
										<section style="text-align: right;"><section class="135brush" data-ct="fix" style="display: inline-block; width: 65%; margin-top: 0.7em; margin-right: -0.4em; padding: 1em; background-color: rgb(188, 227, 249); border-radius: 1em; text-align: left; font-size: 1em; font-style: normal; color: inherit;"><p placeholder="请输入对话">请输入对话的内容</p></section><section style="background-image:url(http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EmGultAbZy6tmUIxPWnw9iavuZiarEgOVeibbOgJXZEyFaPMraQnzLQsKpVJFTezDnO8zwZly0NbunA/640);background-repeat: no-repeat; display:inline-block; margin-top:1.8em; vertical-align:top; width:20px;padding:10px 0px"></section><section style="display: inline-block; line-height: 20px; vertical-align: top; margin-top: 0.5em; text-align: center;"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EmGultAbZy6tmUIxPWnw9iaia9Qbm8Bwp9Eribfk1rscovFOkJSD0NOD8M36LkR0dQBrJeBgFTPEhww/640" style="vertical-align:top; width:40px"><br><span class="135brush" data-brushtype="text" placeholder="135编辑器" style="font-size:12px; line-height:30px">135编辑器</span></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340060" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340060" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="49" title="点击插入此内容">
									<section class="135editor">
										<p class="135brush" placeholder="请输入标题" style="max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap;line-height: 25px;font-size:20px;box-sizing:border-box !important;text-shadow:rgb(0, 187, 236) 1px 0px 4px, rgb(0, 187, 236) 0px 1px 4px, rgb(0, 187, 236) 0px -1px 4px, rgb(0, 187, 236) -1px 0px 4px; word-wrap:break-word !important;color:rgb(255, 255, 255);font-weight:bold;">请输入标题</p>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340057" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340057" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="50" title="点击插入此内容">
									<section class="135editor">
										<section style="margin: 10px 0px 0px 16px;"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="background-color:rgb(159, 136, 127); border-color:rgb(159, 136, 127); border-radius:0.3em; color:rgb(255, 255, 255); padding:0.2em 0.5em; text-align:center">读而思</span><span class="135brush" data-brushtype="text" style="background-color:rgb(255, 255, 255); border-radius:1.2em; border:1px solid rgb(159, 136, 127); color:rgb(159, 136, 127); height:1.2em; line-height:1.2em; margin-left:0.3em; padding:0.2em 0.5em">duersi</span></strong></section><section class="135brush" data-style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)" style="margin: -1em auto 5px; padding: 20px 10px 5px; border-radius: 0.3em; border: 1px solid rgb(159, 136, 127); color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);"><p style="color: inherit;">读而思，为您每日推荐值得深度思考的文章！</p></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340056" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340056" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="51" title="点击插入此内容">
									<section class="135editor">
										<section class="135brush" data-brushtype="text" style="margin: 10px auto 0px; padding: 5px 10px; border-top-left-radius: 0.3em; border-top-right-radius: 0.3em; border-bottom-right-radius: 0.3em; border-bottom-left-radius: 0.3em; border: 1px solid #CCC; color: rgb(51, 51, 51); background-color: #eee;">更多精彩，点击下方“<span style="color:rgb(0, 112, 192); font-size:14px">阅读原文</span>”查看。</section><blockquote data-ct="fix" style="white-space: normal; padding: 0px;border:0 none; max-width: 100%; margin: 0px 0px;"><p style="margin: 11px auto 0px 8px; width: 0px; height: 0px; border-width: 20px; border-style: solid; border-color: rgb(0, 176, 240) transparent transparent; z-index: 1;"></p><p data-ct="fix" style="margin: -44px auto 0px 8px; width: 0px; height: 0px; border-width: 20px; border-style: solid; border-color: #ddd transparent transparent; z-index: 2;"></p><p style="margin: -44px auto 0px 8px; width: 0px; height: 0px; border-width: 20px; border-style: solid; border-color: rgb(0, 176, 240) transparent transparent; z-index: 3;"></p><p data-ct="fix" style="margin: -44px auto 0px 8px; width: 0px; height: 0px; border-width: 20px; border-style: solid; border-color: #ddd transparent transparent; z-index: 4;"></p><p style="margin: -36px auto 0px 16px; width: 0px; height: 0px; border-width: 12px; border-style: solid; border-color: rgb(0, 176, 240) transparent transparent; z-index: 5;"></p><p data-ct="fix" style="margin: -21px auto -32px 23px; width: 0px; height: 0px; border-width: 5px; border-style: solid; border-color: #ddd transparent transparent; z-index: 6;"></p></blockquote><p></p><p></p><p></p>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340054" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340054" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="52" title="点击插入此内容">
									<section class="135editor">
										<blockquote style="white-space: normal; margin: 0px; padding: 12px 15px; border: 0px solid rgb(208, 218, 254); color: rgb(0, 45, 207); min-height: 1em; text-align: justify; background-image: -webkit-linear-gradient(left, rgb(207, 217, 255), rgb(158, 179, 253), rgb(207, 217, 255)); background-color: rgb(255, 255, 240);"><section class="135brush" style="border-color: rgb(208, 218, 254); color: inherit;"><p style="border-color: rgb(208, 218, 254); color: inherit;">渐变背景内容</p></section></blockquote>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340052" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340052" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="53" title="点击插入此内容">
									<section class="135editor">
										<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; max-width: 100%; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(0, 116, 180); border-color: rgb(182, 228, 253); background-image: -webkit-linear-gradient(left, rgb(180, 229, 255), rgb(132, 210, 252)); background-color: rgb(255, 255, 220);"><p style="color: inherit; border-color: rgb(182, 228, 253);">左右渐变格式内容</p></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340049" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340049" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="126" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; margin: 5px 0px; box-sizing: border-box; padding: 0px;">    <section style="height: 1em; box-sizing: border-box;">        <section style="height: 100%; width: 1.5em; float: left; border-top-width: 0.4em; border-top-style: solid; border-color: rgb(249, 110, 87); border-left-width: 0.4em; border-left-style: solid; box-sizing: border-box;"></section>        <section style="height: 100%; width: 1.5em; float: right; border-top-width: 0.4em; border-top-style: solid; border-color: rgb(249, 110, 87); border-right-width: 0.4em; border-right-style: solid; box-sizing: border-box;"></section>        <section style="display: inline-block; color: transparent; clear: both; box-sizing: border-box;"></section>    </section>    <section style="margin: -0.8em 0.1em -0.8em 0.2em; padding: 0.8em; border: 1px solid rgb(249, 110, 87); border-radius: 0.3em; box-sizing: border-box;">        <section placeholder="四角宽边框的样式" style="color: rgb(51, 51, 51); font-size: 1em; line-height: 1.4; word-break: break-all; word-wrap: break-word;" class="135brush">            四角宽边框的样式        </section>    </section>    <section style="height: 1em; box-sizing: border-box;">        <section style="height: 100%; width: 1.5em; float: left; border-bottom-width: 0.4em; border-bottom-style: solid; border-color: rgb(249, 110, 87); border-left-width: 0.4em; border-left-style: solid; box-sizing: border-box;"></section>        <section style="height: 100%; width: 1.5em; float: right; border-bottom-width: 0.4em; border-bottom-style: solid; border-color: rgb(249, 110, 87); border-right-width: 0.4em; border-right-style: solid; box-sizing: border-box;"></section>    </section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340039" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340039" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="125" title="点击插入此内容">
									<section class="135editor">
										<p class="135brush" data-brushtype="text" style="margin: 2px 5px 0px 0px; padding: 0px;color:rgb(75, 92, 196); float:left; font-size:2.7em; line-height:1em; margin-right:5px">秒刷</p><section class="135brush" data-style="clear:none;"><p style="clear:none;">选择需要应用样式的文字，然后选择要使用的样式，即可实现秒刷效果。秒刷支持所有样式，如有使用遇到问题，欢迎加入QQ群 <a href="http://www.135editor.com/books/chapter/1/21" target="_blank"><strong>204411951</strong></a>，将问题反馈给我们。 如果群已满无法加入，<a href="http://www.135editor.com/books/chapter/1/21" target="_blank">点击查看更多交流群及其它交流方式</a>。</p><p style="clear:none;color:red;">回车使下沉占两行的文字独自为一个段落，然后再使用秒刷。建议下沉的为一个或者2个文字，不要多了。</p></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340037" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340037" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="127" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="margin: 96px 16px 16px; border: 1px solid rgb(159, 136, 127); text-align: center; border-radius: 8px; font-size: 18px; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; padding: 0px;"><section style="margin: -3.3em auto 0px; color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPh3REFnLcFPEhtDulVqlTvGQabhn6NFXROrXiaJ6WLSyN1H1B6iczheYBSRA4oyibJOjdNoH5AhDDTWg/0" style="background:none 0% 0% repeat scroll rgb(255, 255, 255); border-radius:100%; border:2px solid rgb(159, 136, 127); box-shadow:rgb(201, 201, 201) 0px 2px 2px 2px; box-sizing:border-box; color:inherit; height:108px; width:108px"></section><section class="135brush" data-brushtype="text" data-style="text-align: left; font-size: 14px; color: inherit;" style="margin: 8px 15px; line-height: 1.4; box-sizing: border-box; color: inherit;"><p style="text-align: left; font-size: 14px; color: inherit;">135编辑器是非常好用的图文编辑工具，这里有很丰富的图文排版格式，图片素材，全文模板。</p><p style="text-align: left; font-size: 14px; color: inherit;">QQ交流群：&nbsp;204411951</p><p style="text-align: left; font-size: 14px; color: inherit;"><a href="http://www.135editor.com/books/chapter/1/21" target="_blank">查看更多交流方式</a></p></section><section style="margin: 10px 15px; border-top-width: 1px; border-top-style: solid; border-color: rgb(159, 136, 127); box-sizing: border-box; color: inherit;"><p style="color: inherit;"><span class="135brush" data-brushtype="text" style="color:inherit; font-size:0.7em; font-weight:inherit; line-height:1.4; text-align:inherit; text-decoration:inherit">微信号：135编辑器 </span></p><p style="color: inherit;"><span class="135brush" data-brushtype="text" style="color:inherit; font-size:0.7em; font-weight:inherit; line-height:1.4; text-align:inherit; text-decoration:inherit">英文ID：editor135</span></p></section><img src="https://mmbiz.qlogo.cn/mmbiz/yqVAqoZvDibHUYL1W4jVtKs2cuj8licOibPXibhFokJEACsh91ZicQd2CyFpMkwjX0S2zJLqiaqOgtDRCibEPI9dq6ic2A/0" style="box-sizing:border-box; color:inherit; margin:0px auto 0.3em; visibility:visible !important"></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340035" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340035" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="128" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: none; margin: 0.8em 0px 0.3em; box-sizing: border-box; padding: 0px;"><section class="135brush" data-brushtype="text" style="width: 2.5em; height: 2.5em; margin: 0px auto 1px; border-radius: 100%; line-height: 2.5em; box-sizing: border-box; overflow: hidden; font-size: 40px;  text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); background-color: rgb(195, 39, 43); border-color: rgb(195, 39, 43);">135</section><section style="font-size: 1em;  font-weight: bold; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(195, 39, 43); box-sizing: border-box;"><section style="width: 0px; margin: 0px auto; border-bottom: 0.5em solid rgb(195, 39, 43); border-top-color: rgb(195, 39, 43); border-left: 1em solid transparent ! important; border-right: 1em solid transparent ! important; box-sizing: border-box;height: 10px;"></section><section class="135brush" data-brushtype="text" style="padding: 0.5em; line-height: 1.2em; font-size: 1em;  box-sizing: border-box; background-color: rgb(195, 39, 43);">做最好用的编辑器</section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340031" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340031" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="129" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px; text-align: center;"><section style="box-sizing: border-box; width: 65%; float: right; padding: 0px 0px 0px 0.1em;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm6uCDSXcDhNL2rbmWebSoHOKibvAHA8LLZmhkVaoHwpoOYo4t9ArDFyg/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100%"></section><section style="display: inline-block; width: 35%; box-sizing: border-box; float: right; padding: 0px 0.1em 0px 0px; text-align: right;"><section class="135brush" data-brushtype="text" style="font-size:16px;box-sizing: border-box; margin-right: 4px; padding: 4px 6px; border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px;font-weight: bold;color: rgb(120, 124, 129); border-color: black;">目送</section><section class="135brush" data-style="box-sizing: border-box; margin-right: 0.3em; padding: 3px 5px; color: rgb(120, 124, 129); font-size: 0.9em; line-height: 2em; text-align: right;font-size:12px;"><p style="box-sizing: border-box; margin-right: 0.3em; padding: 3px 5px; color: rgb(120, 124, 129); font-size: 0.9em; line-height: 2em; text-align: right;font-size:12px;">“我慢慢地、慢慢地了解到，所谓父子母女一场，只不过意味着，你和他的缘分就是今生今世，不断地在目送他的背影渐行渐远。你战力在小路的这一端，看着他逐渐消失在小路转弯的地方，而且，他用背影默默告诉你：不必追”</p><p style="box-sizing: border-box; margin-right: 0.3em; padding: 3px 5px; color: rgb(120, 124, 129); font-size: 0.9em; line-height: 2em; text-align: right;font-size:12px">——龙应台</p></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340028" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340028" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107tagtpl-151-brush tagtpl-151" data-id="131" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: none rgb(252, 180, 43); margin: 0.3em 0px; padding-bottom: 1.5em; font-size: 14px; font-weight: bold; text-align: center; text-decoration: inherit; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZml9cwbY66AlG3kkwBI5w3iayvMhOUo4HIhcwTk1YqIaOsst9gavkbUoQ/0" style="border-radius:50%; color:inherit; height:112px; margin-right:10px; vertical-align:middle; width:112px"><section style="border-left-width: 1px; border-left-style: solid; border-color: rgb(211,172,156); padding-left: 1em; text-align: left; display: inline-block; height: 6em; vertical-align: top;color: rgb(211,172,156); margin-top: 1em;"><h2 class="135brush" data-brushtype="text" style="width: 100%; overflow: hidden; height: 50%; font-size: 1.5em; margin-top: -0.15em; border-color: rgb(211,172,156); color: inherit;margin-bottom:0.5em;">计划</h2><section class="135brush" data-style="font-size: 16px;" style="font-size: 16px; border-color: rgb(211,172,156); color: inherit;"><p>=Planning=</p></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340026" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340026" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="132" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;"><section style="display: inline-block; box-sizing: border-box; color: inherit;"><section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">135编辑器</section><section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">做最易用的编辑器</section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340022" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340022" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="133" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; margin: 0px 0px 0.5em; box-sizing: border-box; width:auto; clear: both; overflow: hidden; padding: 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmiapPtStAqwPXL5UMAsY5NZf50u2mHacNfkxB18zryVvTSpKdkVFMntQ/0" style="box-sizing:border-box; float:left; height:auto !important; width:100%"><section style="display: inline-block; font-size: 2em; z-index: 100; padding: 0.1em 0.5em; margin: -2.55em 0px 0px; line-height: 1.2; box-sizing: border-box; float: right; text-align: right;  font-weight: inherit; text-decoration: inherit; color: inherit; border-color: rgb(249, 110, 87); opacity:0.7;background-color: rgb(248, 247, 245);"><section style="box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box;font-size:25px">路，</section></section><section style="box-sizing: border-box; color: rgb(0,0,0); font-size: 1em;  font-weight: inherit; text-decoration: inherit;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box;font-size:25px">在脚下</section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340018" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340018" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="130" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;"><section style="box-sizing: border-box; width: 65%; float: left; padding: 0px 0.1em 0px 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm2gFWHbYQlG6vIbDGydajRgutZOnPllj2Z7Ts8J4EFSoA3EYoOicN7Uw/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important"></section><section style="display: inline-block; width: 35%; box-sizing: border-box; float: left; padding: 0px 0px 0px 0.1em;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box; margin-right: 4px; padding: 4px 6px; border-bottom-width: 2px; border-bottom-style: solid; font-size: 1.2em; font-weight: bold;color: rgb(102,97,91); border-color: rgb(102,97,91);">机会论</section><section class="135brush" data-styel="line-height: 2em;" style="box-sizing: border-box; margin-right: 0.3em; padding: 0.3em 0.5em; color: rgb(102,97,91); font-size: 0.9em;"><p style="line-height: 2em;">机会是给有准备的人</p><p style="line-height: 2em;">但准备的人多了</p><p style="line-height: 2em;">机会</p><p style="line-height: 2em;">决定摇号</p></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340020" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340020" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="136" title="点击插入此内容">
									<section class="135editor">
										<table style="width:100%"><tbody style="color: inherit;"><tr class="firstRow" style="color: inherit;"><td style="border-color: rgb(245, 245, 245); margin: -6px -9px -6px -15px; word-break: break-all; color: inherit;"><p style="color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm8998eDZAl1bg6WTY3CVmLIKBpnTczykV741H0Dkvs9eJszLDeFZLrw/0" style="color:inherit; height:280px; visibility:visible !important; width:auto"></p><section style="word-break: break-all; padding: 8px; color: rgb(245, 245, 244); border-color: rgb(245, 245, 244); background-color: rgb(255, 255, 255);"><p style="border-color: rgb(245, 245, 244); color: inherit;"><span style="color:rgb(63, 63, 63)"><strong style="border-color:rgb(245, 245, 244); color:inherit"><span class="135brush" data-brushtype="text" style="border-color:rgb(245, 245, 244); font-size:14px; line-height:2px; text-align:justify">Nobody</span></strong><strong style="border-color:rgb(245, 245, 244); color:inherit"><span style="border-color:rgb(245, 245, 244); font-size:14px; line-height:2px; text-align:justify"></span></strong></span></p><p style="border-color: rgb(245, 245, 244); color: inherit;"><span class="135brush" data-brushtype="text" style="color:rgb(63, 63, 63); font-size:12px; line-height:11px">狂妄达人</span></p></section></td><td class="135brush" data-style="color: inherit; line-height: 2em;border-color:rgb(245, 245, 244); font-size:16px; text-align:justify" style="border-color: rgb(245, 245, 244); padding-left: 10px; word-break: break-all; color: inherit;"><p style="color: inherit; line-height: 2em;"><span style="color:rgb(63, 63, 63)"><span style="border-color:rgb(245, 245, 244); font-size:16px; line-height:2px; text-align:justify">◆四个最想实现的愿望：</span></span></p><p style="color: inherit; line-height: 2em;"><span style="color:rgb(63, 63, 63); font-size:14px; line-height:21px; text-align:justify"><span style="border-color:rgb(245, 245, 244); color:rgb(123, 123, 111); font-size:14px; line-height:21px; text-align:justify">●不劳而获</span></span></p><p style="color: inherit; line-height: 2em;"><span style="color:rgb(63, 63, 63); font-size:14px; line-height:21px; text-align:justify"><span style="border-color:rgb(245, 245, 244); color:rgb(123, 123, 111); font-size:14px; line-height:21px; text-align:justify">●不学有术</span></span></p><p style="color: inherit; line-height: 2em;"><span style="color:rgb(63, 63, 63); font-size:14px; line-height:21px; text-align:justify"><span style="border-color:rgb(245, 245, 244); color:rgb(123, 123, 111); font-size:14px; line-height:21px; text-align:justify">●相爱无伤</span></span></p><p style="color: inherit; line-height: 2em;"><span style="color:rgb(63, 63, 63); font-size:14px; line-height:21px; text-align:justify"><span style="border-color:rgb(245, 245, 244); color:rgb(123, 123, 111); font-size:14px; line-height:21px; text-align:justify"></span>●狂吃不胖</span></p></td></tr></tbody></table>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340013" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340013" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12  mix  tagtpl-109" data-id="135" title="点击插入此内容">
									<section class="135editor">
										<table align="left" cellpadding="0" cellspacing="0" style="width:100%"><tbody><tr height="18"><td align="right" colspan="1" rowspan="3" style="border-color: rgb(248, 247, 245);padding-right: 10px; word-break: break-all;text-align:right;vertical-align: top;" valign="top" width="161"><p><span style="font-size:14px">嫩母鸡</span></p><p><span style="font-size:14px">葱</span></p><p><span style="font-size:14px">姜片</span></p><p><span style="font-size:14px">盐</span></p><p><span style="font-size:14px">冰块</span></p></td><td align="left" colspan="1" rowspan="3" style="border-color: rgb(248, 247, 245);padding-left: 10px;text-align:left;vertical-align: top;" valign="top" width="166"><p><span style="font-size:14px">一只</span></p><p><span style="font-size:14px">大量</span></p><p><span style="font-size:14px">少许</span></p><p><span style="font-size:14px">3-4勺（5毫升量匙）</span></p><p><span style="font-size:14px">500克-1000克</span></p></td></tr><tr></tr><tr></tr></tbody></table>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340010" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340010" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="134" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="clear: both; padding: 0px; border: 0px none; margin: 1em 0px 0.5em;"><section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(142, 201, 101); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="padding: 0px 0.5em; background-color: rgb(142, 201, 101); display: inline-block; font-size: 16px;">135编辑器</section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340008" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340008" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="391" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="margin: 2em 1em 1em; padding: 0px; border: 0px rgb(255, 179, 167); border-image-source: none; max-width: 100%; box-sizing: border-box; color: rgb(62, 62, 62); font-size: 16px; line-height: 25px; word-wrap: break-word !important;"><section style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box; line-height: 1.4; margin-left: -0.5em;"><section style="max-width: 100%; box-sizing: border-box; border-color: rgb(0, 0, 0); padding: 3px 8px; border-radius: 4px;color: rgb(167, 23, 0); font-size: 1em;display: inline-block; -webkit-transform: rotateZ(-10deg);transform: rotate(-10deg);transform-origin: left center 0; -webkit-transform-origin: 0% 100%; word-wrap: break-word !important; background-color: rgb(255, 179, 167);"><span class="135brush" data-brushtype="text" style="color:rgb(255, 255, 255)">135编辑器</span></section></section><section class="135brush" data-style="line-height:24px;color:rgb(89, 89, 89); font-size:14px" style="max-width: 100%; box-sizing: border-box; padding: 22px 16px 16px; border: 1px solid rgb(255, 179, 167);color: rgb(0, 0, 0); font-size: 14px;margin-top: -24px;"><p style="line-height:24px;"><span style="color:rgb(89, 89, 89); font-size:14px">135编辑器提供非常好用的微信图文编辑器。可以随心所欲的变换颜色调整格式，更有神奇的自动配色方案。</span></p></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340001" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340001" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="142" title="点击插入此内容">
									<section class="135editor">
										<blockquote style="white-space: normal; margin: 0px; padding: 12px 15px; border: 0px solid rgb(208, 218, 254); color: rgb(0, 45, 207); min-height: 1em; text-align: justify; background-image: -webkit-linear-gradient(top, rgb(207, 217, 255), rgb(158, 179, 253), rgb(207, 217, 255)); background-color: rgb(255, 255, 240);"><section class="135brush" style="border-color: rgb(208, 218, 254); color: inherit;"><p style="border-color: rgb(208, 218, 254); color: inherit;">渐变背景内容</p></section></blockquote>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/340003" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/340003" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="702" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="margin: 0px; padding: 0px; border: 0px; max-width: 100%; font-size: 16.3636360168457px; text-align: center; word-wrap: break-word !important; box-sizing: border-box !important;"><section style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important; display: inline-block;"><section style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important; display: inline-block;"><p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important;"><strong style="box-sizing:border-box !important; max-width:100%; word-wrap:break-word !important">·END·</strong><br style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;">&nbsp;</p></section><section class="135title" style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important; margin: 0.2em 0.5em 0.1em; color: rgb(16, 146, 113); font-size: 1.8em; line-height: 1;  font-weight: inherit; text-align: inherit; text-decoration: inherit;"><strong style="box-sizing:border-box !important; max-width:100%; word-wrap:break-word !important"><em style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important;">135</em><span style="box-sizing:border-box !important; font-size:20px; max-width:100%; word-wrap:break-word !important">编辑器</span></strong></section><section style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important; width: 208px; border-top-style: solid; border-top-width: 1px; border-top-color: black; line-height: 1;"></section><section class="135brush" data-brushtype="text" style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important; margin: 0.5em 1em; font-size: 1em; line-height: 1;  font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);"><p><span style="box-sizing:border-box !important; font-size:16.3636360168457px; max-width:100%; word-wrap:break-word !important">简单·易用·样式多</span></p><p><img alt="" src="http://mmbiz.qlogo.cn/mmbiz/yqVAqoZvDibHUYL1W4jVtKs2cuj8licOibPXibhFokJEACsh91ZicQd2CyFpMkwjX0S2zJLqiaqOgtDRCibEPI9dq6ic2A/0" style="height:200px; width:200px"></p></section><span style="background-color:rgb(16, 146, 113); border-bottom-left-radius:0.3em; border-bottom-right-radius:0.3em; border-top-left-radius:0.3em; border-top-right-radius:0.3em; box-shadow:rgb(16, 146, 113) 0.1em 0.1em 0.1em; box-sizing:border-box !important; color:white; display:inline-block; font-size:1em; font-weight:inherit; max-width:100%; padding:0.3em; text-align:inherit; text-decoration:inherit; word-wrap:break-word !important">微信号：editor135</span></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339999" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339999" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="704" title="点击插入此内容">
									<section class="135editor">
										<section style="margin: 10px 0px;border-radius:4px;  padding: 50px 0px; color: rgb(202, 251, 215); text-align: center; background-color: rgb(14, 184, 58);"><span class="135brush" data-brushtype="text" style="border-radius:4px; border:1px solid rgb(251, 251, 251); font-size:18px; line-height:42px; padding:10px 15px">135编辑器</span><section class="135brush" style="margin-top:30px;"><p>秒刷，最易用的图文排版工具</p><p></p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339994" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339994" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="709" title="点击插入此内容">
									<section class="135editor">
										<section style="border:1px solid #ccc;padding:3px;"><section style="padding: 15px; color: rgb(255, 255, 255); border-color: rgb(89, 195, 249); background: rgb(89, 195, 249);"><p style="text-align: center; color: inherit;"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="color:inherit; font-size:24px">高薪招聘</span></strong></p><p class="135brush" data-brushtype="text" style="text-align: center; color: inherit;">好工作就在135</p></section><section class="135brush" data-style="color: rgb(89, 195, 249);line-height: 1.1;" style="box-sizing: border-box; padding: 9px; color: rgb(85, 85, 85); overflow-y: hidden;font-size: 14px; line-height: 20px; text-align: center;"><h3 style="box-sizing: border-box; font-weight: 500; line-height: 1.1; color: inherit; margin-top: 20px; margin-bottom: 10px; font-size: 24px;">招聘求职<br style="box-sizing: border-box; color: inherit;"><small style="box-sizing: border-box; font-size: 16px; line-height: 1; color: rgb(119, 119, 119);">高薪工作</small></h3><p style="box-sizing: border-box; margin-top: 0px; margin-bottom: 10px; color: inherit;">135正在高薪招聘<span style="border-color:rgb(89, 195, 249); color:rgb(89, 195, 249)">PHP开发工程师</span>，<span style="border-color:rgb(89, 195, 249); color:rgb(89, 195, 249)">网页设计师</span>以及<span style="border-color:rgb(89, 195, 249); color:rgb(89, 195, 249)">网页制作</span>，欢迎感兴趣的朋友投递和推荐简历至<strong style="color:inherit">service@tizikeji.com</strong>！</p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339992" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339992" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="708" title="点击插入此内容">
									<section class="135editor">
										<section style="border-color: rgb(89, 195, 249); color: rgb(255, 255, 255); margin: 10px 0px; padding: 35px; background-color: rgb(89, 195, 249);"><h2 class="135title" style="font-size: 24px; font-weight: bold; border-color: rgb(89, 195, 249); color: inherit;">纯底色大边距大段内容</h2><section class="135brush" style="border-color: rgb(89, 195, 249); color: inherit;"><p style="border-color: rgb(89, 195, 249); color: inherit;">日本的设计师提出过一个配色黄金比例，是70：25：5，其中的70%为大面积使用的主色，25%为辅助色，5%为点缀色。一般情况下建议画面色彩不超过3种，3种是指的3种色相，比如深红和暗红既可以视为一种色相。</p><p style="border-color: rgb(89, 195, 249); color: inherit;"></p><p style="border-color: rgb(89, 195, 249); color: inherit;">一般来说颜色用的越少越好，颜色越少画面越简洁，作品会显得更加成熟。</p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339989" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339989" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="1101" title="点击插入此内容">
									<section class="135editor">
										<section style="font-size: 15px; border: 2px solid rgb(107, 77, 64); padding: 10px 20px 0px;height:auto !important;">
<p style="clear: none; float: right; display: inline-block; font-size: 20px; word-wrap: break-word; margin-left: 5px; width: 20px; color: inherit;"><strong class="135brush" data-brushtype="text" style="color:inherit">做最好用的编辑器</strong></p>

<p class="135brush" data-brushtype="text" style="clear: none; float: right; display: inline-block; word-wrap: break-word; box-sizing: border-box; margin: 0px 15px; font-size: 18px; padding: 0px 4px; width: 28px; color: rgb(255, 255, 255); background-color: rgb(107, 77, 64);">提子科技</p>

<section class="135brush" data-style="margin-left: 6px; clear: none; float: right; display: inline; width: 16px; word-wrap: break-word;" style="color: inherit;">
<p style="margin-left: 6px; clear: none; float: right; display: inline; width: 16px; word-wrap: break-word; color: inherit;">竖排文字效果，</p>

<p style="margin-left: 6px; clear: none; float: right; display: inline; width: 16px; word-wrap: break-word; color: inherit;">文字自动从右到左排列</p>

<p style="margin-left: 6px; clear: none; float: right; display: inline; width: 16px; word-wrap: break-word; color: inherit;">回车时右侧增加新列</p>

<p style="clear: both; color: inherit;">&nbsp;</p>
</section>

<p style="clear: both; color: inherit;">&nbsp;</p>
</section>
									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339984" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339984" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="1474" title="点击插入此内容">
									<section class="135editor">
										<section style="border-style: solid;border-width: 1px;border-left-width:60px;border-color:#A40000;color:#A40000;padding-left:20px;padding-top:10px;"><section style="border-bottom:2px solid #A40000;clear:both;float:left;"><section class="135brush" data-brushtype="text" style="font-size:24px;font-weight:bold;float:left;">New /<br>Spring</section><section class="135brush" data-brushtype="text" style="font-size:20px;margin-left:45px;margin-top:5px;font-weight:bold;float:left;">春.<br>新年快乐2015</section></section><p style="clear:both"></p><p class="135brush">提子135 &nbsp;&nbsp; HAPPY NEW YEAR&nbsp;<em>!!!</em></p></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339982" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339982" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="750" title="点击插入此内容">
									<section class="135editor">
										<blockquote class="135bg" style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: cover; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjstr86wliaib2El5sCU5Ge9ic1b4QsObYX2LsQ16mNrq5MMeUEhZr8sRNZRBMY4bAGhV421U9QVwSwQ/0/mmbizgif);"><p style="text-align: center; color: inherit;"></p><p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; text-align: center; box-sizing: border-box !important; color: inherit;"><strong><span style="font-size:18px"><span class="135title" style="color:#FFFFFF">圣诞节快乐</span></span></strong></p><section class="135brush" style="color:rgb(255, 255, 255)"><p style="color: inherit; text-indent: 2em;"><span style="color:rgb(255, 255, 255)">2014年即将成为记忆，而这一年希望对每个人都是难忘的。</span></p><p style="color: inherit;"><br style="color: inherit;">&nbsp;</p><p style="color: inherit;"></p></section></blockquote>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339980" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339980" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="1485" title="点击插入此内容">
									<section class="135editor">
										<p style="height:18px;"></p><hr style="border-color: rgb(165, 0, 3); border-width: 2px; margin: 0px 0px -28px;"><section class="135brush" data-style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;" style="text-align: center; margin: 10px;"><p style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;">新</p><p style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;">春</p><p style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;">快</p><p style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;">乐</p></section><p>秒刷时支持多字，请每段一个文字使用秒刷。</p>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339976" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339976" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="1482" title="点击插入此内容">
									<section class="135editor">
										<section style="border:5px solid #A50003;padding:5px;"><section style="border:1px solid #A50003;padding:15px 20px;"><p style="color:#A50003;text-align:center;border-bottom:1px solid #A50003"><span class="135brush" data-brushtype="text" style="font-size:48px"><strong>羊年大吉</strong></span></p><section class="135brush" data-style="color:#A50003;text-align:center;font-size:18px" style="color:#A50003;text-align:center;"><p style="color:#A50003;text-align:center;"><span style="font-size:18px"><strong>HAPPY 2015'S NEW YEAR</strong></span></p></section></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339975" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339975" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="1483" title="点击插入此内容">
									<section class="135editor">
										<section style="background:#A50003;padding:5px;"><section class="135brush" data-style="color:#FFF;font-size:24px;weight:bold;" style="border:1px solid #FFF;padding:10px 20px;"><p style="color:#FFF;border-bottom:1px solid #A50003"><span style="font-size:24px"><strong>新年快乐</strong></span>&nbsp;&nbsp; <span style="font-size:14px"><strong>// HAPPY 2015'S NEW YEAR //</strong></span></p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339972" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339972" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="1873" title="点击插入此内容">
									<section class="135editor">
										<section style="max-width: 100%; color: rgb(62, 62, 62); margin: 0px; border-radius: 2em; height: 2.5em;line-height: 2.5em; color: rgb(255, 255, 255);  font-size: 13.33px; word-wrap: break-word !important; box-sizing: border-box !important; background-color: rgb(189, 221, 34);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(189, 221, 34); box-sizing:border-box !important; float:left; height:auto !important; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important; word-wrap:break-word !important"><p class="135brush" data-brushtype="text" style="max-width: 100%; color: inherit; display: inline-block; font-size:16px; ">关注一下又不会怀孕！</p></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339973" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339973" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="2175" title="点击插入此内容">
									<section class="135editor">
										<section class="135brush" data-bcless="true" data-brushtype="text" style="color: #aaa; padding: 0.45em 0.6em 0.45em 0.9em; border-left-width: 10px; border-left-style: solid; border-color:#e9e9e9; background:#f3f3f4;">135编辑器 &nbsp; / &nbsp;关于我们</section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339971" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339971" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="2178" title="点击插入此内容">
									<section class="135editor">
										<section data-bcless="true" style="font-size:20px; background: rgb(223, 240, 203);border:0 none;padding:0 0;margin:0 0;"><span class="135brush" data-brushtype="text" style="background:rgb(255, 255, 255); color:rgb(150, 206, 84); display:inline-block; padding:0px 15px 0px 0px">135编辑器</span><span style="background:#fff; color:#FFF; display:inline-block; margin-left:5px">-</span><span style="background:#fff; color:#FFF; display:inline-block; margin-left:5px">-</span><span style="background:#fff; color:#FFF; display:inline-block; margin-left:5px">-</span></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339967" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339967" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2242" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(198, 198, 199); box-sizing: border-box; width:auto; overflow: hidden; padding: 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm5cXMiaag0yCXia7vthdUVIzN9wBhaUaVLia1BLGtiaYgvicwOshcXwYuMnQ/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%"> &nbsp; &nbsp;<section style="width: 12em; height: 12em; float: left; padding: 2.8em 1.5em 2em 3.5em; margin-top: -9em; margin-left: 0em; border-radius: 12em; box-sizing: border-box; opacity: 0.85; color: rgb(70, 70, 72); background-color: rgb(198, 198, 199);"><section style="display: inline-block; padding: 0.2em 0.2em 0.2em 0px; border-top-width: 1px; border-top-style: solid; border-color: rgb(255, 255, 255) rgb(198, 198, 199); border-bottom-width: 3px; border-bottom-style: solid; color: inherit; text-align: inherit; font-size: 1.4em; font-weight: inherit; text-decoration: inherit; box-sizing: border-box;"><section class="135title" style="box-sizing: border-box; color: inherit; border-color: rgb(198, 198, 199);"><p style="line-height: 1.4; border-color: rgb(198, 198, 199); color: inherit;"><strong><span style="border-color:rgb(198, 198, 199); color:inherit; font-size:16px">&nbsp;水 是</span></strong></p><p style="line-height: 1.4; border-color: rgb(198, 198, 199); color: inherit;"><strong><span style="color:inherit; font-size:16px; font-weight:inherit; line-height:1.5em; text-align:inherit; text-decoration:inherit">&nbsp; &nbsp; 生 命</span><span style="color:inherit; font-weight:inherit; line-height:1.5em; text-align:inherit; text-decoration:inherit">&nbsp; &nbsp;</span></strong></p></section></section><section style="padding: 0.5em 0px; color: inherit; text-align: inherit; font-size: 1em; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(198, 198, 199);"><p style="box-sizing: border-box; color: inherit; border-color: rgb(198, 198, 199);">Water &nbsp;Is</p><p style="box-sizing: border-box; color: inherit; border-color: rgb(198, 198, 199);">The &nbsp;Life</p></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339956" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339956" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2254" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(194, 201, 42); box-sizing: border-box; width: auto; overflow: hidden; padding: 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmNMZFcgebibT8RvMY4Wm1A8oasM1WiczKRDnkNZ3SfSCykqiaiadkbgF09A/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%"><section style="width: 12em; height: 12em; float: right; padding: 2.8em 2em 2em 2.6em; margin-top: -9em; margin-left: 0em; border-radius: 12em; box-sizing: border-box; text-align: left; opacity: 0.85; color: rgb(253, 253, 245); border-color: rgb(194, 201, 42); background-color: rgb(194, 201, 42);"><section style="display: inline-block; margin-right:20px;padding: 0.2em ; border-top-width: 1px; border-top-style: solid; border-color: rgb(255, 255, 255) rgb(194, 201, 42); border-bottom-width: 3px; border-bottom-style: solid; color: inherit; text-align: inherit; font-size: 1.4em; line-height: 1.4; font-weight: inherit; text-decoration: inherit; box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box; color: inherit; border-color: rgb(194, 201, 42);">Apple sales</section></section><section style="padding: 0.5em 0px; color: inherit; text-align: inherit; font-size: 1em; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(194, 201, 42);"><section class="135brush" data-brushtype="text" style="box-sizing: border-box; color: inherit; border-color: rgb(194, 201, 42);">苹果售卖中</section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339952" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339952" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="2182" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px none; margin: 1em 0px 0.8em; clear: both; box-sizing: border-box; padding: 0px;"><section style="font-size: 1.2em; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(249, 110, 87); border-color: rgb(249, 110, 87); box-sizing: border-box; background-color: transparent;"><section style="margin-left: 40px; box-sizing: border-box;"><section style="display: inline-block; vertical-align: bottom; line-height: 1; font-size: 1.2em; font-family: inherit; box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box;">标题</section></section><section style="display: inline-block; vertical-align: bottom; line-height: 1; margin-left: 3px; font-size: 0.9em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(42, 52, 58); box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box;">请输入标题</section></section></section><section style="margin-top: -10px; box-sizing: border-box;height: 5px;"><section style="display: inline-block; height: 1px; width: 40px; transform-origin: right center 0px; transform: rotate(45deg); font-size: 1.2em; background-color: rgb(249, 110, 87); box-sizing: border-box;"></section><section style="display: inline-block; height: 1px; width: 80%; font-size: 1.2em; background-color: rgb(249, 110, 87); box-sizing: border-box;"></section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339951" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339951" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="2181" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px none rgb(12, 137, 24); margin: 1em 0px 1em; clear: both; box-sizing: border-box; padding: 0px;"><section style="text-align: center; font-size: 1em;  font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); border-color: rgb(12, 137, 24); box-sizing: border-box; background-color: transparent;"><section style="width: 2em; height: 2em; margin: 0px auto; border-top-left-radius: 100%; border-top-right-radius: 100%; border-bottom-right-radius: 100%; border-bottom-left-radius: 100%; box-sizing: border-box; color: rgb(158, 246, 166); background-color: rgb(12, 137, 24);"><section style="display: inline-block; padding: 0px 0.5em; font-size: 1em; line-height: 2;  box-sizing: border-box; color: inherit;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box; color: inherit;">壹</section></section></section><section style="margin-top: -1em; margin-bottom: 1em; box-sizing: border-box; color: inherit;"><section style="border-top-width: 1px; border-top-style: solid; width: 35%; float: left; border-color: rgb(12, 137, 24); box-sizing: border-box; color: inherit;"></section><section style="border-top-width: 1px; border-top-style: solid; width: 35%; float: right; border-color: rgb(12, 137, 24); box-sizing: border-box; color: inherit;"></section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339948" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339948" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="2185" title="点击插入此内容">
									<section class="135editor">
										<section style="color: inherit; font-size: 16px; padding: 5px 10px 0px 35px; margin-left: 27px; border-left-width: 2px; border-left-style: dotted; border-left-color: rgb(228, 228, 228);"><section class="autonum" style="width: 32px; height: 32px; margin-left: -53px; margin-top: 23px; color: rgb(202, 251, 215); text-align: center; line-height: 32px; border-top-left-radius: 16px; border-top-right-radius: 16px; border-bottom-right-radius: 16px; border-bottom-left-radius: 16px; background: rgb(14, 184, 58);" data-original-title="" title="">1</section><section class="135brush" style="margin-top: -30px;padding-bottom: 10px; color: inherit;"><p style="clear: both; line-height: 1.5em; font-size: 14px; color: inherit;"><span style="color:inherit; font-size:16px"><strong class="135title" style="color:inherit">如何进入【135编辑器】？</strong></span></p><p style="clear: both; line-height: 1.5em; font-size: 14px; color: inherit;">网页搜索“135编辑器”，点击第一条搜索结果即可进入编辑器页面</p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339947" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339947" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2266" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;"><section style="box-sizing: border-box; width: 65%; float: right; padding: 0px 0px 0px 0.1em;"><img alt="" border="0" src="  https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmthlC0uOS4I28cT4peZ7xq3TG29Je52Ziay50W5Go5L3iaV0YYpGH8RibQ/0" style="box-sizing:border-box; height:auto !important; width:100%" title="" vspace="0"></section><section style="display: inline-block; width: 35%; box-sizing: border-box; float: right; padding: 0px 0.1em 0px 0px; text-align: right;"><section style="box-sizing: border-box; margin-right: 4px; padding: 4px 6px; color: rgb(52, 54, 60); border-bottom-width: 1px; border-bottom-style: solid; border-color: black; font-size: 1.2em;  font-weight: inherit; text-align: inherit; text-decoration: inherit; background-color: transparent;"><section class="135title" style="box-sizing: border-box;">天鹅湖</section></section><section style="box-sizing: border-box; margin-right: 0.3em; padding: 3px 5px; color: rgb(120, 124, 129); font-size: 0.9em;  font-weight: inherit; text-align: inherit; text-decoration: inherit;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box;">Swan Lake Joymen<br style="box-sizing: border-box;">&nbsp;</section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339944" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339944" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2277" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; padding: 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmg73AE4OCnicXslCicW7hwTl3RZQCUm3wsXefAoEWq52QFVzTw5jpb0Jg/0" style="box-sizing:border-box; height:auto !important; width:100%"><section style="box-sizing: border-box; width: 9em; float: right; margin-top: -2em; margin-right: 1em; border-radius: 12em; -webkit-transform: rotate3d(0, 0, 1, 15deg); opacity: 0.99;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmbVpTAd1gX7DhPGTh48aGWhY7rmTV3CqAQ1a0F8BhrjPaEHrzicEte6g/0" style="border:2px solid white; box-sizing:border-box; height:auto !important; width:100%"></section><section style="box-sizing: border-box; margin: 0.5em 11em 0.5em 0px; color: rgb(102, 102, 102); font-size: 0.9em;  font-weight: inherit; text-align: inherit; text-decoration: inherit;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box;">日式料理</section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339940" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339940" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2268" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; margin: 0px 0px 0.5em; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px; text-align: left;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmTVicmfic1OHwtphXZmibMCFIsMDVkgkPfHqpKvuUo1UKZS1jpc5ZaxnRg/0" style="box-sizing:border-box; color:inherit; float:left; height:auto !important; width:100%"> &nbsp; &nbsp;<section style="display: inline-block; font-size: 2em; z-index: 100; padding: 0.1em 0.5em; margin: -1.5em 0px 0px; line-height: 1.2; box-sizing: border-box; float: right; text-align: right; font-weight: inherit; text-decoration: inherit; color: rgb(224, 209, 202); border-color: rgb(107, 77, 64); background-color: rgb(107, 77, 64);"><section style="box-sizing: border-box; border-color: rgb(107, 77, 64); color: inherit;"><section class="135brush" data-style="font-size: 0.8em; border-color: rgb(107, 77, 64); color: inherit;" style="box-sizing: border-box; border-color: rgb(107, 77, 64); color: inherit;"><p style="font-size: 0.8em; border-color: rgb(107, 77, 64); color: inherit;">你是我这一生</p><p style="font-size: 0.8em; border-color: rgb(107, 77, 64); color: inherit;">未拆的礼物</p></section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339937" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339937" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2274" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; margin: 0px 0px 0.5em; box-sizing: border-box; width: auto; clear: both; overflow: hidden; padding: 0px;"><img alt="" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm1MZZbgULIP7dm2IZjn9xzCTuaBeJgaxJHEDezzOY4wdgR392AkuBRg/0" style="box-sizing:border-box; color:inherit; float:left; height:auto !important; width:100%" title="" vspace="0" border="0"><section style="display: inline-block; font-size: 2em; z-index: 100; padding: 15px; margin: -1.5em 0px 0px; line-height: 1.2; box-sizing: border-box; float: left; font-weight: inherit; text-decoration: inherit; color:#FFF; border-color: rgb(60, 40, 34); background-color: rgb(60, 40, 34);"><section class="135brush" style="box-sizing: border-box; color: inherit; border-color: rgb(60, 40, 34);"><p style="box-sizing: border-box;border-color: rgb(60, 40, 34); line-height: normal; text-align: left;"><span style="border-color:rgb(60, 40, 34); font-size:24px; line-height:21px">Massimo Dutti</span></p><p style="box-sizing: border-box; color: inherit; border-color: rgb(60, 40, 34); line-height: normal;"><span style="background-color:rgb(60, 40, 34); display:inline !important; float:none; font-family:微软雅黑,microsoft yahei; font-size:12px; font-weight:inherit; line-height:1.2; text-decoration:inherit">2015S/S</span></p></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339936" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339936" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2293" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px none; margin: 0px; box-sizing: border-box; width: 100%; padding: 0px;"><section class="135bg" data-original-title="" style="box-sizing: border-box; width: 100%; height: 30em; color: inherit; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmJuOEqRjeedZ8Uen52icCiaauXKGnjiaYbgaT0fGyXd3NIbp6Iw07QBpoA/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;"></section><section style="margin: -23em auto 8em; box-sizing: border-box; width: 15em; height: 15em; border-radius: 50%; border: 0.2em solid rgb(245, 245, 244); color: inherit; background-color: transparent;"><section style="margin: 0.333em; box-sizing: border-box; line-height: 1; width: 14em; height: 14em; border-radius: 50%; text-align: center; padding-top: 3em;"><section style="width: 6em; line-height: 1; margin: 0px auto;overflow: hidden; text-overflow: ellipsis; font-size: 2em; color: rgb(123, 123, 111); box-sizing: border-box; border-color: rgb(245, 245, 244);"><section class="135brush" data-brushtype="text" style="color:rgb(255, 255, 255);">高山之间</section></section><section style="width: 90%; margin: 10px auto 0px; line-height: 1; vertical-align: middle; font-size: 1.2em; color: rgb(169, 169, 169); border-color: rgb(245, 245, 244); box-sizing: border-box; background-color: transparent;"><section style="display: inline-block; margin: 6px 0px; width: 1.6em; height: 0.2em; box-sizing: border-box; color: rgb(123, 123, 111); background-color: rgb(245, 245, 244);"></section><section style="display: inline-block; width: 4.5em; line-height: 1; overflow: hidden; text-overflow: ellipsis; font-size: 1.2em;"><section class="135brush" data-brushtype="text" style="color:rgb(255, 255, 255)">WALK</section></section><section style="display: inline-block; margin: 6px 0px; width: 1.6em; height: 0.2em; box-sizing: border-box; color: rgb(123, 123, 111); background-color: rgb(245, 245, 244);"></section></section><section style="width: 14em; height: 1.2em; margin: 1em auto 0px; font-size: 1em; overflow: hidden; text-overflow: ellipsis; line-height: 1;"><p class="135brush" data-brushtype="text" style="color:rgb(255, 255, 255);">行走在尽头</p></section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339934" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339934" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2280" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;"><section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.1em 0px 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmNHvTD90ynpK3Lksm9f37wNQXVVal467BrdJo0jQYKibnX8QFeRicKM5A/0" style="box-sizing:border-box; height:auto !important; width:100%"><section class="135brush" data-style="color:rgb(102, 102, 102); font-size:14px; text-align:inherit; text-decoration:inherit"><p style="color:rgb(102, 102, 102); font-size:14px; text-align:inherit; text-decoration:inherit">① Wood Lamp Design</p></section></section><section style="box-sizing: border-box; width: 50%; float: right; padding: 0px 0px 0px 0.1em;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZme9m5dQT4J3TD3STxe7BmvvoOtVPS1iaxbv0liabnmly8mzicYdOMjrxcg/0" style="box-sizing:border-box; height:auto !important; width:100%"><section class="135brush" data-style="color: rgb(102, 102, 102); font-size: 14px; font-weight: inherit; text-align: inherit; text-decoration: inherit; line-height: inherit;"><p style="color: rgb(102, 102, 102); font-size: 14px; font-weight: inherit; text-align: inherit; text-decoration: inherit; line-height: inherit;">② Wood Lamp Design</p></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339933" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339933" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2302" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(107, 77, 64); padding: 0px; width: 100%; clear: both; overflow: hidden; box-sizing: border-box;"><img alt="" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmtbXArsicSpVa4wB37E9N38R06ia5asicKtFib0URujQBE0LCd3ppictbvNQ/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%" title="" vspace="0" border="0"><section style="box-sizing: border-box; width: 50%; float: left; border: 0px rgb(107, 77, 64); padding: 0.5em; color: inherit;"><section style="box-sizing: border-box; color: inherit;"><span style="background-color:rgb(107, 77, 64); border-color:rgb(107, 77, 64); box-sizing:border-box; color:rgb(224, 209, 202); display:inline-block; float:left; font-size:1em; font-weight:inherit; height:1.2em; line-height:1.2; margin:3px 7px 0px 0px; padding:0px 0.1em; text-align:center; text-decoration:inherit; text-shadow:0px 1px; vertical-align:bottom; width:1.2em">↑ </span></section><section style="box-sizing: border-box; color: rgb(107, 77, 64);"><span style="box-sizing:border-box; color:inherit; font-size:0.9em; font-weight:inherit; line-height:1.4em; text-align:inherit; text-decoration:inherit">图片说明 </span></section></section><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmOUbgwuadf9daqfrR7vVtn7tGA5uwib6G34w6yVDnBxQ5ISbyfQCd6oA/0" style="box-sizing:border-box; color:inherit; float:right; height:auto !important; width:50%"><section style="box-sizing: border-box; width: 50%; float: left; border: 0px rgb(107, 77, 64); padding: 0.5em; color: inherit;"><section style="box-sizing: border-box; color: inherit;"><span style="background-color:rgb(107, 77, 64); border-color:rgb(107, 77, 64); box-sizing:border-box; color:rgb(224, 209, 202); display:inline-block; float:left; font-size:1em; font-weight:inherit; height:1.2em; line-height:1.2; margin:3px 7px 0px 0px; padding:0px 0.1em; text-align:center; text-decoration:inherit; text-shadow:0px 1px; vertical-align:bottom; width:1.2em">→ </span></section><section style="box-sizing: border-box; color: rgb(107, 77, 64);"><span style="box-sizing:border-box; color:inherit; font-size:0.9em; font-weight:inherit; line-height:1.4em; text-align:inherit; text-decoration:inherit">图片说明 </span></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339932" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339932" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2311" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; margin: 0px; box-sizing: border-box; width: 100%; clear: both; padding: 0px;"><section style="box-sizing: border-box;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm9E2HfpdyoaAfRGRpribxme1ZNaaQKQ5U0H4BNsDSGk8uvhXFk8jWE5g/0" style="box-sizing:border-box; height:auto !important; width:100%" title="" vspace="0"><section style="margin-top: 0.5em; width: 100%;  box-sizing: border-box;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmzNC9x9NMF8OUyaenv8TAknRiaOdu04IomYceibADPrGRcrwWlR6AI52Q/0" style="box-sizing:border-box; float:left; height:auto !important; width:49%" title="" vspace="0"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmNtQJxtmBmib6yRDqunzMWOMEcXkda3QjicA6BIkPGU0BIsPkRgU5Bgiag/0" style="box-sizing:border-box; float:right; height:auto !important; width:49%" title="" vspace="0"></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339930" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339930" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2329" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(11, 6, 2); margin: 0px; box-sizing: border-box; width: 100%; clear: both; padding: 0px;"><section class="135bg" style="width: 100%; height: 14.5em; box-sizing: border-box; color: inherit; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm7vsqUYJudhDibnb5iaQicxT8LKq1I4a6UUxF7FGpHg6dE1tMOjaGTYMuA/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;"></section><section class="135bg" style="margin-top: 0.5em; width: 100%; height: 15em; box-sizing: border-box; color: inherit; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmXzrwo7nFMk7YwWMEg19NN861RZVxjrj26om2Y3egBhW71UtP6kI1icg/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;"></section><section style="float: left; margin: -21em 0px 13em 1em; width: 8em; height: 8em; padding-top: 2em; border-radius: 50%; box-sizing: border-box; color: rgb(255,255,255); opacity: 0.6; border-color: rgb(11, 6, 2); background-color: rgb(11, 6, 2);"><section style="width: 50%; margin: auto; line-height: 1; font-size: 2em; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: inherit; box-sizing: border-box; border-color: rgb(11, 6, 2);"><section style="box-sizing: border-box; color: rgb(255, 255, 255); border-color: rgb(11, 6, 2);"><section class="135brush" data-brushtype="text" data-style="color:rgb(255, 255, 255);font-size: 1em"><p style="color:rgb(255, 255, 255);font-size: 1em">永恒</p></section></section></section></section><section style="float: right; margin: -17em 1em 9em 0px; width: 8em; height: 8em; padding-top: 2em; border-radius: 50%; box-sizing: border-box; opacity: 0.6; color: rgb(218, 125, 50); border-color: rgb(11, 6, 2); background-color: rgb(11, 6, 2);"><section style="width: 50%; margin: auto; line-height: 1; font-size: 1em; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: inherit; box-sizing: border-box; border-color: rgb(11, 6, 2);"><section class="135brush" data-brushtype="text" style="box-sizing: border-box; color:rgb(255,255,255); border-color: rgb(11, 6, 2);">不管未来有多远成长的路上有你有我</section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339928" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339928" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2324" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(60, 40, 34); padding: 0px; width: 100%; clear: both; overflow: hidden; box-sizing: border-box;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm0E9ykBE5HFzltmboVJSqOUu1Lh30oZjniaibYsllyXFekZvRJoV202nw/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%" title="" vspace="0"><section style="box-sizing: border-box; width: 50%; float: left; border: 0px rgb(60, 40, 34); padding: 0.5em; color: inherit;"><section style="box-sizing: border-box; color: inherit;"><span class="135title" style="background-color:rgb(60, 40, 34); border-color:rgb(60, 40, 34); box-sizing:border-box; color:rgb(197, 163, 152); display:inline-block; float:left; font-size:1em; font-weight:inherit; height:1.2em; line-height:1.2; margin:3px 7px 0px 0px; padding:0px 0.1em; text-align:center; text-decoration:inherit; text-shadow:0px 1px; vertical-align:bottom; width:1.2em">↑ </span></section><section style="box-sizing: border-box; color: inherit;"><span class="135brush" data-brushtype="text" style="box-sizing:border-box; color:inherit; font-size:0.9em; font-weight:inherit; line-height:1.4em; text-align:inherit; text-decoration:inherit">夕阳西下 </span></section></section><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmVPlup2fXtAGRpgyF7DpP55Se1s8hgCClpnCvpfk5ViaEwiaWXBgeysOQ/0" style="box-sizing:border-box; color:inherit; float:right; height:auto !important; width:50%"><section style="box-sizing: border-box; width: 50%; float: left; border: 0px rgb(60, 40, 34); padding: 0.5em; color: inherit;"><section style="box-sizing: border-box; color: inherit;"><span class="135title" style="background-color:rgb(60, 40, 34); border-color:rgb(60, 40, 34); box-sizing:border-box; color:rgb(197, 163, 152); display:inline-block; float:left; font-size:1em; font-weight:inherit; height:1.2em; line-height:1.2; margin:3px 7px 0px 0px; padding:0px 0.1em; text-align:center; text-decoration:inherit; text-shadow:0px 1px; vertical-align:bottom; width:1.2em">→ </span></section><section style="box-sizing: border-box; color: inherit;"><span class="135brush" data-brushtype="text" style="box-sizing:border-box; color:inherit; font-size:0.9em; font-weight:inherit; line-height:1.4em; text-align:inherit; text-decoration:inherit">断肠人在天涯 </span></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339927" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339927" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2339" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(226, 86, 27); margin: 0px; box-sizing: border-box; width: 100%; clear: both; padding: 0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhRIJq1Gk6AjAJ8QQmEu2VaIHZsmYsqeBOOXpfJ3h5kDxia2ZYRsEiblsMdibS24RIYhw2oV9aSRMickw/0" style="box-sizing:border-box; color:inherit; display:block; width:100%" title="" vspace="0"><section style="display: inline-block; width: 100%; margin-top: -10em; box-sizing: border-box; color: inherit;"><section class="135brush" style="float: right; margin: -12em 1em 4em 0px; padding: 0.5em; width: 8em; height: 8em; border-radius: 50%; text-align: center; display: table; box-sizing: border-box; color: rgb(255, 254, 253); border-color: rgb(226, 86, 27); background-color: rgb(226, 86, 27);"><section style="display: table-cell; vertical-align: middle; width: 100%; line-height: 1.2; font-size: 1.2em; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: inherit; box-sizing: border-box; border-color: rgb(226, 86, 27);"><p style="box-sizing: border-box; color: inherit; border-color: rgb(226, 86, 27);"><span style="border-color:rgb(226, 86, 27); color:inherit; font-size:20px">&nbsp;&nbsp;</span><span style="border-color:rgb(226, 86, 27); color:inherit; font-size:18px"><span style="border-color:rgb(226, 86, 27); color:inherit">VINTAGE</span>&nbsp; </span>&nbsp;&nbsp;</p><p style="box-sizing: border-box; color: inherit; border-color: rgb(226, 86, 27);">- 日系 &nbsp;-</p></section></section><section style="float: left; margin: -18em 1em 6em 0px; width: 12em; height: 12em; border-radius: 50%; border: 0.2em solid rgb(226, 86, 27); text-align: center; box-sizing: border-box; color: inherit; background-color: rgba(255, 255, 255, 0);"><section class="135bg" data-original-title="" style="width: 100%; height: 100%; border-radius: 50%; box-sizing: border-box; color: inherit; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhRIJq1Gk6AjAJ8QQmEu2VaWYWib8P4u1CoAicOxiboxSTKTAyQynibgN665f2p4gUFEF8tp9Ivp6AQ3w/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;" title=""></section></section></section></fieldset><p></p>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339922" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339922" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2356" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: medium none rgb(239, 112, 96); padding-top: 1em; padding-left: 5px; font-size: 1em; font-weight: bolder; text-align: center; text-decoration: inherit; margin: 10px;"><section class="135bg" style="margin: 10px 0px; border-radius: 100%; float: left; color: inherit; border-color: rgb(239, 112, 96); background-image: url(&quot;https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmBCRX4RBwicdW60RoGoJIZD3PQZSx10ASC2FGqGv8NaiaKNrMGtU8QPnQ/0&quot;); background-size: cover; background-position: 63% 37%; background-repeat: no-repeat; height: 9em; width: 9em;"></section><section style="text-align: right; vertical-align: top; float: right; font-weight: 100; color: inherit; border-color: rgb(239, 112, 96);"><section class="135brush" data-brushtype="text" style="display: inline-block; vertical-align: top; margin-left: 1em; width: 1.2em; line-height: 1.2; font-weight: inherit; text-align: left; text-decoration: inherit; color: inherit; float: right; border-color: rgb(239, 112, 96); font-size: 1.2em;">茶语</section><section class="135brush" data-style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);" style="float:right;"><p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);">小桥小店沽洒，</p><p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);">初火新烟煮茶。</p></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339918" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339918" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2353" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="width: 100%; border: none; text-align: center; margin-top: 0.5em; padding: 0px 0.5em; box-sizing: border-box; background-color: transparent;"><section class="135bg" style="display: inline-block; width: 4.5em; height: 4.5em; border-radius: 100%; box-sizing: border-box; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmDdUYuaX4UGF9vEzzXicxNicYdb44HkFxFGuBqbreTWH3yUuefNBlITHA/0); background-color: transparent; background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;"></section><section class="135bg" data-original-title="" style="display: inline-block; width: 4.5em; height: 4.5em; margin-left: 1em; border-radius: 100%; float: left; box-sizing: border-box; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmA7aHuAXd98QzVFoADWribCvcF0jKpfAL1ZMLM5DMOLx62iay59y3Mqiaw/0); background-color: transparent; background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;" title=""></section><section class="135bg" style="display: inline-block; width: 4.5em; height: 4.5em; margin-right: 1em; border-radius: 100%; float: right; box-sizing: border-box; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmqTuico5jTUOCODpx3xxPItXhaBxqiaCDtTIExZkspCU25JuDx9AEI5Nw/0); background-color: transparent; background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;"></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339917" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339917" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2363" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: none rgb(162, 161, 160); margin: 3em 0px 3em 5%; width: 95%; text-align: center; box-sizing: border-box; padding: 0px; color: inherit;"><section style="width: 90%; height: 100%; margin: 0px auto; box-sizing: border-box; color: inherit;"><section style="width: 90%; height: 20em; border: 1px solid rgb(162, 161, 160); -webkit-transform: rotate3d(0, 0, 1, 2deg); box-shadow: rgb(204, 204, 200) 1px 1px 1px; box-sizing: border-box; color: inherit;"></section><section style="width: 90%; height: 20em; border: 1px solid rgb(162, 161, 160); margin-top: -21em; box-shadow: rgb(204, 204, 200) 1px 1px 1px; margin-left: -1em; -webkit-transform: rotate3d(0, 0, 1, -3deg); box-sizing: border-box; color: inherit;background-color:rgb(255,255,255)"><section class="135bg" style="width: 90%; height: 85%; margin: 5%; box-sizing: border-box; color: inherit; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmbgMNyLy3qGjG4xvPicobUjy72gxMrQjdicGSsgx5dJf43nW61h8ZPiagA/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;"></section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339916" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339916" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2360" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: none rgb(33, 33, 34); margin: 0.3em 0px; padding-bottom: 1.5em; font-weight: inherit; text-align: center; text-decoration: inherit; box-sizing: border-box; color: inherit; background-color: transparent;"><section class="135bg" style="font-size: 1em; display: inline-block; width: 8em; height: 8em; border-radius: 50%; float: left; vertical-align: middle; box-sizing: border-box; color: inherit; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmhsP0kAoLZnRibBVtOvxTSPw9ziaNEtx8ThPLtsMfJ3g3rIKk722MzLgA/0); background-color: transparent; background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;"></section><section style="display: inline-block; border-left-width: 1px; border-left-style: solid; border-color: rgb(33, 33, 34); height: auto; width: 55%; margin-top: 1em; padding-left: 1em; vertical-align: middle; box-sizing: border-box; font-weight: inherit; text-align: left; text-decoration: inherit; color: inherit; background-color: transparent;"><section style="width: 100%; vertical-align: top; overflow: hidden; box-sizing: border-box; color: inherit;"><section class="135brush" data-brushtype="text" style="color:inherit; font-size:24px;margin-bottom:1.5em;">LOMO</section></section><section style="width: 100%; vertical-align: bottom; line-height: 1.5em; overflow: hidden; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; color: inherit;"><section class="135brush" data-style="border-color:rgb(33, 33, 34); color:rgb(33, 33, 34); font-family:arial,verdana,tahoma,lucida grande,arial,sans-serif; font-size:13px; letter-spacing:1px; line-height:25px" style="box-sizing: border-box; color: inherit;"><p style="border-color:rgb(33, 33, 34); color:rgb(33, 33, 34); font-family:arial,verdana,tahoma,lucida grande,arial,sans-serif; font-size:13px; letter-spacing:1px; line-height:25px">生活不可能像你想象得那么好，但也不会像你想象得那么糟。</p></section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339913" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339913" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2392" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: none; margin: 0.8em 0px 0.3em; box-sizing: border-box; padding: 0px;"><section style="line-height: 0; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmTRklnQU6b8uD81kef2dtFHurhJEsWm24dI0TiaAdD0WFt46A7Er1QOw/0" style="border:0px; box-sizing:border-box; display:inline-block; height:auto !important; width:100%"></section><section style="width: 30%; display: inline-block; float: left; text-align: right; margin: 15px 0px 0px; padding: 0px; box-sizing: border-box;"><section style="float: right; text-align: center; margin-top: -15px; box-sizing: border-box;"><section style="width: 1px; height: 1.2em; margin-left: 50%; background-color: rgb(102, 102, 102); box-sizing: border-box;"></section><section style="width: 2em; height: 2em; border: 1px solid rgb(102, 102, 102); border-radius: 50%; line-height: 2em; font-size: 1em;font-weight: inherit; text-decoration: inherit; box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box;">简</section></section><section style="width: 2em; height: 2em; border: 1px solid rgb(102, 102, 102); margin-top: 2px; border-radius: 50%; line-height: 2em; font-size: 1em;  font-weight: inherit; text-decoration: inherit; box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="box-sizing: border-box;">单</section></section></section></section><section style="width: 65%; float: left; margin-top: 20px; line-height: 1.5em; margin-left: 5%; padding: 0px; font-size: 1em;  font-weight: inherit; text-decoration: inherit; color: rgb(39, 44, 51); box-sizing: border-box;"><section style="box-sizing: border-box;"><section class="135brush" data-brushtype="text" style="box-sizing:border-box; font-size:175%;margin:5px 0px">Cafe</section><section class="135brush" data-brushtype="text" style="box-sizing: border-box;font-size:16px">伟提尼亚记忆</section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339911" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339911" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="2390" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(107, 77, 64); text-align: center; margin: 0.8em 0px 0.5em; box-sizing: border-box; padding: 0px;"><section style="color: rgb(107, 77, 64); display: inline-block; width: 1em; font-size: 2.5em; font-weight: inherit; line-height: 1em; vertical-align: top; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(107, 77, 64);"><section class="135brush" data-brushtype="text" style="box-sizing: border-box; color: inherit; border-color: rgb(107, 77, 64);">两字</section></section><section class="135title" style="display: inline-block; margin-left: 0.5em; margin-top: 0.2em; text-align: left; box-sizing: border-box; color: inherit;"><section style="box-sizing: border-box; color: inherit;"><section class="135brush" data-brushtype="text" style="background-color:rgb(107, 77, 64); border-color:rgb(107, 77, 64); box-sizing:border-box; color:rgb(224, 209, 202); display:inline-block; font-size:2em; font-weight:inherit; line-height:1; padding:0.1em; text-align:inherit; text-decoration:inherit">副标题1</section></section><section style="color: rgb(107, 77, 64); margin: 0.5em 0px; font-size: 1.5em; line-height: 1em; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(107, 77, 64);"><section class="135brush" data-brushtype="text" style="box-sizing: border-box; color: inherit; border-color: rgb(107, 77, 64);">副标题2</section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339908" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339908" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="2446" title="点击插入此内容">
									<section class="135editor">
										<section style="padding: 0px 8px; border-left-width: 3px; border-left-style: solid; border-color: rgba(163, 163, 163, 0.843137); font-size: 22px; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box;"><section style="line-height: 1.4; box-sizing: border-box; color: inherit;"><section class="135brush" data-brushtype="text" style="border-color: rgb(117, 117, 118); color: rgb(117, 117, 118); font-size: 20px;">标题</section></section><section class="135brush" data-style="border-color: rgb(117, 117, 118); color: inherit; font-size: 12px;" style="color: rgb(117, 117, 118); line-height: 1.4; margin-top: 5px; padding-left: 3px; font-size: 14px; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(117, 117, 118);"><p style="border-color: rgb(117, 117, 118); color: inherit; font-size: 12px;">内容描述</p></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339906" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339906" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2449" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: medium none rgb(239, 112, 96); font-size: 1em; font-weight: bolder; text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); background-color: rgb(239, 112, 96); margin: 0.5em 0px; padding: 1.5em;"><section class="135bg" style="width: 8em; height: 8em; margin: 10px 0px; border-radius: 100%; float: left; color: inherit; border-color: rgb(239, 112, 96); background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmwmKK3YKSwPoDnboWaRWo4XbYc2TjPb531uNhiatfds4nbaQib9kHM2fw/0); background-size: cover; background-position: 63% 37%; background-repeat: no-repeat;"></section><section style="text-align: right; vertical-align: top; float: right; font-weight: 100; color: inherit; border-color: rgb(239, 112, 96);"><section class="135brush" data-brushtype="text" style="display: inline-block; vertical-align: top; margin-left: 1em; width: 1.2em; line-height: 1.2; font-size: 1.2em; font-weight: inherit; text-align: left; text-decoration: inherit; color: inherit; float: right; border-color: rgb(239, 112, 96);">列举</section><section class="135brush" data-style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);" style="float:right;"><p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);">竖向文字排版</p><p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);">每列为一个段落</p><p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);">每个段落的文字不要太多</p></section></section><p></p></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339903" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339903" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="2409" title="点击插入此内容">
									<section class="135editor">
										<section class="135brush" style="padding: 10px; border: 1px solid rgb(248, 247, 245); font-size: 14px; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(51, 51, 51); background-color: rgb(248, 247, 245); box-sizing: border-box;">请输入文字，居中显示<br style="box-sizing: border-box;">请注意每行字数。<p>最好<span style="font-weight:inherit; line-height:1.5em; text-decoration:inherit">能</span></p><p>体现出你的个性</p><p>好好发挥你的创意吧~</p></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339901" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339901" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="2484" title="点击插入此内容">
									<section class="135editor">
										<section style="margin:10px 15%;"><h2 class="135brush" data-brushtype="text" placeholder="请输入标题" style="font-size: 16px; margin: 10px 0px; padding: 10px; max-width: 100%; border-top-style: solid; border-top-width: 1px; border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 1px; line-height: 25px; color: rgb(33, 33, 34); text-align: center; border-color: rgb(33, 33, 34);">假如。。。</h2><p style="text-align:right; color: inherit;"><span class="135brush" data-brushtype="text" style="border-color:rgb(33, 33, 34); color:rgb(33, 33, 34)">作者：135程序猿</span></p><section class="135brush" data-style="font-size:14px;text-align:center" style="line-height: 25px; color: inherit;"><p style="color: inherit;"></p><p style="color: inherit;"></p><p style="color: inherit; text-align: center;">假如你每天使用135编辑器</p><p style="color: inherit; text-align: center;">编辑微信群发消息</p><p style="color: inherit;"></p><p style="color: inherit; text-align: center;">平均每天约节省半小时，</p><p style="color: inherit; text-align: center;">每月节省10多个小时。</p><p style="color: inherit;"></p><p style="color: inherit; text-align: center;">当然</p><p style="color: inherit; text-align: center;">更重要的是用的舒心</p><p style="color: inherit; text-align: center;">愉悦的体验</p><p style="color: inherit; text-align: center;">以及</p><p style="color: inherit; text-align: center;">最后得到的赏心悦目的图文</p><p style="color: inherit;"></p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339899" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339899" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="2490" title="点击插入此内容">
									<section class="135editor">
										<section style="border: 3px solid rgb(255, 129, 36); padding: 5px;"><section data-bcless="lighten" style="border: 1px solid rgb(255, 158, 87); padding: 15px; text-align: center; color: inherit;"><p class="135title" style="color: inherit;">135编辑器</p><p style="color:inherit; font-size:24px"><strong style="color:inherit"><span class="135brush" style="color:inherit; font-size:24px">操作方便才是硬道理</span></strong></p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339898" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339898" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="2497" title="点击插入此内容">
									<section class="135editor">
										<section class="135title" style="float: left; margin:0 15px 10px;color: inherit;"><p style="color: inherit;line-height:72px;"><span style="color:rgb(95, 156, 239); font-size:72px">08</span></p><p style="color:#999;"><span style="color:inherit; font-size:24px">Jan,2015</span></p></section><section style="margin: 24px 5px -20px -8px; padding: 0px; border-right-width: 5px; border-left-width: 0px; border-right-style: solid; border-right-color: rgb(95, 156, 239); border-left-color: rgb(95, 156, 239); display: inline-block; max-width: 100%; height: 5px; width: 5px; vertical-align: top; float: left;  border-bottom-width: 5px !important; border-top-style: solid !important; border-bottom-style: solid !important; border-top-color: transparent !important; border-bottom-color: transparent !important; word-wrap: break-word !important; box-sizing: border-box !important;"></section><section class="135brush" data-brushtype="text" style="margin-left: 125px; line-height: 1.75em; color: rgb(255, 255, 255); padding: 15px; border-radius: 5px; background: rgb(95, 156, 239);"><span style="font-size:14px">提子135平台是一个互联网运营平台，为运营者提供图文编辑工具，运营经验，收录公众号，定制开发微网站等服务，让运营更轻松高效。</span></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339897" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339897" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="2561" title="点击插入此内容">
									<section class="135editor">
										<section data-clessp="70%" style="padding: 20px; margin-left: auto; margin-right: auto; margin-top: 10px; color: rgb(255, 255, 255); background: rgb(159, 136, 127);"><section data-bcless="true" data-bclessp="70%" style="border: 2px solid rgb(255, 255, 255); height: 8px; border-radius: 99px; box-sizing: border-box; color: inherit;"><section data-bgless="true" data-bglessp="70%" style="width: 15%; height: 100%; color: rgb(128, 128, 128); border-color: rgb(159, 136, 127); background-color: rgb(255, 255, 255);"></section></section><section style="margin: 5px auto; font-size: 85%; color: inherit;"><section class="135brush" data-brushtype="text" style="float: right; color: inherit;">剩余 <span class="days-left" style="color:inherit">6</span> 天</section><section class="135brush" data-brushtype="text" style="color: inherit;">已进行<span class="current-amount" style="color:inherit">15%</span></section></section><p style="color: inherit;"></p><section class="135brush" style="font-size: 14px; color: inherit;"><p style="color: inherit;">使用说明： 如要修改进度条的进度，请点击工具条左上角的“html”按钮，然后查找 “width: 15%;”,将15修改成对应的百分比数字即可。</p><p style="color: inherit;"></p><p style="color: inherit;"><span style="color:inherit; line-height:1.5em">以下是更多文字内容</span></p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339892" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339892" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="2527" title="点击插入此内容">
									<section class="135editor">
										<section class="135bg" style="padding:20px;margin-left: auto;margin-right: auto;margin-top: 10px;background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZmBEz2ztYStjwljjJEfakqX1WFDPIClDC5LwE2fmWia9iaxjONRHK9mniag/0);background-size: auto;background-position: 49% 50%;background-repeat: no-repeat;color:#FFF"><section style="border: 2px solid rgb(33, 33, 34); height: 8px; border-radius: 99px; box-sizing: border-box; color: inherit;"><section style="width: 15%; height: 100%; color: inherit; border-color: rgb(33, 33, 34); background-color: rgb(33, 33, 34);"></section></section><section style="margin: 5px auto; font-size: 85%; color: inherit;"><section style="float: right; color: inherit;"><span class="135brush" data-brushtype="text" style="color:rgb(38, 38, 38)">剩余 6 天</span></section><section style="color: inherit;"><span class="135brush" data-brushtype="text" style="color:rgb(38, 38, 38)">已进行&nbsp;15%</span></section></section><p style="color: inherit;"></p><section class="135brush" data-style="color:rgb(38, 38, 38)" style="color: inherit;"><p style="color: inherit;"><span style="color:rgb(38, 38, 38)">使用说明： 如要修改进度条的进度，请点击工具条左上角的“html”按钮，然后查找 “width: 15%;”,将15修改成对应的百分比数字即可。</span></p><p style="color: inherit;"></p><p style="color: inherit;"><span style="color:rgb(38, 38, 38)">以下是更多文字内容</span></p></section></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339891" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339891" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="2665" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(33, 33, 34); margin: 0.5em 0px; padding: 0px; box-sizing: border-box;"><section style="width: 90%; margin-left: 5%; height: 100%; border: 1px solid rgb(33, 33, 34); border-radius: 0px 5px 5px 0px; font-size: 1em; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(33, 33, 34); box-sizing: border-box; background-color: rgb(255, 255, 255);"><section style="margin-top: -1px; float: left; margin-right: 8px; margin-left: -8px; font-size: 0.8em; font-style: inherit; font-weight: inherit; text-decoration: inherit; color: inherit; border-color: rgb(33, 33, 34); box-sizing: border-box; background-color: transparent;"><section style="box-sizing: border-box; color: inherit; border-color: rgb(33, 33, 34);"><span style="background-color:rgb(33, 33, 34); border-radius:0px 0em 0em 0px; box-sizing:border-box; color:rgb(255, 255, 255); display:inline-block; font-size:1em; padding:0.3em 0.5em"><span class="135brush" data-brushtype="text" style="color:inherit; font-size:16px">请输入内容</span> </span></section><section style="width: 0px; border-right-width: 4px; border-right-style: solid; border-right-color: rgb(33, 33, 34); border-top-width: 4px; border-top-style: solid; border-top-color: rgb(33, 33, 34); box-sizing: border-box; color: inherit; height: 4px; border-left-width: 4px !important; border-left-style: solid !important; border-left-color: transparent !important; border-bottom-width: 4px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important;"></section></section><section style="margin-top: 5%; padding: 0px 8px; font-size: 1.5em; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box; color: inherit; border-color: rgb(33, 33, 34);"><section class="135brush" data-brushtype="text" style="box-sizing: border-box; color: inherit; border-color: rgb(33, 33, 34);">请输入标题请输入标题请输入</section></section><section class="135brush" style="padding: 8px; box-sizing: border-box; color: inherit; border-color: rgb(33, 33, 34);"><section style="box-sizing: border-box; color: inherit; border-color: rgb(33, 33, 34);">请输入文字<br style="box-sizing: border-box; color: inherit; border-color: rgb(33, 33, 34);">请输入文字<br style="box-sizing: border-box; color: inherit; border-color: rgb(33, 33, 34);">请输入文字<br style="box-sizing: border-box; color: inherit; border-color: rgb(33, 33, 34);">请输入文字</section></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339889" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339889" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="2845" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;"><section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.1em 0px 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgOiaYOTqESWT5q8TRibbhbZm6ZECicFy1ClkfGv6HRaN5Bg08vaPLSe9fUcEeMZUHIjV4okOwY8yuwA/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important"></section><section class="135brush" data-style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 50%; box-sizing: border-box; float: left; padding: 0px 0px 0px 1.0em;"><p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">我希望</span></p><p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">每一个时刻</span></p><p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">都象彩色蜡笔那样美丽</span></p><p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">我希望</span></p><p style="margin-right: 0.5px;font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">能在心爱的白纸上画画</span></p><p style="margin-right: 0.5px;font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">画出笨拙的自由</span></p><p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">画下一只</span></p><p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">永远不会流泪的眼睛</span></p><p style="margin-right: 2px; font-weight: bold; color: rgb(52, 54, 60); text-align: right;">—— 顾城</p></section></fieldset>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339886" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339886" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-151-brush tagtpl-151" data-id="2861" title="点击插入此内容">
									<section class="135editor">
										<section style="font-size: 15px; border: 1px solid rgb(129, 128, 129); padding: 10px 5px 5px; min-height:auto; color: inherit;"><fieldset style="border: 0px rgb(129, 128, 129); box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px; color: inherit;"><section style="box-sizing: border-box; width: 50%; float: left; padding: 0.1px 0.1em 0px 0px; color: inherit;"><img src="http://a4.att.hudong.com/63/55/01300000316692123961558654676.jpg" style="box-sizing:border-box; color:inherit; height:auto !important; visibility:visible !important; width:100% !important"></section><section style="display: inline-block; width: 50%; box-sizing: border-box; float: left; padding: 0px 0px 0px 1em; color: inherit;"><section style="margin-right: 0.5px; padding: 10px 3px 0px; font-size: 1.2em; font-weight: bold; color: rgb(129, 128, 129);"><span class="135brush" data-brushtype="text" style="color:inherit; font-family:inherit">鲁迅</span></section><section style="box-sizing: border-box; margin-right: 0em; padding: 0.1em 0.3em; color: rgb(129, 128, 129); font-size: 0.9em;"><span class="135brush" data-brushtype="text" style="color:inherit; font-family:inherit">原名周树人</span></section><section class="135brush" style="box-sizing: border-box; margin-right: 0em; padding: 0.5em 0.1em 0.5em 0.3em; color: rgb(129, 128, 129); font-size: 0.9em;"><span style="color:rgb(0, 0, 0); font-family:inherit">中国现代伟大的文学家、思想家和革命家。以笔代戈，奋笔疾书，被誉为“民族魂”。</span></section></section></fieldset></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339884" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339884" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="2873" title="点击插入此内容">
									<section class="135editor">
										<section style="font-size: 14px; text-align: left; text-decoration: inherit; color: rgb(255, 255, 255); background-color: rgb(255, 70, 31); border-color: rgb(255, 70, 31); box-sizing: border-box;"><section style="background-image: repeating-linear-gradient(135deg, transparent, transparent 4px, rgb(248, 247, 245) 4px, rgb(248, 247, 245) 12px); margin: 0px; padding: 16px 16px; white-space: normal; box-sizing: border-box;"><section class="135brush" data-style="font-size:16px;weight:bold" style="margin-top: 0px; padding: 8px; background-color: rgb(248, 248, 248); box-sizing: border-box; color:rgb(255, 70, 31);"><p><span style="font-size:16px"><strong><span style="color:rgb(255, 70, 31); font-family:inherit">大家在使用135编辑器过程中，如果发现任何问题，请联系管理员，我们将及时为您解决！</span></strong></span></p></section></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339879" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339879" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative; display: block;" class="fav-style  col-xs-12 brush mix tagtpl-107-brush tagtpl-107" data-id="2876" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="border: 0px rgb(255, 129, 36); margin: 0.5em 0px 0.5em; box-sizing: border-box; padding: 0px;"><section style="display: inline-block; width: 1.6em; height: 1.6em; border-top-left-radius: 50%; border-top-right-radius: 50%; border-bottom-right-radius: 50%; border-bottom-left-radius: 50%;font-size:3em; line-height: 1.5;text-align: center; text-decoration: inherit; color: rgb(255, 255, 255); background-color: rgb(255, 129, 36); border-color: rgb(255, 129, 36); box-sizing: border-box;"><span class="135brush" data-brushtype="text" style="font-family:微软雅黑,microsoft yahei">字</span></section><section style="display: inline-block; margin-left: 0.7em; margin-top:2px;padding: 0.6em 0px; box-sizing: border-box; color: inherit;"><section style="line-height: 1.4; font-size: 1.5em; text-align: inherit; text-decoration: inherit; color: rgb(255, 129, 36); box-sizing: border-box;"><span class="135brush" data-brushtype="text" style="font-family:inherit">135●编辑器</span></section><section style="line-height: 1.4; margin-left: 0.2em; font-size: 1em; text-align: inherit; text-decoration: inherit; color: rgb(255, 129, 36); box-sizing: border-box;"><span class="135brush" data-brushtype="text" style="color:inherit">online-editor</span></section></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339877" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339877" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="3066" title="点击插入此内容">
									<section class="135editor">
										<blockquote class="135bg" style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: cover; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiaB5wTN4rt8SiaLwWPOGjzszJvNaSYKG2Fiakb8xs5N8L7icCluKGiaTibKtnTQRkL6rOBfSXia31pTMOaw/0);">
<p style="text-align: center; color: inherit;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; text-align: center; box-sizing: border-box !important;">&nbsp;</p>

<section class="135brush" style="color:#FFFFFF">
<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;"><span><span style="font-size:18px"><span style="line-height:1.5em">居家小屋样式，使用本样式请注意图片高度。。</span></span></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>
</section>
</blockquote>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; box-sizing: border-box !important;">&nbsp;</p>
									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339875" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339875" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="3052" title="点击插入此内容">
									<section class="135editor">
										<blockquote class="135bg" style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: cover; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiaB5wTN4rt8SiaLwWPOGjzsz00t8qibibYMxV7vxJvA80XReHDajF0cqmLWMibicUuzlEXRpvGukdOVSxA/0);">
<section class="135brush" style="color:#ffffff">
<p style="text-align: center; color: inherit;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; text-align: center; box-sizing: border-box !important;"><span style="font-size:18px"><strong>雪花动态背景样式，请输入文字</strong></span></p>
</section>
</blockquote>
									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339874" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339874" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-111-brush tagtpl-111" data-id="3063" title="点击插入此内容">
									<section class="135editor">
										<section class="135editor"><section class="135editor"><blockquote style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: cover; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiaB5wTN4rt8SiaLwWPOGjzszyGJS6aicqnqia2piblb1NibH0yj6nnkjVnAddS0NAn7HDc4lkc5AtGWDxw/0);"><section class="135brush" style="color:#ffffff"><p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; text-align: center; box-sizing: border-box !important;"><span style="font-size:18px"><strong>浪漫蒲公英动态背景样式，请输入文字</strong></span></p><p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; text-align: center; box-sizing: border-box !important;"></p><p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; text-align: center; box-sizing: border-box !important;"></p><p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 1.75em; text-align: center; box-sizing: border-box !important;"></p></section></blockquote></section></section>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339873" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339873" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="3245" title="点击插入此内容">
									<section class="135editor">
										<section style="line-height: 1.4; text-align: left; margin-right: 10px; color: inherit;"><fieldset style="border: 30px solid rgb(249, 110, 87); border-image-source: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiaXAGReq0PiaE33xf7P0eJF6SX0icwvExccQcYRc9Eko1eual8YSJkMc58EYGiaVQVSWylYw7tWvX3lA/0); border-image-slice: 55; margin-top: 1em; font-size: 16px; text-decoration: none; color: rgb(135,197,253); line-height: 1.4; text-align: left;"><section class="135brush" data-style="font-family:inherit; font-size:14px"><p style="font-family:inherit; font-size:14px">边框样式的修改方法其实很简单，更换边框图片后，需要调整的数据为：border和border-image-slice这两个数字。不过图片最好是透明的png图片，否则边框可能出现白色背景</p></section></fieldset></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339872" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339872" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="3088" title="点击插入此内容">
									<section class="135editor">
										<fieldset style="margin: 5px 0px; padding: 5px; max-width: 100%; color: rgb(62, 62, 62); white-space: normal; border: 1px solid rgb(204, 204, 204); font-family: inherit; font-size: 13px; box-shadow: rgb(165, 165, 165) 5px 5px 2px; background-color: rgb(248, 248, 248); box-sizing: border-box !important; word-wrap: break-word !important;"><section style="margin: 0px; padding: 0px; max-width: 100%; border-width: 0px; line-height: 1.8em; box-sizing: border-box !important; word-wrap: break-word !important; color: inherit;"><strong style="border:0px rgb(159, 136, 127); box-sizing:border-box !important; color:rgb(89, 89, 89); font-size:18px; line-height:40px; margin:0px; max-width:100%; padding:0px; text-align:center; white-space:pre-wrap; word-wrap:break-word !important"><span class="135brush" data-brushtype="text" style="border:0px rgb(159, 136, 127); box-sizing:border-box !important; color:rgb(159, 136, 127); margin:0px; max-width:100%; padding:0px; text-shadow:rgb(201, 201, 201) 3px 3px 1px; word-wrap:break-word !important">135编辑器：</span></strong></section><section class="135brush" style="color: inherit;"><p style="margin-top: 2px; margin-bottom: 0px; padding: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; overflow: hidden; box-sizing: border-box !important; color: inherit;"><span style="box-sizing:border-box !important; color:inherit; font-size:14px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">如何更改文字<span style="background-color:rgb(159, 136, 127); color:rgb(255, 255, 255); font-family:inherit; white-space:pre-wrap">“背景色”：</span></span></p><p style="margin-top: 2px; margin-bottom: 0px; padding: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; overflow: hidden; box-sizing: border-box !important; color: inherit;"><span style="box-sizing:border-box !important; color:inherit; font-size:14px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">找到背景色几个字，加上background-color: rgb值就可以了</span></p></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339871" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339871" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style  col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="3075" title="点击插入此内容">
									<section class="135editor">
										<p style="text-align: center; white-space: normal;"><span style="color:inherit; font-family:inherit"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="border-color:rgb(159, 136, 127); color:rgb(159, 136, 127); font-size:18px">135编辑器</span></strong></span></p><fieldset style="margin: 15px 5px; padding: 0px; border: 1px dotted rgb(159, 136, 127); border-image-source: none; color: rgb(51, 51, 51); line-height: 2em; font-size: 12px; white-space: normal; min-height: 1.5em; max-width: 100%; border-bottom-right-radius: 15px; border-bottom-left-radius: 10px;"><section style="margin: -10px 40px; padding: 0px 40px; text-align: center; color: rgb(0, 0, 0);"><p style="padding: 0px 0px 4px; color: rgb(255, 255, 255); line-height: 1.6em; font-size: 14px; margin-top: 0px; margin-bottom: 0px; white-space: pre-wrap; border-bottom-right-radius: 100%; border-bottom-left-radius: 100%; background-color: rgb(159, 136, 127);"><span class="135brush" data-brushtype="text" style="color:inherit; font-family:inherit">副标题<span style="background-color:rgb(159, 136, 127); color:rgb(255, 255, 255); line-height:22.390625px; text-align:center; white-space:pre-wrap">副标题<span style="background-color:rgb(159, 136, 127); color:rgb(255, 255, 255); line-height:22.390625px; text-align:center; white-space:pre-wrap">副标题<span style="background-color:rgb(159, 136, 127); color:rgb(255, 255, 255); line-height:22px; text-align:center; white-space:pre-wrap">副标</span></span></span></span></p></section><section class="135brush" style="padding: 8px 5px; line-height: 2em; color: inherit;"><p style="margin-top: 0px; margin-bottom: 0px; min-height: 1.5em; max-width: 100%; color: inherit;"><span style="color:inherit; font-family:inherit; font-size:16px; line-height:2em; max-width:100%">135编辑器开放html源代码，大家可进行随意修改，变成属于自己的样式。</span></p></section></fieldset>									</section>
																		<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339870" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339870" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li style="position: relative;" class="fav-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="3264" title="点击插入此内容">
									<section class="135editor">
										<section style="line-height: 1.25; text-align: left; margin：10px; color: inherit;"><fieldset style="border: 35px solid rgb(166, 91, 203); border-image-source: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiaXAGReq0PiaE33xf7P0eJF69WnMViaCribM7AM7JicVRPfjD8SCFwxJica39hORvq7k55e7Ph3AbtMvSA/0); border-image-slice: 120; margin-top: 0.5em; font-size: 16px; text-decoration: none; color: rgb(166, 91, 203); line-height: 1.4; text-align: left;"><p style="color: inherit;padding:10px"><span class="135brush" style="color:rgb(166, 91, 203); font-family:inherit; font-size:14px; line-height:21px">元素的颜色为color：rgb(255,255,255)，更改rgb值就可以更换颜色；背景色为background-color:rgb(#),#为rgb值。135编辑器中，rgb值三个数字如果相同，则没法通过配色方案更换颜色，如果需要更换，则直接将三个数字任意改动一个即可。</span></p></fieldset></section>									</section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;width:150px;text-align:right;">
																				<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/refresh/339868" onclick="return refreshfavorite(this);">
											<i class="fa fa-arrow-up" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="移到顶部"></i>
										</a> 
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/cancel/339868" onclick="return unfavorite(this);">
											<i class="fa fa-trash" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="取消收藏"></i>
										</a>
									</div>
								</li>								<li class="recomment-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="14" title="系统推荐样式，收藏后可重新排序">
									<section class="135editor"><blockquote style="border-width: 1px 1px 1px 5px; border-style: solid; border-color: rgb(238, 238, 238) rgb(238, 238, 238) rgb(238, 238, 238) rgb(159, 136, 127); border-radius: 3px; padding: 10px; margin: 10px 0px;"><h4 class="135brush" style="color: rgb(159, 136, 127); font-weight: bold; font-size: 18px; margin: 5px 0px; border-color: rgb(159, 136, 127);">标题文字</h4><section class="135brush" data-style="color:inherit;font-size:14px;" style="color: inherit;font-size:14px"><p>内容描述.</p></section></blockquote></section>
									 <div class="origin" style="background:#ed603a;">原创</div> 									<div style="position:absolute;bottom:0px;right:0px;">
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/add" onclick="return addtofavor('EditorStyle','14',this);">
											<i class="fa fa-heart-o" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="收藏"></i>
										</a>
									</div>
								</li>								<li class="recomment-style itembg2 col-xs-12 brush mix tagtpl-109-brush tagtpl-109" data-id="32" title="系统推荐样式，收藏后可重新排序">
									<section class="135editor"><blockquote style="margin: 3px; padding: 10px 15px; border-width: 3px; border-color: rgb(107, 77, 64); border-top-left-radius: 50px; border-bottom-right-radius: 50px; box-shadow: rgb(165, 165, 165) 5px 5px 2px; background-color: rgb(250, 250, 250);"><section class="135brush" data-style="margin-top: 15px; margin-bottom: 0px; padding: 0px; color: rgb(107, 77, 64); line-height: 2em; font-size: 20px; border-color: rgb(107, 77, 64);font-size: 18px;font-weight:bold;"><p style="margin-top: 15px; margin-bottom: 0px; padding: 0px; color: rgb(107, 77, 64); line-height: 2em; font-size: 20px; border-color: rgb(107, 77, 64);"><span style="font-size:18px"><strong style="border-color:rgb(107, 77, 64); color:inherit">读而思</strong></span></p></section><p style="margin-top: -10px; margin-bottom: 0px; padding: 0px; line-height: 2em; min-height: 1.5em; color: inherit;"><span style="font-size:12px"><strong class="135brush" data-brushtype="text" style="background-color:rgb(107, 77, 64); border-bottom-left-radius:20px; border-bottom-right-radius:20px; color:rgb(224, 209, 202); font-size:13px; padding:0px 15px">duersi</strong></span></p><section class="135brush" data-style="margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; font-size: 14px; min-height: 1.5em; color: inherit;"><p><span style="font-size:14px">编辑完成后，将内容复制粘贴到微信后台素材管理的编辑器中即可。</span></p><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 2em; font-size: 16px; min-height: 1.5em; color: inherit;"><span style="font-size:14px"></span></p></section></blockquote></section>
																		<div style="position:absolute;bottom:0px;right:0px;">
										<a class="btn btn-xs" style="color:rgb(255, 129, 36);font-size:20px;" href="javascript:;" data-url="/favorites/add" onclick="return addtofavor('EditorStyle','32',this);">
											<i class="fa fa-heart-o" data-toggle="tooltip" data-container="body" data-placement="top" title="" data-original-title="收藏"></i>
										</a>
									</div>
								</li>							</ul>
						</div>
						<div class="alert alert-warning">样式太少？<a href="/style-center?cate_id=1" target="_blank"> 前往样式中心</a>，收藏更多样式，定制个人专属的样式操作列表</div>
			  			
					</div>
								
					<div class="tab-pane" id="editor-tpls" style="padding:0px 0px;position:relative;">
				    	<ul id="editor-tpls-navtab" class="nav nav-tabs" style="border:0 none;">
						  						  <li class="ignore active" id="personal-tpl-list-li"><a href="#personal-tpl-list-1" role="tab" data-toggle="tab">个人模板</a></li>
						  <li class="ignore" id="favorite-tpl-list-li"><a href="#favorite-tpl-list-1" role="tab" data-toggle="tab">收藏模板</a></li>
						  						  <li class="ignore">
						    <a href="#recommend-tpl-list-1" role="tab" data-toggle="tab">系统推荐</a>
						  </li>						  
						</ul>
						<div class="tab-content" style="padding:0 10px;overflow-x:hidden;" id="editor-tpls-list"><div class="tab-content" id="tpl-tab-content">
					
			<div id="personal-tpl-list-1" class="tab-pane active">
				
							    	<p class="alert alert-warning mt10">保存的个人模板会出现在这里,您可以在编辑完后，点击编辑区右侧的保存按钮“<i class="fa fa-save"></i>”来保存个人模板</p>
			    			    
			</div>
			
			
			<div id="favorite-tpl-list-1" class="tab-pane">
								<div class="row">
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-23354"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/2b83226bda0c3d744d3ae85e.jpg" title="瀑布流图片展示" class="template-cover" data-id="23354" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/2b83226bda0c3d744d3ae85e.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="23354" data-name="瀑布流图片展示" id="template-23354"><section class="135editor" data-id="2280">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.1em 0px 0px;">
<section class="135editor" data-id="7237">
<section style="margin: 3px;background-color: #fff;box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);margin-bottom:20px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhMuEyPkT5Gibia2lwibB9uUGibtJuMt0rmBUTSibhmLjcfRLsT60ciae9D7oVdPHYyxnmjdbuLLfmxMJmg/0" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin: 10px 0px; overflow: hidden; padding: 0px 16px; word-wrap: break-word;"><span style="line-height:1.35em">摆盘是种艺术</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/people/201503/01/20150301164627_aejum.thumb.180_180_c.jpeg" style="border-bottom-left-radius:34px; border-bottom-right-radius:34px; border-top-left-radius:34px; border-top-right-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none;font-size:12px;line-height:17px;padding:0 0;margin:0 0;"><strong>马某某</strong></p>

<p style="clear: none;font-size:12px;line-height:17px;padding:0 0;margin:0 0;">这样的早餐怎么没食欲</p>
</section>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/people/201501/27/20150127162844_Ac5dC.thumb.180_180_c.jpeg" style="border-bottom-left-radius:34px; border-bottom-right-radius:34px; border-top-left-radius:34px; border-top-right-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none;font-size:12px;line-height:17px;padding:0 0;margin:0 0;"><strong>我是汪星人</strong></p>

<p style="clear: none;font-size:12px;line-height:17px;padding:0 0;margin:0 0;">看着都饿了~</p>
</section>
</section>
</section>
</section>

<section class="135editor" data-id="7237">
<section style="margin: 3px;margin-bottom:20px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/blog/201503/05/20150305094817_nxEG3.thumb.700_0.jpeg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin-top: 10px; margin-bottom: 10px; overflow: hidden; padding-right: 16px; padding-left: 16px;"><span style="line-height:1.35em">早春</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img4q.duitang.com/uploads/files/201502/06/20150206164226_3Bc2e.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>遗梦</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">收到 搭配</p>
</section>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/people/201308/03/20130803092303_WtXtk.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>星空</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">收集到 美衣</p>
</section>
</section>
</section>
</section>

<section class="135editor" data-id="7237">
<section style="margin: 3px;margin-bottom:20px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/item/201208/20/20120820030713_QnsrA.jpeg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin-top: 10px; margin-bottom: 10px; overflow: hidden; padding-right: 16px; padding-left: 16px;"><span style="line-height:1.35em">唇妆</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/people/201408/17/20140817085732_vxd3G.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>美丽姑娘</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">收集到 大米人</p>
</section>
</section>
</section>
</section>

<section class="135editor" data-id="7237">
<section style="margin: 3px;margin-bottom:20px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/item/201410/20/20141020153352_S4Kre.thumb.700_0.jpeg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin-top: 10px; margin-bottom: 10px; overflow: hidden; padding-right: 16px; padding-left: 16px;"><span style="line-height:1.35em">肉植</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/blog/201411/18/20141118165425_srRcX.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>图图集</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">收集到 花卉</p>
</section>
</section>
</section>
</section>

<section class="135editor" data-id="7237">
<section style="margin: 3px;margin-bottom:20px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px;"><img alt="" border="0" src="http://cdnq.duitang.com/uploads/item/201501/11/20150111005144_ctsj2.thumb.700_0.jpeg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin-top: 10px; margin-bottom: 10px; overflow: hidden; padding-right: 16px; padding-left: 16px;"><span style="line-height:1.35em">穿搭</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/people/201308/01/20130801135047_3EEeR.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>图图集</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">收集到 减肥吧</p>
</section>
</section>
</section>
</section>

<p>&nbsp;</p>
</section>

<section style="box-sizing: border-box; width: 50%; float: right; padding: 0px 0px 0px 0.1em;">
<section class="135editor" data-id="7237">
<section style="margin: 3px;background-color: #fff;box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);margin-bottom:20px;"><img alt="" border="0" src="http://img4q.duitang.com/uploads/item/201502/24/20150224203902_MSJSF.thumb.700_0.jpeg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin: 10px 0px; overflow: hidden; padding: 0px 16px; word-wrap: break-word;"><span style="line-height:1.35em">您有新的纹身</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/people/201410/31/20141031231739_8XAG8.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none;font-size:12px;line-height:17px;padding:0 0;margin:0 0;"><strong>晨_熙</strong></p>

<p style="clear: none;font-size:12px;line-height:17px;padding:0 0;margin:0 0;">纹身 简单就好</p>
</section>
</section>
</section>
</section>

<section class="135editor" data-id="7237">
<section style="margin: 3px;margin-bottom:20px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px;"><img alt="" border="0" src="http://img3.douban.com/lpic/s27971511.jpg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin-top: 10px; margin-bottom: 10px; overflow: hidden; padding-right: 16px; padding-left: 16px;"><span style="line-height:1.35em">伪文青的文艺书单</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img4q.duitang.com/uploads/files/201312/19/20131219204840_S2mLh.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>果绿色</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">难得有你~</p>
</section>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img4q.duitang.com/uploads/people/201409/08/20140908002858_G4wKJ.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>大妞的美瞳店</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">SO GOOD!</p>
</section>
</section>
</section>
</section>

<section class="135editor" data-id="7237">
<section style="margin: 3px;margin-bottom:20px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px;"><img alt="" border="0" src="http://cdnq.duitang.com/uploads/item/201409/25/20140925220123_yX2jN.thumb.700_0.jpeg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin-top: 10px; margin-bottom: 10px; overflow: hidden; padding-right: 16px; padding-left: 16px;"><span style="line-height:1.35em">手工绕线</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/people/201203/30/20120330110037_hRNsK.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>小兔子汪汪</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">手工做得好棒！</p>
</section>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://cdnq.duitang.com/uploads/files/201503/04/20150304063627_xSPJf.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>给自己一个微笑</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">收集到 手工橱窗</p>
</section>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img4q.duitang.com/uploads/people/201409/08/20140908002858_G4wKJ.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>大妞的美瞳店</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">SO GOOD!</p>
</section>
</section>
</section>
</section>

<section class="135editor" data-id="7237">
<section style="margin: 3px;margin-bottom:20px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/item/201206/03/20120603021613_LxeAr.thumb.700_0.jpeg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin-top: 10px; margin-bottom: 10px; overflow: hidden; padding-right: 16px; padding-left: 16px;"><span style="line-height:1.35em">创意摄影</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/people/201312/29/20131229191623_SZTNe.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>小兔子汪汪</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">收集到 创意</p>
</section>
</section>
</section>
</section>

<section class="135editor" data-id="7237">
<section style="margin: 3px;margin-bottom:20px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px;"><img alt="" border="0" src="http://img4q.duitang.com/uploads/blog/201409/07/20140907194202_VWfUc.thumb.700_0.jpeg" style="width:100%" title="" vspace="0">
<section class="135brush" data-type="main">
<p style="line-height: 1.35em; margin-top: 10px; margin-bottom: 10px; overflow: hidden; padding-right: 16px; padding-left: 16px;"><span style="line-height:1.35em">浴室设计</span></p>
</section>

<section style="background: none repeat scroll 0 0 #fafafa;border-top: 1px solid #f2f2f2;color: #999;padding: 10px; 5px;"><img alt="" border="0" src="http://img5q.duitang.com/uploads/files/201503/09/20150309141125_u4zdv.thumb.180_180_c.jpeg" style="border-radius:34px; float:left; height:34px; margin-right:10px; width:34px" title="" vspace="0">
<section class="135brush" data-style="clear: none;line-height:17px;padding:0 0;font-size:12px;">
<p style="clear: none; font-size: 12px; line-height: 17px;"><strong>我是木质气的娃</strong></p>

<p style="clear: none; font-size: 12px; line-height: 17px;">收集到 浴室</p>
</section>
</section>
</section>
</section>

<p>&nbsp;</p>

<p style="text-align: right;"><span style="color:rgb(192, 0, 0)">▲</span><span style="color:rgb(63, 63, 63)">图片采自堆</span><span style="color:rgb(63, 63, 63); text-align:right">糖</span><span style="color:rgb(63, 63, 63)">网</span></p>

<p>&nbsp;</p>
</section>
</fieldset>
</section>

<section class="135editor" data-id="11363">
<section class="135editor">
<fieldset style="border:0px">
<blockquote class="135bg" data-original-title="" style="width: 100%; margin: 0px; padding: 0px; border: none rgb(255, 129, 36); word-wrap: break-word !important; box-sizing: border-box !important; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhMuEyPkT5Gibia2lwibB9uUGibXx78JWFUQibq2xoziafqUicTzQM8yUb2n9YCuM3RP69Vv4VDIcrKsxicSQ/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;" title="">
<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhMuEyPkT5Gibia2lwibB9uUGib2NsCmXIPZYbbXic1lFibylibr2QMpOtTSUaicJCRwFMdnpibk2hdL0WIG0Q/0"></p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><span style="color:rgb(192, 0, 0); font-size:12px; line-height:1.4">长按上图识别二维码，快速关注</span></p>
</blockquote>
</fieldset>
</section>
</section>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150310/23354.html" target="_blank">瀑布流图片展示</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-23354-view_nums">69</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="23354" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',23354,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-23354-favor_nums">59</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-21999"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/4df9b7dc320f8cce6b3346ce.jpg" title="左右分页模板" class="template-cover" data-id="21999" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/4df9b7dc320f8cce6b3346ce.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="21999" data-name="左右分页模板" id="template-21999"><section class="135editor" data-id="2845">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.1em 0px 0px;">
<fieldset style="width: 100%; border: 0px; margin: 0px 0px 0em; box-sizing: border-box; clear: both; overflow: hidden; padding: 0px; text-align: center;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhMuEyPkT5Gibia2lwibB9uUGibn4VDUibmM4TS4oLQUhrmhqHznAr2kLhNgYs5TicrTZicjpFLTtE4ZlFRw/0" style="box-sizing:border-box; float:left; height:auto !important; width:100%" title="" vspace="0">
<p style="text-align: center;"><span style="color:rgb(127, 127, 127); font-size:14px">| 图片采自：花瓣网 |</span></p>

<section style="display: inline-block; font-size: 2em; z-index: 100; padding: 0.1em 0.5em; margin: -2.55em 0px 0px; line-height: 1.2; box-sizing: border-box; float: right; text-align: right;  font-weight: inherit; text-decoration: inherit; color: inherit; border-color: rgb(249, 110, 87); opacity:0.7;background-color: rgba(248, 247, 245,0);">
<section style="box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box;font-size:25px"><strong><span style="color:rgb(255, 255, 255); font-size:36px">吾</span></strong></section>
</section>
</section>
</fieldset>
</section>

<section class="135brush" data-style="margin-right: 0px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 50%; box-sizing: border-box; float:right; padding: 0px 0px 0px 1m;">
<section class="135brush" data-brushtype="text" style="display: inline-block; vertical-align: top; margin-left: 0.5em; width: 1.2em; line-height: 1.2; font-weight: inherit; text-align: left; text-decoration: inherit; color: rgb(191,50,58); float: right; border-color: rgb(239, 112, 96); font-size: 1.2em;font-size:16px;"><strong>说给自己听</strong></section>

<section class="135brush" data-style="margin-right: 4px; clear: none; float: right; display: inline; width: auto; color: inherit; font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);" style="float:right;">
<p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: rgb(122,118,127); font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);font-size:14px;">如果有来生</p>

<p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: rgb(122,118,127); font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);"><span style="font-size:14px; font-weight:inherit; line-height:1.6em; text-decoration:inherit">要做一棵树</span></p>

<p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px;color:rgb(122,118,127); font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);"><span style="font-size:14px; font-weight:inherit; line-height:1.6em; text-decoration:inherit">一半在风里飞扬</span></p>

<p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px;color:rgb(122,118,127); font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);font-size:14px;">一半在土里安详</p>

<p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px;color:rgb(122,118,127); font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96);font-size:14px;">一半洒落阴凉</p>
&nbsp;

<p style="margin-right: 6px; clear: none; float: right; display: inline; width: 16px; color: rgb(122, 118, 127); font-weight: inherit; text-decoration: inherit; border-color: rgb(239, 112, 96); text-align: left;">&nbsp;</p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor" data-id="2845">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px; text-align: justify;">
<section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.7em 0px 0px;">
<p style="margin-top: 10px; line-height: 1.75em; white-space: normal; text-indent: 2em; text-align: justify;"><span style="color:rgb(127, 127, 127); font-size:14px">这已不知是第几日了，我总在落着雨的早晨醒来，窗外照例是一片灰的天空，没有黎明的曙光，没有风，没有鸟叫。后院的小树都很寂寥的静立在雨中，无论从哪一个窗口望出去，总有雨水在冲流着。除了雨水之外，听不见其他的声音，在这时分里，一切全是静止的。</span></p>

<p style="margin-top: 10px; line-height: 1.75em; white-space: normal; text-indent: 2em; text-align: justify;"><span style="color:rgb(127, 127, 127); font-size:14px">我胡乱的穿着衣服，想到今日的考试，想到心中挂念的凉，心情究竟无端的沉落下去，而对这样的季候也无心再去诅咒它了。昨晚房中的台灯坏了，就以次为借口，故意早早睡去，连笔记都不想碰一下，更不要说那一本本原文书了。当时客厅的电视正在上演着西部片，黑暗中，我躺在床上，偶尔会有音乐、对白和枪声传来，觉得有一丝朦胧的快乐。在那时考试就变的不重要，觉得那是不会有的事，明天也是不会来的。我将永远躺在这黑暗里，而凉会不会找我也不是问题了。不过是这个季节在烦恼着我们，明白就会好了，我们岂是真的就此分开了，这不过是雨季冲乱着我们的心绪罢了。</span></p>

<p style="margin-top: 10px; line-height: 1.75em; white-space: normal; text-indent: 2em; text-align: justify;"><span style="color:rgb(127, 127, 127); font-size:14px">每此早晨醒来的时候，我总喜欢仔细的去看看自己，浴室镜子的我是一个陌生人，那是个奇异时分。我的心境在刚刚醒来的时候时不</span></p>
</section>

<section class="135brush" data-style="margin-right: 0px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 50%; box-sizing: border-box; float: right; padding: 0px 0px 0px 0.7em;">
<p style="margin-top: 10px; line-height: 1.75em; white-space: normal; "><span style="color:rgb(127, 127, 127); font-size:14px"><span style="color:rgb(127, 127, 127); line-height:24px; text-indent:28px"><span style="color:rgb(127, 127, 127); line-height:24px; text-indent:28px"><span style="color:rgb(127, 127, 127); line-height:24px; text-align:justify; text-indent:28px"><span style="color:rgb(127, 127, 127); line-height:24.4965286254883px; text-align:justify; text-indent:28px">设防的，</span><span style="color:rgb(127, 127, 127); line-height:24.4965286254883px; text-align:justify; text-indent:28px">镜中的自己也</span><span style="color:rgb(127, 127, 127); line-height:24.4965286254883px; text-align:justify; text-indent:28px">是不设防的</span>，我喜欢一</span>面将手浸在水里，一面凝望着自己，奇怪的轻声叫着我的名字——今日</span>镜中的不是我，那是</span>个满面渴望着凉的女孩。我凝望着自己，追念着凉的眼睛——我常常不能抗拒的驻留在那时分里，直到我听见母亲或弟弟在另一间浴室里嗽洗的水声，那时我会突然自己该进入的日子和秩序，我就会快快的去喝一杯蜂蜜水，然后夹着些凌乱的笔记本出门。</span><span style="color:rgb(127, 127, 127); line-height:1.75em">　</span><span style="color:rgb(127, 127, 127); font-family:宋体,simsun; line-height:1.75em">　</span></p>

<p style="margin-top: 10px; line-height: 1.75em; white-space: normal; text-indent: 2em; text-align: justify;"><span style="color:rgb(127, 127, 127); font-size:14px">今早要出门去的时候，我找不到可穿的鞋，我的鞋因为在雨地中不好好走路的缘故，已经全都湿光了，于是我只好去穿一双咖啡色的凉鞋。这件小事使得我在出门时不及想象得沉落，这凉鞋落在清晨水湿的街道上的确是愉快的。我坐了三轮车去车站，天空仍灰的分不出时辰来。车帘外的一切被雨弄得静悄悄的，看不出什么显然的朝气，几个小男孩在水沟里放纸船，一个拾垃圾的老人无精打采的站在人行道边，一街的人车在这灰暗的城市中无声的奔流着。我看着这些景象，心中无端的升起一层疲惫来，这是怎样令人丧气的一个日子啊。</span></p>

<section class="135editor" data-id="3344">
<blockquote class="135bg" data-original-title="" style="display: inline-block; width: 100%; float: right; padding: 0px; border: none rgb(255, 129, 36); background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhMuEyPkT5Gibia2lwibB9uUGibNzQ3Th81UtT0jZyd4lfIib3JLSLEgk5f6nQqWsl4ACslzicCWWqvGKMg/0); background-size: contain; word-wrap: break-word !important; box-sizing: border-box !important; background-position: 0px 100%; background-repeat: no-repeat no-repeat;" title="">
<section class="135brush">
<p style="margin-top: 10px; line-height: 1.75em; white-space: normal; text-indent: 2em; text-align: justify;"><span style="color:rgb(127, 127, 127); font-size:14px">下车付车钱时我弄掉了笔记，当我俯身在泥泞中去拾起它时，心中就乍然的软弱无力起来。</span></p>

<p style="margin-top: 10px; line-height: 1.75em; white-space: normal; text-indent: 2em; text-align: justify;">&nbsp;</p>
</section>
</blockquote>
</section>
</section>
</fieldset>
</section>

<p style="text-align: right;"><span style="color:rgb(127, 127, 127); font-size:14px; line-height:24px; text-indent:28px">&gt;&gt;摘自三毛《雨季不再来》</span></p>

<p>&nbsp;</p>

<section class="135editor" data-id="132">
<fieldset style="border: 0px; box-sizing: border-box; padding: 0px;text-align:center;">
<section style="box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; width: 60%; color: rgb(70, 70, 72); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(198, 198, 199); display: inline-block;"></section>

<section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(70, 70, 72); box-sizing: border-box; border-color: rgb(198, 198, 199);"></section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<p style="text-align: center;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgQ9D1ibdc95Fr8cGtDgZV1ySqjH47Afop2viaiagicbC5kmHA3gxfibAsTNYrnvmJGBk3D0PQYwHDSNGg/0"></p>

<p style="text-align: center;"><span style="color:rgb(192, 0, 0); font-size:12px">长按二维码，一键关注</span></p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150309/21999.html" target="_blank">左右分页模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-21999-view_nums">66</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="21999" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',21999,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-21999-favor_nums">111</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-21565"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/51fb3ead304fbeaac0766ead.jpg" title="陈年旧事【once】" class="template-cover" data-id="21565" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/51fb3ead304fbeaac0766ead.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="21565" data-name="陈年旧事【once】" id="template-21565"><section class="135editor" data-id="16128">
<section data-ct="fix">
<section class="135editor">
<section style="width: 100%; display: inline-block; float: left;">
<section class="135brush" data-ct="fix" data-style="line-height: 2em;color: inherit; text-align: center; white-space: normal;" style="padding: 0px; min-height: 140px; border: 1px solid rgb(0, 0, 0); background-image: initial; background-attachment: initial; background-color: rgb(255, 255, 255); background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">
<section class="135editor" data-id="2409">
<section class="135brush" style="padding: 0px;  font-size: 14px; font-weight: inherit; text-align: center; text-decoration: inherit; color: rgb(51, 51, 51); background-color: rgb(0, 0, 0); box-sizing: border-box;">
<section class="135editor" data-id="2845">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px; text-align: right;">
<section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0em 0px 15px;">
<p style="text-align: left;"><span style="color:rgb(255, 255, 255); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">故事丨文字丨新潮丨前沿</span></p>
</section>

<section class="135brush" data-style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 50%; box-sizing: border-box; float: left; padding: 0px 15px 0px 0em;">
<p><span style="color:rgb(255, 255, 255); font-family:times; font-size:18px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">Once</span></p>
</section>
</fieldset>
</section>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor" data-id="2409">
<section class="135brush" style="font-weight: inherit; text-decoration: inherit; color: rgb(51, 51, 51); background-color: rgb(0, 0, 0);"></section>
</section>

<section class="135editor" data-id="2845">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 33%; float: left; padding: 0px 0.1em 0px 0px; text-align: center;">
<p>&nbsp;</p>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section></section>

<section><strong><span style="color:rgb(0, 0, 0); font-family:times; font-size:18px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">故</span></strong></section>

<section></section>

<section><strong><span style="color:rgb(0, 0, 0); font-family:times; font-size:18px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">事</span></strong></section>
</section>

<p>&nbsp;</p>
</section>

<section style="box-sizing: border-box; width: 33%; float: left; padding: 0px 0.1em 0px 0px;">
<p><img data-ratio="0.9939393939393939" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4tE3sFT0Vd8qgcMMf3onYMNsFiadv0HFwmUgZCzsoJFkmbUoNgNY3rLA/640?tp=webp&amp;wxfrom=5" data-type="jpeg" data-w="165" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4tE3sFT0Vd8qgcMMf3onYMNsFiadv0HFwmUgZCzsoJFkmbUoNgNY3rLA/0" style="visibility:visible !important; width:auto !important"></p>
</section>

<section style="box-sizing: border-box; width: 33%; float: left; padding: 0px 0.1em 0px 0px; text-align: center;">
<p>&nbsp;</p>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section><strong><span style="color:rgb(0, 0, 0); font-family:times; font-size:18px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">丁</span></strong></section>

<p>&nbsp;</p>

<p><strong><span style="color:rgb(0, 0, 0); font-family:times; font-size:18px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">钰</span></strong></p>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section></section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<p><span style="color:rgb(0, 0, 0); font-family:times; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">On</span></p>

<p><span style="color:rgb(0, 0, 0); font-family:times; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">c</span></p>

<p><span style="color:rgb(0, 0, 0); font-family:times; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">e常驻作者</span></p>
</section>

<p>&nbsp;</p>
</section>
</fieldset>
</section>

<section class="135editor" data-id="2409">
<section class="135brush" style="padding: 10px; font-size: 14px; font-weight: inherit; text-decoration: inherit; color: rgb(51, 51, 51); box-sizing: border-box; background-color: rgb(0, 0, 0);">
<section class="135editor" data-id="2845">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section class="135brush" data-style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 65%; box-sizing: border-box; float: left; padding: 0px 0px 0px 1.0em;">
<p>&nbsp;</p>

<p><span style="color:rgb(255, 255, 255); font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">有些东西是写给自己看的，有些东西，是写个别人看的。</span></p>

<p>&nbsp;</p>

<p><span style="color:rgb(255, 255, 255); font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">当我知道她哭着写完这个故事的时候，我就知道，这篇文章属于前者。</span></p>

<p>&nbsp;</p>

<p><span style="color:rgb(255, 255, 255); font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">也许不会有很多人看，不会有很多人看完，但这篇文章存在的意义，绝不在此。</span></p>

<p style="text-align: right;"><span style="color:rgb(255, 255, 255); font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">&nbsp; &nbsp; &nbsp;—— 冷眼珠子</span></p>
</section>

<section class="135brush" data-style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 35%; box-sizing: border-box; float: left; padding: 0px 0px 0px 1.0em;">
<section class="135editor" data-id="3348">
<section class="135editor">
<blockquote class="135bg" data-original-title="" style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: contain; background-position: 50% 50%; background-repeat: no-repeat; background-image: url(https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4XLszIkL76AUlAYjxtGnccCSwFkaTb1A8DepoxUqpXmiaWeg2NIb4AMg/0);" title="">
<section class="135brush">
<p>　　</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</section>
</blockquote>
</section>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor" data-id="2845">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section class="135brush" data-style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 20%; box-sizing: border-box; float: left; padding: 0px 0px 0px 1.0em;">
<section class="135editor" data-id="3348">
<section class="135editor">
<section class="135brush"><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="visibility:visible !important; width:auto !important">
<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</section>

<section class="135brush"></section>
</section>
</section>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="visibility:visible !important; width:auto !important"></p>

<p><br>
&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="visibility:visible !important; width:auto !important"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="visibility:visible !important; width:auto !important"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="line-height:1.6em; visibility:visible !important; width:auto !important"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="3" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4FQG2z6ewd5JYm19E8pw55nGPlgNJ9GV5zibokZciblhlckuMUuL8T8Ow/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p><img data-ratio="2.9058823529411764" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/640?tp=webp&amp;wxfrom=5" data-type="png" data-w="85" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B47ytaHH4AHpkgiapUkpRoicpfHUMw2KgianibicrHVdEKxibzeO5Yo3JHLzKw/0" style="cursor:pointer; line-height:22.3999996185303px; visibility:visible !important; width:auto !important; z-index:-1"></p>
</section>

<section class="135brush" data-style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 80%; box-sizing: border-box; float: left; padding: 0px 0px 0px 1.0em;">
<p><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">这个故事发生在甘肃省天水市麦积山区的一个小村庄。</span></p>

<p>&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">她出生于一个大户的地主人家，父母虽是地主，却行善积德。把地分给村里的穷单身汉种，象征性的收点租子，可秋收之际，别人家粮多仓满，穷单身汉却因为懒惰，一整年不务农事任地荒着，颗粒无收，连肚子都填不饱更别说交租子了。这样无果的善事做了许多，她的父母在村里一直拥有好的口碑。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">她有两个姑姑，都算是大家闺秀，媒妁之言之下嫁去了外村。风风光光的喜事成为了她一辈子津津乐道的话题——凤冠霞帔，绣着鸳鸯并蒂的嫁衣映红了姑姑的脸，大红软轿，三寸金莲时隐时现，三十二个轿夫八人一班轮换着抬去了三十多里外的婆家。两个姑姑皆是如此，甚至一个比一个风光。 &nbsp; &nbsp; &nbsp; &nbsp;</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">她是家里第一个女儿，也是唯一一个女儿，乳名唤做“引儿”，之后，她的母亲一连生了几个都是儿子，更使她成为了全家族宠爱的对象。叔伯思想开明，于是她幸运的逃过了裹足的厄运。尽管是女孩，家里却坚持让她上了五年私塾，会写不少字。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">幸福而任性的童年终止于父亲的去世，那年，她十二岁。弟弟们都还小，没有因为父亲的离开而停止玩耍，因为不懂。而母亲却深受打击，病在床上。一直守夜的是她。独自一人坐在灵堂里，恐惧、悲伤折磨着她不能闭眼不能睡觉，整整三天。自那以后，她不得不挑起家里的重担，和母亲一起咬着牙支撑着这个家。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">相比之下，他就不这么幸运了。家境一直都比较贫寒，为了糊口，他跟着戏班子学唱戏，天生一副好嗓子使他越唱越红，逢年过节到各个村庄跑场子，由于嗓音洪亮，年纪又小，知名度越来越高。他长得不算英俊，但时时刻刻都精气神儿十足，用现在的话说就是满满的正能量。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">一次，她被同伴拉着去看戏，恰逢他唱的那场。他在台上，她在角落，远远的对望了一眼，注定了一生的牵绊。唱完戏，他溜到台下，径直走向她，她吓得不知所措，少女的小心思被撞破，却虚惊一场，原来他认识她的同伴。在同伴的牵引下，他们两情相悦了。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">没过多久，媒婆来她家说媒，是同村的，个子没有他高，长相没有他好，她嗤之以鼻。后来，媒婆领着那个矮子的家人上门提亲，四个银元和一些礼行，她不在家，她的母亲却是同意了。回来之后，得知这事，气呼呼的抓起银元和礼行就往外跑，边跑边打听，到了矮男人家，推开房门，一股脑把东西扔到人家炕上，二话不说，转身就跑，还怕跑的太慢被矮子的家人抓住，又一口气跑回了家，大门反锁，这才把心放下来。就这样自己把婚退了，她的母亲倒也没有多说什么。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">几个月后，政策改革，批斗地主，她的家被抄了，财产充公，偌大的一个家族败落了。此时的他成为了成分最好的“贫农”。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">在她母亲的默许之下，他们悄无声息的结了婚。结婚那天，她上身穿桃红色斜襟小褂，下身穿着绿底大红花的九分裤，黑色的绣花布鞋，在当时算是流行的装扮却是远远比不了当年姑姑们的嫁衣。没有盖头，没有轿子，一前一后在黄土路上走了一上午才到婆家。就这样结了个婚。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">婚后，他带着她另立门户，想着她思念家人，就把家安在了她母家附近，她的母亲和弟弟们住在半山坡，他们住在坡下。他去陕西煤矿上干活挣钱，她一个人留在家中，怀孕使她并没有感到多么孤单，也并没有变得娇气，该干的活还是会干。几个月后，天气渐凉，她想着多搬点麦草铺在褥子底下御寒，就从山上背着一大垛麦草走下山，刚进院子，一阵剧痛。她流产了，伴着大出血，从鬼门关走了一趟。他得知了此事，匆匆回家。一年之后，她的身体才渐渐好转。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">中国最困难的那三年来了，饥饿让人逐渐丧失了理智。从打野兔到挖野菜再到剥树皮，最后吃人，满山连一只老鼠都找不到。村里的人都开始逃荒。去新疆的路途有多遥远有多凶险，谁也不知道。他决定先去新疆，稳定下来以后再接她过去。又是一年的分别。在这一年中，尽管饥饿，但也有让人高兴的事——她的大女儿出生了。接着，她收到了他寄来的信，抱着几个月大的女儿踏上了去新疆的寻夫路。路上有多艰辛，已经无人知晓。两个月后，一家人终于团聚。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">如果以为这是幸福的开始，那就错了。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">村长和村支书克扣公粮，始终不承认她和他是一家人，执意说她是逃荒来的盲流，不给她和孩子分粮。一家三口只能吃他一人份的粮、油，每天饿的前胸贴后背，更没有力气干活。这一饿就是一年。他们三番五次的去找村支书讲理，跨级上访，找兵团干部，终于分到了三个人的粮油，可也因此得罪了村领导。同村的一家丢了一桶油，那是一年的用量，诬陷是他们家偷的，因为他们家最穷，最有动机。武装部派来了一个小队，要搜他们的家，不仅把家里搜的一团糟，甚至用铁锨掘地三尺。晚年时的她每每想起这些委屈依然老泪纵横。可是世间的缘分就是这么作，当时的他们也不会想到，二十几年后，他们的大女儿会嫁给这个曾经带领士兵祸害他们家的武装部部长的侄子。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">平静安稳的生活拉开了序幕。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">他围了一个院子，盖了几间土房，又在院子旁边开辟了一个菜园。陆陆续续他们有了三个儿子两个女儿。日子一天比一天好。他在菜园种满了各种蔬菜，骑着三轮车到村口去买，买菜的人买的多了，他就亲自去送。儿女们长大了，会给他们生活费，他不需要赚钱了，于是就装几大袋子蔬菜，绑在自行车后座，骑二十五公里农村的土路去城里给儿女们送。给大女儿家送的最多，最疼的也是大女儿，因为大女儿跟着他吃过苦。来回路上需要很多时间，往往在大女儿家匆匆吃个午饭就要往回赶，顶着中午烈阳也要趁天黑之前回到家，因为乡村的公路上是没有路灯的。十几年如一日。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">时间悄然逝去，只在他们的脸上刻下了岁月的痕迹。这间房子，这个院子，一住就是半个世纪。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">在儿孙满堂，尽享天伦之乐的时候，正是一年春节，新年的喜气冲刷着破旧的土房，忽然他不吃饭了，什么都吃不下去，接着被查出肝癌晚期。庆幸的是，没有疼痛，只是饭量越来越少，脸色变得蜡黄。从发病到离世正好半个月。这半个月中，儿女们不停地为后事做着准备，刚刚做完最后一件事，他便在他亲手搭建的家中离开了，离开的措手不及又好像什么都安排好了。在他去世的前一天晚上，她梦见有人来家里喊他去唱戏，接着她听见了嘹亮的一声开嗓，那是他年轻时的声音，直敲进她的心里。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">他，是我的外公。她，是我的外婆。</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">这个故事并没有结束，只是在那个院子，那间房子，有一段被尘封的记忆。</span></p>

<p>&nbsp;</p>
</section>
</fieldset>

<p style="text-align: justify;"><span style="font-family:times; font-size:12px; line-height:21px; text-indent:28px; white-space:pre-wrap">（此文献给去世近一周年的外公，寥寥几千字写完一生委实显得轻率，完成此文仅表怀念）</span></p>

<p style="text-align: justify;">&nbsp;</p>

<p><img data-ratio="0.057539682539682536" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FI76H2jNGHxTZozmZKOvicsnpJG5BLDIqA5fUsc5iczckCh1CZfCznOEoY0nkc3pmIn6C6OVSsh3hQ/640?tp=webp&amp;wxfrom=5" data-w="504" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FI76H2jNGHxTZozmZKOvicsnpJG5BLDIqA5fUsc5iczckCh1CZfCznOEoY0nkc3pmIn6C6OVSsh3hQ/0" style="visibility:visible !important; width:auto !important"></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor" data-id="3348">
<section class="135editor">
<blockquote class="135bg" data-original-title="" style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: contain; background-position: 50% 50%; background-repeat: no-repeat; background-image: url(https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2FHQQDwzTZJ0SY5BlJ740B4ia60XHTNaF1wNJVrjD3aNkJDJRjW4wxsYXGia5yCpAHqxATFfu3StYicg/0);" title="">
<section class="135brush">
<p>&nbsp;</p>

<section class="135editor" data-id="3587">
<fieldset style="border: 0px; margin: 0px -1px; box-sizing: border-box; width: 100%; clear: both; padding: 0px;">
<section style="margin : 8px 5px; width: 98%;box-sizing: border-box;text-align:center;"><img data-ratio="0.9933333333333333" data-s="300,640" data-src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLGY24kZDvwRPHs0bIuFsLwIIgBIj4GxAHvgL7eUwZjah3V5tqrnb1wg/640?tp=webp&amp;wxfrom=5" data-type="jpeg" data-w="150" file_id="203915569" format="jpeg" source="lib" src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLGY24kZDvwRPHs0bIuFsLwIIgBIj4GxAHvgL7eUwZjah3V5tqrnb1wg/0" style="box-sizing:border-box; padding:2px; visibility:visible !important; width:33% !important" url="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLGY24kZDvwRPHs0bIuFsLwIIgBIj4GxAHvgL7eUwZjah3V5tqrnb1wg/0"></section>
</fieldset>
</section>

<p style="text-align: center;"><span style="font-family:times; font-size:12px; line-height:21px; text-align:justify; text-decoration:underline; text-indent:28px; white-space:pre-wrap">长按上图，识别二维码关注</span></p>

<p style="text-align: center;"><span style="font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">一个故事只讲一次</span></p>

<p style="text-align: center;"><span style="font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">Once 就够了</span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</section>
</blockquote>
</section>
</section>
</section>
</section>
</section>
</section>
</section>
</section>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150309/21565.html" target="_blank">陈年旧事【once】</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-21565-view_nums">89</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="21565" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',21565,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-21565-favor_nums">147</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-21114"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/11e7c8da320da7e43aa4b6ec.png" title="商品展模板" class="template-cover" data-id="21114" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/11e7c8da320da7e43aa4b6ec.png" alt="">						</div>
						<div class="editor-style-content hidden" data-id="21114" data-name="商品展模板" id="template-21114"><section class="135editor" data-id="3066">
<blockquote class="135bg" data-original-title="" style="max-width: 100%;margin-top:0px; padding: 0px 10px; border: none rgb(255, 129, 36); background-size: cover; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntezibMFSnmQ3ypgs5GOPe9crUWJkTxzAYjsJxWCW1ezqPpU9HQ6UWE7A/0); word-wrap: break-word !important; box-sizing: border-box !important; background-repeat: repeat repeat;" title=""><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarnttviaibibp3csGhGHNiaA7XCOqiafAWqFNRUKnd145jDlrqYJceTxdPlxZeA/0" style="color:inherit; line-height:inherit; padding-top:20px; width:100%" title="" vspace="0"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntReM9M3BoFhw4NUcde63uekMsHxCeTGeIGibrbTpicJ0IsH7BzfGiaAuFQ/0" style="color:inherit; line-height:inherit; margin:10px 0px; width:100%" title="" vspace="0">
<section class="135editor" data-id="2280">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.1em 0px 0px;">
<section class="135editor" data-id="2254">
<fieldset style="border: 0px rgb(89, 195, 249); box-sizing: border-box; width: auto; overflow: hidden; padding: 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntx7siaoHNrtEWfUTzCWwZ1Mkq9hWYT0nlONIeqalHlkWOGa8ASR7xWWQ/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%">
<p style="padding:5px;color:rgb(102,144,130)"><span style="font-size:12px">春品尝鲜 <span style="color:rgb(63, 63, 63)">￥</span><span style="color:rgb(63, 63, 63); font-size:16px"><strong>177</strong></span><strong> <span style="font-family:微软雅黑"><span style="color:rgb(165, 165, 165); line-height:18px">￥</span><s style="color:rgb(165, 165, 165); text-decoration:line-through">187</s></span></strong></span></p>

<section style="width: 4em; height: 4em; float: right; padding: 0.5em; margin-top: -6em; margin-left: 0em; border-top-left-radius: 4em; border-top-right-radius: 4em; border-bottom-right-radius: 4em; border-bottom-left-radius: 4em; box-sizing: border-box; text-align: left; opacity: 0.85; color: rgb(255, 255, 255); border-color: rgb(89, 195, 249); background-color: rgb(102,144,130);">
<section style="padding: 0px; color: inherit; text-align: center; font-size: 1em; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(89, 195, 249);">
<p style="box-sizing: border-box; color: inherit; border-color: rgb(89, 195, 249);"><strong style="border-color:rgb(89, 195, 249); color:inherit">立即</strong></p>

<p style="box-sizing: border-box; color: inherit; border-color: rgb(89, 195, 249);"><strong style="border-color:rgb(89, 195, 249); color:inherit">抢购</strong></p>
</section>
</section>
</fieldset>
</section>
</section>

<section style="box-sizing: border-box; width: 50%; float: right; padding: 0px 0px 0px 0.1em;">
<section class="135editor" data-id="2254">
<fieldset style="border: 0px rgb(89, 195, 249); box-sizing: border-box; width: auto; overflow: hidden; padding: 0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntGj7GQ25OnNlziblibuMTpnI2ibJreic79yQ7sqfCe3iaPGYgWQc2Ko2kgqA/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%" title="" vspace="0">
<p style="padding:5px;color:rgb(102,144,130)"><span style="font-size:12px">春品尝鲜 <span style="color:rgb(63, 63, 63)">￥</span><span style="color:rgb(63, 63, 63); font-size:16px"><strong>216</strong></span><strong> <span style="font-family:微软雅黑"><span style="color:rgb(165, 165, 165); line-height:18px">￥</span><s style="color:rgb(165, 165, 165); text-decoration:line-through">218</s></span></strong></span></p>

<section style="width: 4em; height: 4em; float: right; padding:0.5em; margin-top: -6em; margin-left: 0em; border-top-left-radius: 4em; border-top-right-radius: 4em; border-bottom-right-radius: 4em; border-bottom-left-radius: 4em; box-sizing: border-box; text-align: left; opacity: 0.85; color: rgb(255, 255, 255); border-color: rgb(89, 195, 249); background-color: rgb(102,144,130);">
<section style="padding: 0px; color: inherit; text-align: center; font-size: 1em; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(89, 195, 249);">
<p style="box-sizing: border-box; color: inherit; border-color: rgb(89, 195, 249);"><strong style="border-color:rgb(89, 195, 249); color:inherit">立即</strong></p>

<p style="box-sizing: border-box; color: inherit; border-color: rgb(89, 195, 249);"><strong style="border-color:rgb(89, 195, 249); color:inherit">抢购</strong></p>
</section>
</section>
</fieldset>
</section>
</section>
</fieldset>
</section>

<section class="135editor" data-id="2280">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.1em 0px 0px;">
<section class="135editor" data-id="2254">
<fieldset style="border: 0px rgb(89, 195, 249); box-sizing: border-box; width: auto; overflow: hidden; padding: 0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarnticg22DiapCF0HIkObyLJbHtgfibrcePalsOc2taicrHkQ6QuZOJkz0MJSA/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%" title="" vspace="0">
<p style="padding:5px;color:rgb(102,144,130)"><span style="font-size:12px">春品尝鲜 <span style="color:rgb(63, 63, 63)">￥</span><span style="color:rgb(63, 63, 63); font-size:16px"><strong>218</strong></span><strong>&nbsp;</strong><span style="font-family:微软雅黑"><strong style="line-height:1.6em"><span style="color:rgb(165, 165, 165); line-height:18px">￥</span><s style="color:rgb(165, 165, 165); text-decoration:line-through">230</s></strong></span></span></p>

<section style="width: 4em; height: 4em; float: right; padding: 0.5em; margin-top: -6em; margin-left: 0em; border-top-left-radius: 4em; border-top-right-radius: 4em; border-bottom-right-radius: 4em; border-bottom-left-radius: 4em; box-sizing: border-box; text-align: left; opacity: 0.85; color: rgb(255, 255, 255); border-color: rgb(89, 195, 249); background-color: rgb(102,144,130);">
<section style="padding: 0px; color: inherit; text-align: center; font-size: 1em; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(89, 195, 249);">
<p style="box-sizing: border-box; color: inherit; border-color: rgb(89, 195, 249);"><strong style="border-color:rgb(89, 195, 249); color:inherit">立即</strong></p>

<p style="box-sizing: border-box; color: inherit; border-color: rgb(89, 195, 249);"><strong style="border-color:rgb(89, 195, 249); color:inherit">抢购</strong></p>
</section>
</section>
</fieldset>
</section>
</section>

<section style="box-sizing: border-box; width: 50%; float: right; padding: 0px 0px 0px 0.1em;">
<section class="135editor" data-id="2254">
<fieldset style="border: 0px rgb(89, 195, 249); box-sizing: border-box; width: auto; overflow: hidden; padding: 0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntGq175pcFzUdHbksMgGiaHEatJCf5XOOichlxXDH1CDgCmOXzPqkMtyQw/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%" title="" vspace="0">
<p style="padding:5px;color:rgb(102,144,130)"><span style="font-size:12px">春品尝鲜 <span style="color:rgb(63, 63, 63)">￥</span><span style="color:rgb(63, 63, 63); font-size:16px"><strong>190</strong></span><strong> <span style="font-family:微软雅黑"><span style="color:rgb(165, 165, 165); line-height:18px">￥</span><s style="color:rgb(165, 165, 165); text-decoration:line-through">200</s></span></strong></span></p>

<section style="width: 4em; height: 4em; float: right; padding: 0.5em; margin-top: -6em; margin-left: 0em; border-top-left-radius: 4em; border-top-right-radius: 4em; border-bottom-right-radius: 4em; border-bottom-left-radius: 4em; box-sizing: border-box; text-align: left; opacity: 0.85; color: rgb(255, 255, 255); border-color: rgb(89, 195, 249); background-color: rgb(102,144,130);">
<section style="padding: 0px; color: inherit; text-align: center; font-size: 1em; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(89, 195, 249);">
<p style="box-sizing: border-box; color: inherit; border-color: rgb(89, 195, 249);"><strong style="border-color:rgb(89, 195, 249); color:inherit">立即</strong></p>

<p style="box-sizing: border-box; color: inherit; border-color: rgb(89, 195, 249);"><strong style="border-color:rgb(89, 195, 249); color:inherit">抢购</strong></p>
</section>
</section>
</fieldset>
</section>
</section>
</fieldset>
</section>
<img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntReM9M3BoFhw4NUcde63uekMsHxCeTGeIGibrbTpicJ0IsH7BzfGiaAuFQ/0" style="color:inherit; line-height:inherit; margin:10px 0px; width:100%" title="" vspace="0">
<section class="135editor" data-id="2845">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 49%; float: left; padding: 0px 0.1em 0px 40px;">
<p style="margin-right: 0.5px; font-weight: bold; color: rgb(165,165,165); text-align: left;"><span style="color:inherit; font-family:微软雅黑; font-size:14px">流年似水</span></p>

<p style="margin-right: 0.5px; font-weight: bold; color: rgb(165,165,165); text-align: left;"><span style="color:inherit; font-family:微软雅黑,microsoft yahei; font-size:14px">在指尖缓缓流淌</span></p>

<p style="margin-right: 0.5px; font-weight: bold; color: rgb(165,165,165); text-align: left;"><span style="color:inherit; font-family:微软雅黑,microsoft yahei; font-size:14px">回忆是暖</span></p>

<p style="margin-right: 0.5px; font-weight: bold; color: rgb(165,165,165); text-align: left;"><span style="color:inherit; font-family:微软雅黑,microsoft yahei; font-size:14px">在心里丝丝滑过</span></p>
</section>

<section style="box-sizing: border-box; width: 49%; float: right; padding: 0px 0.1em 0px 10px;">
<p style="margin-right: 0.5px; font-weight: bold; color: rgb(165,165,165);">&nbsp;</p>

<p style="margin-right: 0.5px; font-weight: bold; color: rgb(165,165,165);"><span style="color:inherit; font-size:14px; line-height:1.6em">生命里</span></p>

<p style="margin-right: 0.5px; font-weight: bold; color: rgb(165,165,165); text-align: left;"><span style="color:inherit; font-family:微软雅黑,microsoft yahei; font-size:14px">总有那么一些景</span></p>

<p style="margin-right: 0.5px; font-weight: bold; color: rgb(165,165,165); text-align: left;"><span style="color:inherit; font-family:微软雅黑,microsoft yahei; font-size:14px">令人久久不能忘怀</span> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
&nbsp; &nbsp; &nbsp; &nbsp;</section>
&nbsp; &nbsp;</fieldset>
</section>
&nbsp;

<section class="135editor" data-id="2280">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.1em 0px 0px;">
<section class="135editor" data-id="3789">
<fieldset style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarnt1Og9qlO3kD8XpgMJXKib6FdCtKcQlkPLxfjibFMOMUI8B2lWtMDqXJ5A/0" style="border-bottom-left-radius:100%; border-bottom-right-radius:100%; border-top-left-radius:100%; border-top-right-radius:100%; box-sizing:border-box; color:inherit; height:150px; width:300px">
<section style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center; text-shadow: rgb(201, 201, 201) 3px 4px 2px; word-wrap: break-word !important;"><span style="color:#669082"><span style="line-height:22.390625px; text-decoration:underline"><strong>每周二上新</strong></span></span></section>
</fieldset>
</section>
</section>

<section style="box-sizing: border-box; width: 50%; float: right; padding: 0px 0px 0px 0.1em;">
<section class="135editor" data-id="3789">
<fieldset style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntkyKvwiadicxq8y6qZGcmdEdTZic0mDsDTYkHj00PDZqWPyOvjM1ibf06LQ/0" style="border-bottom-left-radius:100%; border-bottom-right-radius:100%; border-top-left-radius:100%; border-top-right-radius:100%; box-sizing:border-box; color:inherit; height:150px; width:300px">
<section style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center; text-shadow: rgb(201, 201, 201) 3px 4px 2px; word-wrap: break-word !important;"><span style="color:#669082"><span style="line-height:22.390625px; text-decoration:underline"><strong>周末会员日</strong></span></span></section>
</fieldset>
</section>
</section>
</fieldset>
</section>

<section class="135editor" data-id="2280">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 50%; float: left; padding: 0px 0.1em 0px 0px;">
<section class="135editor" data-id="3789">
<fieldset style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarnt8hpCxQyCMTcKfMdxkwyho7pspprcEKdFw6NsgWM8lhMsAskozATL9w/0" style="border-bottom-left-radius:100%; border-bottom-right-radius:100%; border-top-left-radius:100%; border-top-right-radius:100%; box-sizing:border-box; color:inherit; height:150px; width:300px">
<section style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center; text-shadow: rgb(201, 201, 201) 3px 4px 2px; word-wrap: break-word !important;"><span style="color:#669082"><span style="line-height:22.390625px; text-decoration:underline"><strong>月中促销</strong></span></span></section>
</fieldset>
</section>
</section>

<section style="box-sizing: border-box; width: 50%; float: right; padding: 0px 0px 0px 0.1em;">
<section class="135editor" data-id="3789">
<fieldset style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarnt3gAwJsFqcyia15u7z5Ig9gvqzyyhdTlCR9eGKvb2kkIoEia9jHIyWDdA/0" style="border-bottom-left-radius:100%; border-bottom-right-radius:100%; border-top-left-radius:100%; border-top-right-radius:100%; box-sizing:border-box; color:inherit; height:150px; width:300px">
<section style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center; text-shadow: rgb(201, 201, 201) 3px 4px 2px; word-wrap: break-word !important;"><span style="color:#669082"><span style="line-height:22.390625px; text-decoration:underline"><strong>反击清仓</strong></span></span></section>
</fieldset>
</section>
</section>
</fieldset>
</section>
<img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntReM9M3BoFhw4NUcde63uekMsHxCeTGeIGibrbTpicJ0IsH7BzfGiaAuFQ/0" style="color:inherit; line-height:inherit; margin:10px 0px; width:100%" title="" vspace="0">
<section class="135editor" data-id="2280">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 58%; float: left; padding: 0px 0.1em 0px 0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarnt6TAbzuqgKibb90WvS1rMNSGicMdw2gN6az025XVUsu008lxiaX56caYkQ/0" style="box-sizing:border-box; height:auto !important; width:100%" title="" vspace="0">
<section class="135brush" data-style="color:rgb(102, 102, 102); font-size:14px; text-align:inherit; text-decoration:inherit">
<p style="padding: 5px; color: rgb(102, 144, 130); text-align: left;"><span style="font-size:12px">春品尝鲜 <span style="color:rgb(63, 63, 63)">￥</span><span style="color:rgb(63, 63, 63); font-size:16px"><strong>218</strong></span><strong> <span style="font-family:微软雅黑"><span style="color:rgb(165, 165, 165); line-height:18px">￥</span><span style="color:rgb(165, 165, 165)"><s style="color:rgb(165, 165, 165); text-decoration:line-through">230</s></span></span></strong></span></p>
</section>
</section>

<section style="box-sizing: border-box; width: 42%; float: right; padding: 0.8em 0px 0px 0em;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjia3kxPZcibh7CM3sFTiciarntgAPAOELOekbjetCHR18hkMmNkN43Btxcsh98zLa6TlgTImYCJWcxSw/0" style="box-sizing:border-box; height:auto !important; width:100%" title="" vspace="0">
<section class="135brush" data-style="color: rgb(102, 102, 102); font-size: 12px; font-weight: inherit; text-align: inherit; text-decoration: inherit; line-height: inherit;">
<p style="padding: 5px 2px; color: rgb(102, 144, 130); text-align: left;"><span style="font-size:12px">春品尝鲜 <span style="color:rgb(63, 63, 63)">￥</span><span style="color:rgb(63, 63, 63); font-size:16px"><strong>218</strong></span><strong> <span style="font-family:微软雅黑"><span style="color:rgb(165, 165, 165); line-height:18px">￥</span><s style="color:rgb(165, 165, 165); text-decoration:line-through">230</s></span></strong></span></p>
</section>
</section>
</fieldset>
</section>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: right;"><span style="color:rgb(127, 127, 127); font-size:12px"><strong>| 排版设计：135EDITOR&nbsp;<span style="color:rgb(127, 127, 127); line-height:1.6em">|</span></strong></span></p>

<p style="text-align: right;"><span style="color:#7f7f7f"><span style="font-size:12px; line-height:19.2000007629395px"><strong>图片采自：仓沐麻衣天猫店</strong></span></span></p>

<p style="text-align: right;">&nbsp;</p>

<p style="text-align: center;"><span style="line-height:1.6em"><img alt="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0"></span></p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;"><img src="http://mmbiz.qpic.cn/mmbiz/yqVAqoZvDibHq0q2cgbgXK83gtquDnqlNCmqac0kjfG5Tdic59mxTAJGxAPo9ichK7zRPv0AgvBG2AJYrOcdbfTVQ/640?tp=webp&amp;wxfrom=5" style="width:174.390625px"></p>

<p style="text-align: center;"><strong style="color:rgb(165, 165, 165); font-size:12px">扫描二维码，关注更多精彩~</strong></p>

<p>&nbsp;</p>
</blockquote>
</section>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150308/21114.html" target="_blank">商品展模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-21114-view_nums">221</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="21114" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',21114,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-21114-favor_nums">210</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-20538"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/6fd852b94db7444e207c1a89.jpg" title="诗意模板【once】" class="template-cover" data-id="20538" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/6fd852b94db7444e207c1a89.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="20538" data-name="诗意模板【once】" id="template-20538"><fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; white-space: normal; text-align: center; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section><span style="font-size:16px">北方的冬天</span></section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">文、杨晨</p>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; text-align: inherit; white-space: normal; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FJsQA7OqKdMziaIYNcUdotuqdPX7sO8desCQxANUzS5nCat6wtFhsydJxpDUFibhOXduOWqIXexj4Q/0); background-position: 100% 50%; background-repeat: no-repeat;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>北方的冬天是那种干冷</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>冷得十分清澈</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>没有泥沙，没有尘土</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你感受到的只有纯纯粹粹的冷</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>这样的时候</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>我只是想和你聊聊</section>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; white-space: normal; text-align: right; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FJsQA7OqKdMziaIYNcUdotuTpkO8ajyUfZuIJNawHu0eg44vic8oia7HCVTyDb3qg8RdD5L6UpeiaPyQ/0); background-position: 0% 50%; background-repeat: no-repeat;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你是不是也会有这样的时候</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>风吹过街道,引起你熟悉的感觉</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>一下子想起了远方胜过从前</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你是不是也曾有过在华灯初上的冬夜</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>看着四周的万家灯火</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>觉得自己其实是个孤单的人</section>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; white-space: normal; text-align: center; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FJsQA7OqKdMziaIYNcUdotu8fnu1HmogtDxbBOiaiao5kjUHEra6wRmn2AB7pBicd4eQI8DiazSAr5qvg/0); background-position: 0% 50%; background-repeat: no-repeat;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>也是不是会有一首早已经不再流行的歌</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>却一直在你心深处</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>也许你不曾远离家门</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>也许你一直拥有温暖</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>也许你可以逃避失落</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>但会不会有那么一瞬</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>熟悉幻化为陌生</section>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; text-align: inherit; white-space: normal; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FJsQA7OqKdMziaIYNcUdotudtlkLXRTTJZiaVAibicHCIvPvy60YKNYLXfnY4o9VRjiaBSFice7ZXWrHhA/0); background-position: 50% 50%; background-repeat: no-repeat;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>而你不知为何你在这里</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>在人心、信息、知识都迅速更新的这个时代里</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你还会不会相信永恒</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>在日月星辰都被证明不会永远的这个时代里</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你还会愿不愿意不变</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>在对与错也无截然划分的这个世界上</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你还会不会执著真理</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>当距离已经不再是生活的障碍</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你还会不会相守一生</section>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; white-space: normal; text-align: right; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FJsQA7OqKdMziaIYNcUdotugqlX9G3nv1MGa6WUbD0UFP03BOfXlXHGnodqCTProaVrTkMuenAojg/0); background-position: 100% 50%; background-repeat: no-repeat;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>如果路的尽头不再是家</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>如果心的深处不再有温暖</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>如果戴了面具的你不再感到疲惫</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你有没有想过重新开始</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>当高楼阻碍了蓝天</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>当岁月模糊了记忆</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你会不会觉得这个世界有些不同</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>当你在行色匆匆的路人当中放缓你的脚步</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>当你在繁华喧嚣的街头驻足你的身影</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你会不会突然觉得有一种不能融入的尴尬</section>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; white-space: normal; text-align: center; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FJsQA7OqKdMziaIYNcUdotu76V80DEmic692f56Ftw05ia6BSkjH7wpxM2akQ0qVkaiaIOkRcQNX2iczA/0); background-position: 50% 50%; background-repeat: no-repeat;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>谁说长安街的落叶不是风景</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>谁在乎窗外的绿缺少春意</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>谁不希望风起的时候</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>路，不再独走</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　　</section>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; text-align: inherit; white-space: normal; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FJsQA7OqKdMziaIYNcUdotu32QPyEgL3LOq181yzBFE4PNV0vonviabVICVg0l8WOXWiazWYvlIKkwA/0); background-position: 50% 50%; background-repeat: no-repeat;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>北方的冬天是那种干冷</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>冷得十分清澈</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>没有泥沙，没有尘土</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>你感受到的只有纯纯粹粹的冷</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　　</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>这样的时候</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>我只是想，和你聊聊</section>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-size: 15px; line-height: 24px;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-size: 15px; line-height: 24px;">&nbsp;</p>

<fieldset style="margin-bottom: 16px; padding: 8px; min-width: 0px; color: rgb(62, 62, 62); font-weight: inherit; white-space: normal; text-align: right; border: 0px solid rgb(226, 226, 226); font-size: 1.5em; line-height: 1; font-family: Times; text-decoration: inherit; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FJsQA7OqKdMziaIYNcUdotuYKG9s34PCND3ds4MdXRfqicV7MK5jX8yHQEfy09HLCY2gib6ov2tn4ow/0); background-position: 50% 50%; background-repeat: no-repeat;">
<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>北方的冬天是物理攻击</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>穿厚点儿就没事了</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>南方的冬天是魔法攻击</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>没有暖气，穿再多也没用</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>随便回复，我们聊聊</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>这样嘚瑟的时候</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>我只是想，和你聊聊</section>
</section>

<section style="margin-right: 3px; display: inline-block; vertical-align: top; width: 1.2em; line-height: 1.2; font-size: 0.5em; font-family: inherit; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(120, 124, 129);">
<section>　</section>
</section>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>
</fieldset>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; line-height: 24px;"><img src="http://mmbiz.qpic.cn/mmbiz/leIEJrL4t8dqhu2kJWeYGzJj7lNK2AcH7DQ6qSfslVsGojR1LFeZhdXJdDrZQdLicLrmsK5mAkP4taRiccWZQiaQg/640?tp=webp&amp;wxfrom=5"></p>

<section class="135editor" data-id="3587">
<fieldset style="border: 0px; margin: 0px -1px; box-sizing: border-box; width: 100%; clear: both; padding: 0px;">
<section style="margin : 8px 5px; width: 98%;box-sizing: border-box;text-align:center;"><img src="https://mmbiz.qlogo.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLGY24kZDvwRPHs0bIuFsLwIIgBIj4GxAHvgL7eUwZjah3V5tqrnb1wg/0" style="box-sizing:border-box; height:auto !important; padding:2px; width:33%"></section>
</fieldset>
</section>

<p style="text-align: center;"><span style="color:rgb(84, 141, 212); font-size:12px; text-decoration:underline">长按上图，识别二维码关注</span></p>

<p>&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-size: 15px; text-align: center; line-height: 2em;"><strong><span style="font-family:times; font-size:18px; line-height:21px; text-align:justify; text-indent:28px">Once</span></strong></p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; text-align: center; line-height: 2em;"><span style="font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px">可以理解为一次也可以理解为曾经</span></p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; text-align: center; line-height: 2em;"><span style="font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px">故事丨文字丨新潮丨前沿</span></p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62);font-size: 15px; text-align: center; line-height: 2em;"><span style="font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px">但我不用文艺这个词</span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150307/20538.html" target="_blank">诗意模板【once】</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-20538-view_nums">302</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="20538" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',20538,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-20538-favor_nums">280</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-20469"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/2454ae892dcbf9e2f53e0a64.jpg" title="景点介绍模板" class="template-cover" data-id="20469" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/2454ae892dcbf9e2f53e0a64.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="20469" data-name="景点介绍模板" id="template-20469"><section style="margin: 0px; text-align: center;">
<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor" data-id="23">
<p style="display: inline-block; orphans: 2; white-space: normal; widows: 2; font-size: 14px; line-height: 1.75em; margin: 10px 0px; padding: 15px 20px 15px 45px; outline: 0px; border: 0px currentcolor; color: rgb(62, 62, 62); vertical-align: baseline; background-image: url(http://www.wx135.com/img/bg/left_quote.jpg); background-color: rgb(241, 241, 241); text-align: left; background-position: 1% 5px; background-repeat: no-repeat no-repeat;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">冬天,很多人都系去一些比较温暖的地方旅游,而且有寒假,所以很多都会想一家老小出去走走,阳光、沙滩都是很多人向往的。那么你知道吗?有些海岛就适合冬天去!下面让哈好网小编带你看看这全球十个绝美海岛!</span></p>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<h1 style="text-align: center;font-size:24px;line-height:2.5em;"><span style="font-family:微软雅黑,microsoft yahei; font-size:24px"><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei">普吉岛</span><span style="font-family:微软雅黑,microsoft yahei">&nbsp;&nbsp;<span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; line-height:20px">Phuket Island&nbsp;</span><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei; line-height:20px">/</span></span></span></h1>

<section class="135editor" data-id="2324">
<section style="display:inline-block;width: 100%; box-sizing: border-box; border-color: rgb(39, 39, 36); color: inherit;text-align:center;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXH2ibcNMfibB0hZgP5gBNljiaNB6WQRK2nNDTHI7MGN5bkDDxXS4TC3XnA/0" style="box-sizing:border-box; color:inherit; height:auto !important; width:100%">
<section style="box-sizing: border-box; width: 100%; display: inline-block; border: 0px rgb(39, 39, 36); padding: 0.5em; color: inherit;">
<section style="box-sizing: border-box; color: inherit; display: inline-block;"><span style="font-family:微软雅黑,microsoft yahei"><span class="135title" style="background-color:rgb(38, 38, 38); border-color:rgb(38, 38, 38); box-sizing:border-box; color:rgb(255, 255, 255); display:inline-block; float:left; font-family:微软雅黑,microsoft yahei; font-size:1em; font-weight:inherit; height:1.2em; line-height:1.2; margin:0px 7px 0px 0px; padding:0px 0.1em; text-align:center; text-decoration:inherit; text-shadow:0px 1px; vertical-align:bottom; width:1.2em">+ </span><span style="box-sizing:border-box; color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:0.9em; font-weight:inherit; line-height:1.4em; text-align:inherit; text-decoration:inherit; vertical-align:top">普吉岛 /&nbsp;泰国 /</span></span></section>
</section>
</section>
</section>

<p>&nbsp;</p>

<section style="width:90%;display:inline-block;">
<p style="line-height: 2em; text-align: justify;">&nbsp;</p>

<section class="135editor" data-id="7308">
<p style="padding-bottom: 9px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); margin-bottom: 10px; font-weight: 500; line-height: 1.1; text-align: left;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">※ 入门海岛，消费低，体验丰富，适合一家老小</span></p>
</section>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">◆<span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">旺季：11月-4月</span></span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆停留时间：5天</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆景色：本岛的景色中规中矩,几个离岛,包括皮皮岛、皇帝岛的景色还是不错的。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆消费：机票便宜,物价不高。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆普吉岛特点：普吉开发得很早,也很成熟,水上运动和夜生活都很丰富,泰国特色也有保留。特别是它的离岛,包括大小PP岛、皇帝岛、007岛等等都很湛蓝,选择跳岛游非常不错。</span></p>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h1 style="text-align: center;font-size:24px;line-height:2.5em;"><span style="font-family:微软雅黑,microsoft yahei; font-size:24px"><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei">长滩岛</span><span style="font-family:微软雅黑,microsoft yahei">&nbsp;&nbsp;<span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; line-height:20px">Boracay&nbsp;</span><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei; line-height:20px">/</span></span></span></h1>

<section class="135editor" data-id="7237">
<section style="margin: 3px;background-color: #fff;display:inline-block;">
<section style="border: 0px rgb(182, 228, 253);text-align: center; margin: 0px; box-sizing: border-box; width: 100%; clear: both; padding: 0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXlrJicdguQaoiaS9CAXAKc8bAa0wq2vDRXZ4YVLHLYPCOMY1BO85JS88g/0" style="border-color:rgb(39, 39, 36); color:inherit; line-height:inherit; margin-bottom:0px; width:100%">
<fieldset style="display:inline-block;margin-top:0px;text-align:center;border: 0px rgb(39, 39, 36); margin: 0px; box-sizing: border-box; width: 100%; clear: both; padding: 0px;">
<section style="margin-top:0px;margin-bottom:0px; width: 100%; box-sizing: border-box; border-color: rgb(39, 39, 36); color: inherit;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXP5ew8U0Z2H23FkAibDYlV1t6y8avJ6LtpE7g4fiaUkgDm0QsPuJFhCJg/0" style="border-color:rgb(39, 39, 36); box-sizing:border-box; color:inherit; float:left; height:auto !important; width:50%" title="" vspace="0"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXx8byiaqM3oMq4U6mxPCkaVqpuibM3pTInlPEPQr37Q9sNblwIDzM0TGQ/0" style="border-color:rgb(39, 39, 36); box-sizing:border-box; color:inherit; float:right; height:auto !important; width:50%" title="" vspace="0"></section>

<section style="box-sizing: border-box; width: 100%; display: inline-block; border: 0px rgb(39, 39, 36); padding: 1em 0.5em; color: inherit;">
<section style="box-sizing: border-box; color: inherit; display: inline-block;"><span style="font-family:微软雅黑,microsoft yahei"><span class="135title" style="background-color:rgb(38, 38, 38); border-color:rgb(38, 38, 38); box-sizing:border-box; color:rgb(255, 255, 255); display:inline-block; float:left; font-family:微软雅黑,microsoft yahei; font-size:1em; font-weight:inherit; height:1.2em; line-height:1.2; margin:0px 7px 0px 0px; padding:0px 0.1em; text-align:center; text-decoration:inherit; text-shadow:0px 1px; vertical-align:bottom; width:1.2em">+ </span><span style="box-sizing:border-box; color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:0.9em; font-weight:inherit; line-height:1.4em; text-align:inherit; text-decoration:inherit; vertical-align:top">长滩岛 /&nbsp;泰国 /</span></span></section>
</section>
</fieldset>
</section>
</section>
</section>

<p>&nbsp;</p>

<section style="width:90%;display:inline-block;">
<p style="line-height: 2em; text-align: justify;">&nbsp;</p>

<section class="135editor" data-id="7308">
<p style="padding-bottom: 9px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); margin-bottom: 10px; font-weight: 500; line-height: 1.1; text-align: left;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">※ 最好的白沙滩,超多水上运动,梁静茹结婚地</span></p>
</section>

<p style="line-height: 1.75em; text-align: justify; margin-top: 10px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">◆旺季：11月-2月</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 10px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆景色：雪白的沙滩、细腻的白沙、碧蓝的海水、成片的帆船是长滩岛标志性的景色。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 10px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆停留时间：4天</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 10px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆消费：奢华和廉价并存的地方。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 10px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆长滩岛特点：世界上最有名最好的白沙滩,让长滩岛成为菲律宾最有名的旅游地之一。长滩岛不大,这里的美景/美食/购物/娱乐设施/酒店都集中在沙滩边。休闲运动成了这里最重要的体验环节。购物街D-MALL是整个长滩岛最热闹的地方。星期五海滩是长,滩岛最美沙滩,当地人称为“粉末沙”,当其细白沙藏在透明清澈海水里,就像漫步于牛乳湖的享受。</span></p>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h1 style="text-align: center;font-size:24px;line-height:2.5em;"><span style="font-family:微软雅黑,microsoft yahei; font-size:24px"><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei">薄荷岛</span><span style="font-family:微软雅黑,microsoft yahei">&nbsp;&nbsp;<span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; line-height:20px">BoholIsland&nbsp;</span><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei; line-height:20px">/</span></span></span></h1>

<section style="display:inline-block;width: 100%; box-sizing: border-box; border-color: rgb(39, 39, 36); color: inherit;text-align:center;">
<section class="135editor" data-id="9579">
<p style="margin-top: 0px; margin-bottom: 0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgqImdicjibnfaCiaklys2uuDoiaNdWqrcQJv7R3mRo806C6UBNk6S0eLsHXSO4LvGiby5QwxIIKpEg7Ag/0" style="box-sizing:border-box !important; float:left; height:auto !important; visibility:visible !important; width:100%; word-wrap:break-word !important" title="" vspace="0"></p>

<p style="margin-top: 0px; margin-bottom: 0px; "><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgqImdicjibnfaCiaklys2uuDooIlcWO5thDGLZO5FFpGp7vZBAtUAFDMWweBk6kNBicIzSbEGV5VdCLA/0" style="float:left; height:auto !important; line-height:1.6em; visibility:visible !important; width:100%" title="" vspace="0"></p>
</section>

<section style="box-sizing: border-box; width: 100%; display: inline-block; border: 0px rgb(39, 39, 36); padding: 1em 0.5em; color: inherit;">
<section style="box-sizing: border-box; color: inherit; display: inline-block;"><span style="font-family:微软雅黑,microsoft yahei"><span class="135title" style="background-color:rgb(38, 38, 38); border-color:rgb(38, 38, 38); box-sizing:border-box; color:rgb(255, 255, 255); display:inline-block; float:left; font-family:微软雅黑,microsoft yahei; font-size:1em; font-weight:inherit; height:1.2em; line-height:1.2; margin:0px 7px 0px 0px; padding:0px 0.1em; text-align:center; text-decoration:inherit; text-shadow:0px 1px; vertical-align:bottom; width:1.2em">+ </span><span style="box-sizing:border-box; color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:0.9em; font-weight:inherit; line-height:1.4em; text-align:inherit; text-decoration:inherit; vertical-align:top">薄荷岛 / 菲律宾 /</span></span></section>
</section>
</section>

<p>&nbsp;</p>

<section style="width:90%;display:inline-block;">
<p style="line-height: 2em; text-align: justify;">&nbsp;</p>

<section class="135editor" data-id="7308">
<p style="padding-bottom: 9px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); margin-bottom: 10px; font-weight: 500; line-height: 1.75em; text-align: left;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">※&nbsp;新晋海岛,独特白沙滩和巧克力山,适合度假休闲</span></p>
</section>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">◆旺季：没有明显的雨季和旱季。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆停留时间：5天</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆景色：沙滩很软,即使在暴晒的烈日下,踩上去仍是凉凉的。巧克力山、海豚群、mini眼镜猴都是特色之一。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆花费：物价不高。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">◆薄荷岛特点：宿雾薄荷岛是菲律宾7000多个岛屿中最美的一个,这里的沙滩可以媲美马尔代夫,这里海水清澈,是世界潜水爱好者的天堂。这里有奇特的巧克力山、世界最小的迷你眼镜猴、落差3000尺的海底悬崖、可爱的海豚群。巧克力山是薄荷岛独有的景色,也是世界十大奇景之一。</span></p>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h1 style="text-align: center;font-size:24px;line-height:2.5em;"><span style="font-family:微软雅黑,microsoft yahei; font-size:24px"><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei">兰卡威</span> &nbsp;<span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; line-height:20px">Pulau Langkawi&nbsp;</span><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei; line-height:20px">/</span></span></h1>

<section class="135editor" data-id="7237">
<section style="display:inline-block;margin: 3px; box-shadow: rgba(0, 0, 0, 0.298039) 0px 1px 3px; border-color: rgb(39, 39, 36); background-color: rgb(255, 255, 255);text-align:center;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXLTTs1VC6lwOliankJy6MegrYEBQic8KBayJEN54BkOib9145tX5MUyaYA/0" style="border-color:rgb(39, 39, 36); color:inherit; width:100%" title="" vspace="0">
<section style="box-sizing: border-box; width: 100%; display: inline-block; border: 0px rgb(39, 39, 36); padding:0.5em;padding-bottom:1em; color: inherit;"><span style="font-family:微软雅黑,microsoft yahei">&nbsp;</span>

<section style="box-sizing: border-box; color: inherit; display: inline-block;"><span style="font-family:微软雅黑,microsoft yahei"><span class="135title" style="background-color:rgb(38, 38, 38); border-color:rgb(38, 38, 38); box-sizing:border-box; color:rgb(255, 255, 255); display:inline-block; float:left; font-family:微软雅黑,microsoft yahei; font-size:1em; font-weight:inherit; height:1.2em; line-height:1.2; margin:0px 7px 0px 0px; padding:0px 0.1em; text-align:center; text-decoration:inherit; text-shadow:0px 1px; vertical-align:bottom; width:1.2em">+ </span><span style="box-sizing:border-box; color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:0.9em; font-weight:inherit; line-height:1.4em; text-align:inherit; text-decoration:inherit; vertical-align:top">兰卡威 /&nbsp;马来 /</span></span></section>
</section>
</section>

<p style="border-color: rgb(39, 39, 36);">&nbsp;</p>
</section>

<p>&nbsp;</p>

<section style="width:90%;display:inline-block;">
<p style="line-height: 2em; text-align: justify;">&nbsp;</p>

<section class="135editor" data-id="7308">
<p style="padding-bottom: 9px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); margin-bottom: 10px; font-weight: 500; line-height: 1.75em; text-align: left;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px">※&nbsp;<span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">世外桃源海岛,自然风景美,附近的槟城很怀旧。</span></span></p>
</section>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">◆旺季：10月至5月</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px"><span style="font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify">◆</span>停留时间：5天</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px"><span style="font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify">◆</span>景色：有独特的自然风景,七层瀑、“热水井”温泉、仙人洞、故事岩等。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px"><span style="font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify">◆</span>消费：合适,不高不低。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;"><span style="color:rgb(165, 165, 165); font-family:微软雅黑,microsoft yahei; font-size:14px"><span style="font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify">◆</span>兰卡威特点：兰卡威有清亮碧绿的海水和绵长平缓的沙滩,人少景美,非常幽静。到了兰卡威,你可以搭乘缆车全角度观赏这座海岛,也可以去巴雅岛来一次浮潜,或者躺卧珍南海滩享受日光浴,乘船穿越红树林。这里的海鲜大排档也非常值得一试。</span></p>

<p style="line-height: 1.75em; text-align: justify; margin-top: 5px;">&nbsp;</p>

<section class="135editor" data-id="7308">
<h2 class="135brush" data-brushtype="text" style="border-bottom: 1px solid #eee;margin-top: 20px;margin-bottom: 10px;font-weight: 500;line-height: 1.1;font-size: 22px;padding-bottom:9px;width:80%;display:inline-block;"></h2>
</section>

<p>&nbsp;</p>

<p style="margin-top: 5px; line-height: 1.75em; text-align: justify;">&nbsp;</p>

<section class="135editor" data-id="2845">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px; text-align: left;">
<section style="box-sizing: border-box; width: 50%; float:left; padding: 0px; text-align: right;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgQ9D1ibdc95Fr8cGtDgZV1ySqjH47Afop2viaiagicbC5kmHA3gxfibAsTNYrnvmJGBk3D0PQYwHDSNGg/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:auto !important"></section>

<section class="135brush" data-style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 50%; box-sizing: border-box; float: left; padding: 10px 0px 0px 1em">
<p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-size:12px; line-height:1.6em">扫描二维码，</span></p>

<p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-size:12px">关注更多精彩~</span></p>

<p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-size:12px">135感谢您的支持</span></p>

<p style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); "><span style="font-size:14px">&nbsp;</span></p>
</section>
</fieldset>
</section>

<p style="margin-top: 5px; line-height: 1.75em; text-align: justify;">&nbsp;</p>
</section>
</section>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150306/20469.html" target="_blank">景点介绍模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-20469-view_nums">379</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="20469" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',20469,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-20469-favor_nums">337</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-20395"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/e9c5c6d56c64e893983a02d5.jpg" title="无缝图片组合样式使用作品" class="template-cover" data-id="20395" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/e9c5c6d56c64e893983a02d5.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="20395" data-name="无缝图片组合样式使用作品" id="template-20395"><p>&nbsp;</p>

<section class="135editor" data-id="4" style="font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; white-space: normal;">
<h2 class="135brush" data-bcless="true" placeholder="浅色边框标题" style="margin-top: 10px; margin-bottom: 10px; padding: 10px; font-size: 16px; line-height: 25px; color: rgb(204, 63, 10); box-shadow: rgb(153, 153, 153) 1px 1px 2px; border-left-style: solid; border-color: rgb(251, 190, 167); border-left-width: 25px; background-color: rgb(253, 226, 216);"><span style="line-height:0px">﻿</span>澳洲旅游攻略——治愈篇</h2>
</section>

<section class="135editor" data-id="50">
<section style="margin: 10px 0px 0px 16px;"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="background-color:rgb(245, 189, 209); border-color:rgb(245, 189, 209); border-radius:0.3em; color:rgb(155, 24, 71); padding:0.2em 0.5em; text-align:center">粉红湖</span><span class="135brush" data-brushtype="text" style="background-color:rgb(255, 255, 255); border-radius:1.2em; border:1px solid rgb(245, 189, 209); color:rgb(245, 189, 209); height:1.2em; line-height:1.2em; margin-left:0.3em; padding:0.2em 0.5em">Pink Lake</span></strong></section>

<section class="135brush" data-style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)" style="margin: -1em auto 5px; padding: 20px 10px 5px; border-radius: 0.3em; border: 1px solid rgb(245, 189, 209); color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);">
<p style="font-size: 14px; line-height: 1.5em; color: inherit;">地址：Pink Lake，MiddleIsland，WA</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">位于澳洲西部深处，距离世界最孤立的城市珀斯（Perth）还要经过5小时的驾车才能到达，可谓离世间繁华最孤立的自然湖泊。科学家至今也不能确定到底是什么原因使其呈现诱人的粉色，又或是上帝看枯寂的澳洲内陆便心情一好为之添上一抹粉红。洁白悉尼的沙滩与嫩粉的湖水，这里是摄影家的天堂，更是被称为“死而无憾令人心境平复的”美景，</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">它还有个好听的名字，Lake Hiller（治愈之湖）</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">http://www.australia.com/explore/states/wa/pink-lake.aspx （英文）</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">http://www.australia.cn/destination/western-australia（中文）</p>
</section>
</section>

<section class="135editor" data-id="9579" style="color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; white-space: normal;">
<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="1.5" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXxg6nUDPibgo5WYbWV06PnfJBKPibFO1O8HqXsKvkPgJLml9hDKPjUxibQ/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXxg6nUDPibgo5WYbWV06PnfJBKPibFO1O8HqXsKvkPgJLml9hDKPjUxibQ/0?tp=webp&amp;wxfrom=5" style="float:left; visibility:visible !important; width:100%"></p>

<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" border="0" data-ratio="1.0019762845849802" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXv25nFcT1eRiaTIGjXa4NmB45aNkzPBvnI8nrJn6MHwaVHQgpeRDjfBA/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXv25nFcT1eRiaTIGjXa4NmB45aNkzPBvnI8nrJn6MHwaVHQgpeRDjfBA/0?tp=webp&amp;wxfrom=5" style="float:left; line-height:1.6em; visibility:visible !important; width:100%" title="" vspace="0"></p>

<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="0.66600790513834" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXMScIos9AiauS9FfKSNBh1Ig12QOJjylW02JQkumRwuy6alMHsjcEdbg/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXMScIos9AiauS9FfKSNBh1Ig12QOJjylW02JQkumRwuy6alMHsjcEdbg/0?tp=webp&amp;wxfrom=5" style="float:left; line-height:1.6em; visibility:visible !important; width:100%"></p>
</section>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"><img data-ratio="0.017786561264822136" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0?tp=webp&amp;wxfrom=5" style="visibility:visible !important; width:auto !important"></p>

<section class="135editor" data-id="50">
<section style="margin: 10px 0px 0px 16px;"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="background-color:rgb(55, 74, 174); border-color:rgb(55, 74, 174); border-radius:0.3em; color:rgb(255, 255, 255); padding:0.2em 0.5em; text-align:center">澳洲天空之境</span><span class="135brush" data-brushtype="text" style="background-color:rgb(255, 255, 255); border-radius:1.2em; border:1px solid rgb(55, 74, 174); color:rgb(55, 74, 174); height:1.2em; line-height:1.2em; margin-left:0.3em; padding:0.2em 0.5em">Lake Tyrrell</span></strong></section>

<section class="135brush" data-style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)" style="margin: -1em auto 5px; padding: 20px 10px 5px; border-radius: 0.3em; border: 1px solid rgb(55, 74, 174); color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);">
<p style="font-size: 14px; line-height: 1.5em; color: inherit;">地址：lake tyrrell，sealake，VIC</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">位于墨尔本西北4小时的镜面盐湖，拥有12万年历史的盐湖经过时境变迁，从当初的13米蒸发到现在纤薄的水面，形成了独特的天海合一的景观。传说以前原住民每年冬天会在会在这里观察星象，预测未来。4月到10月是前往盐湖的最佳时节，水位刚好倒映出天空美景，人站在海天一线的美景中，用相机记录下来，便有了这一幅幅如幻象世界的作品。</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">http://sealake.vic.au/about/tyrrell（英文）</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">http://www.51oz.com/thread-4420-1-1.html（中文）</p>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor" data-id="9579" style="color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; white-space: normal;">
<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="0.66600790513834" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXJQMo5FYvRRwrAVlzX3icJ7Hz2anXicDibfkPHASiaVUh7eg4vQTwxhVJIA/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXJQMo5FYvRRwrAVlzX3icJ7Hz2anXicDibfkPHASiaVUh7eg4vQTwxhVJIA/0?tp=webp&amp;wxfrom=5" style="float:left; visibility:visible !important; width:100%"></p>

<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="0.66600790513834" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXEkVoz1zFpezn1VSGnqYYt4jjvLZlRwhGicia5z9aEmjzLXaqCn2H9hwg/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXEkVoz1zFpezn1VSGnqYYt4jjvLZlRwhGicia5z9aEmjzLXaqCn2H9hwg/0?tp=webp&amp;wxfrom=5" style="float:left; line-height:1.6em; visibility:visible !important; width:100%"></p>

<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="0.8320158102766798" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXHRgCrAGapdWZb5uqIqLU4Z4qHSBibwib4EP5bibNwz1E8wfg1PElqq4vQ/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXHRgCrAGapdWZb5uqIqLU4Z4qHSBibwib4EP5bibNwz1E8wfg1PElqq4vQ/0?tp=webp&amp;wxfrom=5" style="float:left; line-height:1.6em; visibility:visible !important; width:100%"></p>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; text-align: right;"><span style="font-size:14px">文字来源｜澳大利亚旅游局</span></p>

<p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; text-align: right;"><span style="font-size:14px">摄影｜N74photography Mr.Cheese</span></p>

<p>&nbsp;</p>

<section class="135editor" data-id="3" style="font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; white-space: normal;">
<section style="margin: 2px;">
<section style="margin-left: 1em; line-height: 1.4em; color: inherit;"><span style="color:inherit; font-size:14px"><strong style="line-height:32px; white-space:pre-wrap"><span class="135brush" data-brushtype="text" data-mce-style="color: #a5a5a5;" placeholder="关于135编辑器" style="background-color:rgb(235, 103, 148); border-radius:5px; color:rgb(255, 255, 255); padding:4px 10px">OZService</span></strong></span></section>

<section class="135brush" data-style="color:rgb(89, 89, 89); font-size:14px; line-height:28px" style="margin-top: -0.7em; padding: 10px 1em; font-size: 1em; border: 1px solid rgb(235, 103, 148); border-radius: 0.4em; color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);">
<p style="min-height: 1em; white-space: pre-wrap; color: rgb(89, 89, 89); line-height: 28px;">澳洲华人贴身生活小助手，更多服务，敬请期待~</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(89, 89, 89); line-height: 28px;"><img data-ratio="1" data-src="http://mmbiz.qpic.cn/mmbiz/3Wnh6UHoibyntHa8GnT1DIciaBmicDWSGECPmSoySnaChNXS3zyZQY4blPV50MEV9u3LI2hVictiaS5TSzDKOUU0D3w/0" data-w="430" src="http://mmbiz.qpic.cn/mmbiz/3Wnh6UHoibyntHa8GnT1DIciaBmicDWSGECPmSoySnaChNXS3zyZQY4blPV50MEV9u3LI2hVictiaS5TSzDKOUU0D3w/0?tp=webp&amp;wxfrom=5" style="color:inherit; visibility:visible !important; width:auto !important"></p>
</section>
</section>
</section>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150306/20395.html" target="_blank">无缝图片组合样式使用作品</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-20395-view_nums">1365</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="20395" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',20395,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-20395-favor_nums">188</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-17967"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/a980ee5ab033a62f94a08b31.jpg" title="招贤纳士模板" class="template-cover" data-id="17967" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/a980ee5ab033a62f94a08b31.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="17967" data-name="招贤纳士模板" id="template-17967"><section class="135editor">
<fieldset style="clear: both; padding: 0px; border: 0px none; margin: 1em 0px 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="padding: 0px 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">理念</section>
</section>
</fieldset>
</section>

<section class="135editor">
<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; max-width: 100%; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(116, 185, 11); border-color: rgb(229, 243, 208); background-image: -webkit-linear-gradient(left, rgb(230, 249, 202), rgb(207, 233, 167)); background-color: rgb(255, 255, 220);">
<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">营造团结，友爱，自由，包容的大家庭</p>

<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">尊重包容各种奇葩~</p>

<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">做排版最快捷的微信排版工具</p>
</section>
</section>

<section class="135editor">
<fieldset style="clear: both; border: 0px none; margin-top: 1em; margin-bottom: 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255);">
<section class="135brush" data-brushtype="text" style="padding-right: 0.5em; padding-left: 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">产品</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjstr86wliaib2El5sCU5Ge9icqM9hLALMC57SMJB28OEjmVfepl4kKG5tiaesnTJUv8n0jq3UbuYIo4g/0" style="-webkit-box-shadow:rgb(102, 102, 102) 0.2em 0.2em 0.5em; box-shadow:rgb(102, 102, 102) 0.2em 0.2em 0.5em; box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important"></fieldset>
</section>

<section class="135editor">
<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(116, 185, 11); border-color: rgb(229, 243, 208); background-image: -webkit-linear-gradient(left, rgb(230, 249, 202), rgb(207, 233, 167)); background-color: rgb(255, 255, 220);">
<p style="text-align: justify; color: inherit; border-color: rgb(229, 243, 208);">135编辑器是提子科技开发的一款在线微信排版工具，特色在于半自动排版“秒刷”功能，是国内第一款可以同时给图片和多段落文字的排版的工具。其不断更新的系统推荐模板和多功能样式也为不懂代码的微信编辑们提供了引导帮助。</p>
</section>
</section>

<section class="135editor">
<fieldset style="clear: both; border: 0px none; margin-top: 1em; margin-bottom: 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255);">
<section class="135brush" data-brushtype="text" style="padding-right: 0.5em; padding-left: 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">关于我们</section>
</section>
</fieldset>
</section>

<section class="135editor">
<section style="padding: 40px 40px; color: #737373; background: #f8f8f8;">
<p style="color: inherit;"><img src="http://gtms01.alicdn.com/tps/i1/TB1VMruGpXXXXabXpXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px">&nbsp;咳咳，想来的小伙伴可以进QQ咨询我们大Boss@邹齐龙，一言两语说不清哪~</p>

<section class="135brush" data-style="background-color:rgb(248, 248, 248); color:rgb(115, 115, 115); font-size:14px; line-height:21px" style="color: inherit;"></section>

<p style="text-align: right; color: inherit;"><img src="http://gtms02.alicdn.com/tps/i2/TB1zQbsGpXXXXX1XFXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>

<p style="text-align: right; color: inherit;">&nbsp;</p>

<p style="text-align: right; color: inherit;">某航小编如是说</p>
</section>
</section>

<section class="135editor">
<fieldset style="clear: both; border: 0px none; margin-top: 1em; margin-bottom: 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255);">
<section class="135brush" data-brushtype="text" style="padding-right: 0.5em; padding-left: 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">QQ群号：204411951</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="margin: 0px 0px 0.5em; width: auto; clear: both; overflow: hidden; border: 0px none; padding: 0px; text-align: left;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6csy5jNvOgG3aWVox84o9AjFpMpHe759EjuWAUCmibmv2Tc6RbrCvKYA/0" style="color:inherit; float:left; width:100% !important">
<section style="display: inline-block; text-align: left; margin: -4em 0px 0px; opacity: 0.7; float: left; padding: 0.1em; width: 100%; height: 4em; color: rgb(255, 255, 255); border-color: rgb(33, 33, 34); background-color: rgb(33, 33, 34);">
<section class="135brush" data-style="text-align: center; border-color: rgb(128, 177, 53); color: inherit;font-size:16px" style="display: inline-block; width: 100%; color: inherit; margin-top: 1.2em; border-color: rgb(33, 33, 34);">
<p style="text-align: center; border-color: rgb(33, 33, 34); color: inherit; font-size: 16px;"><span style="border-color:rgb(33, 33, 34); color:inherit; line-height:1.6em">无所不能的大Bosss</span></p>
</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 65%; float: right; padding: 0px 0px 0px 0.1em;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6ZCTAU8iax3XXic4ovRxws3jlwF8bjShCBt8wbfEkfuRPiayZic3nczwj2g/0" style="box-sizing:border-box; height:auto !important; width:100%" title="" vspace="0"></section>

<section style="display: inline-block; width: 35%; box-sizing: border-box; float: right; padding: 0px 0.1em 0px 0px; text-align: right;">
<section style="box-sizing: border-box; margin-right: 4px; padding: 4px 6px; color: rgb(52, 54, 60); border-bottom-width: 1px; border-bottom-style: solid; border-color: black; font-size: 1.2em;  font-weight: inherit; text-align: inherit; text-decoration: inherit; background-color: transparent;">
<section class="135title" style="box-sizing: border-box;">茶仔老师</section>
</section>

<section style="box-sizing: border-box; margin-right: 0.3em; padding: 3px 5px; color: rgb(120, 124, 129); font-size: 0.9em;  font-weight: inherit; text-align: inherit; text-decoration: inherit;">
<p style="box-sizing: border-box;">威严庄重</p>

<p style="box-sizing: border-box;">答疑解惑</p>

<p style="box-sizing: border-box;">各项全能</p>
</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 65%; float: left; padding: 0px 0.1em 0px 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6FL8iagJpyEq8uxThSSw5fbGY5e3xSicTRGc3ybp9nW3cjMlX2UmjLwLA/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important"></section>

<section style="display: inline-block; width: 35%; box-sizing: border-box; float: left; padding: 0px 0px 0px 0.1em;">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box; margin-right: 4px; padding: 4px 6px; border-bottom-width: 2px; border-bottom-style: solid; font-size: 1.2em; font-weight: bold;color: rgb(102,97,91); border-color: rgb(102,97,91);">航航小编</section>

<section class="135brush" data-styel="line-height: 2em;" style="box-sizing: border-box; margin-right: 0.3em; padding: 0.3em 0.5em; color: rgb(102,97,91); font-size: 0.9em;">
<p>时而粗现</p>

<p>时而不见</p>

<p>特技T人</p>
</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="margin: 0px 0px 0.5em; width: auto; clear: both; overflow: hidden; border: 0px none; padding: 0px; text-align: left;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6wY8nEqamTUqTbHFRDicicRkqyur4D79ruy5I4MLIdwiaBLrxRfavS553Q/0" style="color:inherit; float:left; width:100% !important">
<section style="display: inline-block; text-align: left; margin: -4em 0px 0px; opacity: 0.7; float: left; padding: 0.1em; width: 100%; height: 4em; color: rgb(239, 239, 239); border-color: rgb(60, 40, 34); background-color: rgb(60, 40, 34);">
<section class="135brush" data-style="text-align: center; border-color: rgb(128, 177, 53); color: inherit;font-size:16px" style="display: inline-block; width: 100%; color: inherit; margin-top: 1.2em; border-color: rgb(60, 40, 34);">
<p style="text-align: center; border-color: rgb(60, 40, 34); color: inherit; font-size: 16px;">有范儿的设计师葱爷</p>
</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="clear: both; border: 0px none; margin-top: 1em; margin-bottom: 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255);">
<section class="135brush" data-brushtype="text" style="padding-right: 0.5em; padding-left: 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">招新季</section>
</section>
</fieldset>
</section>

<section class="135editor">
<h2 class="135brush" data-bcless="darken" placeholder="深色边框标题" style="margin: 10px 0px; padding: 10px; font-size: 16px; line-height: 25px; text-shadow: rgb(34, 95, 135) 0px 1px 0px; color: rgb(123, 123, 111); border-radius: 4px; box-shadow: rgb(153, 153, 153) 2px 2px 4px; border-left-width: 10px; border-left-style: solid; border-color: rgb(221, 221, 217); background-color: rgb(245, 245, 244);">PHP研发N名</h2>
</section>

<section class="135editor">
<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(116, 185, 11); border-color: rgb(229, 243, 208); background-image: -webkit-linear-gradient(left, rgb(230, 249, 202), rgb(207, 233, 167)); background-color: rgb(255, 255, 220);">
<p style="text-align: center; color: inherit; border-color: rgb(229, 243, 208);">薪水按能力可调节，具体面谈</p>

<p style="text-align: center; color: inherit; border-color: rgb(229, 243, 208);">经验不低于一年</p>
</section>
</section>

<section class="135editor">
<h2 class="135brush" data-bcless="darken" placeholder="深色边框标题" style="margin-top: 10px; margin-bottom: 10px; padding: 10px; font-size: 16px; line-height: 25px; text-shadow: rgb(34, 95, 135) 0px 1px 0px; color: rgb(123, 123, 111); border-radius: 4px; box-shadow: rgb(153, 153, 153) 2px 2px 4px; border-left-width: 10px; border-left-style: solid; border-color: rgb(221, 221, 217); background-color: rgb(245, 245, 244);">网页设计师N名</h2>
</section>

<section class="135editor">
<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(116, 185, 11); border-color: rgb(229, 243, 208); background-image: -webkit-linear-gradient(left, rgb(230, 249, 202), rgb(207, 233, 167)); background-color: rgb(255, 255, 220);">
<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">薪水按能力可调节，具体面谈</p>

<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">经验不低于一年</p>
</section>
</section>

<section class="135editor">
<fieldset style="margin: 96px 16px 16px; border: 1px solid rgb(159, 136, 127); text-align: center; border-radius: 8px; font-size: 18px; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; padding: 0px;">
<section style="margin: -3.3em auto 0px; color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPh3REFnLcFPEhtDulVqlTvGQabhn6NFXROrXiaJ6WLSyN1H1B6iczheYBSRA4oyibJOjdNoH5AhDDTWg/0" style="background:none 0% 0% repeat scroll rgb(255, 255, 255); border-radius:100%; border:2px solid rgb(159, 136, 127); box-shadow:rgb(201, 201, 201) 0px 2px 2px 2px; box-sizing:border-box; color:inherit; height:108px; width:108px"></section>

<section class="135brush" data-brushtype="text" data-style="text-align: left; font-size: 14px; color: inherit;" style="margin: 8px 15px; line-height: 1.4; box-sizing: border-box; color: inherit;">
<p style="text-align: left; font-size: 14px; color: inherit;">135编辑器是非常好用的图文编辑工具，这里有很丰富的图文排版格式，图片素材，全文模板。</p>
</section>

<section style="margin: 10px 15px; border-top-width: 1px; border-top-style: solid; border-color: rgb(159, 136, 127); box-sizing: border-box; color: inherit;">
<p style="color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPh3REFnLcFPEhtDulVqlTvGn0HgicdLTice5dRnxUNLwUVcpwRs2B4bgnKZT6slB53zm6s4MF7qNr3g/0" style="color:inherit; font-size:18px; font-weight:inherit; height:200px; line-height:inherit; margin-bottom:0.3em; margin-left:auto; margin-right:auto; text-decoration:inherit; visibility:visible !important; width:200px"></p>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="margin: 0px; padding: 0px; border: 0px; max-width: 100%; text-align: center; word-wrap: break-word !important; box-sizing: border-box !important;">
<section style="max-width: 100%; display: inline-block; word-wrap: break-word !important; box-sizing: border-box !important; color: inherit;">
<section style="font-size: 16.3636360168457px; max-width: 100%; display: inline-block; word-wrap: break-word !important; box-sizing: border-box !important; color: inherit;">
<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; color: inherit;"><strong style="box-sizing:border-box !important; color:inherit; max-width:100%; word-wrap:break-word !important">·END·</strong><br style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important; color: inherit;">
&nbsp;</p>
</section>

<section class="135title" style="max-width: 100%; margin: 0.2em 0.5em 0.1em; color: rgb(71, 193, 168); font-weight: inherit; text-align: inherit; text-decoration: inherit; word-wrap: break-word !important; box-sizing: border-box !important; border-color: rgb(71, 193, 168);"><span style="font-size:20px"><strong style="border-color:rgb(71, 193, 168); box-sizing:border-box !important; color:inherit; max-width:100%; word-wrap:break-word !important"><span style="border-color:rgb(71, 193, 168); box-sizing:border-box !important; color:inherit; line-height:32.7272720336914px; max-width:100%; word-wrap:break-word !important">求贤招新</span><span style="border-color:rgb(71, 193, 168); box-sizing:border-box !important; color:inherit; line-height:22.2222232818604px; max-width:100%; word-wrap:break-word !important">模板</span></strong></span></section>

<section style="font-size: 16.3636360168457px; max-width: 100%; width: 208px; border-top-style: solid; border-top-width: 1px; border-top-color: black; line-height: 1; word-wrap: break-word !important; box-sizing: border-box !important; color: inherit;"></section>

<section class="135brush" data-brushtype="text" style="font-size: 1em; max-width: 100%; margin: 0.5em 1em; line-height: 1; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168); word-wrap: break-word !important; box-sizing: border-box !important; border-color: rgb(71, 193, 168);"><span style="border-color:rgb(71, 193, 168); box-sizing:border-box !important; color:inherit; font-size:16.3636360168457px; max-width:100%; word-wrap:break-word !important">BY航航小编</span></section>
<span style="background-color:rgb(71, 193, 168); border-radius:0.3em; box-shadow:rgb(16, 146, 113) 0.1em 0.1em 0.1em; box-sizing:border-box !important; color:rgb(255, 255, 255); display:inline-block; font-size:1em; font-weight:inherit; max-width:100%; padding:0.3em; text-align:inherit; text-decoration:inherit; word-wrap:break-word !important">微信号：tizi135</span></section>
</fieldset>
</section>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17967.html" target="_blank">招贤纳士模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17967-view_nums">3724</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17967" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17967,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17967-favor_nums">477</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-17808"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/4bcc63f3bed77b662228638b.png" title="短句模板" class="template-cover" data-id="17808" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/4bcc63f3bed77b662228638b.png" alt="">						</div>
						<div class="editor-style-content hidden" data-id="17808" data-name="短句模板" id="template-17808"><p>&nbsp;</p>

<section class="135editor">
<section style="margin: 10px 0px 0px 16px;"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="background-color:rgb(159, 136, 127); border-color:rgb(159, 136, 127); border-radius:0.3em; color:rgb(255, 255, 255); padding:0.2em 0.5em; text-align:center">提子135</span><span class="135brush" data-brushtype="text" style="background-color:rgb(255, 255, 255); border-radius:1.2em; border:1px solid rgb(159, 136, 127); color:rgb(159, 136, 127); height:1.2em; line-height:1.2em; margin-left:0.3em; padding:0.2em 0.5em">tizi135</span></strong></section>

<section class="135brush" data-style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)" style="margin: -1em auto 5px; padding: 20px 10px 5px; border-radius: 0.3em; border: 1px solid rgb(159, 136, 127); color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);">
<section class="135editor">
<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
<section style="display: inline-block; box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">名言模板</section>

<section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);"><span style="background-color:rgb(239, 239, 239); color:rgb(107, 77, 64); font-size:12px; line-height:28.0000019073486px; text-align:center">by 航航小编</span></section>
</section>
</fieldset>
</section>

<p style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)">&nbsp;</p>
</section>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(55, 74, 174); margin: 0.3em 0px; padding-bottom: 1.5em; font-size: 14px; font-weight: bold; text-align: center; text-decoration: inherit; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6icfTnOdQuicuULHrtg1iaCVGuYZdpCMFdanjzgyhfQDkybH3OWTPXMh7Q/0" style="border-radius:50%; color:inherit; height:112px; margin-right:10px; vertical-align:middle; width:112px">
<section style="border-left-width: 1px; border-left-style: solid; border-color: rgb(55, 74, 174); padding-left: 1em; text-align: left; display: inline-block; height: 6em; vertical-align: top; color: rgb(55, 74, 174); margin-top: 1em;">
<h2 class="135brush" data-brushtype="text" style="width: 100%; overflow: hidden; height: 50%; font-size: 1.5em; margin-top: -0.15em; border-color: rgb(55, 74, 174); color: inherit; margin-bottom: 0.5em;">时间</h2>

<section class="135brush" data-style="font-size: 16px;" style="font-size: 16px; border-color: rgb(55, 74, 174); color: inherit;">
<p style="border-color: rgb(55, 74, 174); color: inherit;">=Time=</p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<section style="padding: 40px 40px; color: #737373; background: #f8f8f8;">
<p><img src="http://gtms01.alicdn.com/tps/i1/TB1VMruGpXXXXabXpXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>

<section class="135brush" data-style="background-color:rgb(248, 248, 248); color:rgb(115, 115, 115); font-size:14px; line-height:21px">生命是以时间为单位的，浪费别人的时间等于谋财害命；浪费自己的时间，等于慢性自杀。——鲁迅</section>

<p style="text-align:right"><img src="http://gtms02.alicdn.com/tps/i2/TB1zQbsGpXXXXX1XFXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(159, 136, 127); margin: 0.3em 0px; padding-bottom: 1.5em; font-size: 14px; font-weight: bold; text-align: center; text-decoration: inherit; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6L4acWVD6heAHnDocua03PavkNeVKQDScv5cqgicIhTStdJ8dibumjGog/0" style="border-radius:50%; color:inherit; height:112px; margin-right:10px; vertical-align:middle; width:112px">
<section style="border-left-width: 1px; border-left-style: solid; border-color: rgb(159, 136, 127); padding-left: 1em; text-align: left; display: inline-block; height: 6em; vertical-align: top; color: rgb(159, 136, 127); margin-top: 1em;">
<h2 class="135brush" data-brushtype="text" style="width: 100%; overflow: hidden; height: 50%; font-size: 1.5em; margin-top: -0.15em; border-color: rgb(159, 136, 127); color: inherit; margin-bottom: 0.5em;">生命</h2>

<section class="135brush" data-style="font-size: 16px;" style="font-size: 16px; border-color: rgb(159, 136, 127); color: inherit;">
<p style="font-size: 16px; border-color: rgb(159, 136, 127); color: inherit;">=Life=</p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<section style="padding: 40px 40px; color: #737373; background: #f8f8f8;">
<p><img src="http://gtms01.alicdn.com/tps/i1/TB1VMruGpXXXXabXpXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>

<section class="135brush" data-style="background-color:rgb(248, 248, 248); color:rgb(115, 115, 115); font-size:14px; line-height:21px">必须记住我们学习的时间有限的。时间有限，不只由于人生短促，更由于人事纷繁。——斯宾塞</section>

<p style="text-align:right"><img src="http://gtms02.alicdn.com/tps/i2/TB1zQbsGpXXXXX1XFXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(252, 180, 43); margin: 0.3em 0px; padding-bottom: 1.5em; font-size: 14px; font-weight: bold; text-align: center; text-decoration: inherit; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma61zdOkmqISYEDdbWDOUibyIpfibS6NmvgCwVLk3FiaYszwtLnyV5ex5Nkg/0" style="border-radius:50%; color:inherit; height:112px; margin-right:10px; vertical-align:middle; width:112px">
<section style="border-left-width: 1px; border-left-style: solid; border-color: rgb(211,172,156); padding-left: 1em; text-align: left; display: inline-block; height: 6em; vertical-align: top;color: rgb(211,172,156); margin-top: 1em;">
<h2 class="135brush" data-brushtype="text" style="width: 100%; overflow: hidden; height: 50%; font-size: 1.5em; margin-top: -0.15em; border-color: rgb(211,172,156); color: inherit;margin-bottom:0.5em;">计划</h2>

<section class="135brush" data-style="font-size: 16px;" style="font-size: 16px; border-color: rgb(211,172,156); color: inherit;">
<p>=Planning=</p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<section style="padding: 40px 40px; color: #737373; background: #f8f8f8;">
<p><img src="http://gtms01.alicdn.com/tps/i1/TB1VMruGpXXXXabXpXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>

<section class="135brush" data-style="background-color:rgb(248, 248, 248); color:rgb(115, 115, 115); font-size:14px; line-height:21px">记住吧：只有一个时间是重要的，那就是现在！它所以重要，就是因为它是我们有所作为的时间。——托尔斯泰</section>

<p style="text-align:right"><img src="http://gtms02.alicdn.com/tps/i2/TB1zQbsGpXXXXX1XFXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>
</section>
</section>

<p>&nbsp;</p>

<p style="text-align: center;">&nbsp;</p>

<section class="135editor">
<section style="margin:10px 15%;">
<h2 class="135brush" data-brushtype="text" placeholder="请输入标题" style="font-size: 16px; margin: 10px 0px; padding: 10px; max-width: 100%; border-top-style: solid; border-top-width: 1px; border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 1px; line-height: 25px; color: rgb(33, 33, 34); text-align: center; border-color: rgb(33, 33, 34);"><strong><span style="font-size:18px">微信小编如何节约时间？</span></strong></h2>

<section class="135brush" data-style="font-size:14px;text-align:center" style="line-height: 25px; color: inherit;">
<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">135编辑器，微信排版少不了它</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">一键秒刷，</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">文字、图片啥都能刷。</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">有135编辑器助你排版，</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">可以早点下班回家~</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">有问题来我们QQ群 ：149659920</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">有一群热心小伙伴给你解答~</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">快点来~</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">萌妹基友在等你啊~</span></p>
</section>
</section>
</section>

<p style="text-align:center;"><strong><span style="font-size:20px"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="cursor:pointer; line-height:1.6em; white-space:normal; z-index:-1"></span></strong></p>

<p style="text-align:center;">&nbsp;</p>

<section class="135editor">
<section>
<section style="width:48%;display:inline-block;float:left;">
<section style="padding:20px 25px;border:1px solid #e7e7e7;text-align:center;">
<p><img src="http://img.wx135.com/135editor/logo-135-web.png" style="height:50px; margin-bottom:15px"></p>

<h3 class="134title" style="font-size:16px;font-weight:bold;margin:0 0 10px 0;">135编辑器</h3>

<section class="135brush" data-style="clear:none;">
<p style="clear:none;margin:0 0;line-height:1.5em;">生而排版</p>

<p style="clear:none;margin:0 0;line-height:1.5em;"><span style="text-align:center">为你而美</span></p>
</section>
</section>
</section>

<section style="margin-left:4%;width:48%;display:inline-block;text-align:center;">
<section style="padding:20px 25px;border:1px solid #e7e7e7;">
<p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiazjsibqzMEbFXfnLK8n31vao2YXGwz6wxT8wBGG0FRkuzvGvIztzq8Re1R50omeH8KoicjL2HBx7gQ/0" style="height:50px; margin-bottom:15px"></p>

<h3 class="134title" style="font-size:16px;font-weight:bold;margin:0 0 10px 0;">秒刷</h3>

<section class="135brush" data-style="clear:none;margin:0 0;line-height:1.5em;">
<p style="clear:none;margin:0 0;line-height:1.5em;">一键排版</p>

<p style="clear:none;margin:0 0;line-height:1.5em;">珍惜生命</p>
</section>
</section>
</section>

<p style="height:2px;clear:both;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="cursor:pointer; line-height:1.6em; z-index:-1"></p>
</section>
</section>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17808.html" target="_blank">短句模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17808-view_nums">1459</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17808" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17808,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17808-favor_nums">715</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-17717"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/b837aa55eae1f5c93f33bb8e.png" title="3.8向女神致敬模板" class="template-cover" data-id="17717" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/b837aa55eae1f5c93f33bb8e.png" alt="">						</div>
						<div class="editor-style-content hidden" data-id="17717" data-name="3.8向女神致敬模板" id="template-17717"><p>&nbsp;</p>

<p style="line-height: 2em; text-align: center;"><span style="color:rgb(89, 89, 89); font-family:微软雅黑,microsoft yahei; font-size:20px">3.8，向女神致敬！</span></p>

<p>&nbsp;</p>

<p style="line-height: 2em;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6NbwiazBbyPf96HIZLMnr6tib1UcAIbyN9g932qxCQHqV0ibf4X6jBkwuA/0"></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<section class="135brush" style="white-space: normal; margin: 2px 0px; padding: 0px; max-width: 100%; border-top-style: solid; border-top-width: 2px; border-color: rgb(197, 64, 114); border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 2px; line-height: 25px; color: rgb(197, 64, 114); font-weight: bold; text-align: center;">
<section style="border-color: rgb(197, 64, 114); color: inherit;">
<fieldset style="border: 0px rgb(197, 64, 114); text-align: left; margin: 0.8em 0px 0.5em; box-sizing: border-box; padding: 0px; color: inherit;">
<section style="color: inherit; display: inline-block; width: 1.3em; font-size: 5em; font-weight: inherit; line-height: 1em; vertical-align: top; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box; color: inherit; border-color: rgb(197, 64, 114);">01</section>
</section>

<section class="135title" style="display: inline-block; margin-left: 0.5em; margin-top: 0px; text-align: left; box-sizing: border-box; color: inherit; border-color: rgb(197, 64, 114);">
<section style="box-sizing: border-box; color: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="margin-top: 0px; box-sizing: border-box; color: inherit; display: inline-block; font-size: 1.8em; font-weight: inherit; line-height: 1.2; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);"><span style="border-color:rgb(197, 64, 114); color:inherit; font-size:18px">名词解释</span></section>
</section>

<section style="color: inherit; margin: 0px; font-size: 2em; line-height: 1.4; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(197, 64, 114);">
<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;">International Working</p>

<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;">Women's Day</p>
</section>
</section>
</fieldset>
</section>
</section>
</section>

<p>&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:12px">国际劳动妇女节（International Working Women's Day）</span><span style="color:rgb(127, 127, 127); font-size:12px">，</span><span style="color:rgb(127, 127, 127); font-size:12px; line-height:2em">全称“联合国妇女权益和国际和平日”（United Nations women's rights and international peace day），是在每年的3月8日为庆祝妇女在经济、政治和社会等领域做出的重要贡献和取得的巨大成就而设立的节日。同时，也是为了纪念在1911年美国纽约三角内衣工厂火灾中丧生的140多名女工。从1909年3月8日，美国芝加哥妇女争取“男女平等”游行集会以来，至21世纪已走过了百余年历程。</span></p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:12px">在不同的地区，庆祝的重点有所不同，从普通的庆祝对女性的尊重、庆祝对女性的爱到庆祝女性在经济、政治及社会领域的成就。由于这个节日一开始是社会主义女权主义者发起的政治事件，这个节日和众多国家的文化都有融合，主要在欧洲，包括俄罗斯。&nbsp;</span></p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:12px">在一些地方，这个节日已经失去了政治意味，成为了简单的男人表达对女性的爱的时刻，类似于母亲节与情人节的混合。在其它一些地区，尽管政治权利与妇女权益的主题由联合国指定领导强烈的、政治的及社会的感受女人在世界范围的奋斗，并检验这种带来希望的习惯。&nbsp;</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<section class="135brush" style="white-space: normal; margin-top: 2px; margin-bottom: 2px; border-top-style: solid; border-top-width: 2px; border-color: rgb(197, 64, 114); border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 2px; line-height: 25px; color: rgb(197, 64, 114); font-weight: bold; text-align: center;">
<section style="border-color: rgb(197, 64, 114); color: inherit;">
<fieldset style="border: 0px rgb(197, 64, 114); text-align: left; margin-top: 0.8em; margin-bottom: 0.5em; color: inherit;">
<section style="color: inherit; display: inline-block; width: 1.3em; font-size: 5em; font-weight: inherit; line-height: 1em; vertical-align: top; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="color: inherit; border-color: rgb(197, 64, 114);"><em style="border-color: rgb(197, 64, 114); color: inherit;">02</em></section>
</section>

<section class="135title" style="display: inline-block; margin-left: 0.5em; color: inherit; border-color: rgb(197, 64, 114);">
<section style="color: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 1.8em; font-weight: inherit; line-height: 1.2; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);"><span style="border-color:rgb(197, 64, 114); color:inherit; font-size:18px">节日意义</span></section>
</section>

<section style="color: inherit; font-size: 2em; line-height: 1.4; font-weight: inherit; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);">
<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;"><span style="color:inherit; line-height:1.4; text-align:inherit; text-decoration:inherit">International Working&nbsp;Women's Day</span></p>

<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;"><span style="color:inherit; font-weight:inherit; line-height:1.4; text-align:inherit; text-decoration:inherit">Historical Significance</span></p>
</section>
</section>
</fieldset>
</section>
</section>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em; white-space: normal;"><span style="color:rgb(127, 127, 127); font-size:12px">3.8国际妇女节是全世界妇女的节日。这个日子是联合国承认的，同时也被很多国家确定为法定假日。来自五湖四海的妇女们，尽管被不同的国界、种族、语言、文化、经济和政治所区分，但在这一天能够同时庆祝属于自己的节日。让人们再回首那九十年前的为得到平等、公正、和平以及发展所做出的斗争。[24-25]&nbsp;&nbsp;&nbsp;</span></p>

<p style="line-height: 2em; white-space: normal;"><span style="color:rgb(127, 127, 127); font-size:12px">“三·八”国际妇女节的由来</span></p>

<p style="line-height: 2em; white-space: normal;"><span style="color:rgb(127, 127, 127); font-size:12px">国际妇女节是妇女创造历史的见证，妇女为争取与男性平等所走的斗争道路十分漫长。古希腊的莉西斯特拉塔就领导了妇女斗争来阻止战争；法国革命时期，巴黎妇女高呼“自由，平等，友爱”，走上凡尔赛的街头争取选举权。[24-25]</span><a name="ref_[24&amp;25]_328605"></a><span style="color:rgb(127, 127, 127); font-size:12px">&nbsp;</span><a name="ref_[24]_328605"></a><span style="color:rgb(127, 127, 127); font-size:12px">&nbsp;</span><a name="ref_[25]_328605"></a><span style="color:rgb(127, 127, 127); font-size:12px">&nbsp;</span></p>

<p style="line-height: 2em; white-space: normal;"><span style="color:rgb(127, 127, 127); font-size:12px">在这一天，世界各大洲的妇女，不分国籍、种族、语言、文化、经济和政治的差异，共同关注妇女的人权。近几十年来，联合国的四次全球性会议加强了国际妇女运动，随着国际妇女运动的成长，妇女节取得了全球性的意义。这些进展使国际妇女节成为团结一致、协调努力要求归还妇女权利和妇女参与政治、经济和社会生活的权利的日子。</span></p>

<p style="line-height: 2em; white-space: normal;">&nbsp;</p>

<section class="135editor">
<section class="135brush" style="white-space: normal; margin-top: 2px; margin-bottom: 2px; border-top-style: solid; border-top-width: 2px; border-color: rgb(197, 64, 114); border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 2px; line-height: 25px; color: rgb(197, 64, 114); font-weight: bold; text-align: center;">
<section style="border-color: rgb(197, 64, 114); color: inherit;">
<fieldset style="border: 0px rgb(197, 64, 114); text-align: left; margin-top: 0.8em; margin-bottom: 0.5em; color: inherit;">
<section style="color: inherit; display: inline-block; width: 1.3em; font-size: 5em; font-weight: inherit; line-height: 1em; vertical-align: top; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="color: inherit; border-color: rgb(197, 64, 114);"><em style="border-color: rgb(197, 64, 114); color: inherit;">03</em></section>
</section>

<section class="135title" style="display: inline-block; margin-left: 0.5em; color: inherit; border-color: rgb(197, 64, 114);">
<section style="color: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 1.8em; font-weight: inherit; line-height: 1.2; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);"><span style="border-color:rgb(197, 64, 114); color:inherit; font-size:18px">代表人物</span></section>
</section>

<section style="color: inherit; font-size: 2em; line-height: 1.4; font-weight: inherit; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);">
<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;"><span style="color:inherit; line-height:1.4; text-align:inherit; text-decoration:inherit">International Working&nbsp;Women's Day</span></p>

<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;">Specials</p>
</section>
</section>
</fieldset>
</section>
</section>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px; text-align: left;">
<section style="box-sizing: border-box; width: 65%; float: right; padding: 0px 0px 0px 0.1em;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6P5voddXFQZLM0QslqlGtGaU3oPXH0Bnw8Cw5xcjhcicOib9a5icPEAtPQ/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100%" title="" vspace="0"></section>

<section style="display: inline-block; width: 35%; box-sizing: border-box; float: right; padding: 0px 0.1em 0px 0px; text-align: right;">
<p style="font-size:16px;box-sizing: border-box; margin-right: 4px; padding: 4px 6px; border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px;font-weight: bold;color: rgb(120, 124, 129); border-color: black;">何香凝 &nbsp;<strong style="color:rgb(127, 127, 127); font-size:12px; font-weight:bold; line-height:28px; text-align:right">/<span style="color:rgb(127, 127, 127); line-height:28px">（1878.06.27-1972.09.1）</span></strong><span style="color:rgb(127, 127, 127); font-size:12px; line-height:28px">女权运动的先驱之一，民革主要创始人，国民党元老，建立民国的功臣，“三大政策”的忠实执行者，抗日统一战线的一个方面军，也是新中国创始人之一。</span></p>
</section>
</fieldset>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei">她早年追随孙中山，是同盟会的第一位女会员；她坚持孙中山的三大政策，真诚地同中国共产党合作；她发动妇女参加革命，为国内革命战争、抗日战争做出了卓越贡献；她把艺术创作与革命活动紧密联系，她的作品中充满斗争激情、浩然正气。黄花岗起义前夕回到广东。辛亥革命失败后与廖仲恺一直追随孙左右，进行讨袁与护法斗争。陈炯明叛乱时极为关心孙夫妇的安危并全力营救廖脱险。随后，大力支持孙改组国民党，与廖一道成为孙中山联俄、联共、扶助农工三大政策的忠实拥护者和执行者。</span><a name="7"></a></p>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; width: 100%; clear: both; overflow: hidden; text-align: left;">
<section style="width: 65%; float: right; padding-left: 0.1em;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6oAbagdUpgsDcnTuibH7YOkZ79C7YHt3gbRkicZVfOZRLYjvNhVFJicq0w/0" style="visibility:visible !important; width:100%" title="" vspace="0"></section>

<section style="display: inline-block; width: 35%; float: right; padding-right: 0.1em; text-align: right;">
<p style="margin-right: 4px; padding: 4px 6px; border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-weight: bold; color: rgb(120, 124, 129); border-color: black;"><span style="color:rgb(127, 127, 127); line-height:28px">克拉拉·蔡特金</span> &nbsp;<span style="color:rgb(127, 127, 127); font-size:12px; line-height:28px">/<span style="color:rgb(127, 127, 127); line-height:28px">（Clara Zetkin，1857.7.5－1933.6.20）</span></span><span style="color:rgb(127, 127, 127); font-size:12px; line-height:28px"><span style="color:rgb(127, 127, 127); line-height:28px">原名克拉拉·艾斯纳，德国社会民主党和第二国际左派领袖之一，国际社会主义妇女运动领袖之一，德国共产党创始人之一</span><span style="color:rgb(127, 127, 127); line-height:28px">，无产阶级女权解放的灵魂人物</span></span></p>
</section>
</fieldset>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei">1857年7月5日出生于德国萨克森州维德劳一个教师家庭，15岁时全家迁至莱比锡。1874年至1878年就读莱比锡私立师范学校。毕业后当过家庭教师，1878年结识流亡</span><span style="color:rgb(127, 127, 127); line-height:2em">德国的俄国革命家奥西普·蔡特金，两人于1882年结婚。蔡特金在奥西普指导下阅读了《共产党宣言》和马克思、恩格斯的其他著作，并投身工人运动。1882年至1892年，她与丈夫及两个孩子流亡瑞士和法国巴黎，结识了马克思的女儿劳拉·&nbsp;拉法尔格。1889年参加第二国际成立大会。1897年加入德国社会民主党。</span><span style="color:rgb(127, 127, 127); line-height:2em">1892年创办妇女报纸《平等》，并担任编辑至1917年。1907年，发起并组织了第一届国际社会主义妇女大会。会上决定成立国际民主妇女联合会，把《平等》作为机关报，选举蔡特金为书记处书记。1910年8月主持召开第二届国际社会主义妇女大会，会上建议把每年的3月8日定为国际妇女节。1916年参与创建斯巴达克同盟。1919年加入德国共产党，1920年任党中央委员和议会议员。1921年入选第三国际主席团。</span><span style="color:rgb(127, 127, 127); line-height:2em">1920年至1932年多次出访俄国，大量研读马克思主义书籍，与列宁和罗莎·卢森堡交谊甚笃，支持布尔什维克。</span><span style="color:rgb(127, 127, 127); line-height:2em">1933年6月20日在莫斯科逝世，葬于克里姆林宫墙</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<section style="margin: 10px 0px; padding: 50px 0px; color: rgb(255, 255, 255); text-align: center; border-color: rgb(197, 64, 114); box-shadow: rgba(205, 205, 205, 0.901961) 2px 3px 2px; background-color: rgb(197, 64, 114);"><span class="135brush" data-brushtype="text" style="border:1px solid rgb(251, 251, 251); color:inherit; font-size:18px; line-height:42px; padding:10px 15px">Learn more about Women's Day</span>

<section class="135brush" style="margin-top: 30px; color: inherit;">
<p style="color: inherit;">135在线编辑器 &nbsp; ︳Online Editor</p>

<p style="color: inherit;">&nbsp;</p>

<p style="color: inherit;">&nbsp;</p>

<p style="color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiakV1K00vQW8lEGAib6sDzYhoWkLOaujuoWxj3ia9VunFq6qecex9iaLknmibRjNIiaQw56T7D61kXicgvg/0"></p>
</section>
</section>
</section>

<p>&nbsp;</p>

<p style="line-height: 2em;"><br>
&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17717.html" target="_blank">3.8向女神致敬模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17717-view_nums">4584</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17717" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17717,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17717-favor_nums">720</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-17618"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/181c5ec8198a43c51eaff6ec.png" title="三八节模板" class="template-cover" data-id="17618" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/181c5ec8198a43c51eaff6ec.png" alt="">						</div>
						<div class="editor-style-content hidden" data-id="17618" data-name="三八节模板" id="template-17618"><p style="margin-right: auto; margin-left: auto; max-width: 600px; min-height: 1em; border: 1px solid rgb(96, 127, 166); border-radius: 2em; font-size: 12px;"><span style="background-color:rgb(96, 127, 166); border-bottom-left-radius:2em; border-top-left-radius:2em; color:rgb(255, 255, 255); padding:2px 2px 2px 6px">提示:</span><span style="color:rgb(127, 127, 127); padding-left:2px">点击上方</span><span style="padding-left:2px"><span style="color:#607fa6"><strong>航航小编我爱你</strong></span></span><span style="color:rgb(127, 127, 127)">一键关注</span></p>

<p style="margin: 10px auto; min-height: 1em; height: 40px; width: 365px; line-height: 40px; text-align: center; opacity: 0.6; color: rgb(255, 255, 255); font-family: 微软雅黑; background-image: url(http://mmbiz.qpic.cn/mmbiz/qGZEXL0EiclEsE6VQJ4giaAMtugQF3E1Fp5sEdeWJbJqkwIL4FT39C6bO3k66sDblkakKKAqZXBiaUMMj1fk5dFWA/0); background-size: 365px 40px; background-position: 0px 50%; background-repeat: no-repeat;"><strong>三八女孩节模板，网友提供</strong></p>

<blockquote style="margin-right: auto; margin-left: auto; padding: 12px 5px; max-width: 600px; border-width: 0px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; font-family: 微软雅黑; color: rgb(89, 89, 89); text-align: justify; min-height: 1em; background-image: -webkit-linear-gradient(left, rgb(253, 240, 230), rgb(255, 255, 250), rgb(253, 240, 230)); background-color: rgb(255, 255, 240);">
<fieldset style="padding: 5px; min-width: 0px; font-size: 14px; border: 1px solid rgb(204, 204, 204); box-shadow: rgb(165, 165, 165) 5px 5px 2px; background-color: rgb(250, 250, 240);"><legend style="text-align: center;"></legend>

<p style="padding: 4px 10px; min-height: 1em; white-space: pre-wrap; color: rgb(255, 255, 255); box-shadow: rgb(165, 165, 165) 4px 4px 2px; text-align: left; background-color: rgb(0, 112, 192);"><strong>节日词条</strong></p>

<p style="min-height: 1em; white-space: pre-wrap;"><strong style="color:rgb(0, 112, 192)">国际劳动妇女节，全称<span style="background-color:rgb(250, 250, 240); color:rgb(0, 112, 192); line-height:22.3999996185303px; text-align:justify">为“联合国妇女权益和国际和平日”，在中国又称“三八”妇女节，是联合国从1975年国际妇女年开始，每年于3月8日为庆祝妇女在经济、政治和社会等领域做出的重要贡献和取得的巨大成就而设立的节日。在这一天，世界各大洲的妇女，不分国籍、种族、语言、文化、经济和政治的差异，共同关注妇女的人权。中华人民共和国中央政府成立后正式将3月8日定为妇女节，并举行各种形式的庆祝活动<span style="background-color:rgb(250, 250, 240); color:rgb(89, 89, 89); line-height:22.3999996185303px; text-align:justify">。</span></span></strong></p>
</fieldset>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; text-align: center;"><img data-ratio="0.6612903225806451" data-s="300,640" data-src="http://mmbiz.qpic.cn/mmbiz/qGZEXL0EiclHeicyffBI32k98gg2pzJvKutticibN7YFB1JicXxibYITp7MaNichI9BlF8lTTibSicAUkUhDYcciaQAqNnxg/0" data-w="496" src="http://mmbiz.qpic.cn/mmbiz/qGZEXL0EiclHeicyffBI32k98gg2pzJvKutticibN7YFB1JicXxibYITp7MaNichI9BlF8lTTibSicAUkUhDYcciaQAqNnxg/640?tp=webp&amp;wxfrom=5" style="visibility:visible !important; width:auto !important"></p>

<section class="135editor">
<h2 class="135brush" data-bcless="true" placeholder="浅色边框标题" style="margin: 10px 0px; white-space: normal; padding: 10px; max-width: 100%; line-height: 25px; color: rgb(255, 255, 255); font-weight: bold; font-size: 16px; box-shadow: rgb(153, 153, 153) 1px 1px 2px; border-left-style: solid; border-color: rgb(241, 148, 180); border-left-width: 25px; background-color: rgb(235, 103, 148);">问题来了，三八妇女节是法定假日吗？</h2>
</section>

<p>&nbsp;</p>

<p><span style="font-size:12px">三八妇女节并不是法定节假日，而属于部分公民放假的日子。《全国年节及纪念日放假办法》规定：妇女节（3月8日），妇女放假半天。</span></p>

<p>&nbsp;</p>

<p><span style="font-size:18px"><strong>感到很雀跃有木有！！！</strong></span></p>

<p>&nbsp;</p>

<section class="135editor">
<h2 class="135brush" data-bcless="true" placeholder="浅色边框标题" style="margin: 10px 0px; white-space: normal; padding: 10px; max-width: 100%; line-height: 25px; color: rgb(255, 255, 255); font-weight: bold; font-size: 16px; box-shadow: rgb(153, 153, 153) 1px 1px 2px; border-left-style: solid; border-color: rgb(241, 148, 180); border-left-width: 25px; background-color: rgb(235, 103, 148);">辣么，三八节妇女怎么过？</h2>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0 0.5em 0;font-size: 16px;line-height: 32px; font-weight: bold;">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">1</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">旅行</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px">趁着三八节，来一个短途旅行，不需要远，却也能接触到另一个世界。在这一天，暂时忘记事业和家庭，选择一个自己感兴趣的目的地，即刻出发吧！</span></p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0 0.5em 0;font-size: 16px;line-height: 32px; font-weight: bold;">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">2</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">逛街</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px; line-height:1.6em">女人天性就是爱逛街！对于大部分女人来说，逛街购物有着致命的吸引力。在三八妇女节这天，很多店家都会推出各种优惠妇女的活动，诸如打折、购物送礼、妇女半价或免费等，所以趁着这个时候血拼去吧！</span></p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0px 0.5em; font-size: 16px; line-height: 32px; font-weight: bold; border-color: rgb(165, 0, 204);">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">3</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">休息</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px; line-height:1.6em">有些妇女平日工作实在过于忙碌，甚至都不能够好好休息。所以对她们来说，哪怕是在家里宅上一天也是一直奢侈。所以，在这个特殊的假期，不如就待在家里好好休息，喝喝茶看看电影，享受惬意的时光。</span></p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0px 0.5em; font-size: 16px; line-height: 32px; font-weight: bold; border-color: rgb(165, 0, 204);">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">4</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">护理</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px">女人天性就是爱美，平日工作繁忙肯定没时间护理自己。不如趁这一天找一间美容院，做一次全身spa，来一次面部护理，可以让身心很好地放松一下。</span></p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0px 0.5em; font-size: 16px; line-height: 32px; font-weight: bold; border-color: rgb(165, 0, 204);">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">5</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">健身</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px">不管如何，健康总是最重要的。平日忙于工作，女性们肯定是疏于健身。不如趁着这一天，约上好姐们一起健身去吧！</span></p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p><span style="font-size:14px">最后，航航小编弱弱地说一句，今年三八节是在周日哦。</span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; font-size: 16.3636360168457px; text-align: center;">
<section style="display: inline-block; color: inherit;">
<section style="display: inline-block; color: inherit;">
<p style="word-wrap: normal; min-height: 1em; white-space: pre-wrap; color: inherit;"><strong style="color:inherit">●END●</strong><br style="color: inherit;">
&nbsp;</p>
</section>

<section class="135title" style="margin: 0.2em 0.5em 0.1em; color: rgb(235, 103, 148); font-size: 1.8em; line-height: 1; text-align: inherit; text-decoration: inherit; border-color: rgb(235, 103, 148);"><strong>三八节模板</strong></section>

<section style="width: 208px; border-top-style: solid; border-top-width: 1px; border-top-color: black; line-height: 1; color: inherit;"></section>

<section class="135brush" data-brushtype="text" style="margin: 0.5em 1em; font-size: 1em; line-height: 1; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(235, 103, 148); border-color: rgb(235, 103, 148);"><span style="border-color:rgb(235, 103, 148); color:inherit; font-size:16.3636360168457px">By航航小编</span></section>
<span style="background-color:rgb(235, 103, 148); border-radius:0.3em; box-shadow:rgb(16, 146, 113) 0.1em 0.1em 0.1em; color:rgb(255, 255, 255); display:inline-block; font-size:1em; font-weight:inherit; padding:0.3em; text-align:inherit; text-decoration:inherit">微信号：tizi135</span></section>
</fieldset>
</section>

<p>&nbsp;</p>
</blockquote>

<section class="135editor">
<section data-bcless="true" style="font-size: 20px; border: 0px none rgb(241, 148, 180); color: rgb(255, 255, 255); background: rgb(235, 103, 148);"><span class="135brush" style="background:rgb(255, 255, 255); border-color:rgb(235, 103, 148); color:rgb(235, 103, 148); display:inline-block; padding:0px 15px 0px 0px">135编辑器</span><span style="background:none 0px 0px repeat scroll rgb(255, 255, 255); color:inherit; display:inline-block; margin-left:5px">&nbsp;</span><span style="background:none 0px 0px repeat scroll rgb(255, 255, 255); color:inherit; display:inline-block; margin-left:5px">&nbsp;</span><span style="background:none 0px 0px repeat scroll rgb(255, 255, 255); color:inherit; display:inline-block; margin-left:5px">&nbsp;</span></section>
</section>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17618.html" target="_blank">三八节模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17618-view_nums">3066</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17618" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17618,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17618-favor_nums">533</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-17490"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6VgicoiaR4ObNELnQJ6BqBcfvCK3J0qcO69knRhsZV9Imza4yOIGib6AVA/0" title="雪国小镇风景模板" class="template-cover" data-id="17490" style="max-width:100%;min-height:200px;" data-original="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6VgicoiaR4ObNELnQJ6BqBcfvCK3J0qcO69knRhsZV9Imza4yOIGib6AVA/0" alt="">						</div>
						<div class="editor-style-content hidden" data-id="17490" data-name="雪国小镇风景模板" id="template-17490"><section class="135editor"><p style="margin-right: auto; margin-left: auto; font-size: 16px; color: rgb(57, 0, 213); line-height: 25px; text-align: justify; word-wrap: normal; min-height: 1em; white-space: pre-wrap; padding: 10px; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">不相信吧，我们北方还有景色这么好的地方！第一眼看见的时候，我也不相信，从知道这个地方，到出发，不到6个小时，一张站票，飞奔这个靠近家乡的北方小村，这个世外桃源。</span><span style="border-color:rgba(226, 217, 251, 0.870588); color:inherit; font-size:18px"></span></p><p style="margin-right: auto; margin-left: auto; font-size: 16px; color: rgb(57, 0, 213); line-height: 25.6000003814697px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; text-align: right; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px">❉<strong>雪国小镇</strong>❉</span></p><p class="135brush" data-brushtype="text" style="margin-right: auto; margin-left: auto; font-size: 16px; color: rgb(57, 0, 213); line-height: 25.6000003814697px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; text-align: center; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma66rT9g6WQWiaul30dx8Iye7QkBV28Ne4YP6GrtVBgYVKENR2pEsBDoVg/0"></p><p style="margin-right: auto; margin-left: auto; font-size: 16px; color: rgb(57, 0, 213); line-height: 25.6000003814697px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">村子很小，小的在google地图上都难找到，知道的游客更是甚少。这里没有景区，只是一个小村。</span></p></section><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); text-align: right; background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px">❉<strong>银装素裹</strong>❉</span></p><p class="135brush" data-brushtype="text" style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; text-align: center; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6KWkrglOLXHf0YFHUlSB0ricaUm72X5zhYFN7UYJtWrI7J7I6Z0fucqg/0" title="" vspace="0"></p><section class="135editor"><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">村子前后20公里的路上，处处都是摄影的好地点，如果自驾最好不过。不过我更喜欢原始的小牛车，马车，带上一壶小酒~</span></p></section><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); text-align: right; background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px">❉<strong>映雪朝霞</strong>❉&nbsp;</span></p><p class="135brush" data-brushtype="text" style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; text-align: right; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6Qia5dzXO7oC3rrqSx9Q7bOhw1zzVOhBP9fo45lvicpe2jaOTHRdiaRdSA/0" title="" vspace="0"></p><section class="135editor"><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">村子是在村支书的带动之下，发展成为摄影爱好者都知道的摄影基地。大片大片的美丽，美不胜收。</span></p></section><section class="135editor"><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"></p></section><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); text-align: right; background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px">❉<strong>冰天雪地</strong>❉</span></p><p class="135brush" data-brushtype="text" style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; text-align: center; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6NbYdU7Sn0mKhkUmKR6pByHDjZVz66a8qzzricrrtA9j11E0z1agRDGg/0" title="" vspace="0"></p><section class="135editor"><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">航航小编想，在这风景如画的小村，过着世外桃源般的生活，远离雾霾尘埃，身体健康，每天幸福的生活着，又何尝不好！</span></p></section><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); text-align: right; background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px"><strong>雪国小镇模板<span style="line-height:25.6000003814697px">BY航航小编</span></strong></span><strong><span style="font-size:18px; line-height:25.6000003814697px">&nbsp;</span></strong></p><section class="135editor"><section class="135brush" data-bcless="true" data-brushtype="text" style="color: rgb(255, 255, 255); padding: 0.45em 0.6em 0.45em 0.9em; border-left-width: 10px; border-left-style: solid; border-color: rgb(80, 99, 200); background: rgb(55, 74, 174);">135编辑器 &nbsp; / &nbsp;联系我们QQ群14965992</section></section></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17490.html" target="_blank">雪国小镇风景模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17490-view_nums">1577</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17490" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17490,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17490-favor_nums">340</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-17190"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/1144e36733461f53d61dfc89.jpg" title="电影推荐模板" class="template-cover" data-id="17190" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/1144e36733461f53d61dfc89.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="17190" data-name="电影推荐模板" id="template-17190"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></p>

<fieldset class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; border: 0px; font-family: inherit; clear: both; font-size: 14px; text-align: justify; text-decoration: inherit; box-sizing: border-box !important; word-wrap: break-word !important;">
<section class="135editor">
<section class="135editor">
<section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScsiaeIlpygwr10EL59EDxHqMKebjGEWTrkv0SBzT0U8tCicicw3ekp9Vhg/0" style="margin-top:50px; width:100%" title="" vspace="0">
<section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">
<section class="135editor">
<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
<section style="display: inline-block; box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">狼图腾</section>

<section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">上映年份：2015.2.19</section>
</section>
</fieldset>
</section>
</section>

<p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;">&nbsp;</p>
</section>
</section>

<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"></fieldset>
</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(49, 133, 155); margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">豆瓣评分：7.2</strong></span></p>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">导演:&nbsp;让-雅克·阿诺</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">主演:&nbsp;冯绍峰 / 窦骁 / 昂哈妮玛 / 巴森 / 尹铸胜</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">类型:&nbsp;剧情 / 冒险</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">制片国家/地区:&nbsp;中国大陆 / 法国 &nbsp;</section>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color:#31859b"><strong>影评：</strong></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color:#31859b"><span style="color:rgb(0, 0, 0); line-height:24.8888893127441px; text-align:justify"><span style="color:rgb(89, 89, 89); line-height:22.3999996185303px; text-align:justify; white-space:pre-wrap">大体上忠实于原著，但</span><span style="color:rgb(89, 89, 89); line-height:24.8888893127441px; text-align:justify; white-space:pre-wrap">狼群和黄羊群的气势磅礴没有表现出来，有几个镜头狼简直在散漫的散步。 </span></span></span><strong style="color:rgb(49, 133, 155); line-height:1.6em; text-decoration:inherit">@航航小编老豆</strong></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></p>
</fieldset>

<fieldset class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; border: 0px; font-family: inherit; clear: both; font-size: 14px; text-align: justify; text-decoration: inherit; box-sizing: border-box !important; word-wrap: break-word !important;">
<section class="135editor">
<section class="135editor">
<section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScn37UCLZSIsGz8cxicnicZ2p3UZf49R1dlMpAoKNw74nJ4QXNVUYjvFtA/0" style="margin-top:50px; width:100%" title="" vspace="0">
<section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">
<p style="margin: 5px 0px; font-size: 24px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
<section style="display: inline-block; box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">钟馗伏魔：雪妖魔灵</section>

<p style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">上映年份：2015.2.19</p>

<p style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">&nbsp;</p>
</section>
</fieldset>
</section>
</section>
</section>
</section>

<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"></fieldset>
</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(49, 133, 155); margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">豆瓣评分：4.3</strong></span></p>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">导演:&nbsp;鲍德熹 / 赵天宇</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">主演:&nbsp;陈坤 / 李冰冰 / 赵文瑄 / 杨子姗&nbsp;</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">类型:&nbsp;动作 / 爱情 / 奇幻</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">制片国家/地区:&nbsp;中国大陆 / 香港 / 美国</section>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color:#31859b"><span style="line-height:21px"><strong>影评：</strong></span></span></p>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color:rgb(17, 17, 17); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:19px">编剧越多越能编出个四不像烂东西，李冰冰陈坤明显呈现老态，打光都救不了，这回冰冰李和冰冰范扯平了，范有白发魔女3d，李有雪妖，二女携手一起向烂片道路狂奔吧 <strong style="color:rgb(49, 133, 155); line-height:21px; text-align:justify; white-space:pre-wrap">@翡翠扳指</strong></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="font-family:微软雅黑,microsoft yahei"><span style="color:rgb(17, 17, 17); font-size:12px; line-height:19px"><strong style="color:rgb(49, 133, 155); line-height:21px; text-align:justify; white-space:pre-wrap"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></strong></span></span></p>
</section>
</fieldset>

<fieldset class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; border: 0px; font-family: inherit; clear: both; font-size: 14px; text-align: justify; text-decoration: inherit; box-sizing: border-box !important; word-wrap: break-word !important;">
<section class="135editor">
<section class="135editor">
<section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScqWkjfScFvp2JeKdcTSBMOzAr90j3AhD9fIKnoW6XdWVYOUzDoGsa4g/0" style="margin-top:50px; width:100%" title="" vspace="0">
<section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">
<section class="135editor">
<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
<section style="display: inline-block; box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">冲上云霄</section>

<section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">上映年份：2015.2.19</section>
</section>
</fieldset>
</section>

<p style="margin: 5px 0px; font-size: 24px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">&nbsp;</p>
</section>

<p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;">&nbsp;</p>
</section>
</section>

<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"></fieldset>
</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(49, 133, 155); margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">豆瓣评分：4.7</strong></span></p>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">导演:&nbsp;叶伟信 / 邹凯光</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">主演:&nbsp;古天乐 / 郑秀文 / 吴镇宇 / 张智霖 / 佘诗曼&nbsp;</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">类型:&nbsp;剧情 / 爱情</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">制片国家/地区:&nbsp;香港 / 中国大陆</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(49, 133, 155); margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; color:rgb(49, 133, 155); font-size:14px; line-height:21px; margin:0px; max-width:100%; padding:0px; text-align:justify; white-space:pre-wrap; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">影评：</strong></strong></strong></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:19px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">也不知道这部电影算长mv还是算长广告 一颗星献给张智霖的脸 我已经不能直视吴镇宇了 满脑子dady love you</span><span style="box-sizing:border-box !important; font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:19px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><span style="color:#111111"> &nbsp; </span></span><span style="box-sizing:border-box !important; color:rgb(17, 17, 17); font-family:微软雅黑,microsoft yahei; font-size:12px; line-height:19px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="color:rgb(49, 133, 155); line-height:22.3999996185303px; text-align:justify; white-space:pre-wrap"><strong style="line-height:21px"><strong>@奕~烬</strong></strong></strong></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(17, 17, 17); font-family:微软雅黑,microsoft yahei; font-size:12px; line-height:19px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="color:rgb(49, 133, 155); line-height:22.3999996185303px; text-align:justify; white-space:pre-wrap"><strong style="line-height:21px"><strong><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></strong></strong></strong></span></p>

<section class="135editor">
<section style="width: 100%; border: 1px solid rgb(219, 219, 219); background-color: rgb(0, 0, 0);"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScEMRX8l8jDib47545YAm7V8Gkcz5Bm1SPiabk6PrzUS3U5mZd0mlf4MxQ/0" style="margin-top:50px; width:100%" title="" vspace="0">
<section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">
<p style="margin-top: 5px; margin-bottom: 5px; font-size: 20px; padding: 2px 10px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; text-align: center;">
<section style="display: inline-block; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin-top: 0.2em; padding-right: 0.5em; padding-bottom: 5px; padding-left: 0.5em; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">电影推荐模板</section>

<p style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); border-color: rgb(107, 77, 64);">135编辑器原创</p>

<p style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); border-color: rgb(107, 77, 64);">&nbsp;</p>
</section>
</fieldset>
</section>
</section>
</section>
</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></p>
</fieldset>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150302/17190.html" target="_blank">电影推荐模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17190-view_nums">976</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17190" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17190,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17190-favor_nums">270</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-17038"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/17038.jpg" title="热门资讯模板" class="template-cover" data-id="17038" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/17038.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="17038" data-name="热门资讯模板" id="template-17038"><p><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScApL7hyQ2siayfDvV91uHlI9ZUgfu0IoEicxqBF67AA8puayqWg39vRuQ/0" style="font-size:16px; line-height:normal" title="" vspace="0"></p><p style="font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"><span style="color:rgb(127, 127, 127); font-size:13.3333339691162px; line-height:20px"></span><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="color:rgb(192, 0, 0); cursor:pointer; line-height:25.6000003814697px; z-index:-1"><span style="color:rgb(127, 127, 127); font-size:13.3333339691162px; line-height:20px"><span style="font-size:13.3333339691162px">这是航航小编为</span>您分享的第</span><span style="background-color:rgb(216, 216, 216); color:rgb(192, 0, 0); font-size:13.3333339691162px; line-height:20px"><strong>N</strong></span><span style="color:rgb(127, 127, 127); font-size:13.3333339691162px; line-height:20px">期模板。最近使用的素材都是热门新闻事件，本小编只负责给大家带来排版灵感，新闻版权归原作者所有。初见的朋友请点标题下蓝字或搜索微信号<strong><span style="background-color:rgb(216, 216, 216); color:rgb(192, 0, 0)">tizi135</span></strong>关注。欢迎大家加入135编辑器QQ群探讨排版技巧。</span></p><p style="font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"><span style="color:rgb(127, 127, 127); font-size:13.3333339691162px; line-height:20px">群号：204411951,149659920（以满）</span></p><p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="color:rgb(192, 0, 0); cursor:pointer; font-size:16px; line-height:25.6000003814697px; z-index:-1"></p><p style="font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"><span style="font-family:sans-serif; line-height:25.6000003814697px">&nbsp;</span></p><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"><span style="background-color:rgb(12, 12, 12)"><strong><strong style="color:rgb(251, 213, 181)"><span style="font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong><strong style="color:rgb(251, 213, 181)">&nbsp;概览&nbsp;</strong><span style="color:rgb(251, 213, 181); font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong></span></p><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"></p><blockquote style="padding: 15px 25px; border-left-width: 10px; border-left-color: rgb(194, 39, 36); font-size: 16px; top: 0px; line-height: 24px; font-family: 微软雅黑; vertical-align: baseline; background-color: rgb(239, 239, 239);"><p style="word-wrap: normal; min-height: 1em; white-space: pre-wrap;">一碗肉卤子加几块肉，这本是美味，但对于嫁到宝应范水的高某来说，这是个过不去的“坎”。为了讨要说法，她携带凶器，四处寻找丈夫，试图宣泄心中的“愤恨”。2月23日晚上9点许，在宝应县氾水镇发生一起血案，一名男子被妻子连捅四刀，倒在了血泊中。妻子为何为了一碗肉卤子和几块肉，就对丈夫下如此“重手”呢？事情要从网恋说起。</p></blockquote><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 25.6000003814697px;"></p><p></p><section class="135editor"><section style="height: 2.5em; line-height: 2.5em; color: rgb(255, 255, 255); font-size: 13.33px; border-color: rgb(190, 119, 99); background-color: rgb(190, 119, 99);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(190, 119, 99); color:inherit; float:left; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important"><p class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 16px; border-color: rgb(190, 119, 99);">网上寻得温柔妻，婚后变成女汉子</p></section></section><p></p><p></p><p>钱晨今年38岁，是宝应县氾水人。几年前，钱某因跟妻子感情不合离婚。2013年，钱某在网聊中，认识了重庆女子高某。在聊天中，钱某觉得高某不仅漂亮，而且性格温柔，是一个值得处的对象。2013年9月份，时机成熟了，两人准备结婚。之后，高某(39岁)从重庆嫁到了宝应。婚后一段时间，高某确实比较温柔，钱某对这个新婚妻子也比较满意。</p><p></p><p>随着时间越来越长，高某的性格开始有了变化。在生活中，高某经常因为一点小事，跟丈夫钱某吵架，有时还对丈夫拳脚相加。家丑不可外扬，对于妻子的暴力，钱某一直忍让。</p><p></p><p></p><section class="135editor"><section style="height: 2.5em; line-height: 2.5em; color: rgb(255, 255, 255); font-size: 13.33px; border-color: rgb(190, 119, 99); background-color: rgb(190, 119, 99);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(190, 119, 99); color:inherit; float:left; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important"><p class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 16px; border-color: rgb(190, 119, 99);">一碗卤子和几块肉，引发夫妻不和</p></section></section><p></p><p></p><p>今年2月23日下午，钱某被邀请到亲戚家吃饭，临行前，妻子高某嘱咐钱某，吃完饭后，记得带点吃的回来。宴席很快散去，钱某离开宴席前没有忘记老婆，从主人家里弄了一点饭和菜。</p><p><span style="line-height:1.6em"></span></p><p><span style="line-height:1.6em">“怎么是肉卤子和几块肉啊，你不知道我血脂高啊！”晚上9点许，钱某回到家中，打开饭盒后，妻子突然情绪大变，冲着钱某大叫。之后，高某就开始对钱某恶言相向。钱某不愿意跟妻子一般见识，独自一人离开家，到邻居家“避风头”。钱某离开家后，高某更是火冒三丈。</span></p><p><span style="line-height:1.6em"></span></p><p></p><section class="135editor"><section style="height: 2.5em; line-height: 2.5em; color: rgb(255, 255, 255); font-size: 13.33px; border-color: rgb(190, 119, 99); background-color: rgb(190, 119, 99);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(190, 119, 99); color:inherit; float:left; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important"><p class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 16px; border-color: rgb(190, 119, 99);">一言不合，妻子连捅丈夫四刀</p></section></section><p></p><p></p><p>高某见丈夫躲了起来，随即骑上三轮车，一路寻找丈夫。一路上，她还不断地捡砖块和酒瓶。高某经过一路打听，最终寻得丈夫的藏身地点。</p><p></p><p>丈夫藏身在一村民家里，高某见丈夫不肯现身，就站在门口破口大骂。钱某实在忍受不了，从邻居家里走了出来。一见面，妻子高某的火气没有消，她从三轮车上取来砖块和酒瓶，试图砸向钱某。由于钱某家亲戚的介入，高某被拦截下来。然而之后，高某不但没有罢手，反而更加疯狂，她冲上前去，一口咬住钱某左手食指。高某劲很大，钱某怎么也摆脱不掉。</p><p><span style="line-height:1.6em"></span></p><p><span style="line-height:1.6em">“这已经是第三刀了！”在纠缠中，高某从口袋里掏出一把水果刀，捅向钱某左胸部。钱某一直在提示妻子，他已经中刀了，但妻子似乎没有听见，直到捅下第四刀才罢手。钱某见羽绒服被捅坏，就脱下了羽绒服，之后就倒在了血泊中。</span></p><p></p><p></p><section class="135editor"><section style="height: 2.5em; line-height: 2.5em; color: rgb(255, 255, 255); font-size: 13.33px; border-color: rgb(190, 119, 99); background-color: rgb(190, 119, 99);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(190, 119, 99); color:inherit; float:left; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important"><p class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 16px; border-color: rgb(190, 119, 99);">妻子已经被警方刑事拘留</p></section></section><p></p><p></p><p>晚上9点40分，接到报警后，宝应警方在第一时间内赶到现场。民警首先将钱某紧急送到医院抢救。然后，民警将高某带到了派出所里。高某意识到了自己的错误，称自己犯下大错，只等着丈夫跟她离婚。在医院里，死里逃生的钱某表示，对于妻子的疯狂行为，他实在没有理由原谅。目前，高某因涉嫌故意伤害罪，已经被警方刑事拘留。</p><p><span style="color:#666666"><span style="font-size:16px; line-height:32px"></span></span></p><p><span style="color:#666666"><span style="font-size:16px; line-height:32px"></span></span></p><p></p><p></p><section class="135editor"><h2 class="135brush" data-brushtype="text" style="padding-bottom: 9px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); margin-bottom: 10px; line-height: 1.1; font-size: 22px;">给广大受苦受难的男银tips</h2></section><p></p><p></p><p style="word-wrap: normal; font-family: sans-serif; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"><span style="background-color:rgb(12, 12, 12)"><strong><strong style="color:rgb(251, 213, 181)"><span style="font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong><strong style="color:rgb(251, 213, 181)">&nbsp;律师观点&nbsp;</strong><span style="color:rgb(251, 213, 181); font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong></span></p><p style="word-wrap: normal; font-family: sans-serif; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"></p><section class="135editor"><blockquote class="135brush" style="orphans: 2; white-space: normal; widows: 2; line-height: 22.39px; margin-top: 10px; margin-bottom: 10px; padding: 15px 20px 15px 45px; outline: 0px; border: 0px currentcolor; color: rgb(62, 62, 62); vertical-align: baseline; background-image: url(http://www.wx135.com/img/bg/left_quote.jpg); background-color: rgb(241, 241, 241); background-position: 1% 5px; background-repeat: no-repeat;"><p><span style="line-height:1.6em">“男人如果遭遇家暴，也可以向当地妇联求助，或者拨打110报警。”江苏韵和律师事务所律师童陈介绍，如果受到严重伤害，应当立即报警，通过公安部门委托司法鉴定部门对伤情进行鉴定，如果构成轻伤，就可以追究施暴者的刑事责任。如果受到严重的暴力威胁，一定要注意保护自己，没有必要回到施暴者身边，承受不可预知的危险。</span></p></blockquote></section><p></p><p style="word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"></p><p style="word-wrap: normal; font-family: sans-serif; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"><span style="background-color:rgb(12, 12, 12)"><strong><strong style="color:rgb(251, 213, 181)"><span style="font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong><strong style="color:rgb(251, 213, 181)">&nbsp;航航观点&nbsp;</strong><span style="color:rgb(251, 213, 181); font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong></span></p><p style="word-wrap: normal; font-family: sans-serif; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"></p><section class="135editor"><blockquote class="135brush" style="orphans: 2; white-space: normal; widows: 2; line-height: 22.39px; margin-top: 10px; margin-bottom: 10px; padding: 15px 20px 15px 45px; outline: 0px; border: 0px currentcolor; color: rgb(62, 62, 62); vertical-align: baseline; background-image: url(http://www.wx135.com/img/bg/left_quote.jpg); background-color: rgb(241, 241, 241); background-position: 1% 5px; background-repeat: no-repeat;">言简意赅地说，一个男银，连女的都打不过，还是去哪si一si吧~</blockquote></section><p></p><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 25.6000003814697px;"></p><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 25.6000003814697px;"></p></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150302/17038.html" target="_blank">热门资讯模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17038-view_nums">1278</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17038" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17038,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17038-favor_nums">329</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-16968"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/16968.jpg" title="人物介绍模板" class="template-cover" data-id="16968" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/16968.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="16968" data-name="人物介绍模板" id="template-16968"><section class="135editor">
<fieldset style="border: none; margin: 0.8em 0px 0.3em; box-sizing: border-box; padding: 0px;">
<section style="line-height: 0; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJSc8CFK70xtg1k852JIwwrVeLVOBHMm1VbFXAuTggZee0tOuWjngofSiag/0" style="border:0px; box-sizing:border-box; display:inline-block; height:auto !important; width:100%"></section>

<section style="width: 30%; display: inline-block; float: left; text-align: right; margin: 15px 0px 0px; padding: 0px; box-sizing: border-box;">
<section style="float: right; text-align: center; margin-top: -15px; box-sizing: border-box;">
<section style="width: 1px; height: 1.2em; margin-left: 50%; background-color: rgb(102, 102, 102); box-sizing: border-box;"></section>

<section style="width: 2em; height: 2em; border: 1px solid rgb(102, 102, 102); border-radius: 50%; line-height: 2em; font-size: 1em;font-weight: inherit; text-decoration: inherit; box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box;">哀悼</section>
</section>

<section style="width: 2em; height: 2em; border: 1px solid rgb(102, 102, 102); margin-top: 2px; border-radius: 50%; line-height: 2em; font-size: 1em;  font-weight: inherit; text-decoration: inherit; box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box;"></section>
</section>
</section>
</section>

<section style="width: 65%; float: left; margin-top: 20px; line-height: 1.5em; margin-left: 5%; padding: 0px; font-size: 1em;  font-weight: inherit; text-decoration: inherit; color: rgb(39, 44, 51); box-sizing: border-box;">
<section style="box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="box-sizing:border-box; font-size:175%;margin:5px 0px"><span style="line-height:22.3999996185303px">评书大师袁阔成</span></section>

<p style="box-sizing: border-box;font-size:16px"><span style="line-height:22.3999996185303px">今天凌晨因心脏衰竭去世</span></p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<section style="max-width: 100%;margin: 0.8em 0px 0.5em; overflow: hidden; ">
<section class="135brush" data-brushtype="text" placeholder="请输入标题" style="height: 36px; display: inline-block; color: rgb(255, 255, 255); font-size: 16px; font-weight: bold; padding: 0px 10px; line-height: 36px; float: left; vertical-align: top; box-sizing: border-box !important; background-color: rgb(33, 33, 34);">人民网北京3月2日电</section>

<section style="display: inline-block; height: 36px; vertical-align: top; border-left-width: 9px; border-left-style: solid; border-left-color: rgb(33, 33, 34); box-sizing: border-box !important; border-top-width: 18px !important; border-top-style: solid !important; border-top-color: transparent !important; border-bottom-width: 18px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important; color: inherit;"></section>
</section>
</section>

<p>&nbsp;</p>

<p>许心怡记者从著名相声演员姜昆处获悉，今日凌晨3点30分，著名评书表演艺术家袁阔成因心脏衰竭去世，享年86岁。</p>

<p>&nbsp;</p>

<p>袁阔成，著名评书表演艺术家。他博采众长，吸收话剧、电影、戏曲、相声等艺术形式之长，在继承传统评书的基础上，不断探索，勇于创新。袁先生的评书语言生动幽默，人物形象鲜明，说表并重，形神兼备，绘声绘色，以形传神，讲究气、音、字、节、手、眼、身、步的全身艺术，具有“漂、俏、快、脆”的艺术特色。袁先生的现代评书，内容新、风格新、语言新，为弘扬民族文化艺术做出了可贵的贡献。</p>

<p>&nbsp;</p>

<section class="135editor">
<h2 class="135brush" placeholder="请输入标题" style="border-left:5px solid #666765;font-size: 16px;font-weight:bold; line-height: 32px;color:#666;padding: 5px 10px; margin: 10px 0px;">代表作品：《三国演义》、《西楚霸王》、《水泊梁山》、《烈火金刚》等。</h2>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150302/16968.html" target="_blank">人物介绍模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-16968-view_nums">629</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="16968" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',16968,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-16968-favor_nums">149</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-16423"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/16423.jpg" title="短篇散文模板" class="template-cover" data-id="16423" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/16423.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="16423" data-name="短篇散文模板" id="template-16423"><section class="135editor"><fieldset style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZlytNJ5JeV7dCfXxRRBU6cpwGsiaD1Y6W8dMcw8GxMwELicYictU9L3L3w/0" style="border-radius:100%; box-sizing:border-box; color:inherit; height:16em; width:16em"><section style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center; text-shadow: rgb(201, 201, 201) 3px 4px 2px; color: inherit; word-wrap: break-word !important;"><strong><span class="135brush" data-brushtype="text" style="color:rgb(233,200,101)"></span></strong></section></fieldset></section><p style="text-align: center;">&nbsp;毕淑敏</p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"></p><section class="135editor"><p style="margin-top: 10px; margin-bottom: 10px; border-color: rgb(240, 240, 244); color: rgb(97, 97, 132); border-radius: 4px; padding: 15px; background-color: rgb(240, 240, 244);"><span style="font-size:14px"></span><span style="color:rgb(62, 62, 62); font-family:helvetica neue,helvetica,hiragino sans gb,microsoft yahei,î¢èíñåºú,arial,sans-serif; font-size:12px; line-height:19px; text-align:justify; white-space:pre-wrap"> 毕淑敏于1969年在高原部队当兵11年，历任卫生员、助理军医、军医等职，为医学事业做出突出的贡献。1989年毕淑敏加入中国作家协会，成为国家一级作家，从事医学工作20年后的她专注于写作，很多作品都和医学有关，主要代表作品《红处方》《昆仑殇》。2007年，毕淑敏以364万元的版税收入，荣登“2007第二届中国作家富豪榜”第14位。</span><span style="font-size:14px; line-height:1.5em"></span></p></section><section class="135editor"><section class="135editor"><section placeholder="请输入标题" style="height: 36px; display: inline-block; color: rgb(255, 255, 255); font-size: 16px; font-weight: bold; padding: 0px 10px; line-height: 36px; float: left; vertical-align: top; box-sizing: border-box !important; background-color: rgb(129, 128, 129);">一周特刊</section><section style="display: inline-block; height: 36px; vertical-align: top; border-left-width: 9px; border-left-style: solid; border-left-color: rgb(129, 128, 129); color: inherit; box-sizing: border-box !important; border-top-width: 18px !important; border-top-style: solid !important; border-top-color: transparent !important; border-bottom-width: 18px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important;"></section></section></section><p></p><section class="135editor"><fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;"><section style="display: inline-block; box-sizing: border-box;"><section style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(42, 52, 58); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(42, 52, 58);"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap">向人生的高处飞翔</span></section><p style="margin-right: 1em; margin-left: 1em; line-height: 1; font-size: 1em; color: rgb(120, 124, 129); box-sizing: border-box;"><span style="color:rgb(165, 165, 165); font-size:14px">喜欢本文请抄写100遍~</span></p><p style="margin-right: 1em; margin-left: 1em; line-height: 1; font-size: 1em; color: rgb(120, 124, 129); box-sizing: border-box;"></p></section></fieldset></section><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal; text-align: center;"><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">文/毕淑敏</span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal; text-align: center;"><span style="color:rgb(165, 165, 165); font-size:14px">本文选自《毕淑敏散文精选》</span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(127, 127, 127)"></span><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap">有一块石头在深山里寂寞地躺了很久,它有一个梦想:有一天能够像鸟儿一样飞上天空.当它把自已的理想告诉同伴时,立刻招来同伴们的嘲笑,"瞧瞧,什么叫心比天高,这就是啊!""真是异想天开!"......这块石头不去理会同伴们的闲言碎语,仍然怀抱理想等待时机.有一天一个叫庄子的人路过这里,它知道这个人有非凡的智慧,就把自已的理想对庄子说了,庄子说:"我可以帮你实现理想,但你必须先长成一座大山,这可是要吃不少苦的."石头说:"我不怕吃苦."</span><span style="color:rgb(127, 127, 127)"></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"></span></p><section class="135editor"><section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZMRdrJXAbDYibbNibr0eVrTu5G8fCUN9JOicL5BcMue0ggdNNyicxlAC7Bg/0" style="margin-top:50px; width:100%" title="" vspace="0"><section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;"><p style="margin: 5px 0px; font-size: 24px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">羡慕飞鸟的石头</p></section><p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;"><span style="font-size:18px"></span></p></section></section><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap">于是石头拼命地吸取天地灵气,自然精华,承接雨露惠泽,拼命生长,不知经过了多少年,受了多少风雨的洗礼,它终于长成了一座大山.于是,庄子招来了大鹏以翅膀击山,一时间天摇地动,一声惊天动地的巨响后,山炸开了,无数石块飞向天空,在飞的一刹那,石头会心的笑了,它终于体会到飞的快乐,但是不久它就从天空摔了下来,仍然变成当初的模样,落在原来的地方.庄子问它:"你后悔吗?""不,我不后悔,我长成了一座山,而且我飞翔过!"石头说.</span></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"></span></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap">其实人的一生就像石头一样,最初的开始和最终的结局都是一样,但同生为石,有的石头胸怀飞翔的梦,同生为人,有人却有凌云之志.这什么我们不能像那块石头一样拥有飞翔之志?一个人的目标定得高,他就必须付出更多的汗水,即使经过全力打拼不能实现目标,至少也比目标定得低的人走得远,实现得多.林肯总结自已的一生的经历得出这样的结论:自然界的喷泉的高度不会超过它的源头,一个人最终能取得的成就不会超过他的信念.我们的先辈在经历或目睹了太多的翱翔或匍匐之后,意味深长的告诉我们这样的哲理!取法乎上,仅得其中;取法乎中,仅得其下;取法乎下,一无所得!</span></span></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"></span></span></span></p><section class="135editor"><section class="135editor"><section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZibmWrdhRUKc0dWPqrT0RtEib6WrcY7icq19Wc7FovibibcdtAU0Da7uHgIg/0" style="margin-top:50px; width:100%" title="" vspace="0"><section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;"><p style="margin: 5px 0px; font-size: 24px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">壮志凌云，翱翔天际</p></section><p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;"><span style="font-size:18px"></span></p></section></section><fieldset style="border: 0px; margin-bottom: 0.5em; width: 100%; clear: both; overflow: hidden;"><section style="display: inline-block; font-size: 2em; z-index: 100; padding: 0.1em 0.5em; margin-top: -1.5em; line-height: 1.2; float: right; text-align: right; font-weight: inherit; text-decoration: inherit; color: inherit; border-color: rgb(249, 110, 87); background-color: rgb(248, 247, 245);"><section><section>壮志</section></section></section></fieldset></section><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap">志存高远吧！壮志凌云吧！让我们拥有一个值得一生为之拼搏的高远志向吧！不在攻蓬蒿间低低飞舞，敢上青天与鲲鹏比翼，摈弃燕雀屋檐下的廉价欢悦，勇敢地飞上高空接受风雨雷电的洗礼吧．为理想拼搏，向人生的高空展翅飞翔。</span></span></span><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><section class="135editor"><section class="135editor"></section></section><p style="white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0"></p><section class="135editor"><fieldset class="135editor"><section style="box-sizing: border-box; width: 65%; float: right; padding: 0px 0px 0px 0.1em;"><img _width="100%" alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiazjsibqzMEbFXfnLK8n31vaxjZefKCJItYVoDUBOKtqBsScQuzibtsJzGiayeB6VicnBFz07tTbPDnEg/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important" title="" vspace="0"></section><section style="display: inline-block; width: 35%; box-sizing: border-box; float: right; padding: 0px 0.1em 0px 0px; text-align: right;"><section style="box-sizing: border-box; margin-right: 4px; padding: 4px 6px; border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px;font-weight: bold;color: rgb(52, 54, 60); border-color: black;">135编辑器</section><p>你还没有使用吗？</p><p><span style="line-height:1.6em">“秒刷”在手</span></p><p>早下班，</p><p>早回家。</p></section></fieldset></section><p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0"></p></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150228/16423.html" target="_blank">短篇散文模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-16423-view_nums">1338</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="16423" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',16423,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-16423-favor_nums">386</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-16388"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/16388.jpg" title="元宵节模板" class="template-cover" data-id="16388" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/16388.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="16388" data-name="元宵节模板" id="template-16388"><p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZKXckSDicBhP5ibxVa3V5ANpDfyLjrnXfGcJYezRso0rdZO3L3ufsDRibw/0"></p><section class="135editor"><p style="height:18px;"></p><p style="height:18px;"></p><hr style="border-color: rgb(165, 0, 3); border-width: 2px; margin: 0px 0px -28px;"><section class="135brush" data-style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;" style="text-align: center; margin: 10px;"><p style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;">吃</p><p style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;">汤</p><p style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;">圆</p><p style="color:#FFF;background:#A50003;display:inline-block;width:36px;height:36px;line-height:36px;border-radius:18px;margin:0 5px;">啦</p></section></section><p></p><p><strong style="color:rgb(192, 0, 0); font-family:times; line-height:21px; text-align:justify; white-space:normal">▶</strong><span style="color:rgb(51, 51, 51); line-height:24px">元宵和春节的年糕、端午节的粽子一样，都是节日食品。吃元宵象征家庭像月圆一样团圆，寄托了人们对未来生活的美好愿望。</span></p><p style="white-space: normal;"></p><p style="white-space: normal;"><span style="color:rgb(51, 51, 51); line-height:24px">不管南方北方，正月十五这一天都要合家团聚吃元宵。“元宵”这种食品名称，据说出现于宋末元初，是因为人们习惯在上元节之夜吃它的缘故。下面我们来看看元宵的烹饪手法把~</span></p><p></p><p><strong style="color:rgb(192, 0, 0); font-family:times; line-height:21px; text-align:justify; white-space:normal"><span style="color:rgb(51, 51, 51); font-family:微软雅黑,microsoft yahei; line-height:24px"></span></strong></p><section class="135editor"><section style="border: 3px solid rgb(33, 33, 34); padding: 5px;"><section data-bcless="lighten" style="border: 1px solid rgb(58, 58, 60); padding: 15px; text-align: center; color: inherit;"><p class="135title" style="color: inherit;"><strong style="color:rgb(192, 0, 0); white-space:normal">Dishes</strong></p><p style="color: inherit; font-size: 24px;"><strong style="color:inherit">花香元宵串</strong></p></section></section></section><p><strong style="color:rgb(192, 0, 0); font-family:times; line-height:21px; text-align:justify; white-space:normal"><span style="color:rgb(51, 51, 51); font-family:微软雅黑,microsoft yahei; line-height:24px"></span></strong><br><strong style="color:rgb(192, 0, 0); font-family:times; line-height:21px; text-align:justify; white-space:normal">▶<span style="color:rgb(51, 51, 51); font-family:微软雅黑,microsoft yahei; line-height:24px"></span></strong><span style="color:rgb(51, 51, 51); font-family:微软雅黑,microsoft yahei; line-height:24px">加入花香的元宵，把满满的幸福穿成一串，每一口都会有不一样的味道，也有着别样的祝福味道。</span></p><p><span style="color:rgb(51, 51, 51); font-family:微软雅黑,microsoft yahei; line-height:24px"></span></p><section class="135editor"><fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZfpElEQP1JBwAIiawsIjp9pu2QJIOhxGzroJibngBXEICMb6nX934fLXg/0" style="-webkit-box-shadow:rgb(102, 102, 102) 0.2em 0.2em 0.5em; box-shadow:rgb(102, 102, 102) 0.2em 0.2em 0.5em; box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important"></fieldset></section><p><span style="line-height:22.390625px">食材（5人份） &nbsp;</span></p><p style="text-align: left;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><section class="135editor"><table align="left" cellpadding="0" cellspacing="0" style="width:100%"><tbody><tr class="firstRow" height="18"><td align="right" colspan="1" rowspan="3" style="border-color: rgb(248, 247, 245); padding-right: 10px; word-break: break-all; text-align: right; vertical-align: top;" valign="top" width="161"><p><span style="font-size:14px">糯米粉</span></p><p>勿忘我</p><p><span style="font-size:14px">玫瑰花</span></p><p>绿茶粉</p><p>白糖</p><p>椰蓉</p><p>竹签</p></td><td align="left" colspan="1" rowspan="3" style="border-color: rgb(248, 247, 245); padding-left: 10px; text-align: left; vertical-align: top; word-break: break-all;" valign="top" width="166"><p>200g</p><p>10g</p><p>10g</p><p>5g</p><p>40g</p><p>适量</p><p>5只</p></td></tr><tr></tr><tr></tr></tbody></table></section><p></p><p style="margin-bottom: 15px; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">步骤：</span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); color:rgb(192, 0, 0); font-family:times; font-size:14.4444446563721px; line-height:21px; text-align:justify">❶&nbsp;</span><span style="font-size:14px; line-height:1.6em">糯米粉分成4等份。</span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 0, 0); font-size:14.4444446563721px">❷</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 0, 0); font-size:14.4444446563721px">&nbsp;</span>勿忘我和玫瑰花只留花瓣。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 0, 0); font-size:14.4444446563721px">❸</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">勿忘我和玫瑰花，绿茶粉分别放入糯米粉中，再各加入10克白糖。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 0, 0)">❹</span>&nbsp;<span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">用开水和成四色面团。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="color:rgb(192, 0, 0)"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify">❺</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">&nbsp;</span></span><span style="font-family:微软雅黑,microsoft yahei"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); color:rgb(192, 80, 77); font-size:14px; line-height:21px; text-align:justify"></span><span style="font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:1.6em">然后把面团分别搓成小元宵。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); color:rgb(192, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify">❻</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 80, 77)">&nbsp;</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">锅中水烧开放入元宵煮至浮起关火。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); color:rgb(192, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify">❼</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14.4444446563721px; line-height:21px; text-align:justify">&nbsp;</span></span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="font-size:14.4444446563721px"></span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">煮好的元宵放入冷水中冲洗，沥干水分放入椰蓉中滚满椰蓉。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); color:rgb(192, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify">❽&nbsp;</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 80, 77); font-size:14.4444446563721px"></span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">在用竹签按各种颜色分别串起来即可食用。</span></span></p><p></p><p><span style="line-height:22.390625px">微博：@红豆厨坊 &nbsp;&nbsp;</span></p><p><span style="line-height:22.390625px"></span></p><p></p><section class="135editor"><section style="border: 3px solid rgb(33, 33, 34); padding: 5px;"><section data-bcless="lighten" style="border: 1px solid rgb(58, 58, 60); padding: 15px; text-align: center; color: inherit;"><p class="135title" style="color: inherit;"><span style="color:rgb(192, 0, 0)"><strong>Dishes</strong></span></p><p style="color: inherit; font-size: 24px;"><strong style="color:inherit"><span class="135brush" style="color:inherit; font-size:24px">南瓜红豆汤圆</span></strong></p></section></section></section><p></p><p><span style="color:rgb(51, 51, 51); font-family:tahoma,arial,helvetica,宋体,arial narrow,geneva,sans-serif; line-height:24px"><strong style="color:rgb(192, 0, 0); font-family:times; line-height:21px; text-align:justify; white-space:normal">▶</strong><span style="color:rgb(51, 51, 51); font-family:微软雅黑,microsoft yahei; line-height:24px">这个季节的南瓜最好吃，粉粉的，而且很甜。不管做什么都可以，今天看到君之发的南瓜挞，可想而知南瓜是多么应景儿。从同事那切了一点南瓜，一半做了馒头，一半做了今天的汤圆。</span></span></p><p><span style="color:rgb(51, 51, 51); font-family:tahoma,arial,helvetica,宋体,arial narrow,geneva,sans-serif; line-height:24px"><span style="color:rgb(51, 51, 51); font-family:微软雅黑,microsoft yahei; line-height:24px"></span></span></p><p><span style="color:rgb(51, 51, 51); font-family:微软雅黑,microsoft yahei; line-height:24px"></span></p><section class="135editor"><fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZNPRmEjSoFYhhGa98sT81lcdicHNz8MwbvA1PeUsND2ShSFLymZz9ichA/0" style="-webkit-box-shadow:rgb(102, 102, 102) 0.2em 0.2em 0.5em; box-shadow:rgb(102, 102, 102) 0.2em 0.2em 0.5em; box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important"></fieldset></section><p><span style="line-height:22.390625px">食材（5人份）</span></p><p><span style="line-height:22.390625px"></span></p><section class="135editor"><table align="left" cellpadding="0" cellspacing="0" style="width:100%"><tbody><tr class="firstRow" height="18"><td align="right" colspan="1" rowspan="3" style="border-color: rgb(248, 247, 245); padding-right: 10px; word-break: break-all; text-align: right; vertical-align: top;" valign="top" width="161"><p><span style="font-size:14px"><span style="line-height:22.390625px; text-align:center">&nbsp;南瓜</span></span></p><p><span style="font-size:14px"><span style="line-height:22.390625px; text-align:center">红豆馅</span></span></p><p><span style="font-size:14px"><span style="line-height:22.390625px; text-align:center">糯米粉</span></span></p><p><span style="font-size:14px"><span style="line-height:22.390625px; text-align:center">&nbsp;水</span></span></p></td><td align="left" colspan="1" rowspan="3" style="border-color: rgb(248, 247, 245); padding-left: 10px; text-align: left; vertical-align: top; word-break: break-all;" valign="top" width="166"><p>200g</p><p>180g</p><p>150g</p><p>适量</p></td></tr><tr></tr><tr></tr></tbody></table></section><p style="white-space: normal; text-align: center;"></p><p style="margin-bottom: 15px; min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="color:rgb(38, 38, 38); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">步骤：</span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 0, 0); font-size:14.4444446563721px">❶&nbsp;</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify">南瓜切片，入锅蒸熟。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 0, 0); font-size:14.4444446563721px">❷&nbsp;</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify">蒸熟的南瓜放人糯米粉，不要加水。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 0, 0); font-size:14.4444446563721px">❸&nbsp;</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify">揉成小团，包入自治红豆馅。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); color:rgb(192, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify">❹</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 0, 0)"></span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:21px; text-align:justify">&nbsp;<span style="line-height:22.390625px">依次做好所有的汤圆。</span></span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); color:rgb(192, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify">❺</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="color:rgb(192, 80, 77)">&nbsp;</span><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify">沸水入锅，待汤圆漂浮等一分钟即可。</span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify"></span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify"><span style="line-height:22.390625px">微博：@小斧</span></span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:times; font-size:14px; line-height:21px; text-align:justify"><span style="-webkit-text-stroke-color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:22.390625px; text-align:justify"><span style="line-height:22.390625px"></span></span></span></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; line-height: 24px; font-size: 15.5555562973022px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0"></p><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; text-align: center;">-end-<span style="color:rgb(127, 127, 127); font-size:12px"></span></p><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; text-align: center;"><img alt="" border="0" data-ratio="0.703125" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPiazjsibqzMEbFXfnLK8n31vaxjZefKCJItYVoDUBOKtqBsScQuzibtsJzGiayeB6VicnBFz07tTbPDnEg/0" data-w="384" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiazjsibqzMEbFXfnLK8n31vaxjZefKCJItYVoDUBOKtqBsScQuzibtsJzGiayeB6VicnBFz07tTbPDnEg/0" style="visibility:visible !important; width:auto !important" title="" vspace="0"><span style="color:rgb(127, 127, 127); font-size:12px"></span></p><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; text-align: center;"><span style="color:rgb(127, 127, 127); font-size:12px">加入tizi135，了解更多相关信息</span></p></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150228/16388.html" target="_blank">元宵节模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-16388-view_nums">1485</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="16388" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',16388,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-16388-favor_nums">982</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-13487"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/13487.jpg" title="简洁模板" class="template-cover" data-id="13487" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/13487.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="13487" data-name="简洁模板" id="template-13487"><section class="135editor"><section class="135editor"><blockquote class="135bg" data-original-title="" style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: cover;background-position: 100% 50%; background-repeat: no-repeat no-repeat; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLlY4fI6M0bMp6IXlJUOVREMkCAGakj6rT5J00ltHYU1j0hW8qtmxWdQ/0);" title=""><section class="135brush"><p>　　</p><p></p><p></p><p></p><p></p><p></p></section></blockquote></section></section><section class="135editor"><fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;"><section style="box-sizing: border-box; width: 30%; float: left; padding: 0px 0.1em 0px 0px;"><p></p><p></p><p></p><p></p><p></p><p></p><p></p><section class="135editor"><section class="135editor"><blockquote class="135bg" data-original-title="" style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: contain;background-position: 50% 50%; background-repeat: no-repeat no-repeat; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLjvbckSicnORRQEgKM2Cw9bpVzSstbBhiciaVl9n0Kg85Oz7uQNGpnsuOg/0);" title=""><section class="135brush"><p>　　</p><p></p><p></p><p></p></section></blockquote></section></section><p style="text-align: center;"><strong><span style="color:rgb(127, 127, 127); font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">文/浓雾号角</span></strong></p><p style="text-align: center;"><strong><span style="color:rgb(62, 62, 62); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-decoration:underline; text-indent:28px; white-space:pre-wrap">Once常驻作者</span></strong></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p style="text-align: center;"><img data-ratio="1" data-s="300,640" data-src="http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLGY24kZDvwRPHs0bIuFsLwIIgBIj4GxAHvgL7eUwZjah3V5tqrnb1wg/0" data-type="jpeg" data-w="151" file_id="203915569" format="jpeg" src="http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLGY24kZDvwRPHs0bIuFsLwIIgBIj4GxAHvgL7eUwZjah3V5tqrnb1wg/640?tp=webp&amp;wxfrom=5" style="height:auto !important; visibility:visible !important; width:auto !important" url="http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLGY24kZDvwRPHs0bIuFsLwIIgBIj4GxAHvgL7eUwZjah3V5tqrnb1wg/0"><br><span style="color:rgb(84, 141, 212); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-decoration:underline; text-indent:28px; white-space:pre-wrap">长按图片识别二维码</span></p><section class="135editor"><section style="margin: 10px 0px; text-align: center;"><span style="color:inherit; font-size:12px"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="background-color:rgb(239, 112, 96); border-bottom-left-radius:5px; border-bottom-right-radius:5px; border-top-left-radius:5px; border-top-right-radius:5px; color:rgb(255, 255, 255); padding:5px 10px">关注</span></strong></span></section></section><p style="text-align: center;"><span style="font-size:16px"><strong><span style="color:rgb(62, 62, 62); font-family:times; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">Once</span></strong></span></p><p></p><p style="text-align: center;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">故事</span></p><p><span style="color:rgb(62, 62, 62); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap"></span></p><p style="text-align: center;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">文字</span></p><p><span style="color:rgb(62, 62, 62); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap"></span></p><p style="text-align: center;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">新潮</span></p><p><span style="color:rgb(62, 62, 62); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap"></span></p><p style="text-align: center;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:10px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">前沿</span></p></section><section class="135brush" data-style="margin-right: 0.5px; font-size: 1.2em; font-weight: bold;color: rgb(52, 54, 60); " style="display: inline-block; width: 70%; box-sizing: border-box; float: left; padding: 0px 0px 0px 1.0em;"><p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap"></span></p><p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">今晚诗班分享的时候，接触到一个全新的概念——受害者心理。这个现象在上世纪60年代之后的美国教会、社会、甚至是全世界都十分常见。所谓“受害者心理”，简单来说就是长期或者永久性的将自己当做受害者看待，因为一个旧时的创伤，而执意要用剩下的光阴去处理、修补。受害者心理产生于法治社会之后，让人的自我意识得以不断警醒，但是也让社会和群体在不知不觉中蒙上一种颓败、衰落的阴影，表面上看受害者心理是一种人与人之间的宽容和理解，但其实是一种对自我惰性的放纵。因为幼时被自己的长辈侵犯所以导致一辈子的婚姻都笼罩在不安和破碎里，因为青年时期被公司炒鱿鱼所以导致年老都碌碌无为。受害者心理，让人心安理得可以去怪罪任何事，去联系一些根本没有关系的事，去洗脱自己的责任而完全不会产生愧疚。阴影是客观，也或许会永久，但心理产生于主观。没有任何法则表明因为你受过侵害所以就注定没有幸福的婚姻，也没有任何法则表明因为你被辞退过所以你就注定要碌碌无为穷困潦倒一生。没有任何法则说过，因为一个创伤你就可以彻底躺在原地敞着肚皮等着天地的投喂养育心安理得而不前进。每个人都被生活逼迫过，但任何人都不会成为一辈子的受害者。我们在岁月的某些阶段的确会成为情欲、财富浪潮里的牺牲者受害者，但是没有任何人有资格做一辈子的受害者。有时候太应该想想究竟是什么让自己变得枯朽不堪？是那些几百年前受过的创伤，还是自己一直解不开的梦魇魔障？任何艰巨都会过去，然而过不去的，始终是人心。</span></p><p></p><p></p></section></fieldset></section><p></p><p></p><p style="line-height: 2em; text-align: center;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap"><img data-ratio="0.05708661417322835" data-s="300,640" data-src="http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FI76H2jNGHxTZozmZKOvicsnpJG5BLDIqA5fUsc5iczckCh1CZfCznOEoY0nkc3pmIn6C6OVSsh3hQ/0" data-w="508" src="http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2FI76H2jNGHxTZozmZKOvicsnpJG5BLDIqA5fUsc5iczckCh1CZfCznOEoY0nkc3pmIn6C6OVSsh3hQ/640?tp=webp&amp;wxfrom=5" style="height:auto !important; visibility:visible !important; width:auto !important"></span></p><p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap"></span></p><p></p><section class="135editor"><section class="135editor"><blockquote class="135bg" data-original-title="" style="max-width: 100%; padding: 5px 15px; border: none rgb(255, 129, 36);word-wrap: break-word !important; box-sizing: border-box !important;background-size: contain;background-position: 50% 50%; background-repeat: no-repeat no-repeat; background-image: url(http://mmbiz.qpic.cn/mmbiz/aTgmCo8cA2HX6dmAibTIHykN1Ma2uxJRLAbO2a0ghYPU6Bm6IWZ0RqYjq38nh5wSlODMAV2X0sUTm5rDmaiaxv7A/0);" title=""><section class="135brush"><p>　　</p><p></p><p></p><p></p><p></p><p></p><p></p><p></p><p></p></section></blockquote></section></section><p></p><p style="line-height: 2em; text-align: center;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">你可以理解为一次，也可以理解为曾经</span></p><p style="line-height: 2em; text-align: center;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">因为我们会把很多人事物变成曾经</span></p><p style="line-height: 2em; text-align: center;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:12px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap">而这,只需要Once</span></p><p style="line-height: 2em;"><span style="color:rgb(62, 62, 62); font-family:times; font-size:14px; line-height:21px; text-align:justify; text-indent:28px; white-space:pre-wrap"></span></p></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150215/13487.html" target="_blank">简洁模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-13487-view_nums">375</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="13487" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',13487,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-13487-favor_nums">485</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-13433"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/13433.jpg" title="春联模板" class="template-cover" data-id="13433" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/13433.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="13433" data-name="春联模板" id="template-13433"><section class="135editor" style="border: 1px dotted rgb(218, 98, 71); padding: 2px;">
<section class="135brush" style="border-color: rgb(33, 33, 34); color: rgb(255, 255, 255); border-radius: 4px; margin: 10px 0px; padding: 15px; background-color: rgb(33, 33, 34);">
<p style="color: inherit;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(195, 39, 43); margin-top: 0.8em; margin-bottom: 0.3em; text-align: center;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjhXdiaw8ibquYYw8MI1InGKpjBDKBeTndywvia3C1akicvEpCMjicefLbcDNlPdnhhgCuSWctrwndZquQ/0" style="border:0px rgb(195, 39, 43); color:inherit; display:inline-block; height:auto !important; visibility:visible !important; width:100% !important">
<section style="display: inline-block; width: 20%; vertical-align: top; margin-left: 10%; margin-top: -8em; color: inherit;">
<section class="135bg" data-original-title="" style="width: 5em; height: 5em; border-radius: 50%; padding-top: 0.5em; color: inherit; max-width: 5em !important; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhH6n4nvXuic2Qh5ul4PG88JicvW9XDfU4EZqupddcQdqeb9SUZFDV4VlvYaLvBKXBkkBUH2o3zGYSA/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;" title="">
<section style="width: 4em; height: 4em; margin-right: auto; margin-left: auto; border: 1px solid rgb(255, 255, 255); border-radius: 50%; color: inherit;"></section>
</section>

<section style="width: 1px; height: 3em; border-left-width: 0.1em; border-left-style: solid; border-color: rgb(255, 255, 255); margin-top: -0.5em; margin-left: 2.5em; color: inherit;"></section>

<section style="width: 5em; padding: 0.5em; text-align: center; color: rgb(252, 237, 238); height: auto !important; background-color: rgb(164, 0, 0);">
<section style="width: 1px; height: 0.5em; border-left-width: 0.1em; border-left-style: solid; border-color: rgb(255, 255, 255); margin-top: -0.5em; margin-left: 2em; color: inherit;"></section>

<section style="width: 100%; height: 100%; border: 1px solid rgb(255, 255, 255); padding: 0.5em; color: inherit;">
<section style="width: 1em; display: inline-block; vertical-align: top; margin-right: 0.5em; font-size: 112.5%; font-family: inherit; font-weight: inherit; text-align: left; text-decoration: inherit; color: inherit;">
<section class="135brush" data-brushtype="text" style="color: inherit;"><span style="font-family:inherit">羊年大吉</span></section>
</section>
</section>
</section>
</section>

<section style="display: inline-block; width: 54%; vertical-align: top; margin-top: 0.5em; margin-left: 14px; line-height: 1.5em; font-size: 87.5%; font-weight: inherit; text-decoration: inherit; color: rgb(153, 153, 153);">
<section class="135brush" style="color: rgb(164, 0, 0);">
<p><strong><span style="font-size:20px">祝愿大家</span></strong></p>

<p><strong><span style="font-size:20px">春节快乐</span></strong></p>

<p><strong><span style="font-size:20px">万事如意</span></strong></p>

<p><strong><span style="font-size:20px">合家欢乐</span></strong></p>

<p><strong><span style="font-size:20px">赚钱多多</span></strong></p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<h2 class="135brush" placeholder="请输入标题" style="border-left-width: 5px; border-left-style: solid; border-left-color: rgb(172, 29, 16); font-size: 16px; font-weight: bold; line-height: 32px; color: rgb(102, 102, 102); padding: 5px 10px; margin: 10px 0px;"><span style="color:rgb(192, 0, 0); font-size:24px">春联</span></h2>
</section>

<p><span style="font-size:12px">据说贴春联的习俗，大约始于一千多年前的后蜀时期，这是有史为证的。此外根据《玉烛宝典》，《燕京岁时记》等著作记载，春联的原始形式就是人们所说的“桃符”。</span></p>

<p>&nbsp;</p>

<p><span style="font-size:12px; line-height:1.6em">在中国古代神话中，相传有一个鬼域的世界，当中有座山，山上有一棵覆盖三千里的大桃树，树梢上有一只金鸡。每当清晨金鸡长鸣的时候，夜晚出去游荡的鬼魂必赶回鬼域。鬼域的大门坐落在桃树的东北，门边站着两个神人，名叫神荼、郁垒。如果鬼魂在夜间干了伤天害理的事情，神荼、郁垒就会立即发现并将它捉住，用芒苇做的绳子把它捆起来，送去喂虎。因而天下的鬼都畏惧神荼、郁垒。于是民间就用桃木刻成他们的模样，放在自家门口，以避邪防害。后来，人们干脆在桃木板上刻上神荼、郁垒的名字，认为这样做同样可以镇邪去恶。这种桃木板后来就被叫做“桃符”。</span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor">
<section style="text-align:center;margin-bottom:10px">
<section style="padding: 5px; width: 60%; display: inline-block; background: rgb(165, 0, 3);">
<section data-style="color:#FFF;font-size:24px;weight:bold;" style="border:1px solid #FFF;padding:10px 20px;">
<p style="color: rgb(255, 255, 255); border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(165, 0, 3);"><span class="135brush" data-brushtype="text" style="font-size:24px">辞旧迎新</span></p>
</section>
</section>
</section>

<section style="color: rgb(255, 255, 255); width: 100%; text-align: center;">
<section style="width: 48%; display: inline-block; float: left; color: inherit;">
<section style="width: 5em; padding: 0.5em; color: rgb(252, 237, 238); height: auto !important; background-color: rgb(164, 0, 0);">
<section style="width: 100%; height: 100%; border: 1px solid rgb(255, 255, 255); padding: 0.5em; color: inherit;">
<section style="width: 1em; display: inline-block; vertical-align: top; margin-right: 0.5em; margin-left: 0.5em; font-size: 112.5%; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: inherit;">
<section class="135brush" data-brushtype="text" style="color: inherit;">旧岁又添几个喜</section>
</section>
</section>
</section>
</section>

<section style="margin-left: 4%;width: 48%; display: inline-block;color: inherit;">
<section style="width: 5em; float: right; padding: 0.5em; color: rgb(252, 237, 238); height: auto !important; background-color: rgb(164, 0, 0);">
<section style="width: 100%; height: 100%; border: 1px solid rgb(255, 255, 255); padding: 0.5em; color: inherit;">
<section style="width: 1em; display: inline-block; vertical-align: top; margin-right: 0.5em; margin-left: 0.5em; font-size: 112.5%; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: inherit;">
<section class="135brush" data-brushtype="text" style="color: inherit;">新年更上一层楼</section>
</section>
</section>
</section>
</section>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor"></section>

<p><span style="font-size:12px">到了宋代，人们便开始在桃木板上写对联，一则不失桃木镇邪的意义，二则表达自己美好心愿，三则装饰门户，以求美观。又在象征喜气吉祥的红纸上写对联，新春之际贴在门窗两边，用以表达人们祈求来年福运的美好心愿。</span></p>

<p>&nbsp;</p>

<p><span style="font-size:12px">为了祈求一家的福寿康宁，一些地方的人们还保留着贴门神的习惯。据说，大门上贴上两位门神，一切妖魔鬼怪都会望而生畏。在民间，门神是正气和武力的象征，古人认为，相貌出奇的人往往具有神奇的禀性和不凡的本领。他们心地正直善良，捉鬼擒魔是他们的天性和责任，人们所仰慕的捉鬼天师钟馗，即是此种奇形怪相。所以民间的门神永远都怒目圆睁，相貌狰狞，手里拿着各种传统的武器，随时准备同敢于上门来的鬼魅战斗。由于我国民居的大门，通常都是两扇对开，所以门神总是成双成对。</span></p>

<p>&nbsp;</p>

<p><span style="font-size:12px">唐朝以后，除了以往的神荼、郁垒二将以外，人们又把秦叔宝和尉迟恭两位唐代武将当作门神。相传，唐太宗生病，听见门外鬼魅呼号，彻夜不得安宁。于是他让这两位将军手持武器立于门旁镇守，第二天夜里就再也没有鬼魅搔扰了。其后，唐太宗让人把这两位将军的形象画下来贴在门上，这一习俗开始在民间广为流传。</span></p>

<p style="color: inherit;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(195, 39, 43); margin: 0.8em 0px 0.3em; box-sizing: border-box; padding:0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhH6n4nvXuic2Qh5ul4PG88JicvW9XDfU4EZqupddcQdqeb9SUZFDV4VlvYaLvBKXBkkBUH2o3zGYSA/0" style="border:0px rgb(195, 39, 43); box-sizing:border-box; color:inherit; display:inline-block; height:auto !important; visibility:visible !important; width:100% !important" title="" vspace="0">
<section style="display: inline-block; width: 20%; vertical-align: top; margin-left: 6%; margin-top: -6em; box-sizing: border-box; color: inherit;">
<section class="135bg" data-original-title="" style="width: 5em; height: 5em; padding-top: 0.5em; box-sizing: border-box; color: inherit; max-width: 5em !important; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhH6n4nvXuic2Qh5ul4PG88J3v5sPZBuuj7NE7Lwt2aSlJRTbfXDgQXXBcw04qcr8mSOydWGWsUnHQ/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;" title="">
<section style="width: 4em; height: 4em; margin: 0px auto; border: 1px solid rgb(255, 255, 255); border-top-left-radius: 50%; border-top-right-radius: 50%; border-bottom-right-radius: 50%; border-bottom-left-radius: 50%; box-sizing: border-box; color: inherit;"></section>
</section>
</section>
</fieldset>
</section>

<p style="text-align: left;"><span style="font-size:24px"><strong><span style="color:rgb(192, 0, 0)">完</span></strong></span></p>
</section>
</section>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150215/13433.html" target="_blank">春联模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-13433-view_nums">1585</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="13433" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',13433,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-13433-favor_nums">654</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    	
	    			<div class="col-md-6">
					<div class="style-list clearfix" id="editor-style-12657"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201502/d875674d0b185e947963cf6d.jpg" title="羊年模板" class="template-cover" data-id="12657" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201502/d875674d0b185e947963cf6d.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-id="12657" data-name="羊年模板" id="template-12657"><section class="135editor"><fieldset style="border: 0px rgb(255, 129, 36); margin: 2em 1em 1em; padding: 0px;"><section style="line-height: 1.4; text-align: left; margin-right: 10px; color: inherit;"><fieldset style="border: 28px solid rgb(255, 129, 36); border-image-source: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiaXAGReq0PiaE33xf7P0eJF6P6OAxswYk1Uh3ewvZjwgFSj5cbmiasWbfiaSfHWgQrgqgaVq7YgetVAg/0); border-image-slice: 28; margin-top: 1em; font-size: 16px; text-decoration: none; color: rgb(255, 129, 36); line-height: 1.4; text-align: left;"><p class="135brush" style="text-align: center;"><span style="color:rgb(89, 89, 89); font-size:24px">羊 年 说 羊</span></p></fieldset></section></fieldset></section><p style="line-height: 1.75em; text-align: center;"><span style="color:rgb(89, 89, 89); font-size:20px"></span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89); font-size:20px"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhjgA9jK2c9vKVagR3y38eI9libHG6K3Vh04c97NsKVBLib3Ih5Dya3T728oyurO67adn14rOfcxhyA/0" style="color:rgb(89, 89, 89); cursor:pointer; line-height:24.5px; white-space:normal; z-index:-1"></span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89); line-height:1.75em"></span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89); line-height:1.75em">马年即将过去，羊年已经在向我们招手。此时此刻，一个绰约、优雅的身影浮现于眼前，挥之不去，令人心境久久难以平复。</span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)">羊伴随人类的时间之久远、与人关系之密切，的确值得大书特书。因其形体适中，攻击力差，对人几乎毫无威胁，不似豺狼虎豹之凶猛令人毛骨悚然，于是便成最理想的狩猎目标之一。又因其食之者草，产出者奶、肉、毛、皮，加之其性格温顺，易于驯服，故而成为人类最早饲养的动物。古人以“马牛羊鸡犬豕”为六畜，羊“榜”上有名，且位居前列。足以说明其在古人心目中的重要位置。</span></p><p style="line-height: 1.75em;"></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)"></span></p><section class="135editor"><fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;"><section style="display: inline-block; box-sizing: border-box; color: inherit;"><section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(117, 117, 118); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(117, 117, 118);"><span style="border-color:rgb(117, 117, 118); color:rgb(149, 55, 52); font-size:18px">羊承载艺术</span></section><section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(117, 117, 118); box-sizing: border-box; border-color: rgb(117, 117, 118);"><span style="color:rgb(89, 89, 89)"><strong style="border-color:rgb(117, 117, 118); color:inherit"><span style="border-color:rgb(117, 117, 118); font-size:12px">Goat &amp; Artist</span></strong></span></section></section></fieldset></section><p style="line-height: 1.75em;"></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89); font-size:14px">由</span><span style="color:rgb(89, 89, 89)">于其很早便走入人类视野，因而在早期原始文化遗存中活灵活现，荦荦大观。斑驳的岩画中，有它们壮硕的身影；陶器的图案里，有它们美丽的面容；从商代的“四羊方樽”、“三羊铜罍”，到汉代的“羊型铜灯”、唐代的“三彩陶羊”，直至当今的年画、剪纸等各种民间工艺品，羊的各种形象随处可见，给世世代代的人们带来了莫大的审美享受，成为人们生活内容中不可或缺的重要因素。</span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)"></span></p><p></p><section class="135editor"><fieldset style="border: 0px; text-align: center;"><section style="display: inline-block; color: inherit;"><section class="135brush" data-brushtype="text" style="margin-top: 0.2em; padding-right: 0.5em; padding-bottom: 5px; padding-left: 0.5em; color: rgb(117, 117, 118); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(117, 117, 118);"><span style="border-color:rgb(117, 117, 118); color:rgb(149, 55, 52); font-size:18px; line-height:24.5px">羊代表美丽</span></section><section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(117, 117, 118); border-color: rgb(117, 117, 118);"><span style="color:rgb(89, 89, 89)"><strong style="border-color:rgb(117, 117, 118); color:inherit"><span style="border-color:rgb(117, 117, 118); font-size:12px">Goat &amp; Artist</span></strong></span></section></section></fieldset></section><p style="line-height: 1.75em;"></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)">汉字中的“美”字，即由“羊”和“大”两字组合而成。羊大为美，乃古人实用主义审美倾向的生动体现。</span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)">羊可充作美食。“鱼”和“羊”结合便成“鲜”字，折射出古人口福不浅，不禁让我等垂涎欲滴。</span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)">“羊”字孕育文化。古人以象形之法造出“羊”字，又因之大展其用。《汉字大字典》中，以“羊”为部首的汉字竟多达204个，充分说明其对先民生活影响力的巨大。不知不觉中，羊的影响已渗透到人类生活的方方面面，使人目不暇接.</span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)"></span></p><section class="135editor"><fieldset style="border: 0px; text-align: center;"><section style="display: inline-block; color: inherit;"><section class="135brush" data-brushtype="text" style="margin-top: 0.2em; padding-right: 0.5em; padding-bottom: 5px; padding-left: 0.5em; color: rgb(117, 117, 118); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(117, 117, 118);"><span style="border-color:rgb(117, 117, 118); color:rgb(149, 55, 52); font-size:18px; line-height:24.5px">羊陪伴英雄</span></section><section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(117, 117, 118); border-color: rgb(117, 117, 118);"><span style="color:rgb(89, 89, 89)"><strong style="border-color:rgb(117, 117, 118); color:inherit"><span style="border-color:rgb(117, 117, 118); font-size:12px">Goat &amp; hero</span></strong></span></section></section></fieldset></section><p style="line-height: 1.75em;"></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)">据《汉书·苏武传》，汉中郎将苏武奉武帝之命出使匈奴。匈奴单于背汉妄为，扣留苏武并遣其牧羝羊（公羊）于北海之滨，并扬言“羝乳乃得归”。苏武与羊群为伴，手执汉节，饿吞草籽，渴饮雪水，而不辱使命。直至19年后单于回心转意，苏武才得返长安，受封典属国，留下千古佳话。</span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)">羊可启发智慧。据《战国策·楚策四》载，楚怀王听信张仪花言巧语，入秦而被囚禁。襄王即位，不思进取。良臣庄辛进言而不纳，便避走于赵。不久，郢都被秦所据。襄王悔，寻见庄辛。庄辛用“亡羊补牢，未为迟也”来鼓励襄王应重整旗鼓，卷土重来。用于此处，既通俗易懂，又言简意赅。</span></p><p style="line-height: 1.75em;"></p><section class="135editor"><fieldset style="border: 0px; text-align: center;"><section style="display: inline-block; color: inherit;"><section class="135brush" data-brushtype="text" style="margin-top: 0.2em; padding-right: 0.5em; padding-bottom: 5px; padding-left: 0.5em; color: rgb(117, 117, 118); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(117, 117, 118);"><span style="border-color:rgb(117, 117, 118); color:rgb(149, 55, 52); font-size:18px; line-height:24.5px">羊象征安泰</span></section><section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(117, 117, 118); border-color: rgb(117, 117, 118);"><span style="color:rgb(89, 89, 89)"><strong style="border-color:rgb(117, 117, 118); color:inherit"><span style="border-color:rgb(117, 117, 118); font-size:12px">Goat &amp; Happiness</span></strong></span></section></section></fieldset></section><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)"></span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)">古语有“三羊开泰”之说。考“三羊开泰”本应作“三阳开泰”，最早出自《易经》。《易经》以十一月为复卦，一阳生于下；十二月为临卦，二阳生于下；正月为泰卦，三阳生于下。指冬去春来，阴消阳长，是吉利之象征。对“三阳开泰”的另一种解释为：11月冬至日的白昼最短，其后则白昼渐长。古人以为此乃阴气渐去而阳气始生，所以称冬至一阳生，12月二阳生，正月三阳开泰。因此，旧时常用作新年起始的祝愿之辞。而“羊”与“阳”同音，久之便讹为“三羊开泰”。后人附会出“三只大角羊聚立于一处”之特定造型，成为妇孺皆知的吉亨之象。</span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)"></span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhjgA9jK2c9vKVagR3y38eIdGMJgviaP6LKLnGhGrBFZgN8WMSUnCaU44J9xreWUs17poeaCyXBg3w/0" style="color:rgb(89, 89, 89); cursor:pointer; line-height:24.5px; white-space:normal; z-index:-1"></span></p><p style="line-height: 1.75em;"><span style="color:rgb(89, 89, 89)"></span></p><hr><p style="line-height: 1.75em;"></p><p style="line-height: 1.75em; text-align: center;"><span style="font-size:12px">关注tizi135 &nbsp; ︳创享一触即发</span></p><p style="line-height: 1.75em; text-align: center;"></p></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150213/12657.html" target="_blank">羊年模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-12657-view_nums">1187</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="12657" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',12657,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-12657-favor_nums">1360</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
					</div>
			    			    </div>
			    			</div>
		
				<div id="recommend-tpl-list-1" class="row tab-pane">
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-20395"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/e9c5c6d56c64e893983a02d5.jpg" title="无缝图片组合样式使用作品" class="template-cover" data-id="20395" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/e9c5c6d56c64e893983a02d5.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-name="无缝图片组合样式使用作品" id="template-20395"><p>&nbsp;</p>

<section class="135editor" data-id="4" style="font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; white-space: normal;">
<h2 class="135brush" data-bcless="true" placeholder="浅色边框标题" style="margin-top: 10px; margin-bottom: 10px; padding: 10px; font-size: 16px; line-height: 25px; color: rgb(204, 63, 10); box-shadow: rgb(153, 153, 153) 1px 1px 2px; border-left-style: solid; border-color: rgb(251, 190, 167); border-left-width: 25px; background-color: rgb(253, 226, 216);"><span style="line-height:0px">﻿</span>澳洲旅游攻略——治愈篇</h2>
</section>

<section class="135editor" data-id="50">
<section style="margin: 10px 0px 0px 16px;"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="background-color:rgb(245, 189, 209); border-color:rgb(245, 189, 209); border-radius:0.3em; color:rgb(155, 24, 71); padding:0.2em 0.5em; text-align:center">粉红湖</span><span class="135brush" data-brushtype="text" style="background-color:rgb(255, 255, 255); border-radius:1.2em; border:1px solid rgb(245, 189, 209); color:rgb(245, 189, 209); height:1.2em; line-height:1.2em; margin-left:0.3em; padding:0.2em 0.5em">Pink Lake</span></strong></section>

<section class="135brush" data-style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)" style="margin: -1em auto 5px; padding: 20px 10px 5px; border-radius: 0.3em; border: 1px solid rgb(245, 189, 209); color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);">
<p style="font-size: 14px; line-height: 1.5em; color: inherit;">地址：Pink Lake，MiddleIsland，WA</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">位于澳洲西部深处，距离世界最孤立的城市珀斯（Perth）还要经过5小时的驾车才能到达，可谓离世间繁华最孤立的自然湖泊。科学家至今也不能确定到底是什么原因使其呈现诱人的粉色，又或是上帝看枯寂的澳洲内陆便心情一好为之添上一抹粉红。洁白悉尼的沙滩与嫩粉的湖水，这里是摄影家的天堂，更是被称为“死而无憾令人心境平复的”美景，</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">它还有个好听的名字，Lake Hiller（治愈之湖）</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">http://www.australia.com/explore/states/wa/pink-lake.aspx （英文）</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">http://www.australia.cn/destination/western-australia（中文）</p>
</section>
</section>

<section class="135editor" data-id="9579" style="color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; white-space: normal;">
<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="1.5" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXxg6nUDPibgo5WYbWV06PnfJBKPibFO1O8HqXsKvkPgJLml9hDKPjUxibQ/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXxg6nUDPibgo5WYbWV06PnfJBKPibFO1O8HqXsKvkPgJLml9hDKPjUxibQ/0?tp=webp&amp;wxfrom=5" style="float:left; visibility:visible !important; width:100%"></p>

<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" border="0" data-ratio="1.0019762845849802" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXv25nFcT1eRiaTIGjXa4NmB45aNkzPBvnI8nrJn6MHwaVHQgpeRDjfBA/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXv25nFcT1eRiaTIGjXa4NmB45aNkzPBvnI8nrJn6MHwaVHQgpeRDjfBA/0?tp=webp&amp;wxfrom=5" style="float:left; line-height:1.6em; visibility:visible !important; width:100%" title="" vspace="0"></p>

<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="0.66600790513834" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXMScIos9AiauS9FfKSNBh1Ig12QOJjylW02JQkumRwuy6alMHsjcEdbg/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXMScIos9AiauS9FfKSNBh1Ig12QOJjylW02JQkumRwuy6alMHsjcEdbg/0?tp=webp&amp;wxfrom=5" style="float:left; line-height:1.6em; visibility:visible !important; width:100%"></p>
</section>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"><img data-ratio="0.017786561264822136" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0?tp=webp&amp;wxfrom=5" style="visibility:visible !important; width:auto !important"></p>

<section class="135editor" data-id="50">
<section style="margin: 10px 0px 0px 16px;"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="background-color:rgb(55, 74, 174); border-color:rgb(55, 74, 174); border-radius:0.3em; color:rgb(255, 255, 255); padding:0.2em 0.5em; text-align:center">澳洲天空之境</span><span class="135brush" data-brushtype="text" style="background-color:rgb(255, 255, 255); border-radius:1.2em; border:1px solid rgb(55, 74, 174); color:rgb(55, 74, 174); height:1.2em; line-height:1.2em; margin-left:0.3em; padding:0.2em 0.5em">Lake Tyrrell</span></strong></section>

<section class="135brush" data-style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)" style="margin: -1em auto 5px; padding: 20px 10px 5px; border-radius: 0.3em; border: 1px solid rgb(55, 74, 174); color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);">
<p style="font-size: 14px; line-height: 1.5em; color: inherit;">地址：lake tyrrell，sealake，VIC</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">位于墨尔本西北4小时的镜面盐湖，拥有12万年历史的盐湖经过时境变迁，从当初的13米蒸发到现在纤薄的水面，形成了独特的天海合一的景观。传说以前原住民每年冬天会在会在这里观察星象，预测未来。4月到10月是前往盐湖的最佳时节，水位刚好倒映出天空美景，人站在海天一线的美景中，用相机记录下来，便有了这一幅幅如幻象世界的作品。</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">http://sealake.vic.au/about/tyrrell（英文）</p>

<p style="font-size: 14px; line-height: 1.5em; color: inherit;">http://www.51oz.com/thread-4420-1-1.html（中文）</p>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor" data-id="9579" style="color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; white-space: normal;">
<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="0.66600790513834" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXJQMo5FYvRRwrAVlzX3icJ7Hz2anXicDibfkPHASiaVUh7eg4vQTwxhVJIA/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXJQMo5FYvRRwrAVlzX3icJ7Hz2anXicDibfkPHASiaVUh7eg4vQTwxhVJIA/0?tp=webp&amp;wxfrom=5" style="float:left; visibility:visible !important; width:100%"></p>

<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="0.66600790513834" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXEkVoz1zFpezn1VSGnqYYt4jjvLZlRwhGicia5z9aEmjzLXaqCn2H9hwg/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXEkVoz1zFpezn1VSGnqYYt4jjvLZlRwhGicia5z9aEmjzLXaqCn2H9hwg/0?tp=webp&amp;wxfrom=5" style="float:left; line-height:1.6em; visibility:visible !important; width:100%"></p>

<p style="min-height: 1em; white-space: pre-wrap;"><img _width="100%" data-ratio="0.8320158102766798" data-src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXHRgCrAGapdWZb5uqIqLU4Z4qHSBibwib4EP5bibNwz1E8wfg1PElqq4vQ/0" data-w="" src="http://mmbiz.qpic.cn/mmbiz/cZV2hRpuAPhdGiaL6Q4b58m2yRPvoeKvXHRgCrAGapdWZb5uqIqLU4Z4qHSBibwib4EP5bibNwz1E8wfg1PElqq4vQ/0?tp=webp&amp;wxfrom=5" style="float:left; line-height:1.6em; visibility:visible !important; width:100%"></p>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; text-align: right;"><span style="font-size:14px">文字来源｜澳大利亚旅游局</span></p>

<p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; text-align: right;"><span style="font-size:14px">摄影｜N74photography Mr.Cheese</span></p>

<p>&nbsp;</p>

<section class="135editor" data-id="3" style="font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px; white-space: normal;">
<section style="margin: 2px;">
<section style="margin-left: 1em; line-height: 1.4em; color: inherit;"><span style="color:inherit; font-size:14px"><strong style="line-height:32px; white-space:pre-wrap"><span class="135brush" data-brushtype="text" data-mce-style="color: #a5a5a5;" placeholder="关于135编辑器" style="background-color:rgb(235, 103, 148); border-radius:5px; color:rgb(255, 255, 255); padding:4px 10px">OZService</span></strong></span></section>

<section class="135brush" data-style="color:rgb(89, 89, 89); font-size:14px; line-height:28px" style="margin-top: -0.7em; padding: 10px 1em; font-size: 1em; border: 1px solid rgb(235, 103, 148); border-radius: 0.4em; color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);">
<p style="min-height: 1em; white-space: pre-wrap; color: rgb(89, 89, 89); line-height: 28px;">澳洲华人贴身生活小助手，更多服务，敬请期待~</p>

<p style="min-height: 1em; white-space: pre-wrap; color: rgb(89, 89, 89); line-height: 28px;"><img data-ratio="1" data-src="http://mmbiz.qpic.cn/mmbiz/3Wnh6UHoibyntHa8GnT1DIciaBmicDWSGECPmSoySnaChNXS3zyZQY4blPV50MEV9u3LI2hVictiaS5TSzDKOUU0D3w/0" data-w="430" src="http://mmbiz.qpic.cn/mmbiz/3Wnh6UHoibyntHa8GnT1DIciaBmicDWSGECPmSoySnaChNXS3zyZQY4blPV50MEV9u3LI2hVictiaS5TSzDKOUU0D3w/0?tp=webp&amp;wxfrom=5" style="color:inherit; visibility:visible !important; width:auto !important"></p>
</section>
</section>
</section>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150306/20395.html" target="_blank">无缝图片组合样式使用作品</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-20395-view_nums">1365</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="20395" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',20395,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-20395-favor_nums">188</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-17967"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/a980ee5ab033a62f94a08b31.jpg" title="招贤纳士模板" class="template-cover" data-id="17967" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/a980ee5ab033a62f94a08b31.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-name="招贤纳士模板" id="template-17967"><section class="135editor">
<fieldset style="clear: both; padding: 0px; border: 0px none; margin: 1em 0px 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255); box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="padding: 0px 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">理念</section>
</section>
</fieldset>
</section>

<section class="135editor">
<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; max-width: 100%; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(116, 185, 11); border-color: rgb(229, 243, 208); background-image: -webkit-linear-gradient(left, rgb(230, 249, 202), rgb(207, 233, 167)); background-color: rgb(255, 255, 220);">
<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">营造团结，友爱，自由，包容的大家庭</p>

<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">尊重包容各种奇葩~</p>

<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">做排版最快捷的微信排版工具</p>
</section>
</section>

<section class="135editor">
<fieldset style="clear: both; border: 0px none; margin-top: 1em; margin-bottom: 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255);">
<section class="135brush" data-brushtype="text" style="padding-right: 0.5em; padding-left: 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">产品</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjstr86wliaib2El5sCU5Ge9icqM9hLALMC57SMJB28OEjmVfepl4kKG5tiaesnTJUv8n0jq3UbuYIo4g/0" style="-webkit-box-shadow:rgb(102, 102, 102) 0.2em 0.2em 0.5em; box-shadow:rgb(102, 102, 102) 0.2em 0.2em 0.5em; box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important"></fieldset>
</section>

<section class="135editor">
<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(116, 185, 11); border-color: rgb(229, 243, 208); background-image: -webkit-linear-gradient(left, rgb(230, 249, 202), rgb(207, 233, 167)); background-color: rgb(255, 255, 220);">
<p style="text-align: justify; color: inherit; border-color: rgb(229, 243, 208);">135编辑器是提子科技开发的一款在线微信排版工具，特色在于半自动排版“秒刷”功能，是国内第一款可以同时给图片和多段落文字的排版的工具。其不断更新的系统推荐模板和多功能样式也为不懂代码的微信编辑们提供了引导帮助。</p>
</section>
</section>

<section class="135editor">
<fieldset style="clear: both; border: 0px none; margin-top: 1em; margin-bottom: 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255);">
<section class="135brush" data-brushtype="text" style="padding-right: 0.5em; padding-left: 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">关于我们</section>
</section>
</fieldset>
</section>

<section class="135editor">
<section style="padding: 40px 40px; color: #737373; background: #f8f8f8;">
<p style="color: inherit;"><img src="http://gtms01.alicdn.com/tps/i1/TB1VMruGpXXXXabXpXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px">&nbsp;咳咳，想来的小伙伴可以进QQ咨询我们大Boss@邹齐龙，一言两语说不清哪~</p>

<section class="135brush" data-style="background-color:rgb(248, 248, 248); color:rgb(115, 115, 115); font-size:14px; line-height:21px" style="color: inherit;"></section>

<p style="text-align: right; color: inherit;"><img src="http://gtms02.alicdn.com/tps/i2/TB1zQbsGpXXXXX1XFXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>

<p style="text-align: right; color: inherit;">&nbsp;</p>

<p style="text-align: right; color: inherit;">某航小编如是说</p>
</section>
</section>

<section class="135editor">
<fieldset style="clear: both; border: 0px none; margin-top: 1em; margin-bottom: 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255);">
<section class="135brush" data-brushtype="text" style="padding-right: 0.5em; padding-left: 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">QQ群号：204411951</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="margin: 0px 0px 0.5em; width: auto; clear: both; overflow: hidden; border: 0px none; padding: 0px; text-align: left;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6csy5jNvOgG3aWVox84o9AjFpMpHe759EjuWAUCmibmv2Tc6RbrCvKYA/0" style="color:inherit; float:left; width:100% !important">
<section style="display: inline-block; text-align: left; margin: -4em 0px 0px; opacity: 0.7; float: left; padding: 0.1em; width: 100%; height: 4em; color: rgb(255, 255, 255); border-color: rgb(33, 33, 34); background-color: rgb(33, 33, 34);">
<section class="135brush" data-style="text-align: center; border-color: rgb(128, 177, 53); color: inherit;font-size:16px" style="display: inline-block; width: 100%; color: inherit; margin-top: 1.2em; border-color: rgb(33, 33, 34);">
<p style="text-align: center; border-color: rgb(33, 33, 34); color: inherit; font-size: 16px;"><span style="border-color:rgb(33, 33, 34); color:inherit; line-height:1.6em">无所不能的大Bosss</span></p>
</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 65%; float: right; padding: 0px 0px 0px 0.1em;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6ZCTAU8iax3XXic4ovRxws3jlwF8bjShCBt8wbfEkfuRPiayZic3nczwj2g/0" style="box-sizing:border-box; height:auto !important; width:100%" title="" vspace="0"></section>

<section style="display: inline-block; width: 35%; box-sizing: border-box; float: right; padding: 0px 0.1em 0px 0px; text-align: right;">
<section style="box-sizing: border-box; margin-right: 4px; padding: 4px 6px; color: rgb(52, 54, 60); border-bottom-width: 1px; border-bottom-style: solid; border-color: black; font-size: 1.2em;  font-weight: inherit; text-align: inherit; text-decoration: inherit; background-color: transparent;">
<section class="135title" style="box-sizing: border-box;">茶仔老师</section>
</section>

<section style="box-sizing: border-box; margin-right: 0.3em; padding: 3px 5px; color: rgb(120, 124, 129); font-size: 0.9em;  font-weight: inherit; text-align: inherit; text-decoration: inherit;">
<p style="box-sizing: border-box;">威严庄重</p>

<p style="box-sizing: border-box;">答疑解惑</p>

<p style="box-sizing: border-box;">各项全能</p>
</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px;">
<section style="box-sizing: border-box; width: 65%; float: left; padding: 0px 0.1em 0px 0px;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6FL8iagJpyEq8uxThSSw5fbGY5e3xSicTRGc3ybp9nW3cjMlX2UmjLwLA/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important"></section>

<section style="display: inline-block; width: 35%; box-sizing: border-box; float: left; padding: 0px 0px 0px 0.1em;">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box; margin-right: 4px; padding: 4px 6px; border-bottom-width: 2px; border-bottom-style: solid; font-size: 1.2em; font-weight: bold;color: rgb(102,97,91); border-color: rgb(102,97,91);">航航小编</section>

<section class="135brush" data-styel="line-height: 2em;" style="box-sizing: border-box; margin-right: 0.3em; padding: 0.3em 0.5em; color: rgb(102,97,91); font-size: 0.9em;">
<p>时而粗现</p>

<p>时而不见</p>

<p>特技T人</p>
</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="margin: 0px 0px 0.5em; width: auto; clear: both; overflow: hidden; border: 0px none; padding: 0px; text-align: left;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6wY8nEqamTUqTbHFRDicicRkqyur4D79ruy5I4MLIdwiaBLrxRfavS553Q/0" style="color:inherit; float:left; width:100% !important">
<section style="display: inline-block; text-align: left; margin: -4em 0px 0px; opacity: 0.7; float: left; padding: 0.1em; width: 100%; height: 4em; color: rgb(239, 239, 239); border-color: rgb(60, 40, 34); background-color: rgb(60, 40, 34);">
<section class="135brush" data-style="text-align: center; border-color: rgb(128, 177, 53); color: inherit;font-size:16px" style="display: inline-block; width: 100%; color: inherit; margin-top: 1.2em; border-color: rgb(60, 40, 34);">
<p style="text-align: center; border-color: rgb(60, 40, 34); color: inherit; font-size: 16px;">有范儿的设计师葱爷</p>
</section>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="clear: both; border: 0px none; margin-top: 1em; margin-bottom: 0.5em;">
<section style="border-top-width: 2px; border-top-style: solid; border-color: rgb(71, 193, 168); font-size: 1em; font-weight: inherit; text-decoration: inherit; color: rgb(255, 255, 255);">
<section class="135brush" data-brushtype="text" style="padding-right: 0.5em; padding-left: 0.5em; display: inline-block; font-size: 16px; color: inherit; background-color: rgb(71, 193, 168);">招新季</section>
</section>
</fieldset>
</section>

<section class="135editor">
<h2 class="135brush" data-bcless="darken" placeholder="深色边框标题" style="margin: 10px 0px; padding: 10px; font-size: 16px; line-height: 25px; text-shadow: rgb(34, 95, 135) 0px 1px 0px; color: rgb(123, 123, 111); border-radius: 4px; box-shadow: rgb(153, 153, 153) 2px 2px 4px; border-left-width: 10px; border-left-style: solid; border-color: rgb(221, 221, 217); background-color: rgb(245, 245, 244);">PHP研发N名</h2>
</section>

<section class="135editor">
<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(116, 185, 11); border-color: rgb(229, 243, 208); background-image: -webkit-linear-gradient(left, rgb(230, 249, 202), rgb(207, 233, 167)); background-color: rgb(255, 255, 220);">
<p style="text-align: center; color: inherit; border-color: rgb(229, 243, 208);">薪水按能力可调节，具体面谈</p>

<p style="text-align: center; color: inherit; border-color: rgb(229, 243, 208);">经验不低于一年</p>
</section>
</section>

<section class="135editor">
<h2 class="135brush" data-bcless="darken" placeholder="深色边框标题" style="margin-top: 10px; margin-bottom: 10px; padding: 10px; font-size: 16px; line-height: 25px; text-shadow: rgb(34, 95, 135) 0px 1px 0px; color: rgb(123, 123, 111); border-radius: 4px; box-shadow: rgb(153, 153, 153) 2px 2px 4px; border-left-width: 10px; border-left-style: solid; border-color: rgb(221, 221, 217); background-color: rgb(245, 245, 244);">网页设计师N名</h2>
</section>

<section class="135editor">
<section class="135brush" placeholder="左右渐变格式内容" style="padding: 8px 30px; font-weight: bold; min-height: 1.5em; white-space: pre-wrap; line-height: 2em; color: rgb(116, 185, 11); border-color: rgb(229, 243, 208); background-image: -webkit-linear-gradient(left, rgb(230, 249, 202), rgb(207, 233, 167)); background-color: rgb(255, 255, 220);">
<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">薪水按能力可调节，具体面谈</p>

<p style="text-align: center; border-color: rgb(229, 243, 208); color: inherit;">经验不低于一年</p>
</section>
</section>

<section class="135editor">
<fieldset style="margin: 96px 16px 16px; border: 1px solid rgb(159, 136, 127); text-align: center; border-radius: 8px; font-size: 18px; font-weight: inherit; text-decoration: inherit; box-sizing: border-box; padding: 0px;">
<section style="margin: -3.3em auto 0px; color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPh3REFnLcFPEhtDulVqlTvGQabhn6NFXROrXiaJ6WLSyN1H1B6iczheYBSRA4oyibJOjdNoH5AhDDTWg/0" style="background:none 0% 0% repeat scroll rgb(255, 255, 255); border-radius:100%; border:2px solid rgb(159, 136, 127); box-shadow:rgb(201, 201, 201) 0px 2px 2px 2px; box-sizing:border-box; color:inherit; height:108px; width:108px"></section>

<section class="135brush" data-brushtype="text" data-style="text-align: left; font-size: 14px; color: inherit;" style="margin: 8px 15px; line-height: 1.4; box-sizing: border-box; color: inherit;">
<p style="text-align: left; font-size: 14px; color: inherit;">135编辑器是非常好用的图文编辑工具，这里有很丰富的图文排版格式，图片素材，全文模板。</p>
</section>

<section style="margin: 10px 15px; border-top-width: 1px; border-top-style: solid; border-color: rgb(159, 136, 127); box-sizing: border-box; color: inherit;">
<p style="color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPh3REFnLcFPEhtDulVqlTvGn0HgicdLTice5dRnxUNLwUVcpwRs2B4bgnKZT6slB53zm6s4MF7qNr3g/0" style="color:inherit; font-size:18px; font-weight:inherit; height:200px; line-height:inherit; margin-bottom:0.3em; margin-left:auto; margin-right:auto; text-decoration:inherit; visibility:visible !important; width:200px"></p>
</section>
</fieldset>
</section>

<section class="135editor">
<fieldset style="margin: 0px; padding: 0px; border: 0px; max-width: 100%; text-align: center; word-wrap: break-word !important; box-sizing: border-box !important;">
<section style="max-width: 100%; display: inline-block; word-wrap: break-word !important; box-sizing: border-box !important; color: inherit;">
<section style="font-size: 16.3636360168457px; max-width: 100%; display: inline-block; word-wrap: break-word !important; box-sizing: border-box !important; color: inherit;">
<p style="margin-top: 0px; margin-bottom: 0px; max-width: 100%; word-wrap: normal; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; color: inherit;"><strong style="box-sizing:border-box !important; color:inherit; max-width:100%; word-wrap:break-word !important">·END·</strong><br style="max-width: 100%; word-wrap: break-word !important; box-sizing: border-box !important; color: inherit;">
&nbsp;</p>
</section>

<section class="135title" style="max-width: 100%; margin: 0.2em 0.5em 0.1em; color: rgb(71, 193, 168); font-weight: inherit; text-align: inherit; text-decoration: inherit; word-wrap: break-word !important; box-sizing: border-box !important; border-color: rgb(71, 193, 168);"><span style="font-size:20px"><strong style="border-color:rgb(71, 193, 168); box-sizing:border-box !important; color:inherit; max-width:100%; word-wrap:break-word !important"><span style="border-color:rgb(71, 193, 168); box-sizing:border-box !important; color:inherit; line-height:32.7272720336914px; max-width:100%; word-wrap:break-word !important">求贤招新</span><span style="border-color:rgb(71, 193, 168); box-sizing:border-box !important; color:inherit; line-height:22.2222232818604px; max-width:100%; word-wrap:break-word !important">模板</span></strong></span></section>

<section style="font-size: 16.3636360168457px; max-width: 100%; width: 208px; border-top-style: solid; border-top-width: 1px; border-top-color: black; line-height: 1; word-wrap: break-word !important; box-sizing: border-box !important; color: inherit;"></section>

<section class="135brush" data-brushtype="text" style="font-size: 1em; max-width: 100%; margin: 0.5em 1em; line-height: 1; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(71, 193, 168); word-wrap: break-word !important; box-sizing: border-box !important; border-color: rgb(71, 193, 168);"><span style="border-color:rgb(71, 193, 168); box-sizing:border-box !important; color:inherit; font-size:16.3636360168457px; max-width:100%; word-wrap:break-word !important">BY航航小编</span></section>
<span style="background-color:rgb(71, 193, 168); border-radius:0.3em; box-shadow:rgb(16, 146, 113) 0.1em 0.1em 0.1em; box-sizing:border-box !important; color:rgb(255, 255, 255); display:inline-block; font-size:1em; font-weight:inherit; max-width:100%; padding:0.3em; text-align:inherit; text-decoration:inherit; word-wrap:break-word !important">微信号：tizi135</span></section>
</fieldset>
</section>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17967.html" target="_blank">招贤纳士模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17967-view_nums">3724</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17967" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17967,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17967-favor_nums">477</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-17808"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/4bcc63f3bed77b662228638b.png" title="短句模板" class="template-cover" data-id="17808" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/4bcc63f3bed77b662228638b.png" alt="">						</div>
						<div class="editor-style-content hidden" data-name="短句模板" id="template-17808"><p>&nbsp;</p>

<section class="135editor">
<section style="margin: 10px 0px 0px 16px;"><strong style="color:inherit"><span class="135brush" data-brushtype="text" style="background-color:rgb(159, 136, 127); border-color:rgb(159, 136, 127); border-radius:0.3em; color:rgb(255, 255, 255); padding:0.2em 0.5em; text-align:center">提子135</span><span class="135brush" data-brushtype="text" style="background-color:rgb(255, 255, 255); border-radius:1.2em; border:1px solid rgb(159, 136, 127); color:rgb(159, 136, 127); height:1.2em; line-height:1.2em; margin-left:0.3em; padding:0.2em 0.5em">tizi135</span></strong></section>

<section class="135brush" data-style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)" style="margin: -1em auto 5px; padding: 20px 10px 5px; border-radius: 0.3em; border: 1px solid rgb(159, 136, 127); color: rgb(51, 51, 51); background-color: rgb(239, 239, 239);">
<section class="135editor">
<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
<section style="display: inline-block; box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">名言模板</section>

<section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);"><span style="background-color:rgb(239, 239, 239); color:rgb(107, 77, 64); font-size:12px; line-height:28.0000019073486px; text-align:center">by 航航小编</span></section>
</section>
</fieldset>
</section>

<p style="font-size: 14px;line-height:1.5em;color: rgb(51, 51, 51)">&nbsp;</p>
</section>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(55, 74, 174); margin: 0.3em 0px; padding-bottom: 1.5em; font-size: 14px; font-weight: bold; text-align: center; text-decoration: inherit; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6icfTnOdQuicuULHrtg1iaCVGuYZdpCMFdanjzgyhfQDkybH3OWTPXMh7Q/0" style="border-radius:50%; color:inherit; height:112px; margin-right:10px; vertical-align:middle; width:112px">
<section style="border-left-width: 1px; border-left-style: solid; border-color: rgb(55, 74, 174); padding-left: 1em; text-align: left; display: inline-block; height: 6em; vertical-align: top; color: rgb(55, 74, 174); margin-top: 1em;">
<h2 class="135brush" data-brushtype="text" style="width: 100%; overflow: hidden; height: 50%; font-size: 1.5em; margin-top: -0.15em; border-color: rgb(55, 74, 174); color: inherit; margin-bottom: 0.5em;">时间</h2>

<section class="135brush" data-style="font-size: 16px;" style="font-size: 16px; border-color: rgb(55, 74, 174); color: inherit;">
<p style="border-color: rgb(55, 74, 174); color: inherit;">=Time=</p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<section style="padding: 40px 40px; color: #737373; background: #f8f8f8;">
<p><img src="http://gtms01.alicdn.com/tps/i1/TB1VMruGpXXXXabXpXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>

<section class="135brush" data-style="background-color:rgb(248, 248, 248); color:rgb(115, 115, 115); font-size:14px; line-height:21px">生命是以时间为单位的，浪费别人的时间等于谋财害命；浪费自己的时间，等于慢性自杀。——鲁迅</section>

<p style="text-align:right"><img src="http://gtms02.alicdn.com/tps/i2/TB1zQbsGpXXXXX1XFXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(159, 136, 127); margin: 0.3em 0px; padding-bottom: 1.5em; font-size: 14px; font-weight: bold; text-align: center; text-decoration: inherit; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6L4acWVD6heAHnDocua03PavkNeVKQDScv5cqgicIhTStdJ8dibumjGog/0" style="border-radius:50%; color:inherit; height:112px; margin-right:10px; vertical-align:middle; width:112px">
<section style="border-left-width: 1px; border-left-style: solid; border-color: rgb(159, 136, 127); padding-left: 1em; text-align: left; display: inline-block; height: 6em; vertical-align: top; color: rgb(159, 136, 127); margin-top: 1em;">
<h2 class="135brush" data-brushtype="text" style="width: 100%; overflow: hidden; height: 50%; font-size: 1.5em; margin-top: -0.15em; border-color: rgb(159, 136, 127); color: inherit; margin-bottom: 0.5em;">生命</h2>

<section class="135brush" data-style="font-size: 16px;" style="font-size: 16px; border-color: rgb(159, 136, 127); color: inherit;">
<p style="font-size: 16px; border-color: rgb(159, 136, 127); color: inherit;">=Life=</p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<section style="padding: 40px 40px; color: #737373; background: #f8f8f8;">
<p><img src="http://gtms01.alicdn.com/tps/i1/TB1VMruGpXXXXabXpXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>

<section class="135brush" data-style="background-color:rgb(248, 248, 248); color:rgb(115, 115, 115); font-size:14px; line-height:21px">必须记住我们学习的时间有限的。时间有限，不只由于人生短促，更由于人事纷繁。——斯宾塞</section>

<p style="text-align:right"><img src="http://gtms02.alicdn.com/tps/i2/TB1zQbsGpXXXXX1XFXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(252, 180, 43); margin: 0.3em 0px; padding-bottom: 1.5em; font-size: 14px; font-weight: bold; text-align: center; text-decoration: inherit; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma61zdOkmqISYEDdbWDOUibyIpfibS6NmvgCwVLk3FiaYszwtLnyV5ex5Nkg/0" style="border-radius:50%; color:inherit; height:112px; margin-right:10px; vertical-align:middle; width:112px">
<section style="border-left-width: 1px; border-left-style: solid; border-color: rgb(211,172,156); padding-left: 1em; text-align: left; display: inline-block; height: 6em; vertical-align: top;color: rgb(211,172,156); margin-top: 1em;">
<h2 class="135brush" data-brushtype="text" style="width: 100%; overflow: hidden; height: 50%; font-size: 1.5em; margin-top: -0.15em; border-color: rgb(211,172,156); color: inherit;margin-bottom:0.5em;">计划</h2>

<section class="135brush" data-style="font-size: 16px;" style="font-size: 16px; border-color: rgb(211,172,156); color: inherit;">
<p>=Planning=</p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<section style="padding: 40px 40px; color: #737373; background: #f8f8f8;">
<p><img src="http://gtms01.alicdn.com/tps/i1/TB1VMruGpXXXXabXpXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>

<section class="135brush" data-style="background-color:rgb(248, 248, 248); color:rgb(115, 115, 115); font-size:14px; line-height:21px">记住吧：只有一个时间是重要的，那就是现在！它所以重要，就是因为它是我们有所作为的时间。——托尔斯泰</section>

<p style="text-align:right"><img src="http://gtms02.alicdn.com/tps/i2/TB1zQbsGpXXXXX1XFXXM7dYGFXX-38-36.png" style="color:inherit; height:18px; width:19px"></p>
</section>
</section>

<p>&nbsp;</p>

<p style="text-align: center;">&nbsp;</p>

<section class="135editor">
<section style="margin:10px 15%;">
<h2 class="135brush" data-brushtype="text" placeholder="请输入标题" style="font-size: 16px; margin: 10px 0px; padding: 10px; max-width: 100%; border-top-style: solid; border-top-width: 1px; border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 1px; line-height: 25px; color: rgb(33, 33, 34); text-align: center; border-color: rgb(33, 33, 34);"><strong><span style="font-size:18px">微信小编如何节约时间？</span></strong></h2>

<section class="135brush" data-style="font-size:14px;text-align:center" style="line-height: 25px; color: inherit;">
<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">135编辑器，微信排版少不了它</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">一键秒刷，</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">文字、图片啥都能刷。</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">有135编辑器助你排版，</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">可以早点下班回家~</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">有问题来我们QQ群 ：149659920</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">有一群热心小伙伴给你解答~</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">快点来~</span></p>

<p style="font-size: 14px; text-align: center; line-height: 1.75em;"><span style="color:rgb(127, 127, 127)">萌妹基友在等你啊~</span></p>
</section>
</section>
</section>

<p style="text-align:center;"><strong><span style="font-size:20px"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="cursor:pointer; line-height:1.6em; white-space:normal; z-index:-1"></span></strong></p>

<p style="text-align:center;">&nbsp;</p>

<section class="135editor">
<section>
<section style="width:48%;display:inline-block;float:left;">
<section style="padding:20px 25px;border:1px solid #e7e7e7;text-align:center;">
<p><img src="http://img.wx135.com/135editor/logo-135-web.png" style="height:50px; margin-bottom:15px"></p>

<h3 class="134title" style="font-size:16px;font-weight:bold;margin:0 0 10px 0;">135编辑器</h3>

<section class="135brush" data-style="clear:none;">
<p style="clear:none;margin:0 0;line-height:1.5em;">生而排版</p>

<p style="clear:none;margin:0 0;line-height:1.5em;"><span style="text-align:center">为你而美</span></p>
</section>
</section>
</section>

<section style="margin-left:4%;width:48%;display:inline-block;text-align:center;">
<section style="padding:20px 25px;border:1px solid #e7e7e7;">
<p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiazjsibqzMEbFXfnLK8n31vao2YXGwz6wxT8wBGG0FRkuzvGvIztzq8Re1R50omeH8KoicjL2HBx7gQ/0" style="height:50px; margin-bottom:15px"></p>

<h3 class="134title" style="font-size:16px;font-weight:bold;margin:0 0 10px 0;">秒刷</h3>

<section class="135brush" data-style="clear:none;margin:0 0;line-height:1.5em;">
<p style="clear:none;margin:0 0;line-height:1.5em;">一键排版</p>

<p style="clear:none;margin:0 0;line-height:1.5em;">珍惜生命</p>
</section>
</section>
</section>

<p style="height:2px;clear:both;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="cursor:pointer; line-height:1.6em; z-index:-1"></p>
</section>
</section>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17808.html" target="_blank">短句模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17808-view_nums">1459</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17808" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17808,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17808-favor_nums">715</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-17717"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/b837aa55eae1f5c93f33bb8e.png" title="3.8向女神致敬模板" class="template-cover" data-id="17717" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/b837aa55eae1f5c93f33bb8e.png" alt="">						</div>
						<div class="editor-style-content hidden" data-name="3.8向女神致敬模板" id="template-17717"><p>&nbsp;</p>

<p style="line-height: 2em; text-align: center;"><span style="color:rgb(89, 89, 89); font-family:微软雅黑,microsoft yahei; font-size:20px">3.8，向女神致敬！</span></p>

<p>&nbsp;</p>

<p style="line-height: 2em;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6NbwiazBbyPf96HIZLMnr6tib1UcAIbyN9g932qxCQHqV0ibf4X6jBkwuA/0"></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<section class="135brush" style="white-space: normal; margin: 2px 0px; padding: 0px; max-width: 100%; border-top-style: solid; border-top-width: 2px; border-color: rgb(197, 64, 114); border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 2px; line-height: 25px; color: rgb(197, 64, 114); font-weight: bold; text-align: center;">
<section style="border-color: rgb(197, 64, 114); color: inherit;">
<fieldset style="border: 0px rgb(197, 64, 114); text-align: left; margin: 0.8em 0px 0.5em; box-sizing: border-box; padding: 0px; color: inherit;">
<section style="color: inherit; display: inline-block; width: 1.3em; font-size: 5em; font-weight: inherit; line-height: 1em; vertical-align: top; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box; color: inherit; border-color: rgb(197, 64, 114);">01</section>
</section>

<section class="135title" style="display: inline-block; margin-left: 0.5em; margin-top: 0px; text-align: left; box-sizing: border-box; color: inherit; border-color: rgb(197, 64, 114);">
<section style="box-sizing: border-box; color: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="margin-top: 0px; box-sizing: border-box; color: inherit; display: inline-block; font-size: 1.8em; font-weight: inherit; line-height: 1.2; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);"><span style="border-color:rgb(197, 64, 114); color:inherit; font-size:18px">名词解释</span></section>
</section>

<section style="color: inherit; margin: 0px; font-size: 2em; line-height: 1.4; font-weight: inherit; text-align: inherit; text-decoration: inherit; box-sizing: border-box; border-color: rgb(197, 64, 114);">
<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;">International Working</p>

<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;">Women's Day</p>
</section>
</section>
</fieldset>
</section>
</section>
</section>

<p>&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:12px">国际劳动妇女节（International Working Women's Day）</span><span style="color:rgb(127, 127, 127); font-size:12px">，</span><span style="color:rgb(127, 127, 127); font-size:12px; line-height:2em">全称“联合国妇女权益和国际和平日”（United Nations women's rights and international peace day），是在每年的3月8日为庆祝妇女在经济、政治和社会等领域做出的重要贡献和取得的巨大成就而设立的节日。同时，也是为了纪念在1911年美国纽约三角内衣工厂火灾中丧生的140多名女工。从1909年3月8日，美国芝加哥妇女争取“男女平等”游行集会以来，至21世纪已走过了百余年历程。</span></p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:12px">在不同的地区，庆祝的重点有所不同，从普通的庆祝对女性的尊重、庆祝对女性的爱到庆祝女性在经济、政治及社会领域的成就。由于这个节日一开始是社会主义女权主义者发起的政治事件，这个节日和众多国家的文化都有融合，主要在欧洲，包括俄罗斯。&nbsp;</span></p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei; font-size:12px">在一些地方，这个节日已经失去了政治意味，成为了简单的男人表达对女性的爱的时刻，类似于母亲节与情人节的混合。在其它一些地区，尽管政治权利与妇女权益的主题由联合国指定领导强烈的、政治的及社会的感受女人在世界范围的奋斗，并检验这种带来希望的习惯。&nbsp;</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<section class="135brush" style="white-space: normal; margin-top: 2px; margin-bottom: 2px; border-top-style: solid; border-top-width: 2px; border-color: rgb(197, 64, 114); border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 2px; line-height: 25px; color: rgb(197, 64, 114); font-weight: bold; text-align: center;">
<section style="border-color: rgb(197, 64, 114); color: inherit;">
<fieldset style="border: 0px rgb(197, 64, 114); text-align: left; margin-top: 0.8em; margin-bottom: 0.5em; color: inherit;">
<section style="color: inherit; display: inline-block; width: 1.3em; font-size: 5em; font-weight: inherit; line-height: 1em; vertical-align: top; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="color: inherit; border-color: rgb(197, 64, 114);"><em style="border-color: rgb(197, 64, 114); color: inherit;">02</em></section>
</section>

<section class="135title" style="display: inline-block; margin-left: 0.5em; color: inherit; border-color: rgb(197, 64, 114);">
<section style="color: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 1.8em; font-weight: inherit; line-height: 1.2; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);"><span style="border-color:rgb(197, 64, 114); color:inherit; font-size:18px">节日意义</span></section>
</section>

<section style="color: inherit; font-size: 2em; line-height: 1.4; font-weight: inherit; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);">
<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;"><span style="color:inherit; line-height:1.4; text-align:inherit; text-decoration:inherit">International Working&nbsp;Women's Day</span></p>

<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;"><span style="color:inherit; font-weight:inherit; line-height:1.4; text-align:inherit; text-decoration:inherit">Historical Significance</span></p>
</section>
</section>
</fieldset>
</section>
</section>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em; white-space: normal;"><span style="color:rgb(127, 127, 127); font-size:12px">3.8国际妇女节是全世界妇女的节日。这个日子是联合国承认的，同时也被很多国家确定为法定假日。来自五湖四海的妇女们，尽管被不同的国界、种族、语言、文化、经济和政治所区分，但在这一天能够同时庆祝属于自己的节日。让人们再回首那九十年前的为得到平等、公正、和平以及发展所做出的斗争。[24-25]&nbsp;&nbsp;&nbsp;</span></p>

<p style="line-height: 2em; white-space: normal;"><span style="color:rgb(127, 127, 127); font-size:12px">“三·八”国际妇女节的由来</span></p>

<p style="line-height: 2em; white-space: normal;"><span style="color:rgb(127, 127, 127); font-size:12px">国际妇女节是妇女创造历史的见证，妇女为争取与男性平等所走的斗争道路十分漫长。古希腊的莉西斯特拉塔就领导了妇女斗争来阻止战争；法国革命时期，巴黎妇女高呼“自由，平等，友爱”，走上凡尔赛的街头争取选举权。[24-25]</span><a name="ref_[24&amp;25]_328605"></a><span style="color:rgb(127, 127, 127); font-size:12px">&nbsp;</span><a name="ref_[24]_328605"></a><span style="color:rgb(127, 127, 127); font-size:12px">&nbsp;</span><a name="ref_[25]_328605"></a><span style="color:rgb(127, 127, 127); font-size:12px">&nbsp;</span></p>

<p style="line-height: 2em; white-space: normal;"><span style="color:rgb(127, 127, 127); font-size:12px">在这一天，世界各大洲的妇女，不分国籍、种族、语言、文化、经济和政治的差异，共同关注妇女的人权。近几十年来，联合国的四次全球性会议加强了国际妇女运动，随着国际妇女运动的成长，妇女节取得了全球性的意义。这些进展使国际妇女节成为团结一致、协调努力要求归还妇女权利和妇女参与政治、经济和社会生活的权利的日子。</span></p>

<p style="line-height: 2em; white-space: normal;">&nbsp;</p>

<section class="135editor">
<section class="135brush" style="white-space: normal; margin-top: 2px; margin-bottom: 2px; border-top-style: solid; border-top-width: 2px; border-color: rgb(197, 64, 114); border-left-width: 0px; border-bottom-style: solid; border-bottom-width: 2px; line-height: 25px; color: rgb(197, 64, 114); font-weight: bold; text-align: center;">
<section style="border-color: rgb(197, 64, 114); color: inherit;">
<fieldset style="border: 0px rgb(197, 64, 114); text-align: left; margin-top: 0.8em; margin-bottom: 0.5em; color: inherit;">
<section style="color: inherit; display: inline-block; width: 1.3em; font-size: 5em; font-weight: inherit; line-height: 1em; vertical-align: top; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="color: inherit; border-color: rgb(197, 64, 114);"><em style="border-color: rgb(197, 64, 114); color: inherit;">03</em></section>
</section>

<section class="135title" style="display: inline-block; margin-left: 0.5em; color: inherit; border-color: rgb(197, 64, 114);">
<section style="color: inherit; border-color: rgb(197, 64, 114);">
<section class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 1.8em; font-weight: inherit; line-height: 1.2; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);"><span style="border-color:rgb(197, 64, 114); color:inherit; font-size:18px">代表人物</span></section>
</section>

<section style="color: inherit; font-size: 2em; line-height: 1.4; font-weight: inherit; text-align: inherit; text-decoration: inherit; border-color: rgb(197, 64, 114);">
<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;"><span style="color:inherit; line-height:1.4; text-align:inherit; text-decoration:inherit">International Working&nbsp;Women's Day</span></p>

<p style="line-height: 1.4; font-size: 12px; border-color: rgb(197, 64, 114); color: inherit;">Specials</p>
</section>
</section>
</fieldset>
</section>
</section>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; box-sizing: border-box; width: 100%; clear: both; overflow: hidden; padding: 0px; text-align: left;">
<section style="box-sizing: border-box; width: 65%; float: right; padding: 0px 0px 0px 0.1em;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6P5voddXFQZLM0QslqlGtGaU3oPXH0Bnw8Cw5xcjhcicOib9a5icPEAtPQ/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100%" title="" vspace="0"></section>

<section style="display: inline-block; width: 35%; box-sizing: border-box; float: right; padding: 0px 0.1em 0px 0px; text-align: right;">
<p style="font-size:16px;box-sizing: border-box; margin-right: 4px; padding: 4px 6px; border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px;font-weight: bold;color: rgb(120, 124, 129); border-color: black;">何香凝 &nbsp;<strong style="color:rgb(127, 127, 127); font-size:12px; font-weight:bold; line-height:28px; text-align:right">/<span style="color:rgb(127, 127, 127); line-height:28px">（1878.06.27-1972.09.1）</span></strong><span style="color:rgb(127, 127, 127); font-size:12px; line-height:28px">女权运动的先驱之一，民革主要创始人，国民党元老，建立民国的功臣，“三大政策”的忠实执行者，抗日统一战线的一个方面军，也是新中国创始人之一。</span></p>
</section>
</fieldset>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei">她早年追随孙中山，是同盟会的第一位女会员；她坚持孙中山的三大政策，真诚地同中国共产党合作；她发动妇女参加革命，为国内革命战争、抗日战争做出了卓越贡献；她把艺术创作与革命活动紧密联系，她的作品中充满斗争激情、浩然正气。黄花岗起义前夕回到广东。辛亥革命失败后与廖仲恺一直追随孙左右，进行讨袁与护法斗争。陈炯明叛乱时极为关心孙夫妇的安危并全力营救廖脱险。随后，大力支持孙改组国民党，与廖一道成为孙中山联俄、联共、扶助农工三大政策的忠实拥护者和执行者。</span><a name="7"></a></p>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; width: 100%; clear: both; overflow: hidden; text-align: left;">
<section style="width: 65%; float: right; padding-left: 0.1em;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6oAbagdUpgsDcnTuibH7YOkZ79C7YHt3gbRkicZVfOZRLYjvNhVFJicq0w/0" style="visibility:visible !important; width:100%" title="" vspace="0"></section>

<section style="display: inline-block; width: 35%; float: right; padding-right: 0.1em; text-align: right;">
<p style="margin-right: 4px; padding: 4px 6px; border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px; font-weight: bold; color: rgb(120, 124, 129); border-color: black;"><span style="color:rgb(127, 127, 127); line-height:28px">克拉拉·蔡特金</span> &nbsp;<span style="color:rgb(127, 127, 127); font-size:12px; line-height:28px">/<span style="color:rgb(127, 127, 127); line-height:28px">（Clara Zetkin，1857.7.5－1933.6.20）</span></span><span style="color:rgb(127, 127, 127); font-size:12px; line-height:28px"><span style="color:rgb(127, 127, 127); line-height:28px">原名克拉拉·艾斯纳，德国社会民主党和第二国际左派领袖之一，国际社会主义妇女运动领袖之一，德国共产党创始人之一</span><span style="color:rgb(127, 127, 127); line-height:28px">，无产阶级女权解放的灵魂人物</span></span></p>
</section>
</fieldset>
</section>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;"><span style="color:rgb(127, 127, 127); font-family:微软雅黑,microsoft yahei">1857年7月5日出生于德国萨克森州维德劳一个教师家庭，15岁时全家迁至莱比锡。1874年至1878年就读莱比锡私立师范学校。毕业后当过家庭教师，1878年结识流亡</span><span style="color:rgb(127, 127, 127); line-height:2em">德国的俄国革命家奥西普·蔡特金，两人于1882年结婚。蔡特金在奥西普指导下阅读了《共产党宣言》和马克思、恩格斯的其他著作，并投身工人运动。1882年至1892年，她与丈夫及两个孩子流亡瑞士和法国巴黎，结识了马克思的女儿劳拉·&nbsp;拉法尔格。1889年参加第二国际成立大会。1897年加入德国社会民主党。</span><span style="color:rgb(127, 127, 127); line-height:2em">1892年创办妇女报纸《平等》，并担任编辑至1917年。1907年，发起并组织了第一届国际社会主义妇女大会。会上决定成立国际民主妇女联合会，把《平等》作为机关报，选举蔡特金为书记处书记。1910年8月主持召开第二届国际社会主义妇女大会，会上建议把每年的3月8日定为国际妇女节。1916年参与创建斯巴达克同盟。1919年加入德国共产党，1920年任党中央委员和议会议员。1921年入选第三国际主席团。</span><span style="color:rgb(127, 127, 127); line-height:2em">1920年至1932年多次出访俄国，大量研读马克思主义书籍，与列宁和罗莎·卢森堡交谊甚笃，支持布尔什维克。</span><span style="color:rgb(127, 127, 127); line-height:2em">1933年6月20日在莫斯科逝世，葬于克里姆林宫墙</span></p>

<p style="line-height: 2em;">&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<section class="135editor">
<section style="margin: 10px 0px; padding: 50px 0px; color: rgb(255, 255, 255); text-align: center; border-color: rgb(197, 64, 114); box-shadow: rgba(205, 205, 205, 0.901961) 2px 3px 2px; background-color: rgb(197, 64, 114);"><span class="135brush" data-brushtype="text" style="border:1px solid rgb(251, 251, 251); color:inherit; font-size:18px; line-height:42px; padding:10px 15px">Learn more about Women's Day</span>

<section class="135brush" style="margin-top: 30px; color: inherit;">
<p style="color: inherit;">135在线编辑器 &nbsp; ︳Online Editor</p>

<p style="color: inherit;">&nbsp;</p>

<p style="color: inherit;">&nbsp;</p>

<p style="color: inherit;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiakV1K00vQW8lEGAib6sDzYhoWkLOaujuoWxj3ia9VunFq6qecex9iaLknmibRjNIiaQw56T7D61kXicgvg/0"></p>
</section>
</section>
</section>

<p>&nbsp;</p>

<p style="line-height: 2em;"><br>
&nbsp;</p>

<p style="line-height: 2em;">&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17717.html" target="_blank">3.8向女神致敬模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17717-view_nums">4584</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17717" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17717,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17717-favor_nums">720</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-17618"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/181c5ec8198a43c51eaff6ec.png" title="三八节模板" class="template-cover" data-id="17618" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/181c5ec8198a43c51eaff6ec.png" alt="">						</div>
						<div class="editor-style-content hidden" data-name="三八节模板" id="template-17618"><p style="margin-right: auto; margin-left: auto; max-width: 600px; min-height: 1em; border: 1px solid rgb(96, 127, 166); border-radius: 2em; font-size: 12px;"><span style="background-color:rgb(96, 127, 166); border-bottom-left-radius:2em; border-top-left-radius:2em; color:rgb(255, 255, 255); padding:2px 2px 2px 6px">提示:</span><span style="color:rgb(127, 127, 127); padding-left:2px">点击上方</span><span style="padding-left:2px"><span style="color:#607fa6"><strong>航航小编我爱你</strong></span></span><span style="color:rgb(127, 127, 127)">一键关注</span></p>

<p style="margin: 10px auto; min-height: 1em; height: 40px; width: 365px; line-height: 40px; text-align: center; opacity: 0.6; color: rgb(255, 255, 255); font-family: 微软雅黑; background-image: url(http://mmbiz.qpic.cn/mmbiz/qGZEXL0EiclEsE6VQJ4giaAMtugQF3E1Fp5sEdeWJbJqkwIL4FT39C6bO3k66sDblkakKKAqZXBiaUMMj1fk5dFWA/0); background-size: 365px 40px; background-position: 0px 50%; background-repeat: no-repeat;"><strong>三八女孩节模板，网友提供</strong></p>

<blockquote style="margin-right: auto; margin-left: auto; padding: 12px 5px; max-width: 600px; border-width: 0px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; font-family: 微软雅黑; color: rgb(89, 89, 89); text-align: justify; min-height: 1em; background-image: -webkit-linear-gradient(left, rgb(253, 240, 230), rgb(255, 255, 250), rgb(253, 240, 230)); background-color: rgb(255, 255, 240);">
<fieldset style="padding: 5px; min-width: 0px; font-size: 14px; border: 1px solid rgb(204, 204, 204); box-shadow: rgb(165, 165, 165) 5px 5px 2px; background-color: rgb(250, 250, 240);"><legend style="text-align: center;"></legend>

<p style="padding: 4px 10px; min-height: 1em; white-space: pre-wrap; color: rgb(255, 255, 255); box-shadow: rgb(165, 165, 165) 4px 4px 2px; text-align: left; background-color: rgb(0, 112, 192);"><strong>节日词条</strong></p>

<p style="min-height: 1em; white-space: pre-wrap;"><strong style="color:rgb(0, 112, 192)">国际劳动妇女节，全称<span style="background-color:rgb(250, 250, 240); color:rgb(0, 112, 192); line-height:22.3999996185303px; text-align:justify">为“联合国妇女权益和国际和平日”，在中国又称“三八”妇女节，是联合国从1975年国际妇女年开始，每年于3月8日为庆祝妇女在经济、政治和社会等领域做出的重要贡献和取得的巨大成就而设立的节日。在这一天，世界各大洲的妇女，不分国籍、种族、语言、文化、经济和政治的差异，共同关注妇女的人权。中华人民共和国中央政府成立后正式将3月8日定为妇女节，并举行各种形式的庆祝活动<span style="background-color:rgb(250, 250, 240); color:rgb(89, 89, 89); line-height:22.3999996185303px; text-align:justify">。</span></span></strong></p>
</fieldset>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p style="min-height: 1em; white-space: pre-wrap; text-align: center;"><img data-ratio="0.6612903225806451" data-s="300,640" data-src="http://mmbiz.qpic.cn/mmbiz/qGZEXL0EiclHeicyffBI32k98gg2pzJvKutticibN7YFB1JicXxibYITp7MaNichI9BlF8lTTibSicAUkUhDYcciaQAqNnxg/0" data-w="496" src="http://mmbiz.qpic.cn/mmbiz/qGZEXL0EiclHeicyffBI32k98gg2pzJvKutticibN7YFB1JicXxibYITp7MaNichI9BlF8lTTibSicAUkUhDYcciaQAqNnxg/640?tp=webp&amp;wxfrom=5" style="visibility:visible !important; width:auto !important"></p>

<section class="135editor">
<h2 class="135brush" data-bcless="true" placeholder="浅色边框标题" style="margin: 10px 0px; white-space: normal; padding: 10px; max-width: 100%; line-height: 25px; color: rgb(255, 255, 255); font-weight: bold; font-size: 16px; box-shadow: rgb(153, 153, 153) 1px 1px 2px; border-left-style: solid; border-color: rgb(241, 148, 180); border-left-width: 25px; background-color: rgb(235, 103, 148);">问题来了，三八妇女节是法定假日吗？</h2>
</section>

<p>&nbsp;</p>

<p><span style="font-size:12px">三八妇女节并不是法定节假日，而属于部分公民放假的日子。《全国年节及纪念日放假办法》规定：妇女节（3月8日），妇女放假半天。</span></p>

<p>&nbsp;</p>

<p><span style="font-size:18px"><strong>感到很雀跃有木有！！！</strong></span></p>

<p>&nbsp;</p>

<section class="135editor">
<h2 class="135brush" data-bcless="true" placeholder="浅色边框标题" style="margin: 10px 0px; white-space: normal; padding: 10px; max-width: 100%; line-height: 25px; color: rgb(255, 255, 255); font-weight: bold; font-size: 16px; box-shadow: rgb(153, 153, 153) 1px 1px 2px; border-left-style: solid; border-color: rgb(241, 148, 180); border-left-width: 25px; background-color: rgb(235, 103, 148);">辣么，三八节妇女怎么过？</h2>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0 0.5em 0;font-size: 16px;line-height: 32px; font-weight: bold;">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">1</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">旅行</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px">趁着三八节，来一个短途旅行，不需要远，却也能接触到另一个世界。在这一天，暂时忘记事业和家庭，选择一个自己感兴趣的目的地，即刻出发吧！</span></p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0 0.5em 0;font-size: 16px;line-height: 32px; font-weight: bold;">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">2</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">逛街</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px; line-height:1.6em">女人天性就是爱逛街！对于大部分女人来说，逛街购物有着致命的吸引力。在三八妇女节这天，很多店家都会推出各种优惠妇女的活动，诸如打折、购物送礼、妇女半价或免费等，所以趁着这个时候血拼去吧！</span></p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0px 0.5em; font-size: 16px; line-height: 32px; font-weight: bold; border-color: rgb(165, 0, 204);">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">3</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">休息</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px; line-height:1.6em">有些妇女平日工作实在过于忙碌，甚至都不能够好好休息。所以对她们来说，哪怕是在家里宅上一天也是一直奢侈。所以，在这个特殊的假期，不如就待在家里好好休息，喝喝茶看看电影，享受惬意的时光。</span></p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0px 0.5em; font-size: 16px; line-height: 32px; font-weight: bold; border-color: rgb(165, 0, 204);">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">4</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">护理</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px">女人天性就是爱美，平日工作繁忙肯定没时间护理自己。不如趁这一天找一间美容院，做一次全身spa，来一次面部护理，可以让身心很好地放松一下。</span></p>

<p>&nbsp;</p>

<section class="135editor">
<section style="margin: 0.8em 0px 0.5em; font-size: 16px; line-height: 32px; font-weight: bold; border-color: rgb(165, 0, 204);">
<section style="display: inline-block; float: left; width: 32px; height: 32px; border-radius: 32px; vertical-align: top; text-align: center; border-color: rgb(165, 0, 204); color: rgb(255, 255, 255); background-color: rgb(165, 0, 204);">
<section style="display: table; width: 100%; color: inherit; border-color: rgb(165, 0, 204);">
<section class="autonum" data-original-title="" placeholder="1" style="display: table-cell; text-indent: 0px; vertical-align: middle; font-style: normal; color: inherit; border-color: rgb(165, 0, 204);" title="">5</section>
</section>
</section>

<section class="135brush" data-brushtype="text" style="margin-left: 36px; font-style: normal; color: rgb(165, 0, 204); border-color: rgb(165, 0, 204);">健身</section>
</section>
</section>

<p>&nbsp;</p>

<p><span style="font-size:14px">不管如何，健康总是最重要的。平日忙于工作，女性们肯定是疏于健身。不如趁着这一天，约上好姐们一起健身去吧！</span></p>

<p style="min-height: 1em; white-space: pre-wrap;">&nbsp;</p>

<p><span style="font-size:14px">最后，航航小编弱弱地说一句，今年三八节是在周日哦。</span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; font-size: 16.3636360168457px; text-align: center;">
<section style="display: inline-block; color: inherit;">
<section style="display: inline-block; color: inherit;">
<p style="word-wrap: normal; min-height: 1em; white-space: pre-wrap; color: inherit;"><strong style="color:inherit">●END●</strong><br style="color: inherit;">
&nbsp;</p>
</section>

<section class="135title" style="margin: 0.2em 0.5em 0.1em; color: rgb(235, 103, 148); font-size: 1.8em; line-height: 1; text-align: inherit; text-decoration: inherit; border-color: rgb(235, 103, 148);"><strong>三八节模板</strong></section>

<section style="width: 208px; border-top-style: solid; border-top-width: 1px; border-top-color: black; line-height: 1; color: inherit;"></section>

<section class="135brush" data-brushtype="text" style="margin: 0.5em 1em; font-size: 1em; line-height: 1; font-weight: inherit; text-align: inherit; text-decoration: inherit; color: rgb(235, 103, 148); border-color: rgb(235, 103, 148);"><span style="border-color:rgb(235, 103, 148); color:inherit; font-size:16.3636360168457px">By航航小编</span></section>
<span style="background-color:rgb(235, 103, 148); border-radius:0.3em; box-shadow:rgb(16, 146, 113) 0.1em 0.1em 0.1em; color:rgb(255, 255, 255); display:inline-block; font-size:1em; font-weight:inherit; padding:0.3em; text-align:inherit; text-decoration:inherit">微信号：tizi135</span></section>
</fieldset>
</section>

<p>&nbsp;</p>
</blockquote>

<section class="135editor">
<section data-bcless="true" style="font-size: 20px; border: 0px none rgb(241, 148, 180); color: rgb(255, 255, 255); background: rgb(235, 103, 148);"><span class="135brush" style="background:rgb(255, 255, 255); border-color:rgb(235, 103, 148); color:rgb(235, 103, 148); display:inline-block; padding:0px 15px 0px 0px">135编辑器</span><span style="background:none 0px 0px repeat scroll rgb(255, 255, 255); color:inherit; display:inline-block; margin-left:5px">&nbsp;</span><span style="background:none 0px 0px repeat scroll rgb(255, 255, 255); color:inherit; display:inline-block; margin-left:5px">&nbsp;</span><span style="background:none 0px 0px repeat scroll rgb(255, 255, 255); color:inherit; display:inline-block; margin-left:5px">&nbsp;</span></section>
</section>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17618.html" target="_blank">三八节模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17618-view_nums">3066</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17618" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17618,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17618-favor_nums">533</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-17490"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6VgicoiaR4ObNELnQJ6BqBcfvCK3J0qcO69knRhsZV9Imza4yOIGib6AVA/0" title="雪国小镇风景模板" class="template-cover" data-id="17490" style="max-width:100%;min-height:200px;" data-original="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6VgicoiaR4ObNELnQJ6BqBcfvCK3J0qcO69knRhsZV9Imza4yOIGib6AVA/0" alt="">						</div>
						<div class="editor-style-content hidden" data-name="雪国小镇风景模板" id="template-17490"><section class="135editor"><p style="margin-right: auto; margin-left: auto; font-size: 16px; color: rgb(57, 0, 213); line-height: 25px; text-align: justify; word-wrap: normal; min-height: 1em; white-space: pre-wrap; padding: 10px; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">不相信吧，我们北方还有景色这么好的地方！第一眼看见的时候，我也不相信，从知道这个地方，到出发，不到6个小时，一张站票，飞奔这个靠近家乡的北方小村，这个世外桃源。</span><span style="border-color:rgba(226, 217, 251, 0.870588); color:inherit; font-size:18px"></span></p><p style="margin-right: auto; margin-left: auto; font-size: 16px; color: rgb(57, 0, 213); line-height: 25.6000003814697px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; text-align: right; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px">❉<strong>雪国小镇</strong>❉</span></p><p class="135brush" data-brushtype="text" style="margin-right: auto; margin-left: auto; font-size: 16px; color: rgb(57, 0, 213); line-height: 25.6000003814697px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; text-align: center; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma66rT9g6WQWiaul30dx8Iye7QkBV28Ne4YP6GrtVBgYVKENR2pEsBDoVg/0"></p><p style="margin-right: auto; margin-left: auto; font-size: 16px; color: rgb(57, 0, 213); line-height: 25.6000003814697px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">村子很小，小的在google地图上都难找到，知道的游客更是甚少。这里没有景区，只是一个小村。</span></p></section><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); text-align: right; background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px">❉<strong>银装素裹</strong>❉</span></p><p class="135brush" data-brushtype="text" style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; text-align: center; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6KWkrglOLXHf0YFHUlSB0ricaUm72X5zhYFN7UYJtWrI7J7I6Z0fucqg/0" title="" vspace="0"></p><section class="135editor"><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">村子前后20公里的路上，处处都是摄影的好地点，如果自驾最好不过。不过我更喜欢原始的小牛车，马车，带上一壶小酒~</span></p></section><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); text-align: right; background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px">❉<strong>映雪朝霞</strong>❉&nbsp;</span></p><p class="135brush" data-brushtype="text" style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; text-align: right; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6Qia5dzXO7oC3rrqSx9Q7bOhw1zzVOhBP9fo45lvicpe2jaOTHRdiaRdSA/0" title="" vspace="0"></p><section class="135editor"><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">村子是在村支书的带动之下，发展成为摄影爱好者都知道的摄影基地。大片大片的美丽，美不胜收。</span></p></section><section class="135editor"><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"></p></section><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); text-align: right; background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px">❉<strong>冰天雪地</strong>❉</span></p><p class="135brush" data-brushtype="text" style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; text-align: center; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjC8FfZRfMG1sgFns0YXma6NbYdU7Sn0mKhkUmKR6pByHDjZVz66a8qzzricrrtA9j11E0z1agRDGg/0" title="" vspace="0"></p><section class="135editor"><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); background-image: -webkit-linear-gradient(right, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="color:rgb(0, 0, 0); font-size:14px">航航小编想，在这风景如画的小村，过着世外桃源般的生活，远离雾霾尘埃，身体健康，每天幸福的生活着，又何尝不好！</span></p></section><p style="margin-right: auto; margin-left: auto; word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; color: rgb(57, 0, 213); min-height: 1em; white-space: pre-wrap; border-color: rgba(226, 217, 251, 0.870588); text-align: right; background-image: -webkit-linear-gradient(left, rgb(224, 213, 255), rgb(191, 171, 246)); background-color: rgb(238, 236, 225);"><span style="font-size:14px"><strong>雪国小镇模板<span style="line-height:25.6000003814697px">BY航航小编</span></strong></span><strong><span style="font-size:18px; line-height:25.6000003814697px">&nbsp;</span></strong></p><section class="135editor"><section class="135brush" data-bcless="true" data-brushtype="text" style="color: rgb(255, 255, 255); padding: 0.45em 0.6em 0.45em 0.9em; border-left-width: 10px; border-left-style: solid; border-color: rgb(80, 99, 200); background: rgb(55, 74, 174);">135编辑器 &nbsp; / &nbsp;联系我们QQ群14965992</section></section></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150303/17490.html" target="_blank">雪国小镇风景模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17490-view_nums">1577</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17490" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17490,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17490-favor_nums">340</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-17190"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/files/201503/1144e36733461f53d61dfc89.jpg" title="电影推荐模板" class="template-cover" data-id="17190" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/files/201503/1144e36733461f53d61dfc89.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-name="电影推荐模板" id="template-17190"><p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></p>

<fieldset class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; border: 0px; font-family: inherit; clear: both; font-size: 14px; text-align: justify; text-decoration: inherit; box-sizing: border-box !important; word-wrap: break-word !important;">
<section class="135editor">
<section class="135editor">
<section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScsiaeIlpygwr10EL59EDxHqMKebjGEWTrkv0SBzT0U8tCicicw3ekp9Vhg/0" style="margin-top:50px; width:100%" title="" vspace="0">
<section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">
<section class="135editor">
<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
<section style="display: inline-block; box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">狼图腾</section>

<section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">上映年份：2015.2.19</section>
</section>
</fieldset>
</section>
</section>

<p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;">&nbsp;</p>
</section>
</section>

<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"></fieldset>
</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(49, 133, 155); margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">豆瓣评分：7.2</strong></span></p>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">导演:&nbsp;让-雅克·阿诺</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">主演:&nbsp;冯绍峰 / 窦骁 / 昂哈妮玛 / 巴森 / 尹铸胜</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">类型:&nbsp;剧情 / 冒险</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">制片国家/地区:&nbsp;中国大陆 / 法国 &nbsp;</section>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color:#31859b"><strong>影评：</strong></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color:#31859b"><span style="color:rgb(0, 0, 0); line-height:24.8888893127441px; text-align:justify"><span style="color:rgb(89, 89, 89); line-height:22.3999996185303px; text-align:justify; white-space:pre-wrap">大体上忠实于原著，但</span><span style="color:rgb(89, 89, 89); line-height:24.8888893127441px; text-align:justify; white-space:pre-wrap">狼群和黄羊群的气势磅礴没有表现出来，有几个镜头狼简直在散漫的散步。 </span></span></span><strong style="color:rgb(49, 133, 155); line-height:1.6em; text-decoration:inherit">@航航小编老豆</strong></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></p>
</fieldset>

<fieldset class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; border: 0px; font-family: inherit; clear: both; font-size: 14px; text-align: justify; text-decoration: inherit; box-sizing: border-box !important; word-wrap: break-word !important;">
<section class="135editor">
<section class="135editor">
<section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScn37UCLZSIsGz8cxicnicZ2p3UZf49R1dlMpAoKNw74nJ4QXNVUYjvFtA/0" style="margin-top:50px; width:100%" title="" vspace="0">
<section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">
<p style="margin: 5px 0px; font-size: 24px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
<section style="display: inline-block; box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">钟馗伏魔：雪妖魔灵</section>

<p style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">上映年份：2015.2.19</p>

<p style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">&nbsp;</p>
</section>
</fieldset>
</section>
</section>
</section>
</section>

<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"></fieldset>
</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(49, 133, 155); margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">豆瓣评分：4.3</strong></span></p>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">导演:&nbsp;鲍德熹 / 赵天宇</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">主演:&nbsp;陈坤 / 李冰冰 / 赵文瑄 / 杨子姗&nbsp;</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">类型:&nbsp;动作 / 爱情 / 奇幻</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">制片国家/地区:&nbsp;中国大陆 / 香港 / 美国</section>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color:#31859b"><span style="line-height:21px"><strong>影评：</strong></span></span></p>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">
<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="color:rgb(17, 17, 17); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:19px">编剧越多越能编出个四不像烂东西，李冰冰陈坤明显呈现老态，打光都救不了，这回冰冰李和冰冰范扯平了，范有白发魔女3d，李有雪妖，二女携手一起向烂片道路狂奔吧 <strong style="color:rgb(49, 133, 155); line-height:21px; text-align:justify; white-space:pre-wrap">@翡翠扳指</strong></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="font-family:微软雅黑,microsoft yahei"><span style="color:rgb(17, 17, 17); font-size:12px; line-height:19px"><strong style="color:rgb(49, 133, 155); line-height:21px; text-align:justify; white-space:pre-wrap"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></strong></span></span></p>
</section>
</fieldset>

<fieldset class="tn-Powered-by-XIUMI" style="margin: 0px; padding: 0px; max-width: 100%; border: 0px; font-family: inherit; clear: both; font-size: 14px; text-align: justify; text-decoration: inherit; box-sizing: border-box !important; word-wrap: break-word !important;">
<section class="135editor">
<section class="135editor">
<section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScqWkjfScFvp2JeKdcTSBMOzAr90j3AhD9fIKnoW6XdWVYOUzDoGsa4g/0" style="margin-top:50px; width:100%" title="" vspace="0">
<section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">
<section class="135editor">
<fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;">
<section style="display: inline-block; box-sizing: border-box; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">冲上云霄</section>

<section class="135brush" data-brushtype="text" style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); box-sizing: border-box; border-color: rgb(107, 77, 64);">上映年份：2015.2.19</section>
</section>
</fieldset>
</section>

<p style="margin: 5px 0px; font-size: 24px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">&nbsp;</p>
</section>

<p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;">&nbsp;</p>
</section>
</section>

<fieldset style="border: 0px; box-sizing: border-box; width: auto; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px;"></fieldset>
</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; text-align: center; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(49, 133, 155); margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">豆瓣评分：4.7</strong></span></p>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">导演:&nbsp;叶伟信 / 邹凯光</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">主演:&nbsp;古天乐 / 郑秀文 / 吴镇宇 / 张智霖 / 佘诗曼&nbsp;</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">类型:&nbsp;剧情 / 爱情</section>

<section class="tn-Powered-by-XIUMI" style="color: inherit; margin: 0px; padding: 0px; max-width: 100%; box-sizing: border-box !important; word-wrap: break-word !important;">制片国家/地区:&nbsp;香港 / 中国大陆</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(49, 133, 155); margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; color:rgb(49, 133, 155); font-size:14px; line-height:21px; margin:0px; max-width:100%; padding:0px; text-align:justify; white-space:pre-wrap; word-wrap:break-word !important"><strong style="box-sizing:border-box !important; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">影评：</strong></strong></strong></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(0, 0, 0); font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:19px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important">也不知道这部电影算长mv还是算长广告 一颗星献给张智霖的脸 我已经不能直视吴镇宇了 满脑子dady love you</span><span style="box-sizing:border-box !important; font-family:微软雅黑,microsoft yahei; font-size:14px; line-height:19px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><span style="color:#111111"> &nbsp; </span></span><span style="box-sizing:border-box !important; color:rgb(17, 17, 17); font-family:微软雅黑,microsoft yahei; font-size:12px; line-height:19px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="color:rgb(49, 133, 155); line-height:22.3999996185303px; text-align:justify; white-space:pre-wrap"><strong style="line-height:21px"><strong>@奕~烬</strong></strong></strong></span></p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;">&nbsp;</p>

<p style="margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><span style="box-sizing:border-box !important; color:rgb(17, 17, 17); font-family:微软雅黑,microsoft yahei; font-size:12px; line-height:19px; margin:0px; max-width:100%; padding:0px; word-wrap:break-word !important"><strong style="color:rgb(49, 133, 155); line-height:22.3999996185303px; text-align:justify; white-space:pre-wrap"><strong style="line-height:21px"><strong><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></strong></strong></strong></span></p>

<section class="135editor">
<section style="width: 100%; border: 1px solid rgb(219, 219, 219); background-color: rgb(0, 0, 0);"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScEMRX8l8jDib47545YAm7V8Gkcz5Bm1SPiabk6PrzUS3U5mZd0mlf4MxQ/0" style="margin-top:50px; width:100%" title="" vspace="0">
<section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">
<p style="margin-top: 5px; margin-bottom: 5px; font-size: 20px; padding: 2px 10px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: 0px; text-align: center;">
<section style="display: inline-block; color: inherit;">
<section class="135brush" data-brushtype="text" style="margin-top: 0.2em; padding-right: 0.5em; padding-bottom: 5px; padding-left: 0.5em; color: rgb(107, 77, 64); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-color: rgb(107, 77, 64);">电影推荐模板</section>

<p style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); border-color: rgb(107, 77, 64);">135编辑器原创</p>

<p style="margin: 5px 1em; font-size: 1em; line-height: 1; color: rgb(107, 77, 64); border-color: rgb(107, 77, 64);">&nbsp;</p>
</section>
</fieldset>
</section>
</section>
</section>
</section>

<p style="color: inherit; margin-top: 0px; margin-bottom: 0px; padding: 0px; max-width: 100%; overflow: hidden; min-height: 1em; white-space: pre-wrap; box-sizing: border-box !important; word-wrap: break-word !important;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="line-height:1.6em; white-space:pre-wrap"></p>
</fieldset>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150302/17190.html" target="_blank">电影推荐模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17190-view_nums">976</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17190" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17190,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17190-favor_nums">270</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-17078"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/17078.jpg" title="蓝色科技模板" class="template-cover" data-id="17078" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/17078.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-name="蓝色科技模板" id="template-17078"><p></p><section class="135editor"><section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScRsqVFRWu9oibtQgJaWdQ80wt4170fibfSBlUVic2hMcNKQFStkZGWGrxA/0" style="margin-top:50px; width:100%" title="" vspace="0"><section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;"><p style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">互联网——科技的海洋</p></section><p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;"><span style="font-size:18px"></span></p></section></section><p></p><p></p><section class="135editor"><blockquote style="max-width: 100%; margin: 0px; padding: 5px 15px; color: rgb(255, 255, 255); line-height: 25px; font-weight: bold; text-align: left; border: 0px rgb(30, 155, 232); background-color: rgb(30, 155, 232);"><span class="135brush" data-brushtype="text" style="color:inherit">导语</span></blockquote><blockquote class="135brush" data-style="font-size:14px" style="max-width: 100%; margin: 0px; padding: 10px 15px 20px; border: 1px solid rgb(30, 155, 232); line-height: 25px;"><p style="font-size: 14px; color: inherit;">2014年还有不足一个月就要过去，去年东楼曾盘点了《2013年度十大互联网行业热词》，今年依然继续。 盘点其实是对行业的一个梳理，我们能够更清楚的看到过去一年都发生了哪些值得关注的行业事件，哪个创业领域最为火热，哪家公司最受瞩目，哪个产品最被关注，可能看完东楼盘点的这10大互联网行业热词之后，就能找到一些答案。（以下热词排名不分先后，名词解释统一采用自百度百科）</p></blockquote></section><p></p><p></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(30, 155, 232); min-height: 32px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(30, 155, 232); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(30, 155, 232); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">1</span><strong class="135brush" data-brushtype="text" style="border-color:rgb(30, 155, 232); color:inherit">微商</strong></h2></section><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">名词解释：微商目前尚无统一认知的定义。通俗的说，微商就是在移动端上进行商品售卖的小商家。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">微商这个词绝对是2014年互联网行业的第一新词和流行词。微商的流行始于朋友圈卖货的流行，起初可能是一些爱美的小女生在微信朋友圈分享一些面膜化妆品，继而发现商机，然后是各类不知名的化妆品、面膜厂商进军微信朋友圈。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">而我更愿意将微商群体看做是一个以各种移动互联网产品作为工具来进行在线交易的卖家群体，目前可充当微商的卖货平台有微信朋友圈、QQ空间，微信公众平台、微博等，还有很多垂直的移动社区也将成为微商的销售平台。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">微商的历史很短，但目前却很危险，更多的微商正在以一种类似传销的模式进行经营，大量的商品积压在各种小代理和卖家手里，微商所售卖的商品并没有真正到达客户手中，泡沫严重。不过，我仍然看好微商成为未来电商行业的一个趋势，人人皆是电商，人人皆是客户的时代或许已经不远。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(30, 155, 232); min-height: 32px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(30, 155, 232); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(30, 155, 232); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">2</span><strong class="135brush" data-brushtype="text" style="border-color:rgb(30, 155, 232); color:inherit">众筹</strong></h2></section><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;">名词解释：翻译自国外crowdfunding一词，即大众筹资或群众筹资。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">众筹算是在2014年新诞生的是行业流行词，同时也是目前最为火爆的创业领域，各类众筹网站层出不穷，甚至众筹这个词刚出现时，不少人在朋友圈上还以众筹的名义，向微信好友“化缘”，众筹的项目竟然让每人凑100元赞助其买一个iPhone6，实在是让人感到无耻又无聊。对此，东楼想说，众筹可以，但不要成了”众凑‘，在朋友圈让大家凑钱给自己谋福利的，可以洗洗睡了！</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">而关于众筹，前段时间发生的“西少爷内讧事件“更是具有代表性 ，而也让业界对众筹项目的股权分配等问题产生了质疑。但不管如何，众筹是在2014年彻底火了，甚至原来很多互联网创业产品最爱用的预售也改头换面成了众筹。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(30, 155, 232); min-height: 32px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(30, 155, 232); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(30, 155, 232); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">3</span><strong class="135brush" data-brushtype="text" style="border-color:rgb(30, 155, 232); color:inherit">社群</strong></h2></section><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">名词解释：指在某些边界线、地区或领域内发生作用的一切社会关系。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">社群这个词语是一个真正生在互联网也火在互联网的行业热词。尽管比起微商、众筹等词，使用频率还略低，但是各类社群的崛起已经成为今年互联网行业里一大看点。就在前天，一个社群大会要邀请了一个被某些互联网大佬捧上神坛的KK（凯文凯利）来站台，这也能间接证明，社群这个概念有多么的火热。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">根据东楼的理解，社群的概念应该就是以”领袖“为核心聚集起来的小圈子，甚至类似于宗教的一种东西，大家有相同的“信仰”或者目标，在一起互相学习和帮助，最终达到共赢的状态。而目前有相当多的社群却更多的是“社群领袖”们赚钱的粉饰，而一旦更多人发掘这里面的“奥秘”，人人都搞“社群”的时代或许也将到来。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(30, 155, 232); min-height: 32px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(30, 155, 232); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(30, 155, 232); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">4</span><strong class="135brush" data-brushtype="text" style="border-color:rgb(30, 155, 232); color:inherit">iPhone6</strong></h2></section><p></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">名词解释：iPhone 6是苹果公司（Apple）在2014年9月9日推出的一款手机。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">iPhone6成为互联网行业的流行词一点也不令人意外。事实上，从iPhone4开始，每一代iPhone手机的闻世都会赢得互联网圈最大的关注，就连是乔布斯已经驾鹤西去都没有改变这一现状。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">在国内，目前还没有一个产品能够达到iPhone手机这样热度。特别是每年9月份的发布会，更是万众瞩目。今年也不例外。自从iPhone6发布，互联网媒体们已经连篇累牍的报道了几个月，至今热度不减，而有经验的媒体从业者们早已心知肚明，iPhone手机的报道的点击是最有保证的，没什么新题材，就写iPhone6。相信我，没错的！</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(30, 155, 232); min-height: 32px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(30, 155, 232); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(30, 155, 232); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">5</span><strong class="135brush" data-brushtype="text" style="border-color:rgb(30, 155, 232); color:inherit">红包</strong></h2></section><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">名词解释：传统意义上的红包也叫压岁钱，是过农历春节时长辈给小孩儿用红纸包裹的钱。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">这里提到的红包，但是不是传统意义上的红包，而是微信红包。事实上，把红包这个当做热词是不“科学”的，但红包却实在是今年最抓人眼球的发明创造之一。当你打开你的微信群，一看到或提到微信红包，你心情是不是就有一阵小激动呢。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">而红包已经成为一种现象，甚至让很多小朋友可能都无法专心上班了，在一些微信群里，进群发红包，发广告先发红包等都已成为了“潜规则”。而就在前不久，快的因为无法在微信上通过红包来分享传播，还跟腾讯打了一下公关战。结果，无果。谁让你不是人家的干儿子呢？</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">另一方面，微信红包的泛滥目前已经对微信整体产品已经有了一定的负面效应，虽然带动了微信群的活跃，但也导致微信朋友圈产生了大量的垃圾消息。不过，说归说，如果有人愿意定向一个大红包给东楼，我是不会拒绝的。你看，这就是人性的弱点。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(30, 155, 232); min-height: 32px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(30, 155, 232); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(30, 155, 232); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">6</span><strong class="135brush" data-brushtype="text" style="border-color:rgb(30, 155, 232); color:inherit">情怀</strong></h2></section><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">情怀同样不是一个新词，但却很可能是被互联网行业即将毁掉的一个美好的词。这个词的流行，跟一个互联网行业的热点人物有最直接的关系，这个人就是锤子手机的创始人老罗罗永浩。提到情怀，必然要提到老罗的锤子手机。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">在锤子手机的发布会上，老罗以“我不是未来输赢，我就是认真”来结束演讲，由此锤子手机也成为有史以来最有情怀的手机，而锤粉也成了最有情怀的一群人。不过，很快，情怀被现实打败，3000元的锤子手机在面临滞销之后，在上市几个月之后，老罗即忍痛宣布直降1000余元，这让很多锤粉捶胸顿足，也让人们知道了情怀的真实价格：1000元！</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(30, 155, 232); min-height: 32px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(30, 155, 232); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(30, 155, 232); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">7</span><strong class="135brush" data-brushtype="text" style="border-color:rgb(30, 155, 232); color:inherit">90后</strong></h2></section><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">名词解释：“90后”是“80后”的派生词，指1990年1月1日至1999年12月31日出生的一代中国公民，有时泛指1990年以后至2000年之间出生的所有中国公民。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">90后在前几年就已是一个社会文化现象，并不是互联网行业的专属名词。在过去提到90后，人们经常把非主流、杀马特等另类形象跟他们联系在一起。而在今年，提到90后，在互联网圈更多是却是把他们跟创业者放在一起。这主要是因为出现了如马佳佳、余佳文等这样的一批个性鲜明，语出惊人的90后创业者有关，尤其是最近一个月，90后的话题在互联网行业更是具有空前的热度。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">另外，一些互联网产品经理或媒体人士，还很热衷给90后贴标签，甚至用“90后思维”来指导产品的创新和创造，90后们俨然成为了互联网行业的“当红炸子鸡”和最懂互联网思维的哪些人。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight:bold;font-size:16px;line-height:28px;  max-width: 100%;color:rgb(0, 112, 192); min-height: 32px;border-bottom: 2px solid rgb(0, 112, 192); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(0, 112, 192); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">8</span><strong class="135brush" data-brushtype="text">连接</strong></h2></section><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">名词解释：相连邻接</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">"连接"这个词按照普通的语义解释极为简单和普通，但是放到互联网行业却又被赋予了神奇的力量，人与人连接，人与物连接，物与物连接，线上连接线下，连接未来，连接一切......</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">一个再普通不过的词语，却被BAT巨头们用出了高大上的感觉，仿佛有了连接，未来就都是我们的。不过，在东楼看来，”连接“二字可能只是巨头们打造巨无霸产品的一个幌子，背后隐藏着的却是一统天下的野心。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight:bold;font-size:16px;line-height:28px;  max-width: 100%;color:rgb(0, 112, 192); min-height: 32px;border-bottom: 2px solid rgb(0, 112, 192); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(0, 112, 192); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">9</span><strong class="135brush" data-brushtype="text">颠覆</strong></h2></section><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">名词解释：对某项事物造成强烈冲击改变，使事物本质发生变化。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">颠覆这个词，不是互联网人发明的，却是互联网从业者最爱用的。这个词不仅仅国内互联网从业者爱用，甚至硅谷的哪些创业者也不例外。这个词在国内互联网行业的流行，应该有互联网几个大佬的功劳。尤其是由雷布斯成为小米公司董事长雷军，更是在各个公开演讲场合频繁使用。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">而今年，颠覆这个词的在互联网行业的使用已经到了无以复加无法忍受的地步，互联网的一些媒体和创业者们更是言必谈颠覆，几乎是到了出去忽悠不提”颠覆“二字都不好意思跟人打招呼的地步。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"></p><section class="135editor"><h2 style="margin: 8px 0px 0px; padding: 0px; font-weight: bold; font-size: 16px; line-height: 28px; max-width: 100%; color: rgb(30, 155, 232); min-height: 32px; border-bottom-width: 2px; border-bottom-style: solid; border-color: rgb(30, 155, 232); text-align: justify;"><span class="autonum" data-original-title="" placeholder="1" style="background-color:rgb(30, 155, 232); color:rgb(255, 255, 255); display:block; float:left; line-height:20px; margin:0px 8px 0px 0px; max-width:100%; padding:4px 10px; word-wrap:break-word !important" title="">10</span><strong class="135brush" data-brushtype="text" style="border-color:rgb(30, 155, 232); color:inherit">转型</strong></h2></section><p style="min-height: 1em; white-space: pre-wrap; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">名词解释：指事物的结构形态、运转模型和人们观念的根本性转变过程。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">东楼点评：</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">转型这个词算是勉强入选。不过既然入选也自有我的理由。事实上，在2014年里，移动互联网的彻底爆发，开始对各类传统企业，甚至是传统互联网企业都有巨大的影响和冲击。在这个大背景下，房地产商在转型，银行在转型，教育机构在转型，各类在国民经济当中曾经扮演重要作用的产业都在谈转型。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 24px;"></p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;">与此同时，在国内的富豪排行榜上，越来越多的互联网企业家出现其中。马云、马化腾、李彦宏、丁磊等更是占据富豪榜前列，这都意味着互联网经济成为国内主流经济体的开始，而阿里巴巴上市，马云成为首富可能就是一个最直接的证明。</p><p style="min-height: 1em; white-space: normal; color: rgb(62, 62, 62); font-family: 'Helvetica Neue', Helvetica, 'Hiragino Sans GB', 'Microsoft YaHei', Î¢ÈíÑÅºÚ, Arial, sans-serif; font-size: 15px; line-height: 1.5em;"><em style="font-style: italic;">来源：新浪博客</em></p><p><em style="font-style: italic;"></em></p><section class="135editor"><section style="margin: 10px 0px; padding: 50px 0px; color: rgb(255, 255, 255); text-align: center; border-color: rgb(30, 155, 232); background-color: rgb(30, 155, 232);"><span class="135brush" data-brushtype="text" style="border:1px solid rgb(251, 251, 251); color:inherit; font-size:18px; line-height:42px; padding:10px 15px">135编辑器，愿与你共同成长</span><section class="135brush" style="margin-top: 30px; color: inherit;"><p style="color: inherit;">秒刷，最易用的图文排版工具</p><p style="color: inherit;">早用秒刷，早下班回家</p></section></section></section><p></p><p></p></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150302/17078.html" target="_blank">蓝色科技模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17078-view_nums">1157</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17078" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17078,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17078-favor_nums">269</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-17038"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/17038.jpg" title="热门资讯模板" class="template-cover" data-id="17038" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/17038.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-name="热门资讯模板" id="template-17038"><p><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJScApL7hyQ2siayfDvV91uHlI9ZUgfu0IoEicxqBF67AA8puayqWg39vRuQ/0" style="font-size:16px; line-height:normal" title="" vspace="0"></p><p style="font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"><span style="color:rgb(127, 127, 127); font-size:13.3333339691162px; line-height:20px"></span><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="color:rgb(192, 0, 0); cursor:pointer; line-height:25.6000003814697px; z-index:-1"><span style="color:rgb(127, 127, 127); font-size:13.3333339691162px; line-height:20px"><span style="font-size:13.3333339691162px">这是航航小编为</span>您分享的第</span><span style="background-color:rgb(216, 216, 216); color:rgb(192, 0, 0); font-size:13.3333339691162px; line-height:20px"><strong>N</strong></span><span style="color:rgb(127, 127, 127); font-size:13.3333339691162px; line-height:20px">期模板。最近使用的素材都是热门新闻事件，本小编只负责给大家带来排版灵感，新闻版权归原作者所有。初见的朋友请点标题下蓝字或搜索微信号<strong><span style="background-color:rgb(216, 216, 216); color:rgb(192, 0, 0)">tizi135</span></strong>关注。欢迎大家加入135编辑器QQ群探讨排版技巧。</span></p><p style="font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"><span style="color:rgb(127, 127, 127); font-size:13.3333339691162px; line-height:20px">群号：204411951,149659920（以满）</span></p><p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0" style="color:rgb(192, 0, 0); cursor:pointer; font-size:16px; line-height:25.6000003814697px; z-index:-1"></p><p style="font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"><span style="font-family:sans-serif; line-height:25.6000003814697px">&nbsp;</span></p><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"><span style="background-color:rgb(12, 12, 12)"><strong><strong style="color:rgb(251, 213, 181)"><span style="font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong><strong style="color:rgb(251, 213, 181)">&nbsp;概览&nbsp;</strong><span style="color:rgb(251, 213, 181); font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong></span></p><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; line-height: 25.6000003814697px;"></p><blockquote style="padding: 15px 25px; border-left-width: 10px; border-left-color: rgb(194, 39, 36); font-size: 16px; top: 0px; line-height: 24px; font-family: 微软雅黑; vertical-align: baseline; background-color: rgb(239, 239, 239);"><p style="word-wrap: normal; min-height: 1em; white-space: pre-wrap;">一碗肉卤子加几块肉，这本是美味，但对于嫁到宝应范水的高某来说，这是个过不去的“坎”。为了讨要说法，她携带凶器，四处寻找丈夫，试图宣泄心中的“愤恨”。2月23日晚上9点许，在宝应县氾水镇发生一起血案，一名男子被妻子连捅四刀，倒在了血泊中。妻子为何为了一碗肉卤子和几块肉，就对丈夫下如此“重手”呢？事情要从网恋说起。</p></blockquote><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 25.6000003814697px;"></p><p></p><section class="135editor"><section style="height: 2.5em; line-height: 2.5em; color: rgb(255, 255, 255); font-size: 13.33px; border-color: rgb(190, 119, 99); background-color: rgb(190, 119, 99);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(190, 119, 99); color:inherit; float:left; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important"><p class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 16px; border-color: rgb(190, 119, 99);">网上寻得温柔妻，婚后变成女汉子</p></section></section><p></p><p></p><p>钱晨今年38岁，是宝应县氾水人。几年前，钱某因跟妻子感情不合离婚。2013年，钱某在网聊中，认识了重庆女子高某。在聊天中，钱某觉得高某不仅漂亮，而且性格温柔，是一个值得处的对象。2013年9月份，时机成熟了，两人准备结婚。之后，高某(39岁)从重庆嫁到了宝应。婚后一段时间，高某确实比较温柔，钱某对这个新婚妻子也比较满意。</p><p></p><p>随着时间越来越长，高某的性格开始有了变化。在生活中，高某经常因为一点小事，跟丈夫钱某吵架，有时还对丈夫拳脚相加。家丑不可外扬，对于妻子的暴力，钱某一直忍让。</p><p></p><p></p><section class="135editor"><section style="height: 2.5em; line-height: 2.5em; color: rgb(255, 255, 255); font-size: 13.33px; border-color: rgb(190, 119, 99); background-color: rgb(190, 119, 99);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(190, 119, 99); color:inherit; float:left; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important"><p class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 16px; border-color: rgb(190, 119, 99);">一碗卤子和几块肉，引发夫妻不和</p></section></section><p></p><p></p><p>今年2月23日下午，钱某被邀请到亲戚家吃饭，临行前，妻子高某嘱咐钱某，吃完饭后，记得带点吃的回来。宴席很快散去，钱某离开宴席前没有忘记老婆，从主人家里弄了一点饭和菜。</p><p><span style="line-height:1.6em"></span></p><p><span style="line-height:1.6em">“怎么是肉卤子和几块肉啊，你不知道我血脂高啊！”晚上9点许，钱某回到家中，打开饭盒后，妻子突然情绪大变，冲着钱某大叫。之后，高某就开始对钱某恶言相向。钱某不愿意跟妻子一般见识，独自一人离开家，到邻居家“避风头”。钱某离开家后，高某更是火冒三丈。</span></p><p><span style="line-height:1.6em"></span></p><p></p><section class="135editor"><section style="height: 2.5em; line-height: 2.5em; color: rgb(255, 255, 255); font-size: 13.33px; border-color: rgb(190, 119, 99); background-color: rgb(190, 119, 99);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(190, 119, 99); color:inherit; float:left; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important"><p class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 16px; border-color: rgb(190, 119, 99);">一言不合，妻子连捅丈夫四刀</p></section></section><p></p><p></p><p>高某见丈夫躲了起来，随即骑上三轮车，一路寻找丈夫。一路上，她还不断地捡砖块和酒瓶。高某经过一路打听，最终寻得丈夫的藏身地点。</p><p></p><p>丈夫藏身在一村民家里，高某见丈夫不肯现身，就站在门口破口大骂。钱某实在忍受不了，从邻居家里走了出来。一见面，妻子高某的火气没有消，她从三轮车上取来砖块和酒瓶，试图砸向钱某。由于钱某家亲戚的介入，高某被拦截下来。然而之后，高某不但没有罢手，反而更加疯狂，她冲上前去，一口咬住钱某左手食指。高某劲很大，钱某怎么也摆脱不掉。</p><p><span style="line-height:1.6em"></span></p><p><span style="line-height:1.6em">“这已经是第三刀了！”在纠缠中，高某从口袋里掏出一把水果刀，捅向钱某左胸部。钱某一直在提示妻子，他已经中刀了，但妻子似乎没有听见，直到捅下第四刀才罢手。钱某见羽绒服被捅坏，就脱下了羽绒服，之后就倒在了血泊中。</span></p><p></p><p></p><section class="135editor"><section style="height: 2.5em; line-height: 2.5em; color: rgb(255, 255, 255); font-size: 13.33px; border-color: rgb(190, 119, 99); background-color: rgb(190, 119, 99);"><img src="http://mmbiz.qpic.cn/mmbiz/MVPvEL7Qg0EPD5jh0tV8WnQUh5DoR7UqXe88UP9HuYEcO8vV2H4JYaRAAF8m0dg1916mgEu3ia5MggE6TGEkDog/640" style="border:0px rgb(190, 119, 99); color:inherit; float:left; margin:5px 10px; vertical-align:top; visibility:visible !important; width:auto !important"><p class="135brush" data-brushtype="text" style="color: inherit; display: inline-block; font-size: 16px; border-color: rgb(190, 119, 99);">妻子已经被警方刑事拘留</p></section></section><p></p><p></p><p>晚上9点40分，接到报警后，宝应警方在第一时间内赶到现场。民警首先将钱某紧急送到医院抢救。然后，民警将高某带到了派出所里。高某意识到了自己的错误，称自己犯下大错，只等着丈夫跟她离婚。在医院里，死里逃生的钱某表示，对于妻子的疯狂行为，他实在没有理由原谅。目前，高某因涉嫌故意伤害罪，已经被警方刑事拘留。</p><p><span style="color:#666666"><span style="font-size:16px; line-height:32px"></span></span></p><p><span style="color:#666666"><span style="font-size:16px; line-height:32px"></span></span></p><p></p><p></p><section class="135editor"><h2 class="135brush" data-brushtype="text" style="padding-bottom: 9px; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(238, 238, 238); margin-bottom: 10px; line-height: 1.1; font-size: 22px;">给广大受苦受难的男银tips</h2></section><p></p><p></p><p style="word-wrap: normal; font-family: sans-serif; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"><span style="background-color:rgb(12, 12, 12)"><strong><strong style="color:rgb(251, 213, 181)"><span style="font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong><strong style="color:rgb(251, 213, 181)">&nbsp;律师观点&nbsp;</strong><span style="color:rgb(251, 213, 181); font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong></span></p><p style="word-wrap: normal; font-family: sans-serif; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"></p><section class="135editor"><blockquote class="135brush" style="orphans: 2; white-space: normal; widows: 2; line-height: 22.39px; margin-top: 10px; margin-bottom: 10px; padding: 15px 20px 15px 45px; outline: 0px; border: 0px currentcolor; color: rgb(62, 62, 62); vertical-align: baseline; background-image: url(http://www.wx135.com/img/bg/left_quote.jpg); background-color: rgb(241, 241, 241); background-position: 1% 5px; background-repeat: no-repeat;"><p><span style="line-height:1.6em">“男人如果遭遇家暴，也可以向当地妇联求助，或者拨打110报警。”江苏韵和律师事务所律师童陈介绍，如果受到严重伤害，应当立即报警，通过公安部门委托司法鉴定部门对伤情进行鉴定，如果构成轻伤，就可以追究施暴者的刑事责任。如果受到严重的暴力威胁，一定要注意保护自己，没有必要回到施暴者身边，承受不可预知的危险。</span></p></blockquote></section><p></p><p style="word-wrap: normal; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"></p><p style="word-wrap: normal; font-family: sans-serif; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"><span style="background-color:rgb(12, 12, 12)"><strong><strong style="color:rgb(251, 213, 181)"><span style="font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong><strong style="color:rgb(251, 213, 181)">&nbsp;航航观点&nbsp;</strong><span style="color:rgb(251, 213, 181); font-family:微软雅黑,sans-serif; font-size:14px; line-height:32px; text-align:center">✪</span></strong></span></p><p style="word-wrap: normal; font-family: sans-serif; font-size: 16px; line-height: 25.6000003814697px; white-space: normal; min-height: 1em;"></p><section class="135editor"><blockquote class="135brush" style="orphans: 2; white-space: normal; widows: 2; line-height: 22.39px; margin-top: 10px; margin-bottom: 10px; padding: 15px 20px 15px 45px; outline: 0px; border: 0px currentcolor; color: rgb(62, 62, 62); vertical-align: baseline; background-image: url(http://www.wx135.com/img/bg/left_quote.jpg); background-color: rgb(241, 241, 241); background-position: 1% 5px; background-repeat: no-repeat;">言简意赅地说，一个男银，连女的都打不过，还是去哪si一si吧~</blockquote></section><p></p><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 25.6000003814697px;"></p><p style="font-family: sans-serif; font-size: 16px; word-wrap: normal; min-height: 1em; white-space: pre-wrap; line-height: 25.6000003814697px;"></p></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150302/17038.html" target="_blank">热门资讯模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-17038-view_nums">1278</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="17038" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',17038,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-17038-favor_nums">329</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-16968"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/16968.jpg" title="人物介绍模板" class="template-cover" data-id="16968" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/16968.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-name="人物介绍模板" id="template-16968"><section class="135editor">
<fieldset style="border: none; margin: 0.8em 0px 0.3em; box-sizing: border-box; padding: 0px;">
<section style="line-height: 0; box-sizing: border-box;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPgMBpjC6ZDiaMSCicE5f6SJSc8CFK70xtg1k852JIwwrVeLVOBHMm1VbFXAuTggZee0tOuWjngofSiag/0" style="border:0px; box-sizing:border-box; display:inline-block; height:auto !important; width:100%"></section>

<section style="width: 30%; display: inline-block; float: left; text-align: right; margin: 15px 0px 0px; padding: 0px; box-sizing: border-box;">
<section style="float: right; text-align: center; margin-top: -15px; box-sizing: border-box;">
<section style="width: 1px; height: 1.2em; margin-left: 50%; background-color: rgb(102, 102, 102); box-sizing: border-box;"></section>

<section style="width: 2em; height: 2em; border: 1px solid rgb(102, 102, 102); border-radius: 50%; line-height: 2em; font-size: 1em;font-weight: inherit; text-decoration: inherit; box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box;">哀悼</section>
</section>

<section style="width: 2em; height: 2em; border: 1px solid rgb(102, 102, 102); margin-top: 2px; border-radius: 50%; line-height: 2em; font-size: 1em;  font-weight: inherit; text-decoration: inherit; box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="box-sizing: border-box;"></section>
</section>
</section>
</section>

<section style="width: 65%; float: left; margin-top: 20px; line-height: 1.5em; margin-left: 5%; padding: 0px; font-size: 1em;  font-weight: inherit; text-decoration: inherit; color: rgb(39, 44, 51); box-sizing: border-box;">
<section style="box-sizing: border-box;">
<section class="135brush" data-brushtype="text" style="box-sizing:border-box; font-size:175%;margin:5px 0px"><span style="line-height:22.3999996185303px">评书大师袁阔成</span></section>

<p style="box-sizing: border-box;font-size:16px"><span style="line-height:22.3999996185303px">今天凌晨因心脏衰竭去世</span></p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<section style="max-width: 100%;margin: 0.8em 0px 0.5em; overflow: hidden; ">
<section class="135brush" data-brushtype="text" placeholder="请输入标题" style="height: 36px; display: inline-block; color: rgb(255, 255, 255); font-size: 16px; font-weight: bold; padding: 0px 10px; line-height: 36px; float: left; vertical-align: top; box-sizing: border-box !important; background-color: rgb(33, 33, 34);">人民网北京3月2日电</section>

<section style="display: inline-block; height: 36px; vertical-align: top; border-left-width: 9px; border-left-style: solid; border-left-color: rgb(33, 33, 34); box-sizing: border-box !important; border-top-width: 18px !important; border-top-style: solid !important; border-top-color: transparent !important; border-bottom-width: 18px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important; color: inherit;"></section>
</section>
</section>

<p>&nbsp;</p>

<p>许心怡记者从著名相声演员姜昆处获悉，今日凌晨3点30分，著名评书表演艺术家袁阔成因心脏衰竭去世，享年86岁。</p>

<p>&nbsp;</p>

<p>袁阔成，著名评书表演艺术家。他博采众长，吸收话剧、电影、戏曲、相声等艺术形式之长，在继承传统评书的基础上，不断探索，勇于创新。袁先生的评书语言生动幽默，人物形象鲜明，说表并重，形神兼备，绘声绘色，以形传神，讲究气、音、字、节、手、眼、身、步的全身艺术，具有“漂、俏、快、脆”的艺术特色。袁先生的现代评书，内容新、风格新、语言新，为弘扬民族文化艺术做出了可贵的贡献。</p>

<p>&nbsp;</p>

<section class="135editor">
<h2 class="135brush" placeholder="请输入标题" style="border-left:5px solid #666765;font-size: 16px;font-weight:bold; line-height: 32px;color:#666;padding: 5px 10px; margin: 10px 0px;">代表作品：《三国演义》、《西楚霸王》、《水泊梁山》、《烈火金刚》等。</h2>
</section>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150302/16968.html" target="_blank">人物介绍模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-16968-view_nums">629</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="16968" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',16968,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-16968-favor_nums">149</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-16423"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/16423.jpg" title="短篇散文模板" class="template-cover" data-id="16423" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/16423.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-name="短篇散文模板" id="template-16423"><section class="135editor"><fieldset style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZlytNJ5JeV7dCfXxRRBU6cpwGsiaD1Y6W8dMcw8GxMwELicYictU9L3L3w/0" style="border-radius:100%; box-sizing:border-box; color:inherit; height:16em; width:16em"><section style="border: 0px rgb(255, 129, 36); box-sizing: border-box; width: 100%; clear: both; margin: 0px; padding: 0px 0.5em 0.5em 0px; text-align: center; text-shadow: rgb(201, 201, 201) 3px 4px 2px; color: inherit; word-wrap: break-word !important;"><strong><span class="135brush" data-brushtype="text" style="color:rgb(233,200,101)"></span></strong></section></fieldset></section><p style="text-align: center;">&nbsp;毕淑敏</p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"></p><section class="135editor"><p style="margin-top: 10px; margin-bottom: 10px; border-color: rgb(240, 240, 244); color: rgb(97, 97, 132); border-radius: 4px; padding: 15px; background-color: rgb(240, 240, 244);"><span style="font-size:14px"></span><span style="color:rgb(62, 62, 62); font-family:helvetica neue,helvetica,hiragino sans gb,microsoft yahei,î¢èíñåºú,arial,sans-serif; font-size:12px; line-height:19px; text-align:justify; white-space:pre-wrap"> 毕淑敏于1969年在高原部队当兵11年，历任卫生员、助理军医、军医等职，为医学事业做出突出的贡献。1989年毕淑敏加入中国作家协会，成为国家一级作家，从事医学工作20年后的她专注于写作，很多作品都和医学有关，主要代表作品《红处方》《昆仑殇》。2007年，毕淑敏以364万元的版税收入，荣登“2007第二届中国作家富豪榜”第14位。</span><span style="font-size:14px; line-height:1.5em"></span></p></section><section class="135editor"><section class="135editor"><section placeholder="请输入标题" style="height: 36px; display: inline-block; color: rgb(255, 255, 255); font-size: 16px; font-weight: bold; padding: 0px 10px; line-height: 36px; float: left; vertical-align: top; box-sizing: border-box !important; background-color: rgb(129, 128, 129);">一周特刊</section><section style="display: inline-block; height: 36px; vertical-align: top; border-left-width: 9px; border-left-style: solid; border-left-color: rgb(129, 128, 129); color: inherit; box-sizing: border-box !important; border-top-width: 18px !important; border-top-style: solid !important; border-top-color: transparent !important; border-bottom-width: 18px !important; border-bottom-style: solid !important; border-bottom-color: transparent !important;"></section></section></section><p></p><section class="135editor"><fieldset style="border: 0px; text-align: center; box-sizing: border-box; padding: 0px;"><section style="display: inline-block; box-sizing: border-box;"><section style="margin: 0.2em 0px 0px; padding: 0px 0.5em 5px; max-width: 100%; color: rgb(42, 52, 58); font-size: 1.8em; line-height: 1; border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(42, 52, 58);"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap">向人生的高处飞翔</span></section><p style="margin-right: 1em; margin-left: 1em; line-height: 1; font-size: 1em; color: rgb(120, 124, 129); box-sizing: border-box;"><span style="color:rgb(165, 165, 165); font-size:14px">喜欢本文请抄写100遍~</span></p><p style="margin-right: 1em; margin-left: 1em; line-height: 1; font-size: 1em; color: rgb(120, 124, 129); box-sizing: border-box;"></p></section></fieldset></section><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal; text-align: center;"><span style="font-family:微软雅黑,microsoft yahei; font-size:14px">文/毕淑敏</span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal; text-align: center;"><span style="color:rgb(165, 165, 165); font-size:14px">本文选自《毕淑敏散文精选》</span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(127, 127, 127)"></span><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap">有一块石头在深山里寂寞地躺了很久,它有一个梦想:有一天能够像鸟儿一样飞上天空.当它把自已的理想告诉同伴时,立刻招来同伴们的嘲笑,"瞧瞧,什么叫心比天高,这就是啊!""真是异想天开!"......这块石头不去理会同伴们的闲言碎语,仍然怀抱理想等待时机.有一天一个叫庄子的人路过这里,它知道这个人有非凡的智慧,就把自已的理想对庄子说了,庄子说:"我可以帮你实现理想,但你必须先长成一座大山,这可是要吃不少苦的."石头说:"我不怕吃苦."</span><span style="color:rgb(127, 127, 127)"></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"></span></p><section class="135editor"><section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZMRdrJXAbDYibbNibr0eVrTu5G8fCUN9JOicL5BcMue0ggdNNyicxlAC7Bg/0" style="margin-top:50px; width:100%" title="" vspace="0"><section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;"><p style="margin: 5px 0px; font-size: 24px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">羡慕飞鸟的石头</p></section><p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;"><span style="font-size:18px"></span></p></section></section><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap">于是石头拼命地吸取天地灵气,自然精华,承接雨露惠泽,拼命生长,不知经过了多少年,受了多少风雨的洗礼,它终于长成了一座大山.于是,庄子招来了大鹏以翅膀击山,一时间天摇地动,一声惊天动地的巨响后,山炸开了,无数石块飞向天空,在飞的一刹那,石头会心的笑了,它终于体会到飞的快乐,但是不久它就从天空摔了下来,仍然变成当初的模样,落在原来的地方.庄子问它:"你后悔吗?""不,我不后悔,我长成了一座山,而且我飞翔过!"石头说.</span></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"></span></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap">其实人的一生就像石头一样,最初的开始和最终的结局都是一样,但同生为石,有的石头胸怀飞翔的梦,同生为人,有人却有凌云之志.这什么我们不能像那块石头一样拥有飞翔之志?一个人的目标定得高,他就必须付出更多的汗水,即使经过全力打拼不能实现目标,至少也比目标定得低的人走得远,实现得多.林肯总结自已的一生的经历得出这样的结论:自然界的喷泉的高度不会超过它的源头,一个人最终能取得的成就不会超过他的信念.我们的先辈在经历或目睹了太多的翱翔或匍匐之后,意味深长的告诉我们这样的哲理!取法乎上,仅得其中;取法乎中,仅得其下;取法乎下,一无所得!</span></span></span></p><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"></span></span></span></p><section class="135editor"><section class="135editor"><section style="width:100%;background-color: rgb(0,0,0);border: 1px solid #dbdbdb;margin: 0;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZibmWrdhRUKc0dWPqrT0RtEib6WrcY7icq19Wc7FovibibcdtAU0Da7uHgIg/0" style="margin-top:50px; width:100%" title="" vspace="0"><section class="135brush" data-style="margin: 5px 0px; font-size: 20px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;"><p style="margin: 5px 0px; font-size: 24px; padding: 2px 10px 2px; color: rgb(255, 255, 255); text-align: center; line-height: normal;">壮志凌云，翱翔天际</p></section><p style="margin: 5px 0px; padding: 3px 10px 2px; color: rgb(255, 255, 255); text-align: right; line-height: normal;"><span style="font-size:18px"></span></p></section></section><fieldset style="border: 0px; margin-bottom: 0.5em; width: 100%; clear: both; overflow: hidden;"><section style="display: inline-block; font-size: 2em; z-index: 100; padding: 0.1em 0.5em; margin-top: -1.5em; line-height: 1.2; float: right; text-align: right; font-weight: inherit; text-decoration: inherit; color: inherit; border-color: rgb(249, 110, 87); background-color: rgb(248, 247, 245);"><section><section>壮志</section></section></section></fieldset></section><p style="font-family: sans-serif; font-size: 15.5555562973022px; line-height: normal; white-space: normal;"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; font-size:14px; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap"><span style="color:rgb(51, 51, 51); font-family:microsoft yahei; line-height:28px; white-space:pre-wrap">志存高远吧！壮志凌云吧！让我们拥有一个值得一生为之拼搏的高远志向吧！不在攻蓬蒿间低低飞舞，敢上青天与鲲鹏比翼，摈弃燕雀屋檐下的廉价欢悦，勇敢地飞上高空接受风雨雷电的洗礼吧．为理想拼搏，向人生的高空展翅飞翔。</span></span></span><br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><section class="135editor"><section class="135editor"></section></section><p style="white-space: normal;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0"></p><section class="135editor"><fieldset class="135editor"><section style="box-sizing: border-box; width: 65%; float: right; padding: 0px 0px 0px 0.1em;"><img _width="100%" alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPiazjsibqzMEbFXfnLK8n31vaxjZefKCJItYVoDUBOKtqBsScQuzibtsJzGiayeB6VicnBFz07tTbPDnEg/0" style="box-sizing:border-box; height:auto !important; visibility:visible !important; width:100% !important" title="" vspace="0"></section><section style="display: inline-block; width: 35%; box-sizing: border-box; float: right; padding: 0px 0.1em 0px 0px; text-align: right;"><section style="box-sizing: border-box; margin-right: 4px; padding: 4px 6px; border-bottom-width: 1px; border-bottom-style: solid; font-size: 18px;font-weight: bold;color: rgb(52, 54, 60); border-color: black;">135编辑器</section><p>你还没有使用吗？</p><p><span style="line-height:1.6em">“秒刷”在手</span></p><p>早下班，</p><p>早回家。</p></section></fieldset></section><p><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjEIibB1UYw1VMPzscNxReKZVxEh23qB9KgPqFq3uoyBy3M93PcFOunrvjkYVrtfvXMworbBuWAZ4A/0"></p></div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150228/16423.html" target="_blank">短篇散文模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-16423-view_nums">1338</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="16423" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',16423,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-16423-favor_nums">386</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		</div><!-- end style-list -->
				</div>
		    	
    			<div class="col-md-6">
				<div class="style-list clearfix" id="editor-style-13433"><!-- start style-list -->
		<div class="content">
			 <!-- template && $item['coverimg'] -->
						<div class="pr">
							<img src="http://img.wx135.com/135editor/tpl_covors/13433.jpg" title="春联模板" class="template-cover" data-id="13433" style="max-width:100%;min-height:200px;" data-original="http://img.wx135.com/135editor/tpl_covors/13433.jpg" alt="">						</div>
						<div class="editor-style-content hidden" data-name="春联模板" id="template-13433"><section class="135editor" style="border: 1px dotted rgb(218, 98, 71); padding: 2px;">
<section class="135brush" style="border-color: rgb(33, 33, 34); color: rgb(255, 255, 255); border-radius: 4px; margin: 10px 0px; padding: 15px; background-color: rgb(33, 33, 34);">
<p style="color: inherit;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(195, 39, 43); margin-top: 0.8em; margin-bottom: 0.3em; text-align: center;"><img src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPjhXdiaw8ibquYYw8MI1InGKpjBDKBeTndywvia3C1akicvEpCMjicefLbcDNlPdnhhgCuSWctrwndZquQ/0" style="border:0px rgb(195, 39, 43); color:inherit; display:inline-block; height:auto !important; visibility:visible !important; width:100% !important">
<section style="display: inline-block; width: 20%; vertical-align: top; margin-left: 10%; margin-top: -8em; color: inherit;">
<section class="135bg" data-original-title="" style="width: 5em; height: 5em; border-radius: 50%; padding-top: 0.5em; color: inherit; max-width: 5em !important; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhH6n4nvXuic2Qh5ul4PG88JicvW9XDfU4EZqupddcQdqeb9SUZFDV4VlvYaLvBKXBkkBUH2o3zGYSA/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;" title="">
<section style="width: 4em; height: 4em; margin-right: auto; margin-left: auto; border: 1px solid rgb(255, 255, 255); border-radius: 50%; color: inherit;"></section>
</section>

<section style="width: 1px; height: 3em; border-left-width: 0.1em; border-left-style: solid; border-color: rgb(255, 255, 255); margin-top: -0.5em; margin-left: 2.5em; color: inherit;"></section>

<section style="width: 5em; padding: 0.5em; text-align: center; color: rgb(252, 237, 238); height: auto !important; background-color: rgb(164, 0, 0);">
<section style="width: 1px; height: 0.5em; border-left-width: 0.1em; border-left-style: solid; border-color: rgb(255, 255, 255); margin-top: -0.5em; margin-left: 2em; color: inherit;"></section>

<section style="width: 100%; height: 100%; border: 1px solid rgb(255, 255, 255); padding: 0.5em; color: inherit;">
<section style="width: 1em; display: inline-block; vertical-align: top; margin-right: 0.5em; font-size: 112.5%; font-family: inherit; font-weight: inherit; text-align: left; text-decoration: inherit; color: inherit;">
<section class="135brush" data-brushtype="text" style="color: inherit;"><span style="font-family:inherit">羊年大吉</span></section>
</section>
</section>
</section>
</section>

<section style="display: inline-block; width: 54%; vertical-align: top; margin-top: 0.5em; margin-left: 14px; line-height: 1.5em; font-size: 87.5%; font-weight: inherit; text-decoration: inherit; color: rgb(153, 153, 153);">
<section class="135brush" style="color: rgb(164, 0, 0);">
<p><strong><span style="font-size:20px">祝愿大家</span></strong></p>

<p><strong><span style="font-size:20px">春节快乐</span></strong></p>

<p><strong><span style="font-size:20px">万事如意</span></strong></p>

<p><strong><span style="font-size:20px">合家欢乐</span></strong></p>

<p><strong><span style="font-size:20px">赚钱多多</span></strong></p>
</section>
</section>
</fieldset>
</section>

<p>&nbsp;</p>

<section class="135editor">
<h2 class="135brush" placeholder="请输入标题" style="border-left-width: 5px; border-left-style: solid; border-left-color: rgb(172, 29, 16); font-size: 16px; font-weight: bold; line-height: 32px; color: rgb(102, 102, 102); padding: 5px 10px; margin: 10px 0px;"><span style="color:rgb(192, 0, 0); font-size:24px">春联</span></h2>
</section>

<p><span style="font-size:12px">据说贴春联的习俗，大约始于一千多年前的后蜀时期，这是有史为证的。此外根据《玉烛宝典》，《燕京岁时记》等著作记载，春联的原始形式就是人们所说的“桃符”。</span></p>

<p>&nbsp;</p>

<p><span style="font-size:12px; line-height:1.6em">在中国古代神话中，相传有一个鬼域的世界，当中有座山，山上有一棵覆盖三千里的大桃树，树梢上有一只金鸡。每当清晨金鸡长鸣的时候，夜晚出去游荡的鬼魂必赶回鬼域。鬼域的大门坐落在桃树的东北，门边站着两个神人，名叫神荼、郁垒。如果鬼魂在夜间干了伤天害理的事情，神荼、郁垒就会立即发现并将它捉住，用芒苇做的绳子把它捆起来，送去喂虎。因而天下的鬼都畏惧神荼、郁垒。于是民间就用桃木刻成他们的模样，放在自家门口，以避邪防害。后来，人们干脆在桃木板上刻上神荼、郁垒的名字，认为这样做同样可以镇邪去恶。这种桃木板后来就被叫做“桃符”。</span></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<section class="135editor">
<section style="text-align:center;margin-bottom:10px">
<section style="padding: 5px; width: 60%; display: inline-block; background: rgb(165, 0, 3);">
<section data-style="color:#FFF;font-size:24px;weight:bold;" style="border:1px solid #FFF;padding:10px 20px;">
<p style="color: rgb(255, 255, 255); border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(165, 0, 3);"><span class="135brush" data-brushtype="text" style="font-size:24px">辞旧迎新</span></p>
</section>
</section>
</section>

<section style="color: rgb(255, 255, 255); width: 100%; text-align: center;">
<section style="width: 48%; display: inline-block; float: left; color: inherit;">
<section style="width: 5em; padding: 0.5em; color: rgb(252, 237, 238); height: auto !important; background-color: rgb(164, 0, 0);">
<section style="width: 100%; height: 100%; border: 1px solid rgb(255, 255, 255); padding: 0.5em; color: inherit;">
<section style="width: 1em; display: inline-block; vertical-align: top; margin-right: 0.5em; margin-left: 0.5em; font-size: 112.5%; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: inherit;">
<section class="135brush" data-brushtype="text" style="color: inherit;">旧岁又添几个喜</section>
</section>
</section>
</section>
</section>

<section style="margin-left: 4%;width: 48%; display: inline-block;color: inherit;">
<section style="width: 5em; float: right; padding: 0.5em; color: rgb(252, 237, 238); height: auto !important; background-color: rgb(164, 0, 0);">
<section style="width: 100%; height: 100%; border: 1px solid rgb(255, 255, 255); padding: 0.5em; color: inherit;">
<section style="width: 1em; display: inline-block; vertical-align: top; margin-right: 0.5em; margin-left: 0.5em; font-size: 112.5%; font-family: inherit; font-weight: inherit; text-decoration: inherit; color: inherit;">
<section class="135brush" data-brushtype="text" style="color: inherit;">新年更上一层楼</section>
</section>
</section>
</section>
</section>
</section>
</section>

<p>&nbsp;</p>

<section class="135editor"></section>

<p><span style="font-size:12px">到了宋代，人们便开始在桃木板上写对联，一则不失桃木镇邪的意义，二则表达自己美好心愿，三则装饰门户，以求美观。又在象征喜气吉祥的红纸上写对联，新春之际贴在门窗两边，用以表达人们祈求来年福运的美好心愿。</span></p>

<p>&nbsp;</p>

<p><span style="font-size:12px">为了祈求一家的福寿康宁，一些地方的人们还保留着贴门神的习惯。据说，大门上贴上两位门神，一切妖魔鬼怪都会望而生畏。在民间，门神是正气和武力的象征，古人认为，相貌出奇的人往往具有神奇的禀性和不凡的本领。他们心地正直善良，捉鬼擒魔是他们的天性和责任，人们所仰慕的捉鬼天师钟馗，即是此种奇形怪相。所以民间的门神永远都怒目圆睁，相貌狰狞，手里拿着各种传统的武器，随时准备同敢于上门来的鬼魅战斗。由于我国民居的大门，通常都是两扇对开，所以门神总是成双成对。</span></p>

<p>&nbsp;</p>

<p><span style="font-size:12px">唐朝以后，除了以往的神荼、郁垒二将以外，人们又把秦叔宝和尉迟恭两位唐代武将当作门神。相传，唐太宗生病，听见门外鬼魅呼号，彻夜不得安宁。于是他让这两位将军手持武器立于门旁镇守，第二天夜里就再也没有鬼魅搔扰了。其后，唐太宗让人把这两位将军的形象画下来贴在门上，这一习俗开始在民间广为流传。</span></p>

<p style="color: inherit;">&nbsp;</p>

<section class="135editor">
<fieldset style="border: none rgb(195, 39, 43); margin: 0.8em 0px 0.3em; box-sizing: border-box; padding:0px;"><img alt="" border="0" src="https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhH6n4nvXuic2Qh5ul4PG88JicvW9XDfU4EZqupddcQdqeb9SUZFDV4VlvYaLvBKXBkkBUH2o3zGYSA/0" style="border:0px rgb(195, 39, 43); box-sizing:border-box; color:inherit; display:inline-block; height:auto !important; visibility:visible !important; width:100% !important" title="" vspace="0">
<section style="display: inline-block; width: 20%; vertical-align: top; margin-left: 6%; margin-top: -6em; box-sizing: border-box; color: inherit;">
<section class="135bg" data-original-title="" style="width: 5em; height: 5em; padding-top: 0.5em; box-sizing: border-box; color: inherit; max-width: 5em !important; background-image: url(https://mmbiz.qlogo.cn/mmbiz/cZV2hRpuAPhH6n4nvXuic2Qh5ul4PG88J3v5sPZBuuj7NE7Lwt2aSlJRTbfXDgQXXBcw04qcr8mSOydWGWsUnHQ/0); background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;" title="">
<section style="width: 4em; height: 4em; margin: 0px auto; border: 1px solid rgb(255, 255, 255); border-top-left-radius: 50%; border-top-right-radius: 50%; border-bottom-right-radius: 50%; border-bottom-left-radius: 50%; box-sizing: border-box; color: inherit;"></section>
</section>
</section>
</fieldset>
</section>

<p style="text-align: left;"><span style="font-size:24px"><strong><span style="color:rgb(192, 0, 0)">完</span></strong></span></p>
</section>
</section>

<p>&nbsp;</p>
</div>
						</div><!-- end content -->
					<div class="tools clearfix">
				<div class="title">
					<span><a href="/editor_styles/20150215/13433.html" target="_blank">春联模板</a></span>
					<span> <!--<span class="ui-stats-num" id="Stats-EditorStyle-13433-view_nums">1585</span></span>-->
											<a href="javascript:void(0);" data-toggle="tooltip" data-container="body" data-placement="top" class="btn-favorite pull-right" data-model="EditorStyle" data-id="13433" title="收藏后请前往【模板】&gt;【收藏模板】查看" onclick="addtofavor('EditorStyle',13433,this);"><i class="fa fa-heart-o"></i> <span style="font-size:13px;line-height:24px;">收藏(<span class="ui-stats-num" id="Stats-EditorStyle-13433-favor_nums">654</span>)</span></a>
									</span></div>
				<!--  -->
				
				   
			</div><!-- end tools -->
		 <div class="origin" style="background:#ed603a;">原创</div> </div><!-- end style-list -->
				</div>
		    		</div>
	</div></div>					
				  </div>	
          </div>
        </div>
        <!-- 展示区 结束 -->
        <!-- 编辑器 开始 -->
        <div class="w3 fl">
          <div class="editor1 fl">
          	
          </div>
          <div class="editor2 p-r fl"><!--editor2 start-->
            <!-- <textarea class="editorBox" name="" id="" cols="30" rows="10"></textarea>-->
            <form action="" class="form-horizontal editorBox" role="form" target="_blank" id="WxMsgViewForm" method="post" accept-charset="utf-8">
		            <script id="WxMsgContent" type="text/plain" style="width:500px;height:470px;"></script>
		            <input type="hidden" name="template_id" id="template_id" />
				<input type="hidden" name="template_name"  id="template_name"/>
				<input type="hidden" name="msg_id" />
		            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
				        <h4 class="modal-title">保存模板</h4>
				      </div>
				      <div class="modal-body">
				        <p><input type="text" placeholder="请输入模板名称后点击保存" name="template_name" id="dialog-template-name" class="form-control"></p>
				        <p><label><input type="checkbox" name="push_tpl_center" value="1">发布到模板中心(不勾选时存为私人模板)</label> <a href="/audit-rules.html" target="_blank">审核规则</a> </p>
				        <p><label id="auto_cover_tpl" class="hidden"><input type="checkbox" name="auto_cover_tpl" value="1">覆盖原有模板</label></p>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				        <button type="button" id="dialog-save-template" class="btn btn-primary">保存</button>
				      </div>
				    </div><!-- /.modal-content -->
				  </div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
			
			<!-- 编辑器额外工具栏 开始 -->
            <div class="editorslide">
              <ul>
                <li><a href="javascript:;" id="copy-editor-html" class="btn btn-danger btn-xs" data-toggle="tooltip" data-placement="right" title="复制内容"><i  class="fa fa-copy"></i> 复制</a></li>
                <li><button type="button" id="save-as-template" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="right" title="存为模板"><i class="fa fa-save"></i> 保存</button></li>               
                <li><a href="javascript:;" id="clear-editor" class="btn btn-default btn-xs" data-toggle="tooltip" data-placement="right"  title="清空内容" ><i class="fa fa-trash"></i> 清空</a></li>
                <!-- <li><button type="button" id="html-to-image" class="btn btn-default btn-xs"  data-toggle="tooltip" data-placement="right"  title="长微博图文"><i  class="fa fa-image"></i> 长图</button></li> -->                
                <li><a href="javascript:;"id="html-more-popover"  data-container="#more-popover" data-toggle="popover" data-placement="right" data-content="更多操作"  class="btn btn-default btn-xs" ><i class="fa fa-ellipsis-h" ></i> 更多</a></li>                            
              </ul>
            </div>
            <!-- 编辑器额外工具栏 结束 -->
            </form>
          </div><!--editor2 end-->
        </div>
        <!-- 编辑器  结束 -->
      </div>

    </div><!--box end-->
  </div>
<!-- 更多... 开始 -->
<div  id="more-popover">
	<small  id="more-popover-content" style="margin-right:30px;display:none;">
					 <button class="btn btn-default btn-xs" id="set-image-radius"> 图片圆形  </button>
					 <button class="btn btn-default btn-xs" id="set-image-border"> 图片边框 </button>				 
					 <button class="btn btn-default btn-xs" id="flat-strip-radius"> 去圆角</button>
					 <button class="btn btn-default btn-xs" id="flat-add-radius"> 加圆角</button>
					 <button class="btn btn-default btn-xs" id="flat-strip-border"> 去边框</button>
						<!--  <button class="btn btn-default btn-xs" id="flat-add-border"> 加边框</button>  -->
					 <button class="btn btn-default btn-xs" id="flat-strip-shadow"> 去阴影 </button>
					 <button class="btn btn-default btn-xs" id="flat-add-shadow"> 加阴影 </button>						
					 <button class="btn btn-default btn-xs" id="135-random-color">随机换色</button>
	</small>
</div>
<!-- 更多... 结束 -->

<!-- 配色方案  开始 -->
<section id="color-plan" style="width:120px;position:fixed;top:58px;right:-5px;height:320px;text-align: center;">
	<div class="panel panel-primary" style="border:0 none;background: transparent;">
	  <div class="panel-heading"  style="background:rgba(58,51,50,0.8);border:0 none;color:#dad9d8;height: 52px;padding: 15px;"><h3 class="panel-title">配色方案</h3></div>
	  <div class="panel-body" style="padding:0;background:rgba(58,51,50,0.5);">
	    <ul class="clearfix" style="list-style:none;padding:10px 10px;margin:0 0;">
            <li class="color-swatch" style="background-color: #ac1d10"></li>
            <li class="color-swatch" style="background-color: #d82821;"></li>
            <li class="color-swatch" style="background-color: #ef7060;"></li>
            <li class="color-swatch" style="background-color: #fde2d8;"></li>
           
            <li class="color-swatch" style="background-color: #d32a63;"></li>
            <li class="color-swatch" style="background-color: #eb6794;"></li>
            <li class="color-swatch" style="background-color: #f5bdd1;"></li>            
            <li class="color-swatch" style="background-color: #ffebf0;"></li>                  
            
            <li class="color-swatch" style="clear:left;background-color: #e2561b;"></li>
            <li class="color-swatch" style="background-color: #ff8124;"></li>
            <li class="color-swatch" style="background-color: #fcb42b;"></li>
            <li class="color-swatch" style="background-color: #feecaf;"></li>
            
            <li class="color-swatch" style="clear:left;background-color: #0c8918;"></li>
            <li class="color-swatch" style="background-color: #80b135;"></li>
            <li class="color-swatch" style="background-color:#c2c92a;"></li>
            <li class="color-swatch" style="background-color:#e5f3d0;"></li>
            
            <!-- <li class="color-swatch" style="clear:left;background-color: #1f877a;"></li>
            <li class="color-swatch" style="background-color: #27abc1;"></li>
            <li class="color-swatch" style="background-color: #5acfe1;"></li>
            <li class="color-swatch" style="background-color: #b6f2ea;"></li> -->
            
            <li class="color-swatch" style="clear:left;background-color:#374aae;"></li>
            <li class="color-swatch" style="background-color:#1e9be8;"></li>
            <li class="color-swatch" style="background-color:#59c3f9;"></li>
            <li class="color-swatch" style="background-color:#b6e4fd;"></li>

            <li class="color-swatch" style="clear:left;background-color:#5b39b4;"></li>
            <li class="color-swatch" style="background-color: #4c6ff3;"></li>
            <li class="color-swatch" style="background-color:#91a8fc;"></li>
            <li class="color-swatch" style="background-color:#d0dafe;"></li>
            
            <!-- 紫色 -->
            <li class="color-swatch" style="clear:left;background-color:#8d4bbb;"></li>
            <li class="color-swatch" style="background-color: rgb(166, 91, 203);"></li>
            <li class="color-swatch" style="background-color:#cca4e3;"></li>
            <li class="color-swatch" style="background-color: rgb(190, 119, 99);"></li>
            
            <li class="color-swatch" data-color="#efefef" style="clear:left;background-color:#3c2822;"></li>
            <li class="color-swatch" style="background-color:#6b4d40;"></li>
            <li class="color-swatch" style="background-color:#9f887f;"></li>
            <li class="color-swatch" style="background-color:#d7ccc8;"></li>
            
        	<li class="color-swatch" style="background-color: #212122;"></li>
        	<li class="color-swatch" style="background-color: #757576;"></li>
        	<li class="color-swatch" style="background-color: #c6c6c7"></li>
        	<li class="color-swatch" style="background-color: #f5f5f4"></li>
        	
        </ul>
        <div style="margin:5px 15px;color:#dad9d8;line-height:32px;text-align: center;position:relative;" >
        	<input id="Side-ColorPicker"  class="colorPicker form-control" style="font-size:12px;width:90px;padding:4px 8px 4px 18px;height:24px;line-height:16px" id="custom-color" value="#B6BD79" />
        	<i title="选择要调色的样式或者勾选“全文换色”后可进行换色" data-toggle="tooltip" data-container="body" data-placement="left"  style="position:absolute;left:5px;color:#333;cursor:pointer;top:5px;" class="fa fa-question-circle"></i>
        </div>
        <hr style="margin:2px 20px;border-color:#453d3b;"/>
        <div style="margin:5px 15px;color:#dad9d8;line-height:32px;text-align: center;"><label style="cursor:pointer;"><input style="margin-top:8px;" type="checkbox" id="replace-color-all" value="1"> 全文换色</label></div>
	  </div>
	</div>        
</section>
<!-- 配色方案  结束 -->

<!-- 首次打开提示  开始 -->
<div class="modal fade" id="feedsModal" tabindex="-1" role="dialog"  aria-hidden="true">
  <div class="modal-dialog"  style="width:640px;margin-top:120px;">
    <div class="modal-content">
      <div class="modal-header" style="border:0 none">
      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
        <h4 class="modal-title text-center">“秒刷”，排版可以很简单</h4>
      </div>
      <div class="modal-body text-center" id="template-modal-body">
        <p><a href="http://www.135editor.com/books/chapter/1/16" onclick="$('#feedsModal').modal('hide');return true;" target="_blank"><img src="http://img.wx135.com/135editor/tpl/miaoshua.gif"></a></p><br/>
        <a href="http://www.135editor.com/books/chapter/1/16" onclick="$('#feedsModal').modal('hide');return true;" target="_blank" class="btn btn-default" style="background:#3a3332;color:#f8f5ef;padding:10px 50px;">新技能get起来</a>
      </div>
      <div class="modal-footer text-right">
      		<a href="javascript:;" data-dismiss="modal" onclick="window.localStorage.loadFeeds = 'false';">我知道了，不再显示</a>
      		
    
      	<!-- <label><input type="checkbox" id="load-template-modal" checked="checked">每次都自动弹出模板选择窗口</label>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button> -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<!-- 首次打开提示  结束 -->

<script type="text/javascript" src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
<script type="text/javascript" src="<c:url value='/ueditor/ueditor.all.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/cache/dd42cb832b.js'/>"></script>
<script>
//window.localStorage.loadFeeds = 'true';

function openFeedsModal(){
	$('#feedsModal').modal('show');
}

$(function(){
	
	setTimeout(function(){
		$('#qrcode-pannel').fadeOut();;
	},30000);	
	//var html = $('#insert-style-list').html();
	//$('#insert-style-list').html(parseHtml(html,"rgb(255, 129, 36)","#FFF"));
	
	
	$(window).resize(function(){
		var win_height = $(window).height();
		$('#full-page').height(win_height);
		var area_height = win_height-165;
		
		if(area_height > 800){
			area_height = 800;
		}
		
		$('#WxMsgContent,.edui-editor-iframeholder').height(area_height-8);
		$('.item,.n1-1').height(area_height);
		
		$('.editor2').height(area_height);
	}).trigger('resize');
	
	$('.autonum').on('mousewheel', function(event) {
		if(event.deltaY < 0) { //向下滚动
			$(this).html( parseInt($(this).html()) - 1);
		}
		else{
			$(this).html( parseInt($(this).html()) + 1);
		}
	    return false;
	}).tooltip({'title':'上下滚动鼠标，可调整序号大小',container: 'body'});
	
	
	current_editor = UE.getEditor('WxMsgContent');
	
		
	current_editor.ready(function(){
		//current_editor.addListener('ready', resetHandler);
		setTimeout(function(){
				//current_editor.execCommand('drafts');
				current_editor.execCommand( 'focus' );
				var editor_document = current_editor.selection.document;
				if( window.localStorage){ // 本地临时存储编辑器内容
					if(typeof window.localStorage._135content != "undefined"){
						//alert(window.localStorage._135content);
						setEditorHtml(window.localStorage._135content);
						$(editor_document).find('.135editor').each(function(){
							$(this).removeAttr('style');
						});
					}
					setInterval(function(){
						window.localStorage._135content = getEditorHtml();
					},10000);			
				}
		},100);
        
	});
	window.onbeforeunload = function(event){
		var html = getEditorHtml();
		if(html != ""){
			if( window.localStorage){
				localStorage._135content = html;
			}
			event.returnValue = "即将离开页面，是否确认编辑的内容已使用并废弃？";   
		}
	}
	
	//$('#html-more-popover').data('content',$('#more-popover-content').html());
	$('#html-more-popover').popover({trigger:"hover"}).on('shown.bs.popover', function () {
		var $this = $(this);
		$('#more-popover .popover-content').html($('#more-popover-content').html());
	})
	
	$('.editor-template-list').mixItUp({
    	layout:{display:'block'},
    	callbacks:{}
    });
	
	//$('#left-side-affix').width($('#left-sidebar').width());
	$('.popover-trigger').popover({trigger:"hover"});
	$('#btn-help').popover();
	$('#editor-type-pop').popover({
	  trigger: 'hover'
	});
	
	
});
</script>

   	<!--[if lt IE 9]>
          <script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
 	  <![endif]-->
<script type="text/javascript" src="<c:url value='/resources/cache/b7422eb402.js'/>"></script> 	  
<script type="text/javascript" src="<c:url value='/resources/js/less-1.7.0.min.js'/>"></script> 
<script type="text/javascript" src="<c:url value='/resources/js/ZeroClipboard/ZeroClipboard.min.js'/>"></script> 
	
<script>
var less_parser = new less.Parser;
var zeroClipHelperClient;

ZeroClipboard.config( { swfPath: "<c:url value='/resources/js/ZeroClipboard/ZeroClipboard.swf'/>" } );

$(function(){
	

	// var $colors = jsColorPicker('.colorPicker',{
	$('.colorPicker').colorPicker({
	    customBG: '#222',
	    init: function(elm, colors) { // colors is a different instance (not connected to colorPicker)
	      elm.style.backgroundColor = elm.value;
	      elm.style.color = colors.rgbaMixCustom.luminance > 0.22 ? '#222' : '#ddd';
	    }
	    /*,displayCallback:function(colors, mode, options){
	    	setBackgroundColor($(this).val(),'#FFF', 'all');
	    }*/
	});
	
	
	
	$(document).on('click','#flat-strip-shadow',function(){
		var html = getEditorHtml();
		var obj = $('<div>'+html+'</div>');
		obj.find('*').css('box-shadow','');
		var newHtml = obj.html();
		setEditorHtml(newHtml);
	});
	
	$(document).on('click','#flat-add-shadow',function(){
		var html = getEditorHtml();
		var obj = $('<div>'+html+'</div>');
		
		obj.find('*').each(function(){			
					if( $(this).css('background-color') == 'transparent' ||  $(this).css('background-color') == '' ){
					}
					else{
						$(this).css('box-shadow','rgba(205, 205, 205,0.9) 2px 3px 2px');
					}
		});
		obj.find('hr').each(function(){
			$(this).css('box-shadow','rgba(205, 205, 205,0.9) 1px 1px 2px');
		})
		var newHtml = obj.html();
		setEditorHtml(newHtml);
	});	
	
	
	$(document).on('click','#set-image-radius',function(){
		var html = getDealingHtml();	
		var obj = $('<div>'+html+'</div>');
		obj.find('img').css('border-radius','50%');
		setDealingHtml(obj.html())
		obj = null;
	});
	$(document).on('click','#set-image-border',function(){
		var html = getDealingHtml();	
		var obj = $('<div>'+html+'</div>');
		obj.find('img').css({"background-color":"#fff","border-radius":"4px","max-width":"100%","padding":"4px","border":"1px solid #ddd"});
		setDealingHtml(obj.html())
		obj = null;
	})
	
	$(document).on('click','#flat-add-radius',function(){
		var html = getDealingHtml();	
		var obj = $('<div>'+html+'</div>');
		obj.find('*').each(function(){
			if( $(this).css('background-color') != 'transparent' &&  $(this).css('background-color') != '' ){
				$(this).css('border-radius','4px');
			}			
		});
		setDealingHtml(obj.html())
		obj = null;
	});
	
	$(document).on('click','#flat-strip-radius',function(){
		var html = getDealingHtml();	
		var obj = $('<div>'+html+'</div>');
		obj.find('*').css('border-radius','');
		setDealingHtml(obj.html())
		obj = null;
	});
	
	$(document).on('click','#flat-add-border',function(){
		var html = getDealingHtml();	
		var obj = $('<div>'+html+'</div>');
		obj.find('*').each(function(){
			if( $(this).css('background-color') != 'transparent' &&  $(this).css('background-color') != '' ){
				$(this).css('border','1px solid #efefef');
			}			
		});
		//obj.find('.135editor').css('border','1px solid #efefef');
		setDealingHtml(obj.html())
		obj = null;
	});
	$(document).on('click','#flat-strip-border',function(){
		var html = getDealingHtml();	
		var obj = $('<div>'+html+'</div>');
		
		obj.find('*').each(function(){
			//if( $(this).css('background-color') == 'transparent' ||  $(this).css('background-color') == ''  ){
			//}
			//else{
				$(this).css('border','');
				$(this).css('border-width','0');
			//}
		});
		
		setDealingHtml(obj.html())
		obj = null;
	})

	$(document).on('click','#insert-style-list .ui-portlet-list > li',function(){
		//data-135editor=\"true\"
		//多插入一个空行，防止有时无法选择到底部了，或者两个元素中间不方便插入内容。
		
		if($(this).hasClass('ignore')){
			return false;
		}
		
		var ret = false;
		var num = parseInt($(this).find('.autonum:first').text());
		
		if(typeof num != "undefined") {
			$(this).find('.autonum:first').find('.autonum:first').text(num+1);
		}
		var style_item = $(this).find('.135editor:first');
		var id = $(this).data('id');
		
		if(style_item.size()){
			// insertHtml( $(this).html() + "<p>&nbsp;</p>"); 包含收藏夹的删除按钮等 
			ret = insertHtml("<section data-id=\""+id+"\" class=\"135editor\">" + style_item.html() + "</section><p><br/></p>"); 
		}
		else{ //最外围包装135editor容器
			ret = insertHtml("<section data-id=\""+id+"\" class=\"135editor\">" + $(this).html() + "</section><p><br/></p>"); 
		}
		
		if(ret){			
			if(typeof num != "undefined") {
				$(this).find('.autonum:first').text(num+1);
			}
			style_click($(this).data('id'));
		}
		
	});

	$('.color-swatch').click(function(){
		$('.color-swatch').removeClass('active');
		$(this).addClass('active');
		var color = $(this).data('color'); //data-color为前景色，bgcolor为背景色，或者无背景文字的前景色
		var bgcolor = $(this).css('backgroundColor');
		if(!color)  color = '#FFF';
		setBackgroundColor(bgcolor,color, true);
		if( ! current_active_135item ) {
			$('.editor-template-list li > .135editor').each(function(){
				parseObject($(this),bgcolor,color);
			})
		}
	});
	
	$(document).on('click','#135-random-color',function(){
		var html = getDealingHtml();	
		var obj = $('<div>'+html+'</div>');
		var bgcolors = ['#5BB75B','#2E8BCC','#F09609','#E51400','#7B4F9D','#E671B8','#008641','#20608E','#FFC40D'];
		
		var rd = Math.floor(Math.random() * ( bgcolors.length));
		var used = [];
		var current_bgcolor = bgcolors[rd];
		var components = obj.find('.135editor').each(function(i){
			if(i%random_color_step == 0){
				do
				{
					rd = Math.floor(Math.random() * ( bgcolors.length));
				}
				while(jQuery.inArray(rd,used) != -1);
				
				used[used.length] = rd;
				if( used.length == bgcolors.length ){
					used = [];
				}				
				
				current_bgcolor = bgcolors[rd];
			}
			$(this).html(parseHtml($(this).html(),current_bgcolor,current_select_color));
		});
		
		setDealingHtml(obj.html())
		obj = null;
	});
	
	$('#tab-tpl-trigger').click(function(){
		if($('#editor-tpls-list').html()==""){
			$('#editor-tpls-list').html('正在加载').load('/editor_styles/myTemplates?suffix=-1 #tpl-tab-content',function(){
				$('#editor-tpls-list').find('.col-md-3').removeClass('col-md-3').addClass('col-md-6');
				/*if( $('#favorite-tpl-list-1').find('.editor-style-content').size() ==0 ){
					$('#favorite-tpl-list-li').remove();
				}
				if( $('#personal-tpl-list-1').find('.editor-style-content').size() ==0 ){
					$('#personal-tpl-list-li').remove();
				}*/
				$('#editor-tpls-navtab a:first').tab('show');				
			})
		}		
	})
	
	$('#clear-editor').click(function(){
		if(confirm('是否确认清空内容，清空后内容将无法恢复')){
			setEditorHtml("");
		}		
	});
	
	$('#load-template-modal').click(function(){		
		if( window.localStorage){ // 是否打开选择模板的弹窗			
			if(this.checked){
				window.localStorage.loadFeeds = "true";
			}
			else{
				window.localStorage.loadFeeds = "false";
			}
		}
	})
	
	if(typeof localStorage.loadFeeds == "undefined" ||  window.localStorage && window.localStorage.loadFeeds == "true")
	{
		openFeedsModal();
	}
	else{
		$('#load-template-modal').attr('checked',false);
	}
	
	
	$(document).on('click','#tpl-tab-content .editor-style-content',function(){ //选中模板后设置编辑器的内容		
		setEditorHtml($(this).html());
	
		var id = parseInt($(this).data('id'));
		if(id > 0){
			$('#template_id').val( id );
			$('#auto_cover_tpl').removeClass('hidden');
		}
		else{
			$('#template_id').val('');
			$('#auto_cover_tpl').addClass('hidden');
		}
		
		$('#template_name').val($(this).data('name'));
		$('#dialog-template-name').val($(this).data('name'));
		$('#feedsModal').modal('hide');
	});
	
	$(document).on('click','#tpl-tab-content .template-cover',function(){ //选中模板后设置编辑器的内容	
		var tid = $(this).data('id');
		var obj = $('#template-'+tid);
		
		setEditorHtml(obj.html());
		
		var id = parseInt(obj.data('id'));
		
		if(id > 0){
			$('#template_id').val(id);
			$('#auto_cover_tpl').removeClass('hidden');
		}
		else{
			$('#template_id').val('');
			$('#auto_cover_tpl').addClass('hidden');
		}
		
		$('#template_name').val(obj.data('name'));
		$('#dialog-template-name').val(obj.data('name'));
		$('#feedsModal').modal('hide');
	});
	
	
	$('#save-as-template').click(function(){
		saveTemplate(this.form);
	});
	
	$('#html-to-image').click(function(){
		this.form.action = '/downloads/htmlToImage';
		this.form.submit();
	});
	var client = new ZeroClipboard( $('#copy-editor-html') );
	
	zeroClipHelperClient = new ZeroClipboard();
	
	zeroClipHelperClient.on( 'ready', function(event) {
		zeroClipHelperClient.on( 'copy', function(event) {
	  		event.clipboardData.setData('text/html', getDealingHtml());
	  		event.clipboardData.setData('text/plain', getDealingHtml());
	  		//showSuccessMessage("已复制到剪切板");
		});
	});
	
	client.on( 'ready', function(event) {
		client.on( 'copy', function(event) {
	  		event.clipboardData.setData('text/html', getEditorHtml());
	  		event.clipboardData.setData('text/plain', getEditorHtml());
	  		showSuccessMessage("已成功复制到剪切板");
		});
	});
	
	if($.cookie('bgimg')) {
		$('#bg-img').attr('src',$.cookie('bgimg'));
	}

	$('#bg-choose .chooser').click(function(){
		$('#bg-img').attr('src',$(this).data('url'));
		$.cookie('bgimg',$(this).data('url'));
	});
	
	$('#bg-choose .default').click(function(){
		$('#bg-img').removeAttr('src',"");
		$.cookie('bgimg',null);
	});
	
	// client.on( 'error', function(event) {
	// 	ZeroClipboard.destroy();
	// } );
});

</script>
<div id="bg-choose" title="点击更换编辑器背景图" data-toggle="tooltip" data-placement="right" data-container="body" style="position:fixed;bottom:28px;left:0px;z-index:10;height:auto;width:30px;border:0;padding:0;background:rgba(58,51,50,0.5);">
	
	<div class="default" style="background:#c9b3a5;"></div>
	<div class="chooser" style="background:#584446;" data-url="http://img.wx135.com/135editor/tpl/bg.jpg"></div>
	<div class="chooser" style="background:#ba907b;" data-url="http://img.wx135.com/135editor/bg1.jpg"></div>
	<div class="chooser" style="background:#fcdebd;" data-url="http://img.wx135.com/135editor/bg2.jpg"></div>
	
	<div class="chooser" style="background:#b0bbb7;" data-url="http://img.wx135.com/135editor/bg3.jpg"></div>
</div>
<div id="zeroClipBoard-helper" class="hidden"></div>
<!-- <img src="http://img.wx135.com/135editor/tpl/bg.jpg" style="position:fixed;top:0px;left:0px;z-index:-1;height:100%;width:100%;border:0;">-->
<img id="bg-img" style="position:fixed;top:0px;left:0px;z-index:-2;height:auto;width:100%;border:0;">
</body>
</html>