<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path + "/";  
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频 -- 添加页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">

<link rel="stylesheet" href="<c:url value='/resources/uploadify/uploadify.css'/>" type="text/css"></link>  

<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>



<script type="text/javascript">

//防止客户端缓存文件，造成uploadify.js不更新，而引起的“喔唷，崩溃啦”  
document.write('<script type="text/javascript" '  
        + 'src="<c:url value="/resources/uploadify/jquery.uploadify-3.1.min.js?'+ new Date() +'"/>'  
        + ' "></s' + 'cript>'); 
document.write('<script type="text/javascript" charset="utf-8"'  
        + 'src="<c:url value="/ueditor/ueditor.config.js?'+ new Date() +'"/>'  
        + ' "></s' + 'cript>'); 
document.write('<script type="text/javascript" charset="utf-8"'  
        + 'src="<c:url value="/ueditor/ueditor.all.min.js?'+ new Date() +'"/>'  
        + ' "></s' + 'cript>');
document.write('<script type="text/javascript" charset="utf-8"'  
        + 'src="<c:url value="/ueditor/lang/zh-cn/zh-cn.js?'+ new Date() +'"/>'  
        + ' "></s' + 'cript>');

var videopath='';

$(function(){
	$("#module").change(function(){
		var index = window.document.getElementById("module").selectedIndex;
		var text = window.document.getElementById("module").options[index].text;
		$("#moduleAttribute").val(text);
	});
	
	$("#multiple_file_upload").uploadify({  
	    'uploader' : '<c:url value="/attachment/uploadVideo"/>',//************ action **************  
	    'height' : 18,//表示按钮的高度，默认30PX。若要改为50PX，如下设置：'height' : 50，  
	    'width' : 50,//表示按钮的宽度  
	    'buttonText' : '浏 览',//按钮上显示的文字，默认”SELECT FILES”  
	    'buttonCursor' : 'hand',//上传按钮Hover时的鼠标形状，默认值是’hand’  
	    'auto' : false, //是否自动开始     
	    'multi' : false, //是否支持多文件上传，默认为true  
	    'method' : 'post',//默认是’post’,也可以设置为’get’  
	    'swf' : '<c:url value="/resources/uploadify/uploadify.swf"/>',//进度条显示文件  
	    'cancelImg' : '<c:url value="/resources/uploadify/uploadify-cancel.png"/>',//取消按钮的图片  
	    'fileTypeDesc' : 'mp4',//允许上传的文件类型的描述，在弹出的文件选择框里会显示  
	    'fileTypeExts' : '*.mp4',//指定文件格式  
	    'fileSizeLimit' : '300MB',//上传文件大小限制，默认单位是KB，若需要限制大小在100KB以内，可设置该属性为：'100KB'  
	    'fileObjName' : 'video',//文件对象名称。用于在服务器端获取文件。
	    'formData' : {  
	        'entity' : 1
	    },  
	    'progressData' : 'percentage', // 'percentage''speed''all'//队列中显示文件上传进度的方式：all-上传速度+百分比，percentage-百分比，speed-上传速度  
	    'preventCaching' : true,//若设置为true，一个随机数将被加载swf文件URL的后面，防止浏览器缓存。默认值为true  
	    'timeoutuploadLimit' : 1,//能同时上传的文件数目  
	    'removeCompleted' : true,//默认是True，即上传完成后就看不到上传文件进度条了。  
	    'removeTimeout' : 2,//上传完成后多久删除队列中的进度条，默认为3，即3秒。  
	    'requeueErrors' : true,//若设置为True，那么在上传过程中因为出错导致上传失败的文件将被重新加入队列。  
	    'successTimeout' : 30,//表示文件上传完成后等待服务器响应的时间。不超过该时间，那么将认为上传成功。默认是30，表示30秒。  
	    'uploadLimit' : 999,//最多上传文件数量，默认999 
	    'queueSizeLimit':1,//队列最多显示的任务数量，如果选择的文件数量超出此限制，将会出发onSelectError事件。
	    'onUploadStart' : function(file) {  
	        //$("#file_upload").uploadify("settings", "formData", {'userName':name,'qq':qq});    
	        //$("#file_upload").uploadify("settings", "buttonText", "aaa");  
	        //alert(file.name + " is ready to go!")  
	        $("#stopUpload").removeAttr("hidden");  
	    },  
	    'onUploadSuccess' : function(file, data, response) {  
	        $("#stopUpload").attr("hidden",true); 
	        $('#' + file.id).find('.data').html(' 上传完毕');
	        
	        var dataJson = eval("("+data+")");
	        
	        alert('上传成功!');
	        
			$("#head_video").html("<video  id='example_video_1' class='video-js vjs-default-skin' controls preload='none' width='80%' "
					  +" poster ='"+dataJson.weburl+logopath+"' data-setup='{}'> <source src='"+dataJson.weburl+dataJson.videopath+"'"
					  +"type='video/mp4' /> <track kind='captions' src='demo.captions.vtt' srclang='en' label='English'></track> "
					  +"<track kind='subtitles' src='demo.captions.vtt' srclang='en' label='English'></video>"
	      			);
			  videopath=dataJson.videopath;
			  $("#videoButton").val("重新上传视频");
	    }  ,
	    'onError' : function (event, ID, fileObj, errorObj) {
	   	   if (errorObj.type === "File Size"){
	   	    alert('超过文件上传大小限制（300M）！');
	   	    return;
	   	   }
	   	   alert(errorObj.type + ', Error: ' + errorObj.info);
	   	  },
	    'overrideEvents': ['onSelectError', 'onDialogClose'], //返回一个错误，选择文件的时候触发
	    'onSelectError': function (file, errorCode, errorMsg) {            
	   		  switch (errorCode) {                
	   		  case -100:                    
	   			  alert("只能同时上传" + $('#multiple_file_upload').uploadify('settings', 'queueSizeLimit') + "个文件！"); 
	   			  break;                
	   		  case -110:                    
	   			  alert("文件 [" + file.name + "] 大小超出系统限制的" + $('#multiple_file_upload').uploadify('settings', 'fileSizeLimit') + "大小！");
	   			  break;                
	   		  case -120:                    
	   			  alert("文件 [" + file.name + "] 大小异常！");                    
	   			  break;                
	   		  case -130:                    
	   			  alert("文件 [" + file.name + "] 类型不正确！");                    
	   			  break;            
	   		}            
	   		  return false;        
	   	},      //检测FLASH失败调用        
	   	'onFallback': function () {    
	   		alert("您未安装FLASH控件，无法上传！请安装FLASH控件后再试。");        
	   		}


	});  
	
});

