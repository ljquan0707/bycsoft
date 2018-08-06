<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
  <%@ page import="com.spring.pojo.User"%>
   <%@ include file="/utill/utill.jsp" %>
<% User user=(User)session.getAttribute("users");
	String username=user.getUsername();
	int id=user.getId();
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
body{
background-color: #D7D2CF;
}
.left{
width: 10%;
text-align: right;
line-height: 40px;
font: 14px '楷体';
}
.right{
padding-left:20px;
color:blue;

line-height: 40px;
background-color: 
}
 table tr td img{
border-radius: 18px;
border: 2px solid white; 
}


     		
</style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/amazeui.min.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/amazeui.cropper.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/custom_up_img.css">
</head>
<body onload='init()'>
<input style="display:none;" id="site" value="<%=request.getContextPath()%>" >
	<input style="display: none;" id="username" value="<%=username%>">
	<input style="display: none;" id="nameid" value="<%=id%>">
<table width="100%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:0px;margin-right:310px;font-size: 12px;">
<tr bgcolor="#E7E7E7">
	<td height="30" colspan="2" >&nbsp;我的信息&nbsp; <span style="font:12px '楷体'; color:red;">提示：点击图片修改头像，昵称和个性签名双击更改</span></td>
</tr>
<tr style="height: 20px;">
</tr>
<tr >
	<td class="left">头像：</td>
	
<td><div class="up-img-cover"  id="up-img-touch" >
    		<img class="am-circle" alt="" src="/file/<%=username%>.jpg" onerror="this.src='<%=request.getContextPath()%>/img/photo.jpg'" width="70px;" height="70px;" data-am-popover="{content: '点击修改', trigger: 'hover focus'}" >
    	</div></td>
</tr>

<tr >
	<td class="left">账号：</td>
	<td class="right" id="name"></td>
</tr>
<tr >
	<td class="left">昵称：</td>
	<td class="right" id="nickname" title="双击修改"></td>
</tr>
<tr >
	<td class="left">姓名：</td>
	<td class="right" id="realname"></td>
</tr>
<tr >
	<td class="left">性别：</td>
	<td class="right" id="sex"></td>
</tr>

<tr >
	<td class="left">联系电话：</td>
	<td class="right" id="tel"></td>
</tr>
<tr >
	<td class="left">角色：</td>
	<td class="right" id="rolename"></td>
</tr>
<tr >
	<td class="left">注册时间：</td>
	<td class="right" id="createtime"></td>
</tr>



<tr >
	<td class="left">个人签名：</td><td class="right" id="signature" title="双击修改">

</td>
</tr>

</table>

<!--图片上传框-->
    	<div class="am-modal am-modal-no-btn up-frame-bj " tabindex="-1" id="doc-modal-1">
		  <div class="am-modal-dialog up-frame-parent up-frame-radius">
		    <div class="am-modal-hd up-frame-header">
		       <label>修改头像</label>
		      <a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close>&times;</a>
		    </div>
		    <div class="am-modal-bd  up-frame-body">
		      <div class="am-g am-fl">
		      	<div class="am-form-group am-form-file">
			      <div class="am-fl">
			        <button type="button" class="am-btn am-btn-default am-btn-sm">
			          <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
			      </div>
			      <input type="file" id="inputImage">
			   	</div>
		      </div>
		      <div class="am-g am-fl" >
		      	<div class="up-pre-before up-frame-radius">
		      		<img alt="" src="" id="image" >
		      	</div>
		      	<div class="up-pre-after up-frame-radius">
		      	</div>
		      </div>
		      <div class="am-g am-fl">
   				<div class="up-control-btns">
    				<span class="am-icon-rotate-left"  onclick="rotateimgleft()"></span>
    				<span class="am-icon-rotate-right" onClick="rotateimgright()"></span>
    				<span class="am-icon-check" id="up-btn-ok" url="<%=request.getContextPath()%>/photo.do"></span>
   				</div>
	    	  </div>
		      
		    </div>
		  </div>
		</div>
    	
    	<!--加载框-->
    	<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="my-modal-loading">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">正在上传...</div>
		    <div class="am-modal-bd">
		      <span class="am-icon-spinner am-icon-spin"></span>
		    </div>
		  </div>
		</div>
		
		<!--警告框-->
		<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		  <div class="am-modal-dialog">
		    <div class="am-modal-hd">信息</div>
		    <div class="am-modal-bd"  id="alert_content">
		              成功了
		    </div>
		    <div class="am-modal-footer">
		    <a href="javascript: void(0)" class="am-close" data-am-modal-close><span class="am-modal-btn">确定</span></a>
		      
		    </div>
		  </div>
		</div>
		<script src="<%=request.getContextPath()%>/js/jquery.min.js" charset="utf-8"></script>
        <script src="<%=request.getContextPath()%>/js/amazeui.min.js" charset="utf-8"></script>
        <script src="<%=request.getContextPath()%>/js/cropper.min.js" charset="utf-8"></script>
        <script src="<%=request.getContextPath()%>/js/custom_up_img.js" charset="utf-8"></script>


