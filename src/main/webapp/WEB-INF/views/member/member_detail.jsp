<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频 -- 详细页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/ckeditor_4.3.4_standard/ckeditor.js'/>"></script>
<script type="text/javascript">
$(function(){
	$("#module").change(function(){
		var index = window.document.getElementById("module").selectedIndex;
		var text = window.document.getElementById("module").options[index].text;
		$("#moduleAttribute").val(text);
	});
});


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
                <TD class=manageHead>当前位置：管理首页 &gt; 视频管理模块 &gt; 视频详细信息</TD>
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
						     <input type="hidden" id="videoid" name="videoid" value="${video.videoid }" >
						     	${video.videoname }
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
						     <td width="10%">视频类型：</td>
						     <td width="86%">${video.videotypename }
						     </td>
						 </tr>
						 <tr><td></td></tr>
                        <tr>
						     <td width="10%">视频封面：</td>
                      		<td width="86%">
                      			<img src='<c:url value="${LOGOURL }" />' width='200' height='200' />
                      		<div id="head_img">
                      			
                      		</div>
                      		</td>
						 </tr>
						 <tr><td></td></tr>
						  <tr>
                          <td width="10%">视频视频：</td>
                      		<td width="86%">
                      		<div id="head_video">
                      			<video  id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="80%" 
      								poster='${LOGOURL}' data-setup="{}">
    								<source src='${VIDEOURL }' type='video/mp4' />
    								<track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
    								<track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
  								</video>
                      		</div>
                      		</td>
                      		</tr>
                      		<tr><td></td></tr>
                         <tr>
						     <td width="10%">视频简介：</td>
						     <td width="86%">
						     	${video.videocontent }
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
						  	 <td width="10%">上线状态：</td>
							<td width="86%">
							<c:if test="${video.issync==0 }">未上线</c:if>
							<c:if test="${video.issync==1 }">已上线</c:if>
							</td>
						 </tr>
						 <tr><td></td></tr>
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
<!--1.引入 ckedite.js ， 2.textarea id -->
    
  
</script>
</html>
