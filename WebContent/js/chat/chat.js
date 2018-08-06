var site=$("#site").val();
var addressIp=$("#localip").val();
var username=$("#username").val();
  
  function addface(obj){
	
//绑定表情
  $('#face').SinaEmotion($('#'+obj));
  return false;
  }
 
  var chat = {};
  function add(obj,msg){
  	var array = new Array();
  	 if(obj in chat){
  		chat[obj].push(msg); 
  		 }else{
  	array.push(msg);
  	var str=obj;
  	chat[str]=array;
  	}
  	console.log(chat[obj]);
  	console.log(chat[obj].length);
  	}
  
  
  
  var count=1;
  var left=300;
  var uid = [-1]; 
  
  function removeByValue(arr, val) {
	  for(var i=0; i<arr.length; i++) {
	    if(arr[i] == val) {
	      arr.splice(i, 1);
	      break;
	    }
	  }
	 
	}
  function openchat(obj){
	  var arr=obj.split(",");
	 var dd=uid;
	 
	  if(dd.indexOf(arr[0])<0){
		var list="<div id='"+arr[2]+"' class='right' onclick='moveUp(this.id)'><div class='head' onmousedown='small_down(event,&quot;"+arr[2]+"&quot;)'><div id='headuser' class='username'>"+arr[1]+"</div><span onclick='closewin(&quot;"+arr[0]+","+arr[2]+"&quot;)'><button>X</button></span></div>"+
		"<div class='msg'><table class='msglist "+arr[2]+"' width='100%'></table></div><div class='tip'></div><div class='write'><textarea id='"+arr[0]+"' rows='4' onkeydown='javascript:var e=window.event||arguments[0]; if(e.keyCode==13) {e.preventDefault(); send(&quot;"+arr[0]+";"+arr[2]+"&quot;);}'></textarea></div>"+
		"<div class='btn'><button onclick='closewin(&quot;"+arr[0]+","+arr[2]+"&quot;)'>关闭</button>&nbsp;&nbsp;&nbsp;&nbsp;<button onclick='send(&quot;"+arr[0]+";"+arr[2]+"&quot;)' >发送</button></div></div>";
		$("#main").append(list);
		var div = document.getElementById(arr[2]);
		div.style.left=left+"px";
		div.style.zIndex = count ;
		count++;
		left=left+40;
		uid.push(arr[0]);
		var user=arr[2];
		if(user in chat){
			 var count=chat[user].length;
			 
			 for(var i=0;i<count;i++){
				 var msg=chat[user][i].split("@");
				 var size=strlen(msg[0]);
					if(size<48){
				 var html="<tr class='timedate'><td>"+msg[1]+"</td></tr><tr class='msgleft'><td><img src='/file/"+user+".jpg' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\" width='30px;' height='30px'></td><td class='tosmall'><div>"+putout(msg[0])+"</div></td></tr>";
					$('.'+user).append(html); 
					}else{
						var html="<tr class='timedate'><td>"+msg[1]+"</td></tr><tr class='msgleft'><td><img src='/file/"+user+".jpg' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\" width='30px;' height='30px'></td><td class='tobig'><div>"+putout(msg[0])+"</div></td></tr>";
						$('.'+user).append(html); 
						
					}
			 }
		}
		delete chat[user];
		userlist();
	}else{
		moveUp(arr[2]);
	}}
  
var websocket = null;
//判断当前浏览器是否支持WebSocket
if ('WebSocket' in window) {
	parent.tip('即时聊天','当前浏览器支持聊天');
websocket = new WebSocket("ws://"+addressIp+":8080/"+site+"/newwebsocket/"+username+"");
                    
}
else {
alert('当前浏览器 Not support websocket')
}
//连接发生错误的回调方法
websocket.onerror = function () {
setMessageInnerHTML("WebSocket连接发生错误");
};
//连接成功建立的回调方法
websocket.onopen = function () {
setMessageInnerHTML("连接成功");
}
//接收到消息的回调方法
websocket.onmessage = function (event) {
	parent.tip('即时聊天','你有一条新信息');
	window.focus();
	
setMessageInnerHTML(event.data);
}
//连接关闭的回调方法
websocket.onclose = function () {
	
setMessageInnerHTML("WebSocket连接关闭");

}
//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function () {
closeWebSocket();
}
//将消息显示在网页上
function setMessageInnerHTML(innerHTML) {
var msg=innerHTML;
/* alert(msg); */
var arr=msg.split(";");

if(document.getElementById(arr[0])){
	var size=strlen(arr[1]);
	if(size<48){
	    var html="<tr class='timedate'><td class='userphoto'>"+arr[2]+"</td></tr><tr class='msgleft'><td><img src='/file/"+arr[0]+".jpg' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\" width='30px;' height='30px'></td><td class='tosmall'><div>"+putout(arr[1])+"</div></td></tr>";
	    $('.'+arr[0]).append(html);
	}else{
		var html="<tr class='timedate'><td class='userphoto'>"+arr[2]+"</td></tr><tr class='msgleft'><td><img src='/file/"+arr[0]+".jpg' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\" width='30px;' height='30px'></td><td class='tobig'><div>"+putout(arr[1])+"</div></td></tr>";
		$('.'+arr[0]).append(html);
	}
} else {
	 add(arr[0],arr[1]+"@"+arr[2]);
	}

}
//关闭WebSocket连接
function closeWebSocket() {
	
websocket.close();
}
//发送消息
function send(obj) {
var str=obj.split(";");
 var message=document.getElementById(str[0]).value;
 
var touser=str[1];
if(message==""){
	parent.tip('即时聊天','消息不可为空');
	return false;
}

$("#"+str[0]).val("");
var size=strlen(message);

if(size<48){
	var html="<tr class='timedate'><td><%=s%></td></tr><tr class='msgright'><td><img src='/file/<%=username%>.jpg' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\" width='30px;' height='30px'></td><td><div class='fromsmall'>"+putout(message)+"</div></td></tr>";
	$("."+str[1]).append(html);
}else{
	var html="<tr class='timedate'><td><%=s%></td></tr><tr class='msgright'><td><img src='/file/<%=username%>.jpg' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\" width='30px;' height='30px'></td><td><div class='frombig'>"+putout(message)+"</div></td></tr>";
	$("."+str[1]).append(html);
}

websocket.send(message+"/"+touser);
$("#"+str[0]).focus();
}
function putout(s){
	var outstr="";
	var string=s.split("|");
	var size=string.length;
	for(var i=0;i<size;i++){
		console.log(string[i])
		if(string[i].indexOf("[")!=-1){
			outstr+=AnalyticEmotion(string[i]);
		}else{
		outstr+=string[i];
	}}
	return outstr;
}

