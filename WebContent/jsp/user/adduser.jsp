<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
span {
	color: red;
	font-size: 12px;
}

body {
	
	background-color: #D7D2CF
}

input {
	width: 120px;
	height: 16px;
	padding: 2px 5px;
	border-radius: 4px;
}
table tr td span{
	text-align: left;
	width: 150px;
}

.code {
	background: url(<%=request.getContextPath()%>/img/code_bg.jpg);
	font-family: Arial;
	font-style: italic;
	color: blue;
	font-size: 15px;
	border: 0;
	padding: 2px 3px;
	letter-spacing: 3px;
	float: left;
	cursor: pointer;
	width: 100px;
	height: 30px;
	line-height: 20px;
	text-align: center;
	vertical-align: middle;
}

a {
	text-decoration: none;
	font-size: 12px;
	color: #288bc4;
}

a:hover {
	text-decoration: underline;
}
</style>
 <%@ include file="/utill/utill.jsp" %>
<script type="text/javascript">
   var code;
   var flag="ture";
   function reset(){
	   $("input").val("");
	   $("span").text("");
   }
   function createCode() 
   {
    code = "";
    var codeLength = 4; //验证码的长度
    var checkCode = document.getElementById("checkCode");
    var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9); //所有候选组成验证码的字符，当然也可以用中文的
    for(var i = 0; i < codeLength; i++) 
    {
     var charNum = Math.floor(Math.random() * 10);
     code += codeChars[charNum];
    }
    if(checkCode) 
    {
     checkCode.className = "code";
     checkCode.innerHTML = code;
    }
   }
   
   $(function(){
	   $("input[id='username']").blur(function(){
		   if($(this).val().length==0){
			   $("#u").css({"color":"red"});
			   document.getElementById("u").innerHTML="用户名不可为空";
		   }else{
			   var username=$(this).val();
			   var patten=/^[a-zA-Z]{5,17}$/;
			  
			  if(patten.test(username)){
				  document.getElementById("u").innerHTML="<img src='<%=request.getContextPath()%>/img/ok.png'/>";
				  flag="ture";
			  }else{
				  $("#u").css({"color":"red"});
				  document.getElementById("u").innerHTML="纯字母组成，6~10个。";
				  flag="false"
			  }
		   }
	   });
	   $("input[id='password']").blur(function(){
		   if($(this).val().length==0){
			   $("#p").css({"color":"red"});
			   document.getElementById("p").innerHTML="请输入密码。";
		   }else{
			   var password=$(this).val();
			   var patten=/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,10}$/;
			  
			  if(patten.test(password)){
				  document.getElementById("p").innerHTML="<img src='<%=request.getContextPath()%>/img/ok.png'/>";
				  flag="ture";
			  }else{
				  $("#p").css({"color":"red"});
				  document.getElementById("p").innerHTML="密码不符合规则";
				  flag="false"
			  }
		   }
	   });
	   $("input[id='realname']").blur(function(){
		   if($(this).val().length==0){
			   $("#r").css({"color":"red"});
			   document.getElementById("r").innerHTML="请输入姓名。";
		   }else{
			   var realname=$(this).val();
			   var patten=/^[\u4e00-\u9fa5]{2,4}$/;
			  
			  if(patten.test(realname)){
				  document.getElementById("r").innerHTML="<img src='<%=request.getContextPath()%>/img/ok.png'/>";
				  flag="ture";
			  }else{
				  $("#r").css({"color":"red"});
				  document.getElementById("r").innerHTML="3~5个汉字.。";
				  flag="false"
			  }
		   }
	   });
	   $("input[id='tel']").blur(function(){
		   if($(this).val().length==0){
			   $("#t").css({"color":"red"});
			   document.getElementById("t").innerHTML="请输入手机号码。";
		   }else{
			   var tel=$(this).val();
			   var patten=/^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
			  
			  if(patten.test(tel)){
				  document.getElementById("t").innerHTML="<img src='<%=request.getContextPath()%>/img/ok.png'/>";
				  flag="ture";
			  }else{
				  $("#t").css({"color":"red"});
				  document.getElementById("t").innerHTML="输入的手机号有误，请检查";
				  flag="false"
			  }
		   }
	   });
   });
   $(function(){
	   $("input[id='username']").focus(function(){
		   if($(this).val().length==0){
			   $("#u").css({"color":"black"});
			   document.getElementById("u").innerHTML="纯字母组成，6~10个。";
		   }
	   });
	   $("input[id='password']").focus(function(){
		   if($(this).val().length==0){
			   $("#p").css({"color":"black"});
			   document.getElementById("p").innerHTML="字母和数字，6~12个。";
		   }
	   });
	   $("input[id='realname']").focus(function(){
		   if($(this).val().length==0){
			   $("#r").css({"color":"black"});
			   document.getElementById("r").innerHTML="3~5个汉字.";
		   }
	   });
	   $("input[id='tel']").focus(function(){
		   if($(this).val().length==0){
			   $("#t").css({"color":"black"});
			   document.getElementById("t").innerHTML="手机号须为11为纯数字。";
		   }
	   });
   });
   function add() 
   {
	   var username=$("#username").val();
	   if(username==""){document.getElementById("u").innerHTML="用户名不可为空";flag="false";}
 	   var password=$("#password").val();
 	  if(password==""){document.getElementById("p").innerHTML="请输入密码";flag="false";}
 	   var realname=$("#realname").val();
 	  if(realname==""){document.getElementById("r").innerHTML="请输入姓名。";flag="false";}
 	   var sex=$("input[type='radio']:checked").val();
 	   var tel=$("#tel").val();
 	  if(tel==""){document.getElementById("t").innerHTML="请输入手机号码";flag="false";}
 	   var roleid=$("#roleid").val();
 	   
 	   if(flag=="ture"){
       var inputCode=document.getElementById("inputCode").value;
    if(inputCode.length <= 0) 
    {
    	showMsg('验证码不可为空','center');
    	
    }
    else if(inputCode.toUpperCase() != code.toUpperCase()) 
    {
    	showMsg('验证码输入有误','center');
      createCode();
      $("#inputCode").focus();
      $("#inputCode").select();
    }
    else 
    {
    	 var site= document.getElementById("site").innerHTML; 
    	$.ajax({
    		data:{username:username,password:password,realname:realname,sex:sex,roleid:roleid,tel:tel},
			type:"post",
			url:site+"/add.do",
			datatype:"text",
			success:function(data){
				if(data=="ture"){
					showMsg(username+'注册成功','center');
					$("input").val("");
					$("span [name='check']").text("");
				}
			}
    		
    	});
 	   
    }    
  	 }  
 	   }
   function rolelist(){
	   var site= document.getElementById("site").innerHTML;
	
		$.ajax({
			data:'',
			url:site+"/rolename.do",
			type:"get",
			datatype:'text',
			success:function(data){
              var json=eval("("+data+")");
				var jsonlength=json.length;
				$("#roleid").empty();
				for(var i=0;i<jsonlength;i++){
					var menulist="<option value='"+json[i].roleid+"'>"+json[i].roletitle+"</option>";
					$("#roleid").append(menulist); 
				}
			},
			error:function(XMLHttpRequest, textStatus){  
	            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    XMLHttpRequest.status   XMLHttpRequest.readyState  
	            console.log(textStatus);  
	            showMsg("系统错误","center"); 
	        }  
			});
	}
   </script>
