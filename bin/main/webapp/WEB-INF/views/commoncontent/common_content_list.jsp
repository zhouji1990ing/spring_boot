<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公共文本列表</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript">
function doSearch(){
	//$("#do_search_form").submit();
	var title ='';
	var qrycode = '';
	var digest = '';
	if($('#title').val())
	{
		title = $('#title').val();
	}
	
	if($('#code').val()){
		qrycode = $('#code').val();
	}
	
	if($('#digest').val()){
		digest = $('#digest').val();
	}
	
	window.location = '<c:url value='/commonContent/list?currpage=1'/>&code='+qrycode+'&title='+title+'&digest='+digest;
}
function doClear(){
	$('#title').val("");
	$('#code').val("");	
	$('#digest').val("");	
	window.location = '<c:url value='/commonContent/list?currpage=1'/>';
}
var code='${commonContent.code}';

//修改同步状态
function modifyCommonContentIsSyncOne(isSync,ccid){
	//首先判断数字是否有效
	if(isNaN(ccid)){
		alert("该条记录无效！");
		return false;
	}
	if(confirm("您确定要修改当前发步状态？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/commonContent/modifyCommonContentIsSync'/>?isSync='+isSync+'&ccid='+ccid,
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/commonContent/list?currpage=1'/>&code='+code;
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//修改推荐状态
function modifyCommonContentRecommend(recommend,ccid){
	//首先判断数字是否有效
	if(isNaN(ccid)){
		alert("该条记录无效！");
		return false;
	}
	if(confirm("您确定要修改当前推荐状态？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/commonContent/modifyCommonContentRecommend'/>?recommend='+recommend+'&ccid='+ccid,
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/commonContent/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//删除操作（批量操作，单个操作）
function doSet(){
	var isvalid = false;
	//首先判断是否选择设置
	$("input[name=chk]").each(function(){
		if($(this).attr("checked")){
			isvalid = true;
		}
	});
	var code = $('#scode').val();
	if(code == null || code ==''){
		alert('请选择分类');
		return false;
	}
	if(!isvalid){
		alert("请选择要设置的记录！");
		return false;
	}
	var data = $('#commonContent').serialize();
	console.log(data);
	data += '&code='+code;
	if(confirm("您确定要设置所选的记录吗？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/commonContent/setType'/>',
		  	   data:data,
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = location;
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
		  	   url:'<c:url value='/commonContent/removeCommonContent'/>',
		  	   data:$('#commonContent').serialize(),
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/commonContent/list?currpage=1'/>';
		  		   }
		  	   },
		  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
		             alert("表单提交出错！请联系管理员！");  
		  	   }
		     });
	}
}

//删除操作（单个操作）
function doRemoveOne(ccid){
	//首先判断数字是否有效
	if(isNaN(ccid)){
		alert("该条记录无效，无法删除！");
		return false;
	}
	if(confirm("您确定要删除所选的记录吗？")){
		 $.ajax({
		  	   type: 'post', 
		  	   url:'<c:url value='/commonContent/removeCommonContent'/>?ccid='+ccid,
		  	   success:function(data){
		  		   if(data.success){
		  			   window.location = '<c:url value='/commonContent/list?currpage=1'/>&code='+code;
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
                <TD class=manageHead>当前位置：管理首页 &gt; ${menuType.name }管理模块 &gt; ${menuType.name }列表</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 添  加 " onclick="javascript:window.location='<c:url value='/commonContent/createCommonContent?code=${menuType.code }&codeName=${menuType.name }' />'" />
		                 	 <INPUT class=button id="batchdelete" type="button" value=" 批量删除 " onclick="doRemove()" />
	                  </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD height="35px">
                    <!-- 数据筛选区域，查询表单区域 -->
                    <FORM id="do_search_form" name="do_search_form" method=post action="<c:url value="/commonContent/list"/>" >
                    <TABLE cellSpacing=0 cellPadding=2 border=0>
                    <TBODY>
                     	<TR>
                            <TD><span class="title_menu">设置分类：</span></TD>
                            <TD>
                            	 文件编号：
                             	 <INPUT type="text" id="digest" name="digest" style="WIDTH: 100px" maxLength=50  value="${commonContent.digest}"/>  &nbsp;&nbsp;
                            </TD>
                            <TD>
                            	 标题：
                             	 <INPUT type="text" id="title" name="title" style="WIDTH: 100px" maxLength=50  value="${commonContent.title}"/>  &nbsp;&nbsp;
                            </TD>
							<c:if test="${currentUser.post == null || currentUser.post == ''}">
	                            <TD>
	                            	 分类：
	                             	 <select name="code" id="code">
	                             	 <option value="">--选择分类--</option>
							        <c:forEach items = "${mList }" var="type" varStatus="status">
							     	<option value="${type.code }" <c:if test="${commonContent.code == type.code }">selected</c:if> >${type.name }</option>
							     	</c:forEach>
							        </select>
	                            </TD>
                            </c:if>
                           <TD> &nbsp;&nbsp; <INPUT class=button id=sButton2 type="button" value=" 筛 选 " name=sButton2 onclick="doSearch()" />
                            &nbsp;&nbsp; <INPUT class=button id=sButton type="button" value=" 清 除 " name=sButton onclick="doClear()" />
                          </TR>
                      </TBODY>
                      </TABLE>
                    </FORM> 
                    </TD>
                  </TR>
                  <TR><TD><hr/></TD></TR>
                  <%-- <TR>
                    <TD height="35px">
                    <!-- 数据筛选区域，查询表单区域 -->
                    <FORM id="do_search_form" name="do_set_form" method=post action="<c:url value="/commonContent/list"/>" >
                    <TABLE cellSpacing=0 cellPadding=2 border=0>
                    <TBODY>
                     	<TR>
                            <TD><span class="title_menu">设置分类：</span></TD>
                            <TD>
                            	 分类：
                             	 <select name="scode" id="scode">
						        <c:forEach items = "${mList }" var="type" varStatus="status">
						     	<option value="${type.code }" <c:if test="${commonContent.code == type.code }">selected</c:if> >${type.name }</option>
						     	</c:forEach>
						        </select>
                            </TD>
                           <TD> &nbsp;&nbsp; <INPUT class=button id=sButton2 type="button" value=" 设 置 " name=sButton2 onclick="doSet()" />
                           
                          </TR>
                      </TBODY>
                      </TABLE>
                    </FORM> 
                    </TD>
                  </TR> --%>
                  <TR><TD><hr/></TD></TR>
                  <TR>
                    <TD>
                    
                    <!-- 数据列表，使用el标签循环生成即可 -->
                    <FORM id="commonContent" name="commonContent" method=post>
                    <TABLE id=grid style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc" cellSpacing=1 cellPadding=2 rules=all border=0>
                        <TBODY>
                        <TR style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none" height="30px">
                            <TH>
                            	<INPUT id="chkAll" name="chkAll" type="checkbox"  value="" />全选
                            </TH>
                            <TH>文件编号</TH>
                            <TH>标题</TH>
                            <TH>部门</TH>
                            <TH>线上状态</TH>
                            <TH>创建时间</TH>
                            <TH>操作</TH>
                   		<c:forEach items="${list }" var="list"  varStatus="status">
                   		<TR style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none" height="30px">
                            <TD class="list_td_align"><INPUT name="chk" type="checkbox" value="${list.ccid }" /></TD>
                            <TD class="list_td_align">${list.digest}</TD>
                            <TD class="list_td_align" style="text-align:left;"><a title="点击查看详细信息" href="<c:url value="/commonContent/detailCommonContent?ccid=${list.ccid }&code=${menuType.code }&codeName=${menuType.name }"/>">${list.title}</a></TD>
                            <TD class="list_td_align">${list.codeName}</TD>
                            <TD class="list_td_align">
                            	<c:if test = "${list.isSync == 1 }">已上线</c:if>
                            	<c:if test = "${list.isSync == 0 }">未上线</c:if>
                            </TD>
                            <TD class="list_td_align">${list.createtimeString}</TD>
                            <TD class="list_td_align">
                            <A href="javascript:void(0)" onclick="modifyCommonContentIsSyncOne('${list.isSync }','${list.ccid}')">
                            		<c:if test = "${list.isSync == 1 }">下线</c:if>
                            		<c:if test = "${list.isSync == 0 }">上线</c:if>
                            	</A> |
                            	<%-- <A href="javascript:void(0)" onclick="modifyCommonContentRecommend('${list.recommend }','${list.ccid}')">
                            		<c:if test = "${list.recommend == 1 }">取消推荐</c:if>
                            		<c:if test = "${list.recommend == 0 }">推荐</c:if>
                            	</A> | --%>
                            	<a href="<c:url value="/commonContent/editCommonContent?ccid=${list.ccid}&code=${menuType.code }&codeName=${menuType.name }"/>">修改</a> |
                            	<A href="javascript:void(0)" onclick="doRemoveOne(${list.ccid })">删除</A> 
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
