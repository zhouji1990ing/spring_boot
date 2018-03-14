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
<title>字典 -- 编辑页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>

<script type="text/javascript">
$(function(){
	$("#module").change(function(){
		var index = window.document.getElementById("module").selectedIndex;
		var text = window.document.getElementById("module").options[index].text;
		$("#moduleAttribute").val(text);
	});
	
});

	function Do_save_ftn(){
		var parentcode='${dictionary.parentcode}';
		var code = '${dictionary.code}';
		var value = $("#value").val();
		var sortby = $("#sortby").val();
		/* if(code.trim().length == 0){
			alert("编码不能为空!");
			return false;
		} */
		if(value.trim().length == 0){
			alert("值不能为空!");
			return false;
		}
		if(sortby.trim().length == 0){
			alert("排序不能为空!");
			return false;
		}
		var data = new FormData();
		data.append('code',code);
		data.append('value',$('#value').val());
		data.append('parentcode',parentcode);
		data.append('sortby',sortby);
		
		$.ajax({
			url:'<c:url value='/dictionary/modifyDictionaryChild'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	   
		  	success:function(data){
		  		if(data.success){
		  			alert(data.data);
		  			window.location = '<c:url value='/dictionary/listChild?currpage=1'/>&parentcode='+parentcode;
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
                <TD class=manageHead>当前位置：管理首页 &gt; 字典管理模块 &gt; 编辑字典类别信息</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/dictionary/listChild?parentcode=${dictionary.parentcode }' />'" />
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
						     <td width="10%">父类别编码：</td>
						     <td width="86%">
						     	${dictionary.parentcode }
						     </td>
						 </tr>
						 <tr><td></td></tr>
                      	<tr>
						     <td width="10%">编码：</td>
						     <td width="86%">
						     ${dictionary.code }
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
						     <td width="10%">类别名称：</td>
						     <td width="86%">
						     	<input type="text"  name="value" id="value" class="input_wb" value="${dictionary.value }"/>
						     	<font color="red">*</font>
						     </td>
						 </tr>
						  <tr><td></td></tr>
						 <tr>
						     <td width="10%">排序：</td>
						     <td width="86%">
						     	<input type="text"  name="sortby" id="sortby" class="input_wb" value="${dictionary.sortby }"/>
						     	<font color="red">*</font>
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
