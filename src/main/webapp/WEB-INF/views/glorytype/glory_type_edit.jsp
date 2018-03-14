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
<title>光荣事迹(巢籍官兵)类型 -- 修改页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">

<link rel="stylesheet" href="<c:url value='/resources/uploadify/uploadify.css'/>" type="text/css"></link>  

<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/ckeditor_4.3.4_standard/ckeditor.js'/>"></script>

<script type="text/javascript">
$(function(){
	$("#module").change(function(){
		var index = window.document.getElementById("module").selectedIndex;
		var text = window.document.getElementById("module").options[index].text;
		$("#moduleAttribute").val(text);
	});
	
});

	function Do_save_ftn(){
		
		var name = $("#name").val();
		var isorder = $("#isorder").val();
		var gloryTypeId='${gloryType.gloryTypeId}';
		if(name.trim().length == 0){
			alert("光荣事迹(巢籍官兵)类型名称不能为空!");
			return false;
		}
		if(isorder.trim().length == 0){
			isorder=0
		}
		if(isNaN(isorder)){
			alert("排序为数字!");
			return false;
		}
		var data = new FormData();
		data.append('gloryTypeId',gloryTypeId);
		data.append('name',$('#name').val());
		data.append('isorder',isorder);
        
		$.ajax({
			url:'<c:url value='/gloryType/modifyGloryType'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	   
		  	success:function(data){
		  		if(data.success){
		  			alert(data.data);
		  			window.location = '<c:url value='/gloryType/list?currpage=1'/>';
		  		   }else{
		  			   alert(data.data);
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
                <TD class=manageHead>当前位置：管理首页 &gt; 光荣事迹(巢籍官兵)管理模块 &gt; 添加光荣事迹(巢籍官兵)类型信息</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/gloryType/list' />'" />
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
						     <td width="10%">光荣事迹(巢籍官兵)类型名称：</td>
						     <td width="86%">
						     <input type="hidden" name="gloryTypeId" id="gloryTypeId" value="${gloryType.gloryTypeId }" />
						     	<input type="text"  name="name" id="name" value="${gloryType.name }" class="input_wb" />
						     	<font color="red">*</font>
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
						     <td width="10%">排序：</td>
						     <td width="86%">
						     	<input type="text"  name="isorder" id="isorder" class="input_wb" value="${gloryType.isorder }" onkeyup="this.value=this.value.replace(/\D/g,'')" />
						     </td>
						 </tr>
						 <tr><td></td></tr>
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
<!--1.引入 ckedite.js ， 2.textarea id -->
  
</script>
</html>
