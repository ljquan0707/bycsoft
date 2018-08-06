<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<%@ include file="/utill/utill.jsp" %>
<title>Insert title here</title>
</head>
	<style type="text/css">
	body{
	font-size: 13px;
	background-color: #EAF5E8;
	}
	
</style>
<body>
	<input style="display: none;" id="site" value="<%=request.getContextPath()%>">

<table width="100%"  border="0" cellpadding="3" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px;margin-top:18px;margin-left: 18px;">
  <tr>
    <td  bgcolor="#E7E7E7" class='title'><span style="font-size: 14px; color: red;">温馨提示：</span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td>新增客户需谨慎，客户代码有5位纯数字组成，请正确填写。欲删除客户，须先删除客户所对应的运价。与之对应，先增加客户然后才能上传所对应的运价。</td>
  </tr>
</table>
<div style="width: 300px;height: 200px;background-color:#E7E7E7;margin-left: 35%;margin-top: 50px;border-radius:5px;text-align: center;">
	<br/>
		<h4>添加客户</h4>
	<table id="customer">
	<tr><td width="75" align="right">客户编号:</td><td><input id="customerid"></td></tr>
		<tr><td width="75" align="right">客户名:</td><td><input id="customername"></td></tr>
	</table>
	<br>
		<button type="button" onclick="reset()">重置</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" onclick="submit()">提交</button>
</div>
</body>
<script type="text/javascript">
	function reset(){
		$("#customername").val("");$("#customerid").val("");$("#customername").css({"background-color":"#FFFFFF"});
		$("#customerid").css({"background-color":"#FFFFFF"});
	}
	$(function(){
		$("input[id='customername']").blur(function(){
			   if($(this).val().length==0){
				   $("#customername").css({"background-color":"#F7A0A0"});
			   }});
		$("input[id='customerid']").blur(function(){
			   if($(this).val().length==0){
				   $("#customerid").css({"background-color":"#F7A0A0"});
			   }else{
				   var customername=$(this).val();
				   var patten=/^1[0-9]{4}$/;
				  
				  if(patten.test(customername)){
					 
					  flag="ture";
				  }else{
					  $("#customerid").css({"background-color":"#F7A0A0"});
					  showMsg('客户编号为1开头的5位纯数字','center');
					  flag="false";
				  }
			   }
			   });
	});
	 $(function(){
		   $("input[id='customername']").focus(function(){
			   $("#customername").css({"background-color":"#FFFFFF"});
				});
		   $("input[id='customerid']").focus(function(){
			   $("#customerid").css({"background-color":"#FFFFFF"});
				});
	 });
	function submit(){
		var site=$("#site").val();
		var customername=$("#customername").val();
		var customerid=$("#customerid").val()
		if(customername==""||customerid==""){
			showMsg('客户名或客户编号必填','center')
		}else{
		$.ajax({
			
			data:{customername:customername,customerid:customerid},
			type:"post",
			url:site+"/customeradd.do",
			datatype:"text",
			success:function(data){
				if(data=="200"){showMsg('客户：'+customername+'注册成功','center');$("#customername").val("");$("#customerid").val("");}
				if(data=="400"){showMsg('客户编号存在','center');$("#customername").val("");$("#customerid").val("");}
				if(data=="300"){showMsg('客户存在','center');$("#customername").val("");$("#customerid").val("");}
			}
		});
	}}
</script>
</html>