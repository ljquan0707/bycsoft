<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<title>修改密码</title>
<style type="text/css">
	body{
	font-size: 12px;
	}
</style>

<script type="text/javascript">
	var username="";
	function next_one(){
		 username=$("#name").val();
		var site=$("#site").val();
		if(!username==""){
			$.ajax({
				data:{username:username},
				type:"GET",
				url:site+"/yanz.do",
				datatype:"text",
				success:function(data){
					if(data=="200"){
						document.getElementById("msg").innerHTML="";
							document.getElementById("tip").innerHTML="请输入用户手机号";
							$("#name").val("");
							$("#one").hide();
							$("#two").show();
					}else{
						document.getElementById("msg").innerHTML="用户名不存在";
					}
				}
			});
	}else{
		document.getElementById("msg").innerHTML="用户名不可为空";
	}
		}
	function next_two(){
		 var tel=$("#name").val();
		var site=$("#site").val();
		if(!username==""){
			$.ajax({
				data:{username:username,tel:tel},
				type:"GET",
				url:site+"/yz.do",
				datatype:"text",
				success:function(data){
					if(data=="200"){
						document.getElementById("msg").innerHTML="";
							document.getElementById("tip").innerHTML="请输入新密码";
							$("#name").val("");
							$("#two").hide();
							$("#three").show();
					}else{
						document.getElementById("msg").innerHTML="手机号有误，请查正";
					}
				}
			});
	}else{
		document.getElementById("msg").innerHTML="手机号不可为空";
	}}
	function next_three(){
		 var password=$("#name").val();
		var site=$("#site").val();
		if(!username==""){
			$.ajax({
				data:{username:username,password:password},
				type:"GET",
				url:site+"/updatepw.do",
				datatype:"text",
				success:function(data){
					if(data=="200"){
						document.getElementById("msg").innerHTML="";
							document.getElementById("tip").innerHTML="密码修改成功";
							$("#name").hide();
							$("#three").hide();
							$("#four").show();
					}else{
						document.getElementById("msg").innerHTML="密码格式有误";
					}
				}
			});
	}else{
		document.getElementById("msg").innerHTML="密码不可为空";
	}}
</script>
</head>

<body bgcolor="#6CA2AD">
	<input style="display: none;" id="site" value="<%=request.getContextPath()%>">
	<div style="text-align: center; margin: 50px auto;">
	             <span style="color: red;font-size:15px">重要提醒：</span>
				<p style="color: red;">为了账户的安全考虑，请验证以下问题来完成密码的修改</p>
				<div style="padding-left: 0px;">
				<div id="tip">请输入用户名：</div>
				<br>
				<input id="name" value="123"><div style="color: red;" id="msg"></div>
				<br>
				<div><button id="one" onclick="next_one();">下一步①</button>
				<button id="two" style="display: none;" onclick="next_two();">下一步②</button>
				<button id="three" style="display: none;"onclick="next_three();">下一步③</button>
				<a id="four" style="display: none;" href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a></div>
				
		</div>
	</div>

</body>
</html>