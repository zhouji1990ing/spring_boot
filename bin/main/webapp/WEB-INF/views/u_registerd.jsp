<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1;' name='viewport' />
<meta content='yes' name='apple-mobile-web-app-capable' />
<meta content='black' name='apple-mobile-web-app-status-bar-style' />
<meta content='telephone=no' name='format-detection' />
<title>微登记</title>
<link rel='stylesheet' href='<c:url value="/resources/css/main.css"/>' />
<link href="<c:url value="/images/apple-touch-icon.png"/>" rel="apple-touch-icon-precomposed" /> 
<link rel="stylesheet" href="<c:url value='/resources/css/jquery.mobile-1.4.3.css'/>" />
<script type="text/javascript" src="<c:url value='/resources/js/jquery-1.11.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery.mobile-1.4.3.min.js'/>"></script>

<style>
td{line-height:45px;height:50px;text-align:center;}
label{ background:#58a6bf;  line-height:37px; padding:8px 15px 8px 15px ; margin-right:10px; border-radius:3px; font-size:16px; color:#FFF;}
input{height:35px;}
input::placeholder{
text-align:center;
}
select{border: 1px #CCC solid;color: #A0A0A0;-webkit-border-radius: 3px;display: inline-block;height: 23px;}
</style>
<script type="text/javascript">
$(function(){
	$("#province").change(function(){
		var index = window.document.getElementById("province").selectedIndex;
		var text = window.document.getElementById("province").options[index].text;
		$("#provinceName").val(text);
		
		var nodeId = $("#province").val();
		if(nodeId == 0){
			$("#city").empty();
			$("#city").append("<option value='0'>选择城市</option>");
			return false;
		}
		$.ajax({
			type:"post",
			async:true,
			url:"<c:url value='/u/fuser/syncGetCity' />",
			data:"nodeId="+nodeId,
			success:function(data){
				var option ="";
				$("#city").empty();
				$("#city").append("<option value='0'>选择城市</option>");
				for(var i=0;i<data.listCity.length;i++){
					option += "<option value='"+data.listCity[i].nodeId+"'>"+data.listCity[i].nodeName+"</option>";
				}
				$("#city").append(option);
			}
		});
	});
	
	$("#city").change(function(){
		var index = window.document.getElementById("city").selectedIndex;
		var text = window.document.getElementById("city").options[index].text;
		$("#cityName").val(text);
		
	});
});


	function Do_save_ftn(){
		var username = $.trim($("#username").val());
		if(username.length <=0 || username =='姓名'){$("#message").html("“姓名不能为空”");return false;}
		var phone = $.trim($("#phone").val());
		if(phone.length <=0 || phone == '电话'){$("#message").html("“电话不能为空”");return false;}
		var cityName = $("#cityName").val();
		if(cityName.length <=0){$("#message").html("“请选择地市”");return false;}
		/* var company = $("#company").val();
		if(company.length <=0){$("#message").html("“公司不能为空”");return false;} */
		
		$("#message").html("");
		$("#saveForm").submit();
	}
</script>
</head>
<body>

<FORM id="saveForm" name="saveForm" action="<c:url value="/u/fuser/saved"/>" method=post data-ajax="false">
<input type="hidden" name="wxcode" value="${wxcode}" />

<header>
  <div id="webtop"><span style="padding-right:8px;"><img src="<c:url value="/resources/images/arrow.png"/>" width="20" height="14"></span>注册</div>
  <div class="login">
    <ul>
      <li>
        <input type="text" id="username" name="username"
         placeholder="姓名"
        style="height:35px;  background:url(<c:url value="/resources/images/user-1.png"/>) #f2f2f3 no-repeat; background-position:right;background-position:98% 50%; " placeholder="" />
      </li>
      <li>
        <input type="text" id="phone" name="phone"  placeholder="电话"  style="height:35px;  background:url(<c:url value="/resources/images/lock.png"/>) #f2f2f3 no-repeat;background-position:right;background-position:98% 50%; " placeholder="" />
      </li>
      <li>
        <select name="province" id="province" style="height:35px;background: #f2f2f3" placeholder="" >
     		<option value="0">省市</option>
     		<c:forEach items="${listProvice}" var="p">
				<option value="${p.nodeId}">${p.nodeName}</option>						     		
     		</c:forEach>
     	</select>
	    </li>
	   <li>
	   <select name="city" id="city" style="height:35px;background: #f2f2f3" placeholder="" >
     		<option value="0">地区</option>
     	</select>
     	<input type="hidden"  name="provinceName" id="provinceName" />
     	<input type="hidden"  name="cityName" id="cityName" />
	   </li> 
    </ul>
  </div>
  <div class="refer">
  	<div id="message" style="color:red;"></div>
    <div class="refer_l" onclick="Do_save_ftn();">注册提交</div>
  </div>
  </div>
</header>
</FORM>
</body>
</html>