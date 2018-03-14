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
<title>站点-- 编辑页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">


<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>

<script type="text/javascript">

/**
 * 提价表单
 */
 function doSubmit(){
	   $("#saveForm").ajaxSubmit({
  	   type: 'post', 
  	   url:'<c:url value='/station/modifyStation'/>',
  	   beforeSubmit: validate,
  	   success:function(data){
  		 	
  		   if(data.success){
  			   alert(data.data);
  			   window.location = '<c:url value='/station/list'/>';
  		   }else{
  			   alert(data.data);
  		   }
  	   },
  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
             alert("表单提交出错！请联系管理员！");  
  	   }
     });
 }
 
 //在这里对表单进行验证，如果不符合规则，将返回false来阻止表单提交，直到符合规则为止 
 function validate(formData, jqForm, options) {
	   //利用fieldValue()方法，fieldValue 是表单插件的一个方法，它能找出表单中的元素的值，返回一个集合。  
	   var name =  $("#name").val();
	   var flag = true;
	   var r=/^[1-9]+[0-9]*$/;
	   var rtrim=/^(\s|\u00A0)+|(\s|\u00A0)+$/g;
	   if (name.replace(rtrim,"").length == 0) {  
	      alert("站点名称不能为空!");  
	      return false;  
	   } 
	  
	 	//验证网格是否被分配过直销员
	/*  $.ajax({
			url:'<c:url value='/station/saveStation'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	   
		  	success:function(data){
		  		if(data.success){
		  			alert(data.data);
		  			window.location = '<c:url value='/station/list?currpage=1'/>';
		  		   }else{
		  			   alert(data.data);
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     }); */
		     return flag;
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
                 <TD class=manageHead>当前位置：管理首页 &gt; 志愿者管理模块 &gt; 编辑志愿者类型</TD>
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
 		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/station/list' />'" />
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
 						     <td width="10%">站点名称：</td>
 						     <td width="86%">
 						     <input type="hidden"  name="sid" id="sid" value="${station.sid} " />
 						     	<input type="text"  name="name" id="name" class="input_wb" value="${station.name }" />
 						     	<font color="red">*</font>
 						     </td>
 							 <tr>
						  	 <td width="10%">是否上线：</td>
							<td width="86%">
							<c:if test="${station.issync==0 }">
								<input type="radio" name="issync" id="issync" value="0" checked='checked'>否
								<input type="radio" name="issync" id="issync" value="1">是
							</c:if>
							<c:if test="${station.issync==1 }">
								<input type="radio" name="issync" id="issync" value="0" >否
								<input type="radio" name="issync" id="issync" value="1" checked='checked'>是
							</c:if>
							</td>
						 </tr>
 					  	<tr>
						<tr> 
 						 <td width="10%"></td>
 						 	<td width="86%">
 						 	<input type="button" value=" 保存" onclick="doSubmit();"/>
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
 </script>
</html>