function userlist(){
	var site=$("#site").val();
	var user=$("#username").val();
	$.ajax({
		url:site+"/useronline.do",
		type:"get",
		datatype:'text',
		success:function(data){
			$("#list").empty();
			$("#usertop").empty();
			var json=eval("("+data+")");
			var size=json.length;
			  for(var i=0;i<size;i++){
				   if(json[i].user==user){
					  var usertip="<div class='img'><img src='/file/"+json[i].user+".jpg' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\" width='50px;' height='50px'></div><div class='title'><div class='nick'>"+json[i].nickname+"("+json[i].user+")</div><div class='signa' title="+json[i].signature+">"+json[i].signature+"</div>";
					  $("#usertop").append(usertip); 
				   }else{
					   var obj=json[i].user;
					   if(obj in chat){
						   var count=chat[obj].length;
						   var html="<li class='openuser' onclick=\"openchat('"+json[i].id+","+json[i].nickname+","+json[i].user+"')\"><div class='img' ><img src='/file/"+json[i].user+".jpg' width='40px;' height='40px' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\"></div><div class='title'><div class='nick'>"+json[i].nickname+"("+json[i].user+")</div><div class='signa' title="+json[i].signature+">"+json[i].signature+"</div></div><div class='count'>"+count+"</div><div class='clear'></div></li>";
							$("#list").append(html);
			   }else{
				   var html="<li class='openuser' onclick=\"openchat('"+json[i].id+","+json[i].nickname+","+json[i].user+"')\"><div class='img' ><img src='/file/"+json[i].user+".jpg' width='40px;' height='40px' onerror=\"this.src='<%=request.getContextPath()%>/img/photo.jpg'\"></div><div class='title'><div class='nick'>"+json[i].nickname+"("+json[i].user+")</div><div class='signa' title="+json[i].signature+">"+json[i].signature+"</div></div><div class='clear'></div></li>";
					$("#list").append(html);
			   }
					   }
			  }
			   
			
			
				/* $('.openuser').on("click",function(e) {
				var user= $(this).find(".nick").text();
				alert(user);
				username=user;
				document.getElementById("headuser").innerHTML=user;
				$(".right").show(); 
				
			});*/
				
				
			
			
		},
		error:function(XMLHttpRequest, textStatus){  
            console.log(XMLHttpRequest);  //XMLHttpRequest.responseText    class='"+json[i].count,json[i].rolename,json[i].child[0].menuid+"'
            console.log(textStatus);  
            parent.tip("系统消息","打开聊天窗口失败"); 
		}
		});
	
} 
 setInterval('userlist()','3000');
/* 点击关闭聊天窗口*/
function closewin(obj){
	var str=obj.split(",");
	
	var div=document.getElementById(str[1]);
	div.remove();
	removeByValue(uid,str[0]);
	event.stopPropagation(); 
}

function moveUp(id)
{
	count++;
var box = document.getElementById(id);
box.style.zIndex=count;
}
function small_down(e,str) {
	var obj=str;
	
	var obig = document.getElementById("main");
	var osmall = document.getElementById(obj);
	var e = e || window.event;
	/*用于保存小的div拖拽前的坐标*/
	osmall.startX = e.clientX - osmall.offsetLeft;
	osmall.startY = e.clientY - osmall.offsetTop;
	/*鼠标的移动事件*/
	document.onmousemove = function(e) {
		var e = e || window.event;
		osmall.style.left = e.clientX - osmall.startX + "px";
		osmall.style.top = e.clientY - osmall.startY + "px";
		/*对于大的DIV四个边界的判断*/
		 if (e.clientX - osmall.startX <= 0) {
			osmall.style.left = 0 + "px";
		}
		if (e.clientY - osmall.startY <= 0) {
			osmall.style.top = 0 + "px";
		}
		/*if (e.clientX - osmall.startX >= 600) {
			osmall.style.left = 600 + "px";
		}
		if (e.clientY - osmall.startY >= 600) {
			osmall.style.top = 600 + "px";
		} */
	};
	/*鼠标的抬起事件,终止拖动*/
	document.onmouseup = function() {
		document.onmousemove = null;
		document.onmouseup = null;
	};
}
function strlen(str){
    var len = 0;
    for (var i=0; i<str.length; i++) { 
     var c = str.charCodeAt(i); 
    //单字节加1 
     if ((c >= 0x0001 && c <= 0x007e) || (0xff60<=c && c<=0xff9f)) { 
       len++; 
     } 
     else { 
      len+=2; 
     } 
    } 
    return len;
}