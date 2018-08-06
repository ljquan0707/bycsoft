<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ include file="/utill/utill.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Insert title here</title>
	<style type="text/css">
	body{
	font-size: 13px;
	
	
	background-repeat: no-repeat;
	background-color: #D7D2CF;

	}
	.menu tr td button{
	     margin-left: 10%;
	}
	.left{
	 	 float: left;
		 width: 20%;
		 top:500px;
		 border: 1px solid #fff;
		height: 600px;
		border-radius: 3px;
	}
	.right{
		float: right;
		width: 79%;
		border: 1px solid #fff;
		height: 600px;
		border-radius: 3px;
		overflow: auto;
		margin-bottom: 30px;
	}
	.right .head{
	background-color: #396b68;
	line-height: 28px;
	color:white;
	font-size: 15px;
	}
	.menu{
	font-size: 13px;
	}
	.right tr td{
	      border: 1px solid #fff;
	      text-align: center;
	
	}
	.menusel,.rolesel{
	margin-left: 10%;
	margin-top: 10%;
	padding-right: 10px;
	}
	select{
	width: 100px;
	border-radius: 3px;
	
	}
	#menuadd{
	margin-left: 38%;
	margin-top: 15%;
	}
	span{
	color: blue;
	font-size: 15px;
	}
	.top{
	text-align: center;
	width: 100%;
	background-color: white;
	font:bold 15px 楷体;
	line-height: 28px;
	}
	 .addrolename{
	display: none;
	} 
	.updaterolename{
	display: none;
	}
	</style>
	
	<script type="text/javascript">
	
	function init(){
		var site =$("#site").val();
		$.ajax({
			
			url : site + "/roleauthor.do",
			type : "get",
			datatype : "text",
			
			success : function(data){
				
				var json=eval("("+data+")");
				
				$(".menu").empty();
				var head="<tr class='head'><td>角色</td><td>菜单项</td></tr>";
				$(".menu").append(head);
				var jsonlength=json.length;
				for(var i=0;i<jsonlength;i++){
					if(json[i].child.length!=0){
						
					
					var hml="<tr><td rowspan='"+json[i].count+"'>"+json[i].rolename+"</td><td class='"+json[i].roleid+","+json[i].child[0].menuid+","+json[i].rolename+","+json[i].child[0].menutitle+"'>"+json[i].child[0].menutitle+"<button class='menudelete'>删除</button></td></tr>"
					
					$(".menu").append(hml);
					
					var cnode=json[i].child.length;
					for(var j=1;j<cnode;j++){
						
						
					var chml="<tr><td class='"+json[i].roleid+","+json[i].child[j].menuid+","+json[i].rolename+","+json[i].child[j].menutitle+"'>"+json[i].child[j].menutitle+"<button class='menudelete'>删除</button></td></tr>"
					$(".menu").append(chml);
					}
				}};
				$('.menudelete').on("click",function(e){
						var arr=$(this).parent().attr('class');
						deletemenu(arr);
				});
				
			},
			error:function(XMLHttpRequest, textStatus){  
	            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    XMLHttpRequest.status   XMLHttpRequest.readyState  
	            console.log(textStatus);  
	            showMsg("系统错误","center"); 
	        }  
			});
	}
	function add(){
		var site=$("#site").val();
		var roleid=$("#rolelist").val();
		var menuid=$("#menulist").val();
		$.ajax({
			data:{roleid:roleid,menuid:menuid},
			url:site+"/addrolemenu.do",
			type:"get",
			datatype:'text',
			success:function(data){
				if(data==200){
					showMsg("添加成功","center"); 
					init();
				}if(data==404){
					showMsg("菜单项已存在，无需重复添加","center"); 
				}
					
				
			},
			error:function(XMLHttpRequest, textStatus){  
	            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    class='"+json[i].count,json[i].rolename,json[i].child[0].menuid+"'
	            console.log(textStatus);  
	            showMsg("系统错误","center"); 
	        }  
			});
		
	}
	function menulist(){
		var site=$("#site").val();
		
		$.ajax({
			
			url:site+"/menulist.do",
			type:"get",
			datatype:'text',
			success:function(data){
               var json=eval("("+data+")");
				var jsonlength=json.length;
				$("#menulist").empty();
				for(var i=0;i<jsonlength;i++){
					var menulist="<option value='"+json[i].menuid+"'>"+json[i].menutitle+"</option>";
					$("#menulist").append(menulist); 
				}
			},
			error:function(XMLHttpRequest, textStatus){  
	            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    XMLHttpRequest.status   XMLHttpRequest.readyState  
	            console.log(textStatus);  
	            showMsg("系统错误","center"); 
	        }  
			});
	}
	var index;
	var json;
	function rolelist(){
		var site=$("#site").val();
		
		$.ajax({
			
			url:site+"/rolename.do",
			type:"get",
			datatype:'text',
			success:function(data){
                json=eval("("+data+")");
				var jsonlength=json.length;
				$("#rolelist").empty();
				$("#updateroleid").empty(); 
				for(var i=0;i<jsonlength;i++){
					var menulist="<option value='"+json[i].roleid+"'>"+json[i].roletitle+"</option>";
					var roleid="<option value='"+json[i].roleid+"'>"+json[i].roleid+"</option>";
					$("#rolelist").append(menulist);
					$("#updateroleid").append(roleid);
					index=parseInt(json[i].roleid)+1;
					
				}
				$("#updaterolename").val(json[0].roletitle);
				
			},
			error:function(XMLHttpRequest, textStatus){  
	            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    XMLHttpRequest.status   XMLHttpRequest.readyState  
	            console.log(textStatus);  
	            showMsg("系统错误","center"); 
	        }  
			});
	}
	function deletemenu(obj){
		var site=$("#site").val();
		var arr=obj.split(',');
		var roleid=arr[0];
		var menuid=arr[1];
		if (confirm("确定删除《"+arr[2]+"》下的《"+arr[3]+"》菜单项吗？")) {  
			$.ajax({
				data:{roleid:roleid,menuid:menuid},
				url:site+"/deleterolemenu.do",
				type:"get",
				datatype:'text',
				success:function(data){
					if(data==200){
						showMsg("删除成功","center"); 
						init();
					}
				},
				error:function(XMLHttpRequest, textStatus){  
		            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    class='"+json[i].count,json[i].rolename,json[i].child[0].menuid+"'
		            console.log(textStatus);  
		            showMsg("系统错误","center"); 
		        }  
				});
        }  
	}
	function addrole(){
		var site=$("#site").val();
		var roleid=$("#addroleid").val();
		var rolename=$("#addrolename").val();
			$.ajax({
				data:{roleid:roleid,rolename:rolename},
				url:site+"/rolesave.do",
				type:"get",
				datatype:'text',
				success:function(data){
					if(data==200){
						showMsg("添加成功","center"); 
						menulist();
						rolelist();
					}
				},
				error:function(XMLHttpRequest, textStatus){  
		            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    class='"+json[i].count,json[i].rolename,json[i].child[0].menuid+"'
		            console.log(textStatus);  
		            showMsg("系统错误","center"); 
				}
				});
         
	}
	function updaterole(){
		var site=$("#site").val();
		var roleid=$("#updateroleid").val();
		var rolename=$("#updaterolename").val();
			$.ajax({
				data:{roleid:roleid,rolename:rolename},
				url:site+"/roleupdate.do",
				type:"get",
				datatype:'text',
				success:function(data){
					if(data==200){
						showMsg("修改成功","center"); 
						menulist();
						rolelist();
					}
				},
				error:function(XMLHttpRequest, textStatus){  
		            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    class='"+json[i].count,json[i].rolename,json[i].child[0].menuid+"'
		            console.log(textStatus);  
		            showMsg("系统错误","center"); 
				}
				});
        
	}
	function addhide(){
		$(".updaterolename").fadeOut();
		setTimeout('$(".addrolename").fadeIn()','400');
		
		$("#addroleid").val(index);
	}
	function updatehide(){
		$(".addrolename").fadeOut();
		setTimeout('$(".updaterolename").fadeIn()','400');
		
		
	}
	function updaterolename(){
		var roleid=parseInt($("#updateroleid").val());
		$("#updaterolename").val(json[roleid-1].roletitle);
	}
