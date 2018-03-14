<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前沿观点--列表页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
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
function doSearch(){
	$("#do_search_form").submit();
}
function doClear(){
	$("#title").val(""); 
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
                 <TD class=manageHead>当前位置：管理首页 &gt; 政策法规&gt; 智能问答  &gt;列表</TD>
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
	                  <TD height="35px" class="function_menu">
		                  <!-- 工具栏区域，主要是快捷按钮，如添加，删除，导入，导出 -->
		                 	 <span class="title_menu">功能菜单：</span>
		                 	 <INPUT class=button id="back" type="button" value=" 添  加 " onclick="javascript:window.location='<c:url value='/query/createQuery' />'" />
		                 	 <INPUT class=button id="back" type="button" value="批量删除" onclick="doRemove()" />
		                 	 <INPUT class=button id="back" type="button" value="批量上线" onclick="doOnline()" />
		                 	 <INPUT class=button id="back" type="button" value="批量下线" onclick="doOffline()" />
	                  </TD>
                  </TR>
                  <TR>
                    <TD height="35px" class="function_menu">
                    <!-- 数据筛选区域，查询表单区域 -->
                    <FORM id="do_search_form" name="do_search_form" method=post action="<c:url value="/query/list"/>" >
                    <TABLE cellSpacing=0 cellPadding=2 border=0>
                    <TBODY>
                     	<TR>
                            <TD><span class="title_menu">筛选条件：</span></TD>
                            <TD>
                            	标题
                             	 <INPUT type="text" id="title" name="title" style="WIDTH: 100px" maxLength=50  value="${query.title}"/>  &nbsp;&nbsp;
                            </TD>
                           <TD> &nbsp;&nbsp; <INPUT class=button id=sButton2 type="button" value=" 筛 选 " name=sButton2 onclick="doSearch()" />
                          	 &nbsp;<INPUT class=button id=ClearButton type="button" value=" 清 空 " name=ClearButton onclick="doClear()" /></TD>
                          </TR>
                      </TBODY>
                      </TABLE>
                    </FORM> 
                    </TD>
                  </TR>
                  <TR>
                    <TD class="data-grid">
                    
                    <!-- 数据列表，使用el标签循环生成即可 -->
                    <FORM id="query" name="query" method=post>
                    <TABLE id=grid style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=0>
                        <TBODY>
                        <TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none" height="30px">
                            <TH><INPUT id="chkAll" name="chkAll" type="checkbox"  value="" />全选</TH>
                            <TH>编号</TH>
                            <TH>标题</TH>
                            <TH>是否同步</TH>
                            <TH>操作</TH>
                   		<c:forEach items="${list }" var="info"  varStatus="infoStatus">
                   		<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none" height="30px">
                            <TD class="list_td_align" >
                            <c:if test = "${info.isSync == 0 }">
                            <INPUT name="chk" type="checkbox"   value="${info.qid }" />
                            </c:if>                            
                            </TD>
                            <TD class="list_td_align_left">${info.no}</TD>
                            <TD class="list_td_align_left"><a  href="<c:url value="/query/detailQuery?qid=${info.qid }"/>">${info.title}</a></TD>
                            <TD class="list_td_align">
                            <c:if test = "${info.isSync == 1 }">已同步</c:if>
                            <c:if test = "${info.isSync == 0 }">未同步</c:if>
                            </TD>
                            <TD class="list_td_align">
                                <c:if test = "${info.isSync == 1 }">
                                <a href="javascript:doOfflineOne(${info.qid})" >下线</a> 
                                </c:if>
                                <c:if test = "${info.isSync == 0 }">
                                <a href="javascript:doOnlineOne(${info.qid})" >上线</a> | 
                                <a href="<c:url value="/query/editQuery?qid=${info.qid}"/>">修改</a> | 
                            	<a href="javascript:doRemoveOne(${info.qid})" >删除</a>
                                </c:if>

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
<SCRIPT language="javascript">


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
		 $("#query").ajaxSubmit({
		  	   type: 'post', 
		  	   url:'<c:url value='/query/removeQuery'/>',
		  	   success:function(data){
		  		   if(data.success){
		  			 window.location = "<c:url value='/query/list'/>"+window.location.search;
		  		   }else{
		  			   alert(data.data);
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//删除操作（单个操作）
function doRemoveOne(id){
	//首先判断数字是否有效
	if(isNaN(id)){
		alert("该条记录无效，无法删除！");
		return false;
	}
	if(confirm("您确定要删除所选的记录吗？")){
		 $("#query").ajaxSubmit({
		  	   type: 'post', 
		  	   url:'<c:url value='/query/removeQuery'/>?qid='+id,
		  	   success:function(data){
		  		   if(data.success){
		  			 window.location = "<c:url value='/query/list'/>"+window.location.search;
		  		   }else{
		  			   alert(data.data);
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}


//上线操作（批量操作，单个操作）
function doOnline(){
	var isvalid = false;
	//首先判断是否选择上线
	$("input[name=chk]").each(function(){
		if($(this).attr("checked")){
			isvalid = true;
		}
	});
	if(!isvalid){
		alert("请选择要上线的记录！");
		return false;
	}
	if(confirm("您确定要上线所选的记录吗？")){
		 $("#query").ajaxSubmit({
		  	   type: 'post', 
		  	   url:'<c:url value='/query/onlineQuery'/>',
		  	   success:function(data){
		  		   if(data.success){
		  			 window.location = "<c:url value='/query/list'/>"+window.location.search;
		  		   }else{
		  			   alert(data.data);
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//上线操作（单个操作）
function doOnlineOne(id){
	//首先判断数字是否有效
	if(isNaN(id)){
		alert("该条记录无效，无法上线！");
		return false;
	}
	if(confirm("您确定要上线所选的记录吗？")){
		 $("#query").ajaxSubmit({
		  	   type: 'post', 
		  	   url:'<c:url value='/query/onlineQuery'/>?qid='+id,
		  	   success:function(data){
		  		   if(data.success){
		  			 window.location = "<c:url value='/query/list'/>"+window.location.search;
		  		   }else{
		  			   alert(data.data);
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}


//下线操作（批量操作，单个操作）
function doOffline(){
	var isvalid = false;
	//首先判断是否选择下线
	$("input[name=chk]").each(function(){
		if($(this).attr("checked")){
			isvalid = true;
		}
	});
	if(!isvalid){
		alert("请选择要下线的记录！");
		return false;
	}
	if(confirm("您确定要下线所选的记录吗？")){
		 $("#query").ajaxSubmit({
		  	   type: 'post', 
		  	   url:'<c:url value='/query/offlineQuery'/>',
		  	   success:function(data){
		  		   if(data.success){
		  			 window.location = "<c:url value='/query/list'/>"+window.location.search;
		  		   }else{
		  			   alert(data.data);
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//下线操作（单个操作）
function doOfflineOne(id){
	//首先判断数字是否有效
	if(isNaN(id)){
		alert("该条记录无效，无法下线！");
		return false;
	}
	if(confirm("您确定要下线所选的记录吗？")){
		 $("#query").ajaxSubmit({
		  	   type: 'post', 
		  	   url:'<c:url value='/query/offlineQuery'/>?qid='+id,
		  	   success:function(data){
		  		   if(data.success){
		  			 window.location = "<c:url value='/query/list'/>"+window.location.search;
		  		   }else{
		  			   alert(data.data);
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}
</SCRIPT>
</body> 
</html>
