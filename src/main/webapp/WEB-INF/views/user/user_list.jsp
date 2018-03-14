<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理列表</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	//$("#sex").val("${u.sex}");
});

function doSearch(){
	$("#do_search_form").submit();
}

function exportExcel(){
	window.location = "<c:url value='/user/exportExcel'/>?sex=${u.sex}&arms=${u.arms}&education=${u.education}&politicalstatus=${u.politicalstatus}&householdregister=${u.householdregister}&desire=${u.desire}&birthday=${u.birthday}"
}

function doClear(){
	$("#username").val("");
	$("#sex").val("");
	$("#post").val("");
	$("#wxcode").val("");
}

function modifyUserConstants(){
	var value;	
	value = prompt("请输入附加人数(只能输入整数!)","${constants.value}");
	if(prompt.isNaN){
		aleart("请输入整数!");
		return false;
	}
	
	var data = new FormData();
	data.append('value',value);
	$.ajax({
		url:'<c:url value='/user/modifyUserCount'/>',
	  	type: 'post', 
	  	data:data,
   	    cache: false,
   	  	contentType: false,    //不可缺
   	  	processData: false,    //不可缺
	  	success:function(data){
	  			if(data){
	  				alert("附加人数修改成功!");
	  				window.location='<c:url value='/user/list' />';
	  			}else{
	  				alert("附加人数修改失败!");
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
            
              <!-- 导航栏，前期先写死，后期做成活的 -->
              <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
              <TR>
                <TD class=manageHead>当前位置：管理首页 &gt; 微登记模块 &gt; 列表页面</TD>
              </TR>
              <TR>
                <TD height=2></TD>
              </TR>
              </TABLE>
              <!-- 导航栏，前期先写死，后期做成活的 -->
              
              <!-- 主数据区域，查询表单区域 -->
              <TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
                <TBODY>
                 <!-- 数据筛选区域，查询表单区域 -->
                  <TR>
	                  <TD height="35px">
		                  <!-- 工具栏区域，主要是快捷按钮，如添加，删除，导入，导出 -->
		                 	 <span class="title_menu">功能菜单：</span>
		                 	 <INPUT class=button id="back" type="button" value=" 添  加 " onclick="javascript:window.location='<c:url value='/user/add' />'" />
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD height="35px">
                    <!-- 数据筛选区域，查询表单区域 -->
                    <FORM id="do_search_form" name="do_search_form" method=post action="<c:url value="/user/list"/>" >
                    <TABLE cellSpacing=0 cellPadding=2 border=0>
                    <TBODY>
                     	<TR>
                            <TD><span class="title_menu">筛选条件：</span></TD>
                            <TD>
                             	 <INPUT  type="hidden" id="wxcode" name="wxcode" style="WIDTH: 100px" maxLength=50  value="${u.wxcode}"/>
                             	  账号名称
                             	 <INPUT type="text" id="username" name="username" style="WIDTH: 100px" maxLength=50  value="${u.username}"/>
                            	 <INPUT type="hidden" name="sex" id="sex"/>
                            	 分类
                             	 <select name="post" id="post">
                             	 <option value="">--选择分类--</option>
						        <c:forEach items = "${mList }" var="type" varStatus="status">
						     	<option value="${type.code }" <c:if test="${u.post == type.code }">selected</c:if> >${type.name }</option>
						     	</c:forEach>
						        </select>
						     	</TD>
                           <TD> &nbsp;&nbsp; <INPUT class=button id=sButton2 type="button" value=" 筛 选 " name=sButton2 onclick="doSearch()" />
                          	 &nbsp;<INPUT class=button id=ClearButton type="button" value=" 清 空 " name=ClearButton onclick="doClear()" /></TD>
                          </TR>
                      </TBODY>
                      </TABLE>
                    </FORM> 
                    </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD>
                    
                    <!-- 数据列表，使用el标签循环生成即可 -->
                    <FORM id="groupMembersDetails" name="groupMembersDetails" method=post>
                    <TABLE id=grid style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=0>
                        <TBODY>
                        <TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none" height="30px">
                            <TH>序号</TH>
                            <TH>账号名称</TH>
                            <TH>部门</TH>
                            <TH>操作</TH>
                   		<c:forEach items="${list }" var="user"  varStatus="userStatus">
                   		<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none" height="30px">
                            <TD class="list_td_align" >${userStatus.count}</TD>
                            <TD class="list_td_align">${user.username}</TD>
                            <TD class="list_td_align">${user.cityName}</TD>
                            <TD class="list_td_align">
                            	<a href="<c:url value="/user/edit?userId=${user.userId}"/>">修改</a> | 
                            	<a href="<c:url value="/user/remove?userId=${user.userId}"/>" onClick="return confirm('确认删除？');">删除</a>
                            </TD>
                         </TR>
                   		</c:forEach>
                         
                      </TBODY>
                      </TABLE>
                      </FORM>
                      <!-- 数据列表，使用el标签循环生成即可 -->
                      <br/>
                      <!-- 分页区域 -->
                      <div style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
	                    ${pageBar }
	                  </div>
                    <!-- 分页区域 -->
                    
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
</html>
