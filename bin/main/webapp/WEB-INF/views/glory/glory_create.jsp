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
<title>光荣事迹(巢籍官兵)管理-- 添加页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">

<link rel="stylesheet" href="<c:url value='/resources/uploadify/uploadify.css'/>" type="text/css"></link>  

<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
<%-- <script type="text/javascript" charset="utf-8" src="<c:url value='/ueditor/ueditor.config.js'/>"></script>
<script type="text/javascript" charset="utf-8" src="<c:url value='/ueditor/ueditor.all.min.js'/>"> </script>
<script type="text/javascript" charset="utf-8" src="<c:url value='/ueditor/lang/zh-cn/zh-cn.js'/>"></script> --%>
<script language="JavaScript" type="text/javascript" src="<c:url value='/resources/thedate/WdatePicker.js'/> " ></script>

<script type="text/javascript">

document.write('<script type="text/javascript" charset="utf-8"'  
        + 'src="<c:url value="/ueditor/ueditor.config.js?'+ new Date() +'"/>'  
        + ' "></s' + 'cript>'); 
document.write('<script type="text/javascript" charset="utf-8"'  
        + 'src="<c:url value="/ueditor/ueditor.all.min.js?'+ new Date() +'"/>'  
        + ' "></s' + 'cript>');
document.write('<script type="text/javascript" charset="utf-8"'  
        + 'src="<c:url value="/ueditor/lang/zh-cn/zh-cn.js?'+ new Date() +'"/>'  
        + ' "></s' + 'cript>');

$(function(){
	$("#module").change(function(){
		var index = window.document.getElementById("module").selectedIndex;
		var text = window.document.getElementById("module").options[index].text;
		$("#moduleAttribute").val(text);
	});
	
});

var logopath='';

//上传封面
function doUploadLogo(){
	
	var imgPath = $("#gloryLogo").val();
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
     $.each($('#gloryLogo')[0].files, function(i, file) {
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

	function Do_save_ftn(){
		
		var title = $("#title").val();
		var happenedtimeStr = $("#happenedtimeStr").val();

		var content = cue.getContent();
		var isorder = $("#isorder").val();
		var gtid = $("#gtid").val();
		if(logopath == ''){
			alert("请上传封面!");
			return false;
		}
		if(title.trim().length == 0){
			alert("请填写标题!");
			return false;
		}
		if(Number(gtid)<=0){
			alert("请选择类型!");
			return false;
		} 
		if(content.trim().length == 0){
			alert("请填写内容!");
			return false;
		}
		if(happenedtimeStr.trim().length == 0){
			alert("请填写事迹日期!");
			return false;
		}
		var issync=getRadioVar("issync");
		var data = new FormData();
		data.append('gtid',gtid);
		data.append('logopath',logopath);
		data.append('title',$('#title').val());
		data.append('happenedtimeStr',$('#happenedtimeStr').val());
        data.append('content',content);
        data.append('issync',issync);
        data.append('isorder',isorder);
        
		$.ajax({
			url:'<c:url value='/glory/saveGlory'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	   
		  	success:function(data){
		  		if(data.success){
		  			alert(data.data);
		  			window.location = '<c:url value='/glory/list?currpage=1'/>';
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
                <TD class=manageHead>当前位置：管理首页 &gt; 讲师管理模块 &gt; 添加讲师信息</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/glory/list' />'" />
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
						     <td width="10%">封面：</td>
                      		<td width="86%">
                      		<div id="head_img"></div>
                      			<input type="file" id="gloryLogo" name="gloryLogo" />
                      			<input type="button" id="logoButton" name="logoButton" value="上传封面" onclick="doUploadLogo();">
                      			<font color="red">*</font>
                      		</td>
						 </tr>
						 <tr><td></td></tr>
                      	<tr>
						     <td width="10%">标题：</td>
						     <td width="86%">
						     	<input type="text"  name="title" id="title" class="input_wb" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
						     <td width="10%">类型：：</td>
						     <td width="86%">
								<select name="gtid" id="gtid" >
                            	    <c:forEach items="${listType }" var="listType"  varStatus="typeStatus">
                            	    <option value="${listType.gloryTypeId }">${listType.name }</option>
                            	    </c:forEach>
						     	</select>
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr><td></td></tr>
                         <tr>
						     <td width="10%">内容：</td>
						     <td width="86%">
						     	<textarea name="content" id="content" rows="" cols=""></textarea>
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr>
						     <td width="10%">事迹日期：</td>
						     <td width="86%">
						     	<INPUT type="text"  id="happenedtimeStr" name="happenedtimeStr" size="20" maxLength=10  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr>
						     <td width="10%">排序：</td>
						     <td width="86%">
						     	<input type="text"  name="isorder" id="isorder" class="input_wb" value="0" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
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
var cue = UE.getEditor('content');  
</script>
</html>
