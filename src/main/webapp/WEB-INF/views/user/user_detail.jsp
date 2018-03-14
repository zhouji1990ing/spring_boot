<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>微注册 -- 查看详细页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript">
</script>
<style type="text/css">
#province,#city{width: 80px;}
</style>
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
                <TD class=manageHead>当前位置：管理首页 &gt; 用户管理模块 &gt; 详细信息</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/user/list' />'" />
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD align="center">
						<p>&nbsp;</p>                    
                    <FORM id="saveForm" name="saveForm" action="<c:url value="/user/modify"/>" method=post>
                    <input type="hidden" name="userId" value="${u.userId }" />
                    <TABLE id=grid class="page_add" border=0>
                      <TBODY>
                      	<tr>
						     <td width="100">微信：</td>
						     <td width="200">${u.wxcode}</td>
						</tr>
                      	<tr>
						     <td width="100">姓名：</td>
						     <td width="200">${u.username}</td>
						</tr>
                      	<tr>
						     <td width="100">电话：</td>
						     <td width="200">${u.phone}</td>
						</tr>
                      	<tr>
						     <td width="100">性别：</td>
						     <td width="200">${u.sex}</td>
						 </tr>
						 <tr>
						  	 <td width="100">政治面貌：</td>
							<td width="200">${u.politicalstatus}</td>
						 </tr>
						 <tr>
						  	 <td width="100">参军意向：</td>
							<td width="200">${u.desire}</td>
						 </tr>
                         <tr>
						     <td width="100">学历：</td>
						     <td width="200">${u.education}</td>
						 </tr>
						 <tr>
						  	 <td width="100">兵种：</td>
							<td width="200">${u.arms}</td>
						 </tr>
						 <tr>
						  	 <td width="100">籍贯：</td>
							<td width="400">${u.householdregister}
							</td>
						 </tr>
						 <tr>
						  	 <td width="100">生日：</td>
							<td width="400">${u.birthday}
							</td>
						 </tr>
						 <tr>
						  	 <td width="100">身份证号：</td>
							<td width="400">${u.idnumber}
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
