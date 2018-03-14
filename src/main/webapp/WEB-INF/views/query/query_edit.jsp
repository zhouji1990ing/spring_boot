<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前沿观点 -- 编辑页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
<script type="text/javascript">
	function Do_save_ftn(){
		
		
		var title = $("#title").val();
		if(title.trim().length ==0){
			alert("标题不能为空");return false;
		}
		var no = $("#no").val();
		if(no.trim().length ==0){
			alert("编号不能为空");return false;
		}
	 	//var content = CKEDITOR.instances.content.getData();
	 	var content = $("#editor").val();
		if(content.trim().length == 0){
			alert("内容不能为空");return false;
		} 
		
		
		
		var data = new FormData();
		 
 		
 		data.append('no',no);
        data.append('title',$('#title').val());
        data.append('content',content);
        data.append('qid',$('#qid').val());
        $.ajax({
        	  url:"<c:url value="/query/modifyQuery"/>",
              type:'POST', 
        	  data:data,
        	  cache: false,
        	  contentType: false,    //不可缺
        	  processData: false,    //不可缺
        	  success:function(data){
        		  if(data.success){
        			  alert(data.data);
        			  window.location = location.href;
        		  }else{
        			 alert(data.data);
        		  }
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
              <TABLE cellSpacing=0 cellPadding=5 width="100%" border=0>
              <TR>
                 <TD class=manageHead>当前位置：管理首页 &gt; 新闻管理 &gt; 前沿观点  &gt;编辑</TD>
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
		                 	 <INPUT class=button id="back" type="button" value=" 返回列表 " onclick="javascript:window.location='<c:url value='/query/list' />'" />
	                  </TD>
                  </TR>
                  <TR>
                    <TD align="center">
						<p>&nbsp;</p>                    
                    <FORM id="saveForm" name="saveForm" action="<c:url value="/query/modifyQuery"/>" method=post enctype="multipart/form-data" >
                    <TABLE id=grid class="page_add" border=0>
                      <TBODY>
   
                         <tr>
						     <td width="6%">标题：</td>
						     <input type="hidden" name="qid" id="qid" value="${query.qid }"/>
						     <td width="94%"><input type="text" name="title" id="title" value="${query.title }" class="input_wb" /></td>
						 </tr>

						 <tr>
						     <td width="6%">编号：</td>
						     <td width="94%"><input type="text" name="no" id="no"  class="input_wb" value="${query.no }"/></td>
						 </tr>						 					 
						 <tr>
						  	 <td width="82">内容：</td>
							<td><textarea name="contents" id="editor" style="width:800px;height:200px;">${query.content }</textarea>
							</td>
						 </tr>
						 <tr>
						    <td></td>
						 	<td align="left" valign="middle">
						 	<input type="button" value=" 修改 " onclick="Do_save_ftn();"/>
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
<script>
/**
 * 使用UEditor
 */
//var ue = UE.getEditor('editor');
</script>
</body> 
</html>
