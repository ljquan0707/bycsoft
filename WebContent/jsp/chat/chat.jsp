<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.spring.pojo.User"%>
<%@ page import="java.util.Date,java.text.SimpleDateFormat" %>
<%
SimpleDateFormat df=new SimpleDateFormat("MM月dd日  HH:mm");
String s=df.format(new Date());


String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
User user=(User)session.getAttribute("users");
String username=user.getUsername();
int id=user.getId();

String addressIp=(String)session.getAttribute("localIp");
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.sinaEmotion.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/chat/chat.css">
</head>
  
  <body onload="userlist()">
  <input style="display:none;" id="site" value="<%=request.getContextPath()%>" >
  <input style="display:none;" id="username" value="<%=username%>" >
  <input style="display:none;" id="localip" value="<%=addressIp%>" >
  <div class="main" id="main">
  		<div class="left">
  			<div id="usertop">
  				</div>
  				<br>
  			<hr>
  		<ul id="list" style="list-style: none;">
  		</ul>
  		</div>
</div>
  </body>
 <script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/jquery.sinaEmotion.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/js/chat/chat.js" type="text/javascript"></script>

</html>