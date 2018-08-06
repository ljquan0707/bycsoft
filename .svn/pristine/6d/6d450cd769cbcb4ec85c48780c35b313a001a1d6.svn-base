<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/alert.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/easyui.css">
	<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/icon.css"> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/alert.js"></script>
<title>Insert title here</title>
<style type="text/css">
	body {
	background-color: #D7D2CF;
	background-repeat:no-repeat;
	background-position:center center;
	background-attachment:fixed;
	background-size:100% 100%;
	
     }
	#head-update{
	
	height: 40px;
	width: 100%;
	border-radius:3px;
	background-color:#E7E7E7;
	padding-top: 15px;
	}
	.combo-panel{
	height:68px !important;
	}
	#body_update{
	width:100%;
	margin:5px 0px;
	border-radius:3px;
	}
	#update_user{
	font-size:13px;
	height: 125px;
	width:100%;
	border: 1px solid white;
	background-color: #E7E7E7;
	display: none;
	border-radius:3px;
	}
	#update_table input{
		width: 120px;
		
	}
</style>
<script type="text/javascript">
	var obj="";
	function lookuser(){
		var site=$("#site").val();
		var colum=$(".textbox-value").val();
		var text=$("#text").val();
		
		
		$.ajax({
			url:site+"/lookuser.do",
			data:{colum:colum,text:text},
			datatype:"json",
			type:"post",
			success:function(data){
				if(data==400){
					$("#body_update").empty();
					showMsg('没有可查询的数据','center');
				}else{
				 obj=eval('('+data+')');
				var html="<table width='100%' style='text-align: center;font-size: 13px;'><tr style='background-color: #AAB7D1;height:30px;'><td>账号</td><td>密码</td><td>姓名</td><td>性别</td><td>电话</td><td>角色</td><td>创建时间</td><td>操作</td></tr><tr style='background-color: #F9F9F9;height:20px;'><td>"+obj.u0
    			+"</td><td>"+obj.u1
    			+"</td><td>"+obj.u2
    			+"</td><td>"+obj.u3
    			+"</td><td>"+obj.u4
    			+"</td><td>"+obj.u5
    			+"</td><td>"+obj.u6
    			+"</td><td><button id='update' onclick='updateuser();'>修改</button><button onclick='del(&quot;"+obj.u0+"&quot;);'>删除</button></td></tr></table>";
    			$("#body_update").empty();
    			$("#body_update").append(html);
    			$("#body_update").slideDown("slow");
			}}
		});
	}
	  
	function del(str){
		var obj=str;
		var site=$("#site").val();
		like=window.confirm("确定删除"+str+"吗？");
		if(like==true)
	      {
		$.ajax({
			url:site+"/delete.do",
			data:{username:obj},
			datatype:"json",
			type:"post",
			success:function(data){
				if(data=="200"){
					showMsg('删除成功','center');
					$("#body_update").empty();
				}
			}
		});
	}}
	function updateuser(){
		var text= $("#update").text();
		if(text=="修改"){
		document.getElementById("update").innerHTML="取消";
		$("#update_user").empty();
		$("#username").val(obj.u1);
		var html="<table width='100%' id='update_table' style='text-align: center;margin-top:8px;'><tr><td>账号:<input id='username' value="+obj.u0
		+"></td><td>密码:<input id='password' value="+obj.u1
		+"></td><td>角色:<select id='roleid' size='1' style='width: 125px; height: 22px;'></select></td></tr><tr><td>姓名:<input id='realname' value="+obj.u2
		+"></td><td>性别:<input type='radio' id='sex' value='男' name='sex' checked='checked' style='width: 30px;' />男 <input type='radio' id='sex' value='女' name='sex' style='width: 40px;' />女</td><td>电话:<input id='tel' value="+obj.u4
		+"></td></tr><tr><td>创建时间:<input readonly='readonly' value="+obj.u6+"></td></tr><tr><td colspan='3'><button onclick='update_user();'>提交</button></td></tr></table>";
		rolelist();
		$("#update_user").append(html).slideDown("slow");
		
      var sel=document.getElementById('roleid');
     
	
	 $(":radio[name='sex'][value='" + obj.u3 + "']").prop("checked", "checked");
		}
		if(text=="取消"){
			document.getElementById("update").innerHTML="修改";
			$("#update_user").slideUp();
		}
}
	function update_user(){
		var site=$("#site").val();
		 var username=$("#username").val();
		 if(username==""){
			 showMsg('账号不可为空','center');
			 return false;}
	 	   var password=$("#password").val();
	 	  if(password==""){
				 showMsg('密码不可为空','center');
				 return false;}
	 	   var realname=$("#realname").val();
	 	  if(realname==""){
				 showMsg('姓名不可为空','center');
				 return false;}
	 	   var sex=$("input[type='radio']:checked").val();
	 	   var tel=$("#tel").val();
	 	  if(tel==""){
				 showMsg('电话不可为空','center');
				 return false;}
	 	   var roleid=$("#roleid").val();
	 	   var id=obj.u7;
	 	  $.ajax({
	    		data:{username:username,password:password,realname:realname,sex:sex,roleid:roleid,tel:tel,id:id},
				type:"post",
				url:site+"/update.do",
				datatype:"text",
				success:function(data){
					if(data=="ture"){
						showMsg('修改成功','center');
						document.getElementById("update").innerHTML="修改";
						$("#update_user").slideUp("slow");
						lookuser();
					}
				}
	    		
	    	});
	 	   
	}
	function rolelist(){
		var site=$("#site").val();
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
						var menulist="";
						if(json[i].roletitle==obj.u5){
							 menulist="<option value='"+json[i].roleid+"' selected='selected'>"+json[i].roletitle+"</option>";
						}else{
						menulist="<option value='"+json[i].roleid+"'>"+json[i].roletitle+"</option>";
						}
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
<body>
<input style="display:none;" id="site" value="<%=request.getContextPath()%>" >
	  <div id="head-update" style="position: relative; z-index: 1">
			<label style="font-size: 12px;padding-left: 10px;">查找条件：</label>&nbsp;&nbsp;
	    	<select class="textbox-value" id="select"><option value="username">账&nbsp;&nbsp;号</option><option value="tel">电&nbsp;话</option><option value="realname">姓&nbsp;名</option></select>
	    	<input class="" type="text" id="text" data-options="required:true"></input>&nbsp;&nbsp;
	    	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="lookuser()">查找</a>
	   </div>
	   <div id="body_update">
	   </div>
	   <div id="update_user">
	   </div>
	   
</body>
</html>
