<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>视频类型列表</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript">
function doSearch(){
	$("#do_search_form").submit();
}
function doClear(){
	$("#name").val(""); 
}

/* 
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
		  	   url:'<c:url value='/videoType/removeVideoType'/>',
		  	   data:$('#videoType').serialize(),
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/videoType/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//删除操作（单个操作）
function doRemoveOne(videoTypeId){
	//首先判断数字是否有效
	if(isNaN(videoTypeId)){
		alert("该条记录无效，无法删除！");
		return false;
	}
	if(confirm("您确定要删除所选的记录吗？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/videoType/removeVideoType'/>?videoTypeId='+videoTypeId,
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/videoType/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
} */

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
                <TD class=manageHead>当前位置：管理首页 &gt; 视频类型管理模块 &gt; 视频类型列表</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 添  加 " onclick="javascript:window.location='<c:url value='/videoType/createVideoType' />'" />
		                 	 <!-- <INPUT class=button id="batchdelete" type="button" value=" 批量删除 " onclick="doRemove()" /> -->
	                  	                  
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD height="35px">
                    <!-- 数据筛选区域，查询表单区域 -->
                    <FORM id="do_search_form" name="do_search_form" method=post action="<c:url value="/videoType/list"/>" >
                    <TABLE cellSpacing=0 cellPadding=2 border=0>
                    <TBODY>
                     	<TR>
                            <TD><span class="title_menu">筛选条件：</span></TD>
                            <TD>
                            	 类型名称
                             	 <INPUT type="text" id="name" name="name" style="WIDTH: 100px" maxLength=50  value="${videoType.name}"/>  &nbsp;&nbsp;
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
                    <FORM id="videoType" name="videoType" method=post>
                    <TABLE id=grid style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=0>
                        <TBODY>
                        <TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none" height="30px">
                            <TH width="5%">
                            	<INPUT id="chkAll" name="chkAll" type="checkbox"  value="" />全选
                            </TH>
                            <TH width="5%">序号</TH>
                            <TH width="50%">视频类型名称<br><SPAN style='color:green'>(点名称可查看详情)</SPAN></TH>
                            <TH width="10%">排序</TH>
                            <TH width="30%">操作</TH>
                   		<c:forEach items="${list }" var="list"  varStatus="status">
                   		<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none" height="30px">
                            <TD width="5%" class="list_td_align"><INPUT name="chk" type="checkbox" value="${list.videoTypeId }" /></TD>
                            <TD width="5%" class="list_td_align">${status.index+1}</TD>
                            <TD width="50%" class="list_td_align"><a title="点击查看详细信息" href="<c:url value="/videoType/detailVideoType?videoTypeId=${list.videoTypeId }"/>">${list.name}</a></TD>
                            <TD width="10%" class="list_td_align">${list.isorder}</TD>
                            <TD width="30%" class="list_td_align">
                            	<a href="<c:url value="/videoType/editVideoType?videoTypeId=${list.videoTypeId}"/>">修改</a> 
                            	<%-- <A href="javascript:void(0)" onclick="doRemoveOne(${list.videoTypeId })">删除</A>  --%>
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
