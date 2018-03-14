<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频列表</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript">
function doSearch(){
	$("#do_search_form").submit();
}


//批量同步操作（单个操作）
function modifyIsSync(stau){
	var isvalid = false;
	//首先判断是否选择删除
	$("input[name=chk]").each(function(){
		if($(this).attr("checked")){
			isvalid = true;
		}
	});
	if(!isvalid){
		alert("请选择要操作的记录！");
		return false;
	}
	if(confirm("您确定要同步所选的记录吗？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/member/modifyIsSync'/>?issync='+stau,
		  	   data:$('#member').serialize(),
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/member/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//修改同步状态
function modifyIsSyncOne(issync,mid){
	//首先判断数字是否有效
	if(isNaN(mid)){
		alert("该条记录无效！");
		return false;
	}
	if(confirm("您确定要修改当前同步状态？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/member/modifyIsSync'/>?issync='+issync+'&mid='+mid,
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/member/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}
//删除操作（批量操作，单个操作）
function doRemove(){
	var isvalid = false;
	//首先判断是否选择删除
	$("input[name=chk]").each(function(){
		if($(this).attr("checked")){
			isvalid = true;
		}
	});
	if(!isvalid){
		alert("请选择要删除的记录！");
		return false;
	}
	if(confirm("您确定要删除所选的记录吗？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/member/removeMember'/>',
		  	   data:$('#member').serialize(),
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/member/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//删除操作（单个操作）
function doRemoveOne(mid){
	//首先判断数字是否有效
	if(isNaN(mid)){
		alert("该条记录无效，无法删除！");
		return false;
	}
	if(confirm("您确定要删除所选的记录吗？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/member/removeMember'/>?mid='+mid,
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/member/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
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
                <TD class=manageHead>当前位置：管理首页 &gt; 视频管理模块 &gt; 视频列表</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 添  加 " onclick="javascript:window.location='<c:url value='/member/createMember' />'" />
		                 	 <INPUT class=button id="batchdelete" type="button" value=" 批量删除 " onclick="doRemove()" />
		                 	 <INPUT class=button id="batchdelete" type="button" value=" 批量上线" onclick="modifyIsSync(0)"/>
		                 	 <INPUT class=button id="batchdelete" type="button" value=" 批量下线" onclick="modifyIsSync(1)" />
	                  	                  
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD height="35px">
                    <!-- 数据筛选区域，查询表单区域 -->
                    <FORM id="do_search_form" name="do_search_form" method=post action="<c:url value="/member/list"/>" >
                    <TABLE cellSpacing=0 cellPadding=2 border=0>
                    <TBODY>
                     	<TR>
                            <TD><span class="title_menu">筛选条件：</span></TD>
                            <TD>
                            	 视频名称
                             	 <INPUT type="text" id="membername" name="membername" style="WIDTH: 100px" maxLength=50  value="${member.name}"/>  &nbsp;&nbsp;
                            </TD>
                            <TD>
                            	 视频类型
                             	 <select name="vtid" id="vtid" >
                             	 <option value="" >请选择</option>
                            	    <c:forEach items="${listType }" var="listType"  varStatus="typeStatus">
                            	    <option value="${listType.memberTypeId }" <c:if test="${member.vtid == listType.memberTypeId }">selected</c:if> >${listType.name }</option>
                            	    </c:forEach>
						     	</select>
                            </TD>
                           <TD> &nbsp;&nbsp; <INPUT class=button id=sButton2 type="button" value=" 筛 选 " name=sButton2 onclick="doSearch()" />
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
                    <FORM id="member" name="member" method=post>
                    <TABLE id=grid style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=0>
                        <TBODY>
                        <TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none" height="30px">
                            <TH>
                            	<INPUT id="chkAll" name="chkAll" type="checkbox"  value="" />全选
                            </TH>                           
                            <TH>微信号</TH>
                            <TH>公众号名称</TH>
                            <TH>头像</TH>
                            <TH>类型</TH>
                            <TH>是否认证</TH>
                            <TH>原始微信ID</TH>
                            <TH>APPID</TH>
                            <TH>APPSECRECT</TH>
                            <TH>操作</TH>
                   		<c:forEach items="${list }" var="list"  varStatus="status">
                   		<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none" height="30px">
                            <TD class="list_td_align"><INPUT name="chk" type="checkbox" value="${list.mid }" /></TD>
                            <TD class="list_td_align">${list.weixinName}</TD>
                            <TD class="list_td_align">${list.name}</TD>
                            <TD class="list_td_align">${list.avatar}</TD>
                            <TD class="list_td_align">${list.type}</TD>
                            <TD class="list_td_align">                          
                            	<c:if test = "${list.auth == 1 }">已认证</c:if>
                            	<c:if test = "${list.auth == 0 }">未认证</c:if>
                            </TD>
                            <TD class="list_td_align">${list.originalId}</TD>
                            <TD class="list_td_align">${list.appId}</TD>
                            <TD class="list_td_align">${list.appSecret}</TD>
                            <TD class="list_td_align">
                            	<a href="<c:url value="/member/editMember?mid=${list.mid}"/>">修改</a> |
                            	<A href="javascript:void(0)" onclick="doRemoveOne(${list.mid })">删除</A> 
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
<script type="text/javascript">
$(function () {
	//全选/反选操作
    $("#chkAll").click(function () { 
    	if($("#chkAll").attr("checked")){
            $("input[name=chk]").attr("checked", true); 
    	}else{
            $("input[name=chk]").attr("checked", false); 
    	}
    });
});
</script> 
</html>