</body>
<script type="text/javascript">

  

function init(){
	var site=$("#site").val();
	var username=$("#username").val();
	
		$.ajax({
			data:{username:username},
			url:site+"/info.do",
			type:"get",
			datatype:'text',
			success:function(data){
				var json=eval("("+data+")");
				document.getElementById("realname").innerHTML=json[0].realname;
				document.getElementById("name").innerHTML=json[0].username;
				document.getElementById("sex").innerHTML=json[0].sex;
				document.getElementById("rolename").innerHTML=json[0].rolename;
				document.getElementById("tel").innerHTML=json[0].tel;
				document.getElementById("nickname").innerHTML=json[0].nickname;
				document.getElementById("createtime").innerHTML=json[0].createtime;
				document.getElementById("signature").innerHTML=json[0].signature;
			},
			error:function(XMLHttpRequest, textStatus){  
	            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    class='"+json[i].count,json[i].rolename,json[i].child[0].menuid+"'
	            console.log(textStatus);  
	            showMsg("系统错误","center"); 
			}
			});
}
$("#picFile").change(function(){
	   //验证是否图片
	   if(!/image\/\w+/.test(this.files[0].type)){ 
	           alert("文件必须是图片格式!");
	           return false;
	      } 
	   //限制图片大小
	   var size = this.files[0].size / 1024;    
	         if(size>500){  
	            alert("图片大小不能大于1M!");
	            return false;
	         }
	         //var v = $(this).val();
	         var reader = new FileReader();
	         reader.readAsDataURL(this.files[0]);
	         reader.onload = function(e){
	             console.log(e.target.result);
	             $("#imageVal").val("");        //清空base46
	             $("#imagePre").attr("src", "");   //清空图片
	             
	             $("#imageVal").val(e.target.result.split(",")[1]);
	             $("#imagePre").attr("src", e.target.result);    //将Base64流显示在页面的  img标签中进行浏览
	         };
	     });

$(function() {
	$("#signature").dblclick(function() {
		var td = $(this);
		var txt = td.text();
		var input = $("<input width='200px;' type='text'value='" + txt + "'/>");
		td.html(input);
		input.click(function() { return false; });
		//获取焦点
		input.trigger("focus");
		//文本框失去焦点后提交内容，重新变为文本
		input.blur(function() {
		var newtxt = $(this).val();
		
		//判断文本有没有修改
		if (newtxt != txt) {
		td.html(newtxt);
		var site=$("#site").val();
		var username=$("#name").text();
		$.ajax({
			data:{username:username,signature:newtxt},
			url:site+"/updatenick.do",
			type:"get",
			datatype:'text',
			success:function(data){
				if(data=="200"){
					parent.tip('个人中心','个性签名修改成功');
				}
			},
			error:function(XMLHttpRequest, textStatus){  
	            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    class='"+json[i].count,json[i].rolename,json[i].child[0].menuid+"'
	            console.log(textStatus);  
	            showMsg("系统错误","center"); 
			}
			});
		}
		else
		{
		td.html(newtxt);
		}
		});
		});
	$("#nickname").dblclick(function() {
	var td = $(this);
	var txt = td.text();
	var input = $("<input type='text'value='" + txt + "'/>");
	td.html(input);
	input.click(function() { return false; });
	//获取焦点
	input.trigger("focus");
	//文本框失去焦点后提交内容，重新变为文本
	input.blur(function() {
	var newtxt = $(this).val();
	
	//判断文本有没有修改
	if (newtxt != txt) {
	td.html(newtxt);
	var site=$("#site").val();
	var username=$("#name").text();
	$.ajax({
		data:{username:username,nickname:newtxt},
		url:site+"/updatenick.do",
		type:"get",
		datatype:'text',
		success:function(data){
			if(data=="200"){
				parent.tip('个人中心','昵称修改成功');
			}
		},
		error:function(XMLHttpRequest, textStatus){  
            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    class='"+json[i].count,json[i].rolename,json[i].child[0].menuid+"'
            console.log(textStatus);  
            showMsg("系统错误","center"); 
		}
		});
	}
	else
	{
	td.html(newtxt);
	}
	});
	});
	}); 
</script>
</html>