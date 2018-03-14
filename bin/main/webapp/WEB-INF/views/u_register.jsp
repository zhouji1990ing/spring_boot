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
<title>巢湖征兵微登</title>
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



	function Do_save_ftn(){
		var username = $.trim($("#username").val());
		if(username.length <=0 || username =='姓名'){$("#message").html("“姓名不能为空”");return false;}
		var phone = $.trim($("#phone").val());
		if(phone.length <=0 || phone == '电话'){$("#message").html("“电话不能为空”");return false;}
		
		var sex = $("#sex").val();
		if(sex.length <=0){$("#message").html("“请选择性别”");return false;}
		
		var year = $("#year").val();
		var month = $("#month").val();
		var day = $("#day").val();
		if(year.length <=0){$("#message").html("“请选择出生年”");return false;}
		if(month.length <=0){$("#message").html("“请选择出生月”");return false;}
		if(day.length <=0){$("#message").html("“请选择出生日”");return false;}
		
		$("#birthday").val(year+"-"+month+"-"+day);

		var arms = $("#arms").val();
		if(arms.length <=0){$("#message").html("“请选择兵种”");return false;}
		
		var education = $("#education").val();
		if(education.length <=0){$("#message").html("“请选择学历”");return false;}
		
		var desire = $("#desire").val();
		if(desire.length <=0){$("#message").html("“请选择参军意向”");return false;}
		
		var politicalstatus = $("#politicalstatus").val();
		if(politicalstatus.length <=0){$("#message").html("“请选择政治面貌”");return false;}
		
		var householdregister = $("#householdregister").val();
		if(householdregister.length <=0){$("#message").html("“请选择户籍”");return false;}
		/* var company = $("#company").val();
		if(company.length <=0){$("#message").html("“公司不能为空”");return false;} */
		
		$("#message").html("");
		$("#saveForm").submit();
	}
	

</script>
</head>
<body>

<FORM id="saveForm" name="saveForm" action="<c:url value="/u/fuser/save"/>" method=post data-ajax="false">
<input type="hidden" name="wxcode" value="${wxcode}" />
<input type="hidden" name="birthday" id="birthday" value="" />
<header>
  <div id="webtop">巢湖征兵微登</div>
  <div style="font-size:12px;padding:5px;text-align:center;color:#E21111;">进行微登记的,在定兵时,同等条件优先考虑.</div>
  <div class="login">
    <ul>
      <li>
        <input type="text" id="username" name="username" placeholder="姓名" />
      </li>
      <li>
        <input type="text" id="phone" name="phone"  placeholder="电话"  />
      </li>
      <li>
       <select name="sex" id="sex" style="height:35px;background: #f2f2f3" placeholder="" >
            <option value="">性别</option>
            <option value="男">男</option>
            <option value="女">女</option>
     	</select>
      
      </li>
      <li>
      <div>出生日期</div>
      <div style="width:36%;float:left;margin-right:5%;">
        <select name="year" id="year" style="height:35px;background: #f2f2f3" placeholder="" >
            <option value="">年</option>
            <c:forEach items="${yearlist }" var="info"  varStatus="infoStatus">
	            <option value="${info }">${info }</option>
	        </c:forEach>
     	</select>
     	</div>
     	<div style="width:27%;float:left;margin-right:5%;">
     	<select name="month" id="month" style="height:35px;background: #f2f2f3" placeholder="" >
            <option value="">月</option>
              <option value="01">01</option>
              <option value="02">02</option>
              <option value="03">03</option>
              <option value="04">04</option>
              <option value="05">05</option>
              <option value="06">06</option>
              <option value="07">07</option>
              <option value="08">08</option>
              <option value="09">09</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
     	</select>
     	</div>
     	<div style="width:27%;float:left;">
     	<select name="day" id="day" style="height:35px;background: #f2f2f3" placeholder="" >
            <option value="">日</option>
              <option value="01">01</option>
              <option value="02">02</option>
              <option value="03">03</option>
              <option value="04">04</option>
              <option value="05">05</option>
              <option value="06">06</option>
              <option value="07">07</option>
              <option value="08">08</option>
              <option value="09">09</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
              <option value="19">19</option>
              <option value="20">20</option>
              <option value="21">21</option>
              <option value="22">22</option>
              <option value="23">23</option>
              <option value="24">24</option>
              <option value="25">25</option>
              <option value="26">26</option>
              <option value="27">27</option>
              <option value="28">28</option>
              <option value="29">29</option>
              <option value="30">30</option>
              <option value="31">31</option>            
     	</select>
      <div style="width:30%;">
	   </li>
	   <li>
	   <select name=arms id="arms" style="height:35px;background: #f2f2f3" placeholder="" >
	        <option value="">兵种意愿</option>
	        <c:forEach items="${kList }" var="info"  varStatus="infoStatus">
	            <option value="${info.value }">${info.value }</option>
	        </c:forEach>
     	</select>
	   </li> 
	   <li>
	   <select id="education" name="education" style="height:35px;background: #f2f2f3" placeholder="">
	        <option value="">学历</option>
	        <c:forEach items="${eList }" var="info"  varStatus="infoStatus">
	            <option value="${info.value }">${info.value }</option>
	        </c:forEach>
		</select>
	   </li> 
	   <li>
	   <select id="desire" name="desire" style="height:35px;background: #f2f2f3" placeholder="">
	        <option value="">参军意向</option>
	        <c:forEach items="${dList }" var="info"  varStatus="infoStatus">
	            <option value="${info.value }">${info.value }</option>
	        </c:forEach>
		</select>
	   </li> 
	   <li>
	   <select id="politicalstatus" name="politicalstatus" style="height:35px;background: #f2f2f3" placeholder="">
	        <option value="">政治面貌</option>
	        <c:forEach items="${pList }" var="info"  varStatus="infoStatus">
	            <option value="${info.value }">${info.value }</option>
	        </c:forEach>
		</select>
	   </li> 
	   <select id="householdregister" name="householdregister" style="height:35px;background: #f2f2f3" placeholder="">
	        <option value="">户籍</option>
	        <c:forEach items="${hList }" var="info"  varStatus="infoStatus">
	            <option value="${info.value }">${info.value }</option>
	        </c:forEach>
		</select>
	   </li>
	   <li>
        <input type="text" id="idnumber" name="idnumber"  placeholder="身份证"  />
      </li>	   	   
    </ul>
  </div>
  <div class="refer">
  	<div id="message" style="color:red;"></div>
    <div class="ui-btn ui-shadow  ui-btn-b"  onclick="Do_save_ftn();">提交登记</div>
  </div>
  </div>
</header>
</FORM>
</body>
</html>