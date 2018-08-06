<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<!doctype html>
<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<meta http-equiv="pragma" content="no-cache" /> 
<title>音乐</title> 
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/music/music.css"></link>
<script src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js" ></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/music/music.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-form.js"></script>
</head>
<body onLoad="play();musiclist();">
<input style="display: none;" id="site" value="<%=request.getContextPath()%>">
	<form  id="uploadForm" name="uploadForm" enctype="multipart/form-data">
	<input style="display:none" name="messageContent" value="">
<label>添加音乐</label> <input type="file" name="file" multiple="multiple">
     <button class="btn" type="button" id="doSave">提交</button>
    </form>

 <div class="panl">
<div id="panl" style="margin-left:0px;">
<div id="pic">
<img id="imagecreter" src="../../img/music/bg.png"/>
<div id="piccenter"></div>
</div>
	<marquee style="WIDTH: 212px; HEIGHT: 25px;margin-left:34px;margin-top:7px;" scrollamount="3" direction="left" ><div id="nowplay">网络歌手 - 男人花 (女声版).mp3</div></marquee>
<audio id='test' src="/file/sound/赵雷 - 成都.mp3"></audio>
<div id="playtime">
&nbsp;<div id="startime">00:00</div>&nbsp;<div id="main"><div id="bar"></div>&nbsp;
</div><div id="endtime">00:00</div>
</div>
<br>
<div id="butt">
	
	<button id="vol" onClick="showvol()" class="vol" title="音量"></button>
	<button id="prev" onClick="prev()" title="上一曲"></button>
    <button id='name' class="puse" onclick='play();' title="播放/暂停"></button>
    <button id="next" onclick='next();' title="下一曲"></button>
	<button id="list" onClick="openmusic()" title="列表"></button>
	<div id="volnum" >
  <div id="lineDiv" class="lineDiv">
   <div id="minDiv" class="minDiv" onmousedown="tuod()" >
    <div id="vals" class="vals">20</div>
   </div>
  </div>
	</div>
</div>
	 
 </div>
 <div id="musiclist" style="margin-left:-300px;">
 <ol class="second-tag" style="height: 325px;list-style: none">
	
</ol>
	<label style="margin-left: 20px;color: blue" class="countmusic"></label><div class="pagecount" style="display: none;float: right;margin-right: 10px;"><button onclick="prepage();">上一页</button><button onclick="nextpage();">下一页</button></div>
</div> 
</div>

 </body>
<script type="text/javascript">

$(function() {
	var site=site=$("#site").val();
    $("#doSave").click(
           function() {
                $("#uploadForm").ajaxSubmit({
                            type : 'post',
                            url : site+"/uploadmusic.do",
								//data:  //注意只要是写在表单里面的，都不需要加这个属性。在controller中可以根据@RequestParam String str获取到属性值。    
   							 contentType : "application/x-www-form-urlencoded; charset=utf-8",
    						success: function(data) {
             											 //接受到的data还只是一个字符串，需要转成json对象
              							var obj = JSON.parse(data);
              							if(obj.flag==true){
            	 					 parent.tip('音乐中心','上传成功');
            	 					 musiclist();
              										}else{
            	  
											                }
											            },
            error: function (data)//服务器响应失败处理函数
            {
            	parent.tip('系统消息','系统错误，请联系管理员');
            }  
          });
});
});  
</script>
</html>