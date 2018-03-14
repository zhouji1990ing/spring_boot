<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>相册--编辑页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">

<link rel="stylesheet" href="<c:url value='/resources/uploadify/uploadify.css'/>" type="text/css"></link>  

<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>

<script type="text/javascript">

var logopath='${logopath }';

//上传照片
function doUploadLogo(){
	
	var imgPath = $("#filename").val();
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
     $.each($('#filename')[0].files, function(i, file) {
   	  	 data.append('filename', file);
      });
     
     $.ajax({
      	  url:"<c:url value='/photoAlbum/uploadPhoto'/>",
           type:'POST', 
      	  data:data,
      	  cache: false,
      	  contentType: false,    //不可缺
      	  processData: false,    //不可缺
      	  success:function(data){
      		  if(data.success){
      			 $("#head_img").html("");
      			  $("#head_img").html("<img src='"+data.url+"' />");
      			  logopath=data.logopath;
      			  $("#logoButton").val("重新上传照片");
      		  }else{
      			  alert("预览失败");
      		  }
      	  }
        });
}

	function Do_save_ftn(){
		
		
		var albumid = $("#albumid").val();
		var photoname = $("#photoname").val();
		var ispublic = $("input[name='ispublic']:checked").val();
		
		if(logopath == ''){
			alert("请上传照片!");
			return false;
		}
		if(photoname.trim().length == 0){
			alert("请填写相册名称!");
			return false;
		}
		if(ispublic == ''){
			alert("请上传照片!");
			return false;
		}
		
		var data = new FormData();
		data.append('photoname',photoname);
		data.append('filepath',logopath);
		data.append('ispublic',ispublic);
		data.append('albumid',albumid);
        
		$.ajax({
			url:'<c:url value='/photoAlbum/modifyPhotoAlbum'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	   
		  	success:function(data){
		  		if(data.success){
		  			alert(data.data);
		  			window.location = '<c:url value='/photoAlbum/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
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
                <TD class=manageHead>当前位置：管理首页 &gt; 相册管理模块 &gt; 编辑相册信息</TD>
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
		                  <!-- 工具栏区域，主要是快捷按钮，如编辑，删除，导入，导出 -->
		                 	 <span class="title_menu">功能菜单：</span>
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/photoAlbum/list' />'" />
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
						     <td width="10%">照片：</td>
						     <input type="hidden" id="albumid" name="albumid" value="${photoAlbum.albumid}" />
                      		<td width="86%">
                      			<input type="file" id="filename" name="filename" />
                      			<input type="button" id="logoButton" name="logoButton" value="重新上传照片" onclick="doUploadLogo();">
                      			<font color="red">*</font>
                      		</td>
						 </tr>
                      	<tr>
						     <td width="10%">照片名称：</td>
						     <td width="86%">
						     	<input type="text"  name="photoname" id="photoname" class="input_wb" value="${photoAlbum.photoname}" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr>
						  	 <td width="10%">是否上线：</td>
							<td width="86%">
							<c:if test="${photoAlbum.ispublic==0 }">
								<input type="radio" name="ispublic" id="ispublic" value="0" checked='checked'>否
								<input type="radio" name="ispublic" id="ispublic" value="1">是
							</c:if>
							<c:if test="${photoAlbum.ispublic==1 }">
								<input type="radio" name="ispublic" id="ispublic" value="0" >否
								<input type="radio" name="ispublic" id="ispublic" value="1" checked='checked'>是
							</c:if>
							</td>
			
						 </tr>
						 <tr> 
						 <td width="10%"></td>
						 	<td width="86%">
						 	<input type="button" value=" 保存 " onclick="Do_save_ftn();"/>
						 	</td>
						 </tr>
                      </TBODY>
                      </TABLE>
                      </FORM>
                      <div id="head_img">
                      	 	<img src='<c:url value="${photoAlbum.logoUrl }" />' />
                      	 </div>
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
</script>
</html>