</script>
	</head>

<body onload="init(),menulist(),rolelist()">
 <input style="display: none;" id="site" value="<%=request.getContextPath()%>"/>
<div id="main">
<div class="left">
<div class="top"><span>添加菜单</span></div>
	<div class="rolesel">
	<label>角色名：</label><select id="rolelist" >
						
						</select></div>
	<div class="menusel">
	
						<label>菜单项：</label><select id="menulist">
							
						</select>
	</div>
	<button id="menuadd" onclick="add();">添加</button>
	<hr/>
	<div class="top"><span>角色管理</span></div>
	<button onclick="addhide()">添加</button><button onclick="updatehide()">修改</button>
	<!-- 新增区 -->
	<div class="addrolename">
	<div class="rolesel">
	<label>角色id：</label><input id="addroleid" style="width: 100px;background-color: gray;" readonly="readonly"/></div>
	<div class="menusel">
	<label>角色名：</label><input id="addrolename" style="width: 100px;"/></div>
	<button id="menuadd" onclick="addrole();">添加</button>
	<br/>
	</div>
	<!-- 修改区 -->
	<div class="updaterolename">
	<div class="rolesel">
	<label>角色id：</label><select id="updateroleid" onchange="updaterolename()" >
						</select></div>
	<div class="menusel">
	<label>角色名：</label><input id="updaterolename" style="width: 100px;"/></div>
	<button id="menuadd" onclick="updaterole();">修改</button>
	<br/>
	</div>
</div>
<div class="right">
<div class="top"><span>角色—菜单   对照表</span></div>
<table class="menu" width="100%">
	</table></div>
	
</div>

</body>
	

</html>