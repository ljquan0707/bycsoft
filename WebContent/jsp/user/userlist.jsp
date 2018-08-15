<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.dataTables.min.css">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/user/userlist.css">

</head>
<body>
	<input style="display: none;" id="site"
		value="<%=request.getContextPath()%>">
	<div style="position: relative; z-index: 1">
		<table id="example" class="display" cellspacing="0" width="100%"
			style="margin-left: 0px;">
			<thead>
				<tr>
					<td>账号</td>
					<td>姓名</td>
					<td>性别</td>
					<td>电话</td>
					<td>角色</td>
					<td>创建时间</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${loginlist}" var="lo">
					<tr>
						<td><a style="color: green;" onclick="look('${lo[0]}')">${lo[0]}</a></td>
						<td>${lo[1]}</td>
						<td>${lo[2]}</td>
						<td>${lo[3]}</td>
						<td>${lo[4]}</td>
						<td>${lo[5]}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="tip"></div>
	<div id="result">
		<div
			style="background-color: #adecbd; height: 20px; text-align: center; padding: 5px 2px;">
			<a>信 息 展 示</a><a id='close' style="float: right;"><button>X</button></a>
		</div>
		<div id="content"></div>
	</div>
</body>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/user/userlist.js"></script>
</html>