<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/loading.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/alert.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/alert.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/loading.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta http-equiv="pragma" content="no-cache" /> 
<title>文件上传</title>
<style type="text/css">
	table tr td{
	border: 1px solid black;
	}
</style> 
</head>
<body bgcolor="#F0FAFC"><br>
<input style="display: none;" id="site" value="<%=request.getContextPath()%>">
<form method="post" action="<%=request.getContextPath()%>/loadprice.do" enctype="multipart/form-data">
<label style="font-size: 12px;">运价上传：</label>
<input id="file" type="file" name="UploadFile" value="file">
<input type="button" value="确定" onclick="upload();">
</form>
<hr>
<div>
<div style="width: 45%;height: 560px;float: left;background-color: #E7E7E7">
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="margin-top:8px;margin-right:310px;font-size: 12px;text-align: center;">
	<tr bgcolor="#E7E7E7" height="30px;">
	<td width="150">名称</td><td width="100" >上传时间</td><td width="100">管理</td></tr>
	<c:forEach items="${pricelist}" var="list">
	<tr><td><a><img alt="" src="<%=request.getContextPath()%>/img/excel.png" align="top"><span>${list[0]}.xls</span></a></td><td>${list[1]}</td>
	<td><button type="button" onclick="lookprice('${list[0]}')">查看</button>&nbsp;&nbsp;&nbsp;<button type="button" onclick="delprice('${list[0]},${list[2]}')">删除</button></td></tr>
</c:forEach>
</table>
</div>
<div id="info" style="border: 2px solid white; float: left; width: 54%;height: 528px;overflow: scroll; padding-bottom: 30px;display: none;">
	<table id="infoprice" width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" style="font-size: 12px;text-align: center;">
	 
	
</table>
</div></div>
</body>
<script type="text/javascript">
	function delprice(obj){
		var site=$("#site").val();
		var arr=obj.split(",");
		like=window.confirm("确定删除【"+arr[0]+"运价】吗？");
		if(like==true)
	      {
		$.ajax({
			url:site+"/delprice.do",
			data:{customerid:arr[1]},
			datatype:"json",
			type:"post",
			success:function(data){
				if(data=="200"){
					showMsg('删除成功','center');
					window.location.href=site+"/pricelist.do";	
				}
			}
		});
	}
	}
	function lookprice(str){
		$("#infoprice").empty();
		$("#info").fadeOut();
		setTimeout("start('"+str+"')","300");
	}
		function start(str){
		var site=$("#site").val();
		$.ajax({
			url:site+"/pricesingle.do",
			data:{customername:str},
			datatype:"json",
			type:"post",
			success:function(data){
				var json=eval("("+data+")");
				
				var size=json.data.length;
				$("#title").val(str);
				
				
				
				var htm="<tr bgcolor='#E7E7E7' height='30px;''><td colspan='7'style='font:normal 16px/30px Georgia,serif;'>"+str+"</td></tr>";
				$("#infoprice").append(htm);
				for(var i=0;i<size;i++){
					var html="<tr><td>"+json.data[i].city+
					         "</td><td>"+json.data[i].mincharge+
					         "</td><td>"+json.data[i].no1+
					         "</td><td>"+json.data[i].no2+
						     "</td><td>"+json.data[i].no3+
						     "</td><td>"+json.data[i].no4+
						     "</td><td>"+json.data[i].no5+
						     "</td></tr>";
				$("#infoprice").append(html);
			   
			   $("#info").fadeIn();
			   
				}
				}
			});}
	function upload(){
		var File=document.getElementById("file");
		var str=File.value;
		if(str==""){
			showMsg('请选择文件','center');
		}else{
			if(str.indexOf("xls")<0&&str.indexOf("xlsx")<0)
			{
			alert("请选择格式为.xls或.xlsx的文件！");
			return false;
			 }
			$('form').submit();
			$('body').loading({
				loadingWidth:240,
				title:'上传中。。。!',
				name:'test',
				animateIn:'none',
				discription:'这是一个描述...',
				direction:'row',
				type:'origin',
				mustRelative:true,
				originBg:'#71EA71',
				originDivWidth:30,
				originDivHeight:30,
				originWidth:4,
				originHeight:4,
				smallLoading:false,
				titleColor:'#388E7A',
				loadingBg:'#312923',
				loadingMaskBg:'rgba(22,22,22,0.2)'
			});

			setTimeout(function(){
				removeLoading('test');
			},5000);
		}
		
	}
</script>
</html>