</head>
<body onload="rolelist()">
	<div
		style="width: 450px; background-color: white;text-align: center;margin: auto;border-radius: 5px;">
		<div id="site" style="display: none;"><%=request.getContextPath()%></div>
		<br>
		<h5>
			请认真填写信息 ，带 "<label style="color: red">*</label>" 的为必填项。
		</h5>
		<table cellpadding="8" style="margin-left: 50px;">
			<tr>
				<td><label style="color: red">*</label>&nbsp;账&nbsp;&nbsp;&nbsp;号:</td>
				<td><input type="text" id="username"></input></td>
				<td><span id="u" name="check"></span></td>
			</tr>
			<tr>
				<td><label style="color: red">*</label>&nbsp;密&nbsp;&nbsp;&nbsp;码:</td>
				<td><input type="password" id="password"></input></td>
				<td><span id="p" name="check"></span></td>
			</tr>
			<tr>
				<td><label style="color: red">*</label>&nbsp;姓&nbsp;&nbsp;&nbsp;名:</td>
				<td><input type="text" id="realname"></input></td>
				<td><span id="r" name="check"></span></td>
			</tr>
			<tr>
				<td><label style="color: red">*</label>&nbsp;性&nbsp;&nbsp;&nbsp;别:</td>
				<td><input type="radio" checked="checked" id="sex" value="男" name="sex"
					 style="width: 40px;" />男 <input type="radio"
					id="sex" value="女" name="sex" style="width: 40px;" />女</td>
			</tr>
			<tr>
				<td><label style="color: red">*</label>&nbsp;电&nbsp;&nbsp;&nbsp;话:</td>
				<td><input type="text" id="tel"></input></td>
				<td><span id="t" name="check"></span></td>
			</tr>
			<tr>
				<td><label style="color: red">*</label>&nbsp;角&nbsp;&nbsp;&nbsp;色:</td>
				<td><select id="roleid" size="1"
					style="width: 130px; height: 26px;">
						
				</select></td>
			</tr>
			<tr>
				<td>验证码：</td>
				<td><div class="code" id="checkCode" onclick="createCode()">点击更换</div></td>

			</tr>
			<tr>
				<td></td>
				<td><input style="float: left;" type="text" id="inputCode" /></td>
				<td><span style="font-size: 12px; color: red;" id="code"></span></td>
			</tr>

			<tr>
				<td colspan="2"></td>
			</tr>

		</table>
		<button type="button"  onclick="reset()">重置</button>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="add();">提交</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<br><br>
	</div>


</body>
</html>