<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/login.css"/>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<title>物流系统-登陆</title>
<link rel="icon" href="img/logo.ico" type="image/x-icon">
<style type="text/css">
	span{
	font-size: 11px;
	color: red;
	}
	a:HOVER {
	color: blue;
}
label{
font:normal 12px/30px Georgia,serif; 
}
</style>
<script type="text/javascript">
$(document).ready(function () {
	document.getElementById("username").focus();
	$("#password").keydown(function (e) {
	var curKey = e.which;
	if (curKey == 13) {
	$("#button").click();
        return false;
        }
	});
	});
	function submit(){
		var site=$("#site").val();
		var username=$("#username").val();
		var password=$("#password").val();
		if(username==""){
			//alert("密码不可为空");
			document.getElementById("u").innerHTML="账号必填";
			if(password==""){
				//alert("密码不可为空");
				document.getElementById("p").innerHTML="密码必填";
			}
			return;
		}
		if(password==""){
			//alert("密码不可为空");
			document.getElementById("p").innerHTML="密码必填";
			return;
		}
		
		$.ajax({
				data:{username:username,password:password},
				type:"GET",
				url:site+"/submit.do",
				datatype:"text",
				success:function(data){
					if(data=="200"){
						window.location.href=site+"/sub.do";
					}
					if(data=="400"){
						document.getElementById("p").innerHTML="密码错误";
					}
				}
		});
	}
	function yanzheng(){
		var site=$("#site").val();
		var username=$("#username").val();
		if(!username==""){
		$.ajax({
			data:{username:username},
			type:"GET",
			url:site+"/yanz.do",
			datatype:"text",
			success:function(data){
				if(data=="200"){
					document.getElementById("u").innerHTML="<img src='./img/ok.png'/>";	
				}else{
					document.getElementById("u").innerHTML="<img src='./img/no.png'/>";
				}
			}
		});
	}}
	function init(){
		$("#username").val("");
	    $("#password").val("");
	}
	function forget(){
		window.open('jsp/forget.jsp', '修改密码', 'height=300, width=450, top=100px, left=100px');
	}
	
</script>
</head>
<body bgcolor="#387ccf">
	<input style="display: none;" id="site" value="<%=request.getContextPath()%>">
	<div id="top"><br><br>
		<h1>自动化物流系统<sup>2017</sup></h1>
		<div id="un"><label>账号：</label><input id="username" type="text" name="username" onblur="yanzheng();">&nbsp;<span id="u"></span></div>
		<div id="pw"><label>密码：</label><input id="password" type="password" name="password">&nbsp;<span id="p"></span></div>
		<div id="reset"><button type="button" onclick="init();">重置</button></div>
		<div id="load"><button id="button" type="button" onclick="submit()">登录</button></div>
		<div id="find"><span style="font-size: 13px;"><a onclick="forget()">忘记密码</a></span></div>
		<div>
			
		</div>
	</div>
	
</body>
</html>