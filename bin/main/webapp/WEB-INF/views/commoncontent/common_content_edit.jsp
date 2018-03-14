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
<title>编辑页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
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
var keyWords = {};
<c:forEach items="${kMap }" var="list"  varStatus="status">
	keyWords[${list.keywordId}] = "${list.keywordName}";
</c:forEach>
$(function(){
	$("#module").change(function(){
		var index = window.document.getElementById("module").selectedIndex;
		var text = window.document.getElementById("module").options[index].text;
		$("#moduleAttribute").val(text);
	});
	
	$("#keywords").change(function(){
		if($("#keywords").val() != null && $("#keywords").val() != ''){
			keyWords[$("#keywords").val()] = $("#keywords").find("option:selected").text();
		}
		var keyWordNames = "";
		 for(var key in keyWords) {
			 if(keyWordNames == ""){
				 keyWordNames = keyWords[key];
			 }else{
				 keyWordNames = keyWordNames + "," + keyWords[key];
			 }
		 }
		 $("#keyWordNames").val(keyWordNames);
	});
	
	
	var keyWordNames = "";
	 for(var key in keyWords) {
		 if(keyWordNames == ""){
			 keyWordNames = keyWords[key];
		 }else{
			 keyWordNames = keyWordNames + "," + keyWords[key];
		 }
	 }
	 $("#keyWordNames").val(keyWordNames);
});
var logopath='${commonContent.logopath}';
var key = '${commonContent.key}';


