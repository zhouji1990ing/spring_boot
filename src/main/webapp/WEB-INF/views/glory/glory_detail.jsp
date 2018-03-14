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
<title>光荣事迹(巢籍官兵)-- 详细页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">

<link rel="stylesheet" href="<c:url value='/resources/uploadify/uploadify.css'/>" type="text/css"></link>  

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
                <TD class=manageHead>当前位置：管理首页 &gt; 光荣事迹(巢籍官兵)管理模块 &gt; 光荣事迹(巢籍官兵)详细信息</TD>
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
                      		<div id="head_img">
                      			<img src='<c:url value="${glory.logoUrl }" />' width='200' />
                      		</div>
                      		</td>
						 </tr>
			<tr><td></td></tr>
						 
                      	<tr>
						     <td width="10%">标题：</td>
						     <td width="86%">
						     	${glory.title }
						     </td>
						 </tr>
						 <tr><td></td></tr>
						 <tr>
						     <td width="10%">类型：</td>
						     <td width="86%">${glory.glorytypename }
						     </td>
						 </tr>
						 <tr><td></td></tr>
                         <tr>
						     <td width="10%">内容：</td>
						     <td width="86%">
						     	${glory.content }
						     </td>
						 </tr>
						 <tr>
						     <td width="10%">事迹日期：</td>
						     <td width="86%">
						     	${glory.happenedtimeStr }
						     </td>
						 </tr>
						 <tr>
						     <td width="10%">排序：</td>
						     <td width="86%">
						     	${glory.isorder }
						     </td>
						 </tr>
						 <tr>
						  	 <td width="10%">是否上线：</td>
							<td width="86%">
							<c:if test="${glory.issync==0 }">否</c:if>
							<c:if test="${glory.issync==1 }">是</c:if>
							</td>
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
