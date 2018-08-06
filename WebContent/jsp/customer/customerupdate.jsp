<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/utill/utill.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
<style type="text/css">
	body{
	font-size: 12px;
	background-color: #EAF5E8;
	}
	.dataTables_wrapper .dataTables_filter{
	margin-left: 270px !important;
	}
	table.dataTable tbody th,table.dataTable tbody td{
	padding:1px 20px !important;}
	#cusupdate{
	position:fixed;
	display: none;
	background-color:#aab7d1;
	z-index:2;
	visibility:visible;
	}
	#example{
	text-align: center;
	background-color: #ece3e3;
	}
	#example tr td{
	border: 1px solid white;
	}
	.firsttd{
	height: 30px;
	background-color:#60c6c6;
	}
</style>
</head>
<body>
<div style="position:relative;z-index: 1" >
<div style="width: 50%;height: 500px;float: left;">
<button type="button" onclick="refresh()">刷新</button>
	<input style="display: none;" id="site" value="<%=request.getContextPath()%>">
	<br>
	 <table id="example" class="display" cellspacing="0" width="100%" style="margin-left: 5px;">
	 	<thead>
		<tr class="firsttd">
			<td>客户编号</td><td>客户名称</td><td>操作</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${clist}" var="lo">
		     <tr>
				<td>${lo[0]}</td>
				<td>${lo[1]}</td>
				<td><button type="button" onclick="cusupdate('${lo[0]},${lo[1]},${lo[2]}');">更改</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" onclick="del('${lo[1]}')">删除</button></td>
				
		    </tr>
		</c:forEach>
		</tbody>
	</table>
	
</div>
<div style="width: 49%;height: 500px;float: left;margin-left: 5px">
	<div id="cusupdate" style="width: 300px;height: 200px;background-color:#a9d86e;margin-left: 150px;margin-top: 50px;border-radius:5px;text-align: center;">
	<br/>
		<h4>更改客户</h4>
		<input style="display: none;" id="str" />
	<table id="customer">
	<tr><td width="75" align="right">客户编号:</td><td><input id="customerid"></td></tr>
		<tr><td width="75" align="right">客户名:</td><td><input id="customername"></td></tr>
	</table>
	<br>
		<button style="margin-left:30px;" type="button" onclick="off()">取消</button>
		<button style="margin-left:40px;" type="button" onclick="submit()">更新</button>
</div>
</div>
</div>
</body>
<script type="text/javascript">
function off(){
	$("#cusupdate").slideUp("slow");
	$("#customername").val("");$("#customerid").val("");
}
function refresh(){
	var site=$("#site").val();
	window.location.href=site+"/customerlist.do";
}

function del(str){
	
	var site=$("#site").val();
	like=window.confirm("确定删除【"+str+"】吗？");
	if(like==true)
      {
	$.ajax({
		url:site+"/deletecustomer.do",
		data:{customername:str},
		datatype:"json",
		type:"post",
		success:function(data){
			if(data=="200"){
				showMsg('删除成功','center');
				
				window.location.href=site+"/customerlist.do";	
			}
			if(data="400"){
				showMsg('请先删除与【'+customername+'】对应的与运价','center');
			}
		}
		
	});
}}
function cusupdate(str){
	var obj=str;
	arr=obj.split(",");
	$("#customername").val(arr[1]);
	$("#customerid").val(arr[0]);
	$("#str").val(arr[2]);
	$("#cusupdate").slideDown("slow");
}
function submit(){
	var site=$("#site").val();
	var customername=$("#customername").val();
	var customerid=$("#customerid").val();
	var id=$("#str").val();
	if(customername==""||customerid==""){
		showMsg('客户编号和客户名称必填','center');
	}else{
	if(customerid.length==5){
	//alert(customername+"///"+customerid+"//"+id);
	$.ajax({
		
		data:{customername:customername,customerid:customerid,id:id},
		type:"post",
		url:site+"/customerupdate.do",
		datatype:"text",
		success:function(data){
						
			if(data=="300"){showMsg('客户编号：【'+customerid+'】存在，请更换','center');$("#customerid").val("");}
			if(data=="400"){showMsg('客户名称：【'+customername+'】存在，请更换','center');$("#customername").val("");}
			if(data=="200"){showMsg('客户：【'+customername+'】更改成功','center');$("#customername").val("");$("#customerid").val("");
			$("#cusupdate").slideUp("slow");
			}
			}
			
		
	});
}else{
	showMsg('客户编号格式不正确，1开头的5位纯数字','center');$("#customerid").val("");
	}}}

</script>
</html>