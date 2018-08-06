<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.dataTables.min.css">
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.dataTables.min.js"></script>
<style type="text/css">
	body {
	background-color: #D7D2CF;
	font-size:12px;
	background-position:center center;
	background-attachment:fixed;
	background-size:100% 100%;
	overflow: scroll
}
#result{
	position:fixed;
	display: none;
	width: 380px;
	height: 430px;
	background-color:#aab7d1;
	top:42px;
	left:239px;
	z-index:2;
	visibility:visible;
	}
	#content{
	margin: 1px 1px;
	text-align: center;}
	#content table tr td{
	width: 184px;
	height: 40px;
	background-color: #EFEFEF;

	}
	
</style>
	
</head>
<body>
	
	<input style="display: none;" id="site" value="<%=request.getContextPath()%>">
	<div style="position:relative;z-index: 1" >
	 <table id="example" class="display" cellspacing="0" width="100%" style="margin-left: 0px;">
	 	<thead>
		<tr>
			<td>账号</td><td>姓名</td><td>性别</td><td>电话</td><td>角色</td><td>创建时间</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${loginlist}" var="lo">
		     <tr>
				<td><a style="color:green;" onclick="look('${lo[0]}')">${lo[0]}</a></td>
				<td>${lo[1]}</td>
				<td>${lo[2]}</td>
				<td>${lo[3]}</td>
				<td>${lo[4]}</td>
				<td>${lo[5]}</td>
		    </tr>
		</c:forEach>
		</tbody>
	</table></div>
	
	<div id="result">
	<div style="background-color: #627bec;height: 20px; text-align: center;padding: 5px 2px;"><a>信 息 展 示</a><a id='close' style="float: right;"><button>X</button></a></div>
	<div id="content">
		
	
	</div>
	</div>
<script type="text/javascript">
    
    $(document).ready(function() {
     $('#example').dataTable();
     
});
    var userid="";
    function look(str){
    	
    	var name=str;
    	var site=$("#site").val();
    	$.ajax({
    		data:{username:name},
    		url:site+"/looksingle.do",
    		datatype:"text",
    		type:"get",
    		success:function(data){
    			var obj = eval('(' + data + ')');
    			userid=obj.u0;
    			var html="<table><tr><td>编号：</td><td>"+obj.u6
    			+"</td></tr><tr><td>账号：</td><td id='userid'>"+obj.u0
    			+"</td></tr><tr><td>密码：</td><td>"+obj.u1
    			+"</td></tr><tr><td>姓名：</td><td>"+obj.u2
    			+"</td></tr><tr><td>性别：</td><td>"+obj.u3
    			+"</td></tr><tr><td>电话：</td><td>"+obj.u4
    			+"</td></tr><tr><td>角色：</td><td>"+obj.u7
    			+"</td></tr><tr><td>创建时间</td><td>"+obj.u5
    			+"</td></tr><tr style='text-align: center;'><td colspan='2'><button onclick=\"javascript:$('#result').slideToggle('fast');userid='';\">确定</button></td></tr></table>";
    			$("#content").empty();
    			$("#content").append(html);
    		}
    	});	
    	
    	if(userid==""||str!=userid){
    		$("#result").slideUp("slow");
    	$("#result").slideDown("slow");
    }}
    $('#close').click(function(){
    	$("#result").slideToggle("fast");
    	userid="";
    	$("#content").empty();

   });

</script>

</body>



</html>