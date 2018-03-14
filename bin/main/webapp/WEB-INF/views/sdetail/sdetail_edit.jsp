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
<title>办事处-- 编辑页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">


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
	function Do_save_ftn(){
		var sdid=$("#sdid").val();
		
		var name = $("#name").val();
		
		var sid = $("#sid").val();
		
		var adrees = hue.getContent();
		
		
		
		if(name.trim().length == 0){
			alert("请填办事处名称!");
			return false;
		}


		if(adrees.trim().length == 0){
			alert("请填写办事处地址!");
			return false;
		}
		var issync=getRadioVar("issync");
		var data = new FormData();
		data.append('sdid',$('#sdid').val());
		data.append('sid',$('#sid').val());
		data.append('name',$('#name').val());
        data.append('adrees',adrees);
        data.append('issync',issync);
        
		$.ajax({
			url:'<c:url value='/sdetail/modifySdetail'/>',
		  	type: 'post', 
		  	data:data,
       	    cache: false,
       	  	contentType: false,    //不可缺
       	  	processData: false,    //不可缺
		  	   
		  	success:function(data){
		  		if(data.success){
		  			alert(data.data);
		  			window.location = '<c:url value='/sdetail/list'/>?sid='+sid;
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
                <TD class=manageHead>当前位置：管理首页 &gt; 办事处模块 &gt; 编辑办事处信息</TD>
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
		                 	 <INPUT class=button id="back" type="button" value="返回办事处列表 " onclick="javascript:window.location='<c:url value='/sdetail/list?sid=${sdetail.sid}' />'" />
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD align="center">
						<p>&nbsp;</p>                    
                    <FORM id="saveForm" name="saveForm" method=post>
                    <TABLE id=grid class="page_add" border=0>
                      <TBODY>
                      	<tr>
 						     <td width="15%" align="right">办事处名称：</td>
 						     <td width="86%">
 						     <input type="hidden"  name="sdid" id="sdid" value="${sdetail.sdid} " />
 						     	<input type="text"  name="name" id="name" class="input_wb" value="${sdetail.name }" />
 						     	<font color="red">*</font>
 						     	
 						     </td>
 						    </tr>

							  <tr>                   
						     <td width="15%" align="right">站点类型：</td>
						     <td width="86%" align="left">
						     	 <select name="sid" id="sid">
						     		<c:forEach items="${typeList }" var="type">
						     			<option value="${type.sid }" <c:if test="${type.sid ==sdetail.sid }">selected</c:if> >${type.name }</option>
						    		 </c:forEach>
						    	 </select>						  
						     </td>						 
						 </tr>
						 <TR><TD></TD></TR>
                          </tr>
						 <tr><td></td></tr>
                         <tr>
						     <td width="15%" align="left">办事处地址：</td>
						     <td width="86%">
						     <textarea name="adrees" id="adrees" style="width:800px;height:500px;"  >${sdetail.adrees }</textarea>
						 	
						 </tr>
						 <TR><TD></TD></TR>
						 <tr>
						  	 <td width="15%" align="left">是否上线：</td>
							<td width="86%">
							<c:if test="${sdetail.issync==0 }">
								<input type="radio" name="issync" id="issync" value="0" checked='checked'>否
								<input type="radio" name="issync" id="issync" value="1">是
							</c:if>
							<c:if test="${sdetail.issync==1 }">
								<input type="radio" name="issync" id="issync" value="0" >否
								<input type="radio" name="issync" id="issync" value="1" checked='checked'>是
							</c:if>
							</td>
						 </tr>
 						 <td width="10%"></td>
 						 	<td width="86%">
 						 	<input type="button" value=" 保存" onclick="Do_save_ftn();"/>
 						 	</td>
 						 </tr>
                       </TBODY>
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
var hue = UE.getEditor('adrees');
</script>
</script>