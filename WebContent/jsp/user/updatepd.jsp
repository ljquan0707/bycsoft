<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@ page import="com.spring.pojo.User"%>
<% User user=(User)session.getAttribute("users");
	String username=user.getUsername();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/utill/utill.jsp" %>
<style type="text/css">
.right{
padding-left: 6%;
text-align: right;
background-color: #fafaf1;
line-height: 22px;
}
body{
background-color: #D7D2CF;
}
</style>
<title>修改密码</title>
</head>
<body leftmargin="8" topmargin="8">
<input style="display:none;" id="site" value="<%=request.getContextPath()%>" >
<form name="form2" style="text-align: center;">
	<input style="display: none;" id="username" value="<%=username%>">
<table id="pw" width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px;font-size: 12px;">
<tr bgcolor="#E7E7E7">
	<td height="24" colspan="2">&nbsp;修改密码&nbsp;</td>
</tr>
<tr >
	<td class='right'>原密码：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input type="password" id="passw"/></td>
</tr>
<tr >
	<td class='right'>新密码：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input type="password" id="pw1"/></td>
</tr>
<tr >
	<td class='right'>重复密码：</td>
	<td  align='left' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='#FCFDEE';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22"><input type="password" id="pw2"/></td>
</tr>
<tr bgcolor="#FAFAF1">
<td height="28" colspan=4 align=center>
	&nbsp;
	<button type="button" onclick="updatepw();" class="coolbg">保存</button>
	
</td>
</tr>
</table>
	
</form>
  

</body>
<script type="text/javascript">
	function updatepw(){
		var site=$("#site").val();
		var username=$("#username").val();
		var password=$("#passw").val();
		var pw1=$("#pw1").val();
		var pw2=$("#pw2").val();
	if(password==""||pw1==""){
		showMsg('原密码和新密码必填','center');
	}else{
		if(pw1==pw2){
			$.ajax({
				url:site+"/uppw.do",
				data:{username:username,password:password,pw1:pw1,pw2:pw2},
				datatype:"text",
				type:"post",
				success:function(data){
					if(data=="200"){
						showMsg('密码修改成功','center');
						$("#passw").val("");
						$("#pw1").val("");
						$("#pw2").val("");
					}
                    if(data=="400"){
						showMsg('原密码有误','center');
						$("#passw").val("");
						$("#passw").focus();
					}
				}
				});
		}else{
			showMsg('密码输入不一致','center');
			$("#pw1").val("");
			$("#pw2").val("");
			$("#pw1").focus();
		}
	}	}
</script>
</html>