//上传封面
function doUploadLogo(){
	
	var imgPath = $("#imgLogo").val();
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
   $.each($('#imgLogo')[0].files, function(i, file) {
 	  	 data.append('logoimg', file);
    });
   
   $.ajax({
  	 url:"<c:url value='/attachment/uploadQiniu'/>",
         type:'POST', 
    	  data:data,
    	  cache: false,
    	  contentType: false,    //不可缺
    	  processData: false,    //不可缺
    	  success:function(data){
    		  if(data.success){
    			  $("#head_img").html("<img src='"+data.url+"'  height='200' />");
    			  logopath=data.logopath;
    			  key=data.key;
    			  $("#logoButton").val("重新上传封面");
    		  }else{
    			  alert("预览失败");
    		  }
    	  }
      });
}

	function Do_save_ftn(){
		
		var ccid=$("#ccid").val();
		var code = $("#code").val();
		var digest = $("#digest").val();
		var title = $("#title").val();
		var content = cue.getContent();
		var ordernum = $("#ordernum").val();
		var author = $("#author").val();
		
		/* if(logopath==''){
			alert("请上传封面!");
			return false;
		} */
		if(code.trim().length==0){
			alert("请填写部门!");
			return false;
		}
		if(title.trim().length==0){
			alert("请填写名称!");
			return false;
		}
		if(author.trim().length==0){
			alert("请填写信息来源!");
			return false;
		}
		if(content.trim().length == 0){
			alert("请填写内容!");
			return false;
		}
		if(isNaN(ordernum)){
			alert("排序必须为数字!");
			return false;
		}
		if(digest.trim().length == 0){
			alert("请填写文件编号!");
			return false;
		}
		var keywordIds = "";
		for(var key in keyWords) {
			 if(keywordIds == ""){
				 keywordIds = key;
			 }else{
				 keywordIds = keywordIds + "," + key;
			 }
		 }
		if(keywordIds.trim().length == 0){
			alert("请填写类别!");
			return false;
		}
		var isSync=getRadioVar("isSync");
		var data = new FormData();
		data.append('ccid',ccid);
		//data.append('logopath',logopath);
		data.append('key',key);
		data.append('code',code);
		data.append('title',title);
		data.append('content',content);
        data.append('ordernum',ordernum);
        data.append('isSync',isSync);
        data.append('digest',digest);
        data.append('author',author);
        data.append('keywordIds',keywordIds);
        
		$.ajax({
			url:'<c:url value='/commonContent/modifyCommonContent'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	   
		  	success:function(data){
		  		if(data.success){
		  			alert(data.data);
		  			window.location = '<c:url value='/commonContent/list?currpage=1'/>&code='+code;
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
	
	function clearInfo(){
		keyWords = {};
		$("#keyWordNames").val('');
		$("#keywords").val('');
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
                <TD class=manageHead>当前位置：管理首页 &gt; ${commonContent.codeName }管理模块 &gt; 编辑${commonContent.codeName }</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.history.back();return false;" />
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD align="center">
						<p>&nbsp;</p>                    
                    <FORM id="saveForm" name="saveForm" action="" method=post>
                    <TABLE id=grid class="page_add" border=0>
                      <TBODY>
                       <%-- <tr style="display:none">
						     <td width="10%">封面：</td>
                      		<td width="86%">
                      		<div id="head_img">
                      			<img src='<c:url value="${LOGOURL }" />' width='200' />
                      		</div>
                      			<input type="file" id="imgLogo" name="imgLogo" />
                      			<input type="button" id="logoButton" name="logoButton" value="重新上传封面" onclick="doUploadLogo();">
                      			<font color="red">*</font><font color="#666">为了更好的显示效果，请上传4*3比例的图片。</font>
                      		</td>
						 </tr> --%>
						 <tr>
						    <td width="10%">文件编号：</td>
						     <td width="86%">
						     	<input type="text"  name="digest" id="digest" class="input_wb" value="${commonContent.digest }"/>
								<font color="red">*</font>
						     </td>
						 </tr>
                      <tr>
						     <td width="10%">标题：</td>
						     <td width="86%">
						     	<input type="text"  name="title" id="title" class="input_wb" value="${commonContent.title }" />
						     	
						     	<input type="hidden"  name="ccid" id="ccid" value="${commonContent.ccid }" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr>
						     <td width="10%">信息来源：</td>
						     <td width="86%">
						     	<input type="text"  name="author" id="author" class="input_wb" value="${commonContent.author }" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr>
						    <td width="10%">类别(可以多个)：</td>
						    <td width="86%">
						        <select name="keywords" id="keywords">
						        <option value="">--请选择--</option>
						        <c:forEach items = "${kList }" var="k" varStatus="status">
						     	<option value="${k.keywordId }">${k.keywordName }</option>
						     	</c:forEach>
						        </select>
						     	<input disabled="disabled" type="text" id="keyWordNames" name="keyWordNames" style="width: 300px">
						     	<font color="red">*</font>
						     	<input type="button" value=" 清空 " onclick="clearInfo();"/>
						    </td>
						 </tr>
						 <c:if test="${currentUser.post == null || currentUser.post == ''}">
							 <tr>
							    <td width="10%">部门：</td>
							     <td width="86%">
							        <select name="code" id="code">
							        <c:forEach items = "${mList }" var="type" varStatus="status">
							     	<option value="${type.code }" <c:if test="${commonContent.code == type.code }">selected</c:if> >${type.name }</option>
							     	</c:forEach>
							        </select>
							     	
							     	
							     	<font color="red">*</font>
							     </td>
							 </tr>
					     </c:if>
						 <c:if test="${currentUser.post != null && currentUser.post != ''}">
						 	<input type="hidden"  name="code" id="code" value="${currentUser.post}" />
						 </c:if>
                      	 <tr>
						     <td width="10%">内容：</td>
						     <td width="86%">
						     	<textarea name="content" id="content" style="width:800px;height:500px;">${commonContent.content }</textarea>
						     	<font color="red">*</font>
						     </td>
						 </tr>
						  <tr style="display:none">
						     <td width="10%">排序：</td>
						     <td width="86%">
						     	<input type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" name="ordernum" id="ordernum"  class="" value="${commonContent.ordernum }" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
						<tr>
						  	 <td width="10%">是否上线：</td>
							<td width="86%">
							<c:if test="${commonContent.isSync==0 }">
								<input type="radio" name="isSync" id="isSync" value="0" checked='checked'>否
								<input type="radio" name="isSync" id="isSync" value="1">是
							</c:if>
							<c:if test="${commonContent.isSync==1 }">
								<input type="radio" name="isSync" id="isSync" value="0" >否
								<input type="radio" name="isSync" id="isSync" value="1" checked='checked'>是
							</c:if>
							</td>
						 </tr>
						 <tr> 
						 <td width="10%"></td>
						 	<td width="86%">
						 	<input type="button" value=" 保存 " onclick="Do_save_ftn();"/>
						 	<INPUT class=button id="back" type="button" value=" 取消 " onclick="javascript:window.history.back();return false;" />
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