var logopath='';

//上传封面
function doUploadLogo(){
	
	var imgPath = $("#videoLogo").val();
	if(imgPath==""){
		alert("请选择图片");
		return;
	}
	var strExtension = (imgPath.substr(imgPath.lastIndexOf('.') + 1)).toLowerCase();
	if (strExtension != 'jpg' && strExtension != 'gif' && strExtension != 'png' && strExtension != 'bmp') {  
	             alert("请选择图片文件(jpg,gif,png,bmp)");  
           return;  
  }
	 
	 var data = new FormData();
   $.each($('#videoLogo')[0].files, function(i, file) {
 	  	 data.append('logoimg', file);
    });
   
   $.ajax({
    	  url:"<c:url value='/attachment/uploadLogo'/>",
         type:'POST', 
    	  data:data,
    	  cache: false,
    	  contentType: false,    //不可缺
    	  processData: false,    //不可缺
    	  success:function(data){
    		  if(data.success){
    			  $("#head_img").html("<img src='"+data.url+"' width='200' height='200' />");
    			  logopath=data.logopath;
    			  $("#logoButton").val("重新上传封面");
    		  }else{
    			  alert("预览失败");
    		  }
    	  }
      });
}

function doUpload(){
	if(logopath==""){
		alert("请先上传视频封面");
		return;
	}
	$('#multiple_file_upload').uploadify('upload','*');
	
} 
	function Do_save_ftn(){
		
		var videoname = $("#videoname").val();
		var vtid = $("#vtid").val();
		var videocontent = ciue.getContent();
		if(videoname.trim().length == 0){
			alert("视频名称不能为空!");
			return false;
		}
		if(Number(vtid)<=0){
			alert("请选择视频类型!");
			return false;
		} 
		if(logopath == ''){
			alert("请上传视频封面!");
			return false;
		}
		if(videopath == ''){
			alert("请上传视频视频!");
			return false;
		}
		
		var issync=getRadioVar("issync");

		var data = new FormData();
		data.append('videoname',$('#videoname').val());
		data.append('logopath',logopath);
		data.append('videopath',videopath);
        data.append('vtid',$('#vtid').val());
        data.append('videocontent',videocontent);
        data.append('issync',issync);
        
		$.ajax({
			url:'<c:url value='/video/saveVideo'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	   
		  	success:function(data){
		  		if(data.success){
		  			alert(data.data);
		  			window.location = '<c:url value='/video/list?currpage=1'/>';
		  		   }else{
		  			 alert(data.data);
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
	function getRadioVar(name){
		var objectValue=0;
		var radio=document.getElementsByName(name);
		for(var i=0;i<radio.length;i++){
	        if(radio[i].checked==true){
	        	objectValue=radio[i].value;
	          	break;
	        }
	  }
		return objectValue;
	}
</script>

</head>
<body>
<div class="cen_rht">
  <div class="top_search">
  	<!-- 中间内容 -->
      <TABLE cellSpacing=0 cellPadding=0 width="98%" border=0>
        <TBODY>
          <TR>
            <TD vAlign=top width="100%" bgColor=#ffffff>
              <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
              <TR>
                <TD class=manageHead>当前位置：管理首页 &gt; 视频管理模块 &gt; 添加视频信息</TD>
              </TR>
              <TR>
                <TD height=2></TD>
              </TR>
              </TABLE>
              <!-- 主数据区域，查询表单区域 -->
              <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
                <TBODY>
                  <!-- 数据筛选区域，查询表单区域 -->
                  <TR>
	                  <TD height="35px">
		                  <!-- 工具栏区域，主要是快捷按钮，如添加，删除，导入，导出 -->
		                 	 <span class="title_menu">功能菜单：</span>
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/video/list' />'" />
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD align="center">
						<p>&nbsp;</p>                    
                    <FORM id="saveForm" name="saveForm" action="" method=post>
                    <TABLE id=grid class="page_add" border=0>
                      <TBODY>
                      	<tr>
						     <td width="10%">视频名称：</td>
						     <td width="86%">
						     	<input type="text"  name="videoname" id="videoname" class="input_wb" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
						     <td width="10%">视频类型：：</td>
						     <td width="86%">
								<select name="vtid" id="vtid" >
                            	    <c:forEach items="${listType }" var="listType"  varStatus="typeStatus">
                            	    <option value="${listType.videoTypeId }">${listType.name }</option>
                            	    </c:forEach>
						     	</select>
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
                          <td width="10%">视频封面：</td>
                      		<td width="86%">
                      		<div id="head_img"></div>
                      			<input type="file" id="videoLogo" name="videoLogo" />
                      			<input type="button" id="logoButton" name="logoButton" value="上传封面" onclick="doUploadLogo();">
                      			<font color="red">*</font>
                      		</td>
                      		</tr>
                      		<tr><td></td></tr>
                      		 <tr>
                          <td width="10%">视频视频：</td>
                      		<td width="86%">
                      		<div id="head_video"></div>
                      			
                      			<input type="file" name="uploadify" id="multiple_file_upload" />  
        						<hr>  
        						<a id="videoButton" name="videoButton" href="javascript:void(0)" onclick="doUpload();">开始上传</a>  
        						<a href="javascript:$('#multiple_file_upload').uploadify('cancel','*')">取消上传</a>  
        						<a href="javascript:$('#multiple_file_upload').uploadify('stop','*')" hidden=true id="stopUpload">停止上传</a> 
                      			
                      			<!--  <input type="file" id="video" name="video" />
                      			<input type="button" id="videoButton" name="videoButton" value="上传视频" onclick="doUploadVideo();"> -->
                      			<font color="red">*</font>
                      			<br>
                      			 <br><SPAN style='color:red'>(请上传300M以下的MP4视频文件)</SPAN>
                      		</td>
                      		</tr>
                      		<tr><td></td></tr>
                         <tr>
						     <td width="10%">视频简介：</td>
						     <td width="86%">
						     	<textarea name="videocontent" id="videocontent" rows="" cols=""></textarea>
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
						  	 <td width="10%">是否上线：</td>
							<td width="86%">
							<input type="radio" name="issync" id="issync" value="0" checked='checked'>否
							<input type="radio" name="issync" id="issync" value="1">是
							</td>
						 </tr>
						 <tr> 
						 <td width="10%"></td>
						 	<td width="86%">
						 	<input type="button" value=" 添 加 " onclick="Do_save_ftn();"/>
						 	</td>
						 </tr>
                      </TBODY>
                      </TABLE>
                      </FORM>
                   </TD>
                  </TR>
                </TBODY>
              </TABLE></TD>
          </TR>
        </TBODY>
      </TABLE>
  </div>
</div>
</body> 
<script>
var ciue = UE.getEditor('videocontent');
</script>
</html>
