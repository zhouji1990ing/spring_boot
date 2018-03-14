<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript">
	function Do_save_ftn(){
		
		var oldpwd = $("#oldpwd").val();
		if(oldpwd == ''){
			alert("请填写原始密码!");return false;
		}
		var newpwd1 = $("#newpwd1").val();
		if(newpwd1 == ''){
			alert("请填写新密码!");return false;
		}
		var newpwd2 = $("#newpwd2").val();
		if(newpwd2 ==''){
			alert("请确认新密码!");return false;
		}
		
		if(newpwd1 != newpwd2){
			alert("两次密码输入不一致!");return false;
		}
		var data = new FormData();
		data.append('oldpwd',oldpwd);
		data.append('newpwd1',newpwd1);
		data.append('newpwd2',newpwd2);
		
		$.ajax({
			url:'<c:url value='/admin/modifyPwd'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	success:function(data){
		  			if(data.success){
		  				alert(data.data);
			  			window.location = '<c:url value='/admin/admin_index'/>';
		  			}else{
		  				alert(data.data);
		  				return false;
		  			}
		  			
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		 });
	}
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
                <TD class=manageHead>当前位置：管理首页 &gt; 微登记模块 &gt; 添加登记信息</TD>
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
		                  <!-- 工具栏区域，主要是快捷按钮，如添加，删除，导入，导出 
		                 	 <span class="title_menu">功能菜单：</span>
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/user/list' />'" />
		                 	 -->
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD align="center">
						<p>&nbsp;</p>                    
                    <FORM id="saveForm" name="saveForm" action="<c:url value="/admin/modifyPwd"/>" method=post>
                    <TABLE id=grid class="page_add" border=0>
                      <TBODY>
                      	<tr>
						     <td width="100">原密码</td>
						     <td width="200"><input type="text" name="oldpwd" id="oldpwd"  class="input_wb" /></td>
						</tr>
                      	<tr>
						     <td width="100">新密码</td>
						     <td width="200"><input type="text" name="newpwd1" id="newpwd1"  class="input_wb" /></td>
						</tr>
                      	<tr>
						     <td width="100">确认新密码</td>
						     <td width="200"><input type="text" name="newpwd2" id="newpwd2"  class="input_wb" /></td>
						</tr>
						
						 <tr>
						 	<td align="center" colspan="2" valign="middle">
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
</script>
</html>
