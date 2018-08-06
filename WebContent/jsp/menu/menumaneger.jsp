<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SimpleTree</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/SimpleTree.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/alert.css"/>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/SimpleTree.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/alert.js"></script>
<script type="text/javascript">
	
	function init() {
		var site = $("#site").val();
		
				$.ajax({
					url : site + "/rootinit.do",
					type : "post",
					datatype : "text",
					success : function(data) {
						var json = eval("(" + data + ")");
						var jsonlength = json.length;
						for (var i = 0; i < jsonlength; i++) {
							if (json[i].pid == 0) {
								var hml = "<div><li><a href='#' ref='"+json[i].id+","+json[i].title+"'>"
										+ json[i].title
										+ "</a><span class='button'><button class='add'></button><button class='pedit'></button><button class='delete'></button></span></li><ul class="+json[i].id+" ref="+json[i].title+','+json[i].id+"></ul></div>";
								$("#root").append(hml);
							}
						}
						for (var j = 0; j < jsonlength; j++) {
							if (json[j].pid != 0) {
								var pid = json[j].pid;
								var html = "<li><a href='#' ref='"+json[j].id+","+json[j].action+"'>"
										+ json[j].title
										+ "</a><span class='button'><button class='edit'></button><button class='delete'></button></span></li>";
								$("." + pid).append(html);
							}
						}
						$(".st_tree").SimpleTree({
							click : function(a) {
								if (!$(a).attr("hasChild"))
									alert($(a).attr("ref"));
							}
						});
						$('.add')
								.on(
										"click",
										function(e) {
											reset();
											document.getElementById("save").innerHTML = "新增";
											var pid = $(this).parent().parent()
													.next('ul').attr('class');
											var pname = $(this).parent()
													.parent().find('a').text();
											$("#save").attr("onclick",
													"save();");
											if (pname == "根目录") {
												$(".action").hide();
												$("#pname").val(pname);
												$("#pid").val("-1");
												$("#cid").val("1");
												$("#action").val(".do");
												$("#cname").focus();
											} else {
												$(".action").show();
												$("#pname").val(pname);
												$("#pid").val(pid);
												$("#cid").val("11");
												$("#cname").focus();
											}
											return false;
										});
						$('.edit')
								.on(
										"click",
										function(e) {
											$(".action").show();
											$("#save").attr("onclick",
													"edit();");
											reset();
											document.getElementById("save").innerHTML = "修改";
											var cname = $(this).parent()
													.parent().find('a').text();
											var pid = $(this).parent().parent()
													.parent().attr('ref');
											var cnode = $(this).parent()
													.parent().find('a').attr(
															'ref');
											var arr = pid.split(",");
											var str = cnode.split(",");

											$("#pname").val(arr[0]);
											$("#pid").val(arr[1]);
											$("#cname").val(cname);
											$("#cid").val(str[0]);
											$("#action").val(str[1]);
											$("#cname").focus();
											return false;
										});
						$('.pedit')
								.on(
										"click",
										function(e) {
											reset();
											$("#save").attr("onclick",
													"edit();");
											$(".action").hide();
											var pid = $(this).parent().parent()
													.next('ul').attr('ref');
											var arr = pid.split(",");

											$("#pname").val("根目录");
											$("#pid").val(0);
											$("#cname").val(arr[0]);
											$("#cid").val(arr[1]);
											$("#action").val(".do");
											document.getElementById("save").innerHTML = "修改";
											$("#cname").focus();
											return false;
										});
						$('.delete').on("click",function(e) {
							var cnode = $(this).parent()
							.parent().find('a').attr(
									'ref');
					     var arr = cnode.split(",");
					    
					     delmenu(arr);
						});
					}
				});
	}

	function reset() {
		$("#pname").val("");
		$("#cname").val("");
		$("#pid").val("");
		$("#cid").val("");
		$("#action").val("");
	}
	function save(){
	var site=$("#site").val();
	var pname=$("#pname").val();
    var pid=$("#pid").val();
	var cname=$("#cname").val();
	if(cname==""){
		showMsg("信息不完整","center");
		return false;
	}
	var cid=$("#cid").val();
	var action=$("#action").val();
		$.ajax({
			data:{pname:pname,pid:pid,cid:cid,cname:cname,action:action},
			url : site + "/menuadd.do",
			type : "post",
			datatype : "text",
			success : function(data){
				if(data==200){
					showMsg("保存成功","center");
					init();
					reset();
					$("#root").empty();
				}
				
			}
			});}
		
	
	function edit(){
		var site=$("#site").val();
		var pname=$("#pname").val();
	    var pid=$("#pid").val();
		var cname=$("#cname").val();
		
		if(cname==""){
			showMsg("信息不完整","center");
			return false;
		}
		var cid=$("#cid").val();
		var action=$("#action").val();
			$.ajax({
				data:{pname:pname,pid:pid,cid:cid,cname:cname,action:action},
				url : site + "/menuedit.do",
				type : "post",
				datatype : "text",
				success : function(data){
					if(data==200){
						showMsg("修改成功","center");
						init();
						reset();
						$("#root").empty();
					}
					
				},
				error:function(XMLHttpRequest, textStatus){  
		            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    XMLHttpRequest.status   XMLHttpRequest.readyState  
		            console.log(textStatus);  
		            showMsg("系统错误","center"); 
		        }  
				});}
	function delmenu(obj){
		var site=$("#site").val();
		var arr=obj;
		var id=arr[0];
		var flag=arr[1];
		$.ajax({
			data:{id:id,flag:flag},
			url : site + "/menudelete.do",
			type : "post",
			datatype : "text",
			success : function(data){
				if(data==200){
					showMsg("删除成功","center");
					init();
					$("#root").empty();
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
<style type="text/css">
body {
	
	background-repeat: no-repeat;
	background-color: #D7D2CF;
}

#tree {

	height: 610px;
	width: 24%;
	float: left;
	border: 1px double #fff;
	background-color: white;
	border-radius: 5px;
}

#info {
	height: 570px;
	width: 74%;
	float: left;
	border: 1px double #fff;
	margin: 0px 5px;
	padding: 20px 0;
	
}

.button {
	display: none;
	margin-left: 10px;
}

.button button {
	margin-left: 3px;
}

.add {
	width: 20px;
	height: 20px;
	background-image: url(<%=request.getContextPath()%>/img/edit_add.png);
}

.edit {
	width: 20px;
	height: 20px;
	background-image: url(<%=request.getContextPath()%>/img/pencil.png);
}

.pedit {
	width: 20px;
	height: 20px;
	background-image: url(<%=request.getContextPath()%>/img/pencil.png);
}

.delete {
	width: 20px;
	height: 20px;
	background-image: url(<%=request.getContextPath()%>/img/no.png);
}

.pmenu, .cmenu {
	margin-left: 50px;
	margin-top: 20px;
}

.action {
	display: none;
	margin-left: 50px;
	margin-top: 20px;
}

#button {
	margin-left: 150px;
	margin-top: 20px;
}

label {
	margin-left: 10%;
	font-size: 13px;
}

#button button {
	margin-left: 19%;
}
.tip{
width: 100%;
text-align: center;

}
.tip p{
font-size:14px;
    font-family:Arial, Helvetica, sans-serif;
    color:#d21f1e;
    height:30px;
    line-height:30px;
    font-weight:normal; 
}
.main{
padding: 30px 10px;
border: 1px solid black;
margin: 20px;
background-color: white;
	border-radius: 5px;
}
</style>
</head>

<body onload="init()">
	<input style="display: none;" id="site"
		value="<%=request.getContextPath()%>" />
	<div id="tree">
		<div class="st_tree">
			<ul>
				<li><a href="#" ref="ckgl">根目录</a><span class='button'><button
							class='add' /></span></li>
				<ul id="root">
				
				
				</ul>
			</ul>
		</div>
	</div>
	<div id="info">
		<div class="tip">
			<p>菜单操作指南：</p>
			<p>添加主菜单：点击根目录上的添加,填入子节点名称即可，无需填写pid和cid.</p>
			<p>添加子菜单：再需添加子菜单的目录后点击添加，需填写子节点和action（action的格式为.do和.jsp结束），无需填写pid和cid.</p></div>
		
		<div class="main">
		<div class="pmenu">
			<label>父节点:</label><input id="pname" readonly="readonly" style="background-color: gray;"/><label>pid:</label><input
				id="pid" readonly="readonly" style="background-color: gray;" value="-1" />
		</div>
		<div class="cmenu">
			<label>子节点:</label><input id="cname" /><label>id: </label><input
				id="cid" readonly="readonly" style="background-color: gray;" value="1"/>
		</div>
		<div class="action">
			<label>action:</label><input id="action" />
		</div>
		<div id="button">
			<button onclick="edit()" id="save">保存</button>
			<button onclick="reset()">清空</button>
		</div>
   </div>
	</div>


</body>

</html>