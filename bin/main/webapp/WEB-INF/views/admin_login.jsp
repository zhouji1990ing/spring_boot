<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>江苏省地震局防震减灾制度文件管理系统</title>
</head>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/gold.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.8.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.easyui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.form.js'/>"></script>
<style type="text/css">
	html{
		height: 100%;
		width: 100%;
		margin:0;
		padding:0;
		clear:both;
	}
	html,body{
		width: 100%;
		margin:0;
		padding:0;
		clear:both;
	}
</style>
<script type="text/javascript">
document.onkeydown = function(evt){
  　 var evt = window.event?window.event:evt;
   　if (evt.keyCode==13) {
          /* document.forms["mpky_login"].submit(); */
          $("#submit_button").click();
   }
  }
function doSubmit() {
	$("#mpky_login").ajaxSubmit({
	  	   type: 'post', 
	  	   url:'<c:url value="/admin/doLogin"/>',
 	  	   beforeSubmit: validate, 
	  	   success:function(data){
	  		 	/* try{
					data = eval('(' + data + ')');
				}catch(e){
					alert("出错了!");
					return;
				} */
	  		   if(data.success){
	  			   window.location = data.url;
	  		   }else{
	  			   alert(data.message);
	  		   }
	  	   },
	  	   error: function(XmlHttpRequest, textStatus, errorThrown){  
	             alert("表单提交出错！请联系管理员！"+textStatus);  
	  	   }
	     });
}

//在这里对表单进行验证，如果不符合规则，将返回false来阻止表单提交，直到符合规则为止 
function validate(formData, jqForm, options) {  
	  
	   //利用fieldValue()方法，fieldValue 是表单插件的一个方法，它能找出表单中的元素的值，返回一个集合。  
	   var name = $('input[name=username]').fieldValue();  
	   var dm = $('input[name=password]').fieldValue();  
	   if (!name[0]) {  
	      alert('请输入登录名！');  
	      return false;  
	   }  
	   if (!dm[0]) {  
		  alert('请输入登录密码！');  
		  return false;  
	   } 

	   return true;  
}
</script>
<body style="background-size:100% 100%;background-color:#fff;background-image:url(<c:url value='/resources/images/bg_login_banner_v51e5b3a.jpg'/>);background-repeat:no-repeat;">
<div class="login-mod">
<div align="center" class="login-panel">
<h3>江苏省地震局防震减灾制度文件管理系统</h3>
  <form class="login-form" id="mpky_login" method="post">
    <div class="login-un">
      <span class="icon-wrapper"><i class="icon_login un"></i></span>
      <input type="text" name="username" id="username" placeholder="用户名" value="">
    </div>
    <div class="login-pwd">
      <span class="icon-wrapper"><i class="icon_login pwd"></i></span>
      <input type="password" name="password" id="password"  placeholder="密码">
    </div>
  </form>
  <div class="login-btn-panel">
    <a class="login-btn" title="点击登录" href="javascript:;" id="submit_button" onclick="doSubmit()">登录</a>
  </div>
</div>
</div>
</body>
</html>
