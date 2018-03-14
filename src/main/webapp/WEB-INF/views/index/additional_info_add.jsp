<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户 -- 添加页面</title>
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


	function Do_save_ftn(){
		
		var module = $("#module").val();
		if(module == 0){
			alert("请选择推荐类别模块");return false;
		}
		
		var entityAttribute = $("#entityAttribute").val();
		if(entityAttribute.trim().length ==0){
			alert("推荐名称不能为空");return false;
		}
		var entityUrl = $("#entityUrl").val();
		if(entityUrl.trim().length == 0){
			alert("链接地址不能为空");return false;
		}
		$("#saveForm").submit();
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
                <TD class=manageHead>当前位置：管理首页 &gt; 推荐信息管理模块 &gt; 添加推荐信息</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/additionalInfo/list' />'" />
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD align="center">
						<p>&nbsp;</p>                    
                    <FORM id="saveForm" name="saveForm" action="<c:url value="/additionalInfo/saveInfo"/>" method=post>
                    <TABLE id=grid class="page_add" border=0>
                      <TBODY>
                      	<tr>
						     <td width="100">推荐类别名称：</td>
						     <td width="500">
						     	<select name="module" id="module"  class="input_wb">
						     		<option value="0">--请选择--</option>
						     		<c:forEach items="${additionalInfoList}" var="c">
										<option value="${c.constantValue}">${c.constantName}</option>						     		
						     		</c:forEach>
						     	</select>
						     	<input type="hidden"  name="moduleAttribute" id="moduleAttribute" />
						     </td>
						 </tr>
                         <tr>
						     <td width="100">推荐名称：</td>
						     <td width="200"><input type="text" name="entityAttribute" id="entityAttribute"  class="input_wb" />（如：张牧之）</td>
						 </tr>
                         <tr>
						     <td width="100">链接地址：</td>
						     <td width="200"><input type="text" name="entityUrl" id="entityUrl"  class="input_wb" />（如：http://mis.konyo.com.cn:9090/）</td>
						 </tr>
						 <tr>
						  	 <td width="82">备注：</td>
							<td><textarea name="description" id="description" rows="4" cols="40"></textarea>
							</td>
						 </tr>
						 <tr>
						  	 <td width="82" colspan="2">富文本编辑器：<br><br>
								<textarea name="copyrightContent" id="copyrightContent" rows="" cols=""></textarea>
							</td>
						 </tr>
						 <tr>
						 	<td align="center" colspan="2" valign="middle">
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
    CKEDITOR.replace( 'copyrightContent',{
    	filebrowserUploadUrl: '<c:url value="/copyright/doUploadCopyrightImage"/>'
    });
</script>
</html>
