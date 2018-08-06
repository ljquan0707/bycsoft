<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.spring.pojo.User"%>
	<%String path = request.getContextPath(); %>
	<% User user=(User)session.getAttribute("users");
		String realname=null;
		String logintime=null;
		String rolename=null;
		String username=null;
		int roleid=0;
		 int id =user.getId();
		if(!user.equals("")){
		 realname=user.getRealname();
		 logintime=user.getLogintime();
		 rolename=user.getRolename();
		 roleid=user.getRoleId();
		 username=user.getUsername();
		}%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- BEGIN META -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
   <title>
       物流自动化系统
     </title>
        <link rel="icon" href="img/logo.ico" type="image/x-icon">
        <link href="http://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet">
        <link href="css/bootstrap-reset.css" rel="stylesheet">
		<link href="http://www.jq22.com/jquery/font-awesome.4.6.0.css" rel="stylesheet">
		<link href="css/style.css" rel="stylesheet">
		<link href="css/style-responsive.css" rel="stylesheet">
		<link href="assets/morris.js-0.4.3/morris.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="css/easyui.css">
	    <link rel="stylesheet" type="text/css" href="http://www.jeasyui.net/Public/js/easyui/themes/icon.css">
	<style type="text/css">
		.tabs-header{
		position:fixed;
		z-index: 999;
		}
		.panel-body{
	padding: 1px !important;
	}	
	#tip{bottom: -86px;position: fixed;width: 170px;height: 85px;right: 0px;border: 3px solid #0078D7;border-radius: 5px;background-color: #FDF3CC;}
	.title{background-color: #0078D7;font:14px '楷体';color:white;}
	.tip{text-align: center;}
	</style>
	
     <!--dashboard calendar-->
     <link href="css/clndr.css" rel="stylesheet"><!-- CALENDER CSS -->
     <!--[if lt IE 9]>
<script src="js/html5shiv.js">
</script>
<script src="js/respond.min.js">
</script>
<![endif]-->
     <!-- END STYLESHEET-->
  </head>
  <body>
  <input style="display: none;" id="site" value="<%=request.getContextPath()%>">
  <input style="display: none;" id="roleid" value="<%=roleid%>">
    <!-- BEGIN SECTION -->
    <section id="container">
      <!-- BEGIN HEADER -->
      <header class="header white-bg">
        <!-- SIDEBAR TOGGLE BUTTON -->
			<div class="sidebar-toggle-box">
			  <div  data-placement="right" class="fa fa-bars tooltips">
			  </div>
			</div>
        <!-- SIDEBAR TOGGLE BUTTON  END-->
        <a href="login.jsp" class="logo">
           物流
          <span>
           自动化
          </span>
        </a>
        
           <!-- START HEADER  NAV -->
        
        <nav class="nav notify-row" id="top_menu">
          
          <ul class="nav top-menu">
            <!-- START NOTIFY TASK BAR -->
            
            <li class="dropdown">
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-tasks">
                </i>
                <span class="badge bg-success">
                  3
                </span>
              </a>
              
              <ul class="dropdown-menu extended tasks-bar">
                <li class="notify-arrow notify-arrow-blue">
                </li>
                <li>
                  <p class="blue">
                                                                              当 前 登 录 信 息
                  </p>
                </li>
                <li>
                 <a href="#" > 用 户: <%=realname %></a>
                </li>
                <li>
                  <a href="#">角色: <%=rolename %></a>
                  </li>
                <li>
                  <a href="#">上次登录时间: <span><%=logintime %></span>
                    </a>
                </li>
                
              <li class="external">
                  <a href="#">
                                                                   如需修改，点击个人中心
                  </a>
                </li>
              </ul>
              
            </li>
            <!-- END NOTIFY TASK BAR -->
            
            <!-- START NOTIFY INBOX BAR -->
            
            <li id="header_inbox_bar" class="dropdown">
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-envelope-o">
                </i>
                <span class="badge bg-important">
                  5
                </span>
              </a>
              <ul class="dropdown-menu extended inbox">
                <li class="notify-arrow notify-arrow-blue">
                </li>
                <li>
                  <p class="blue">
                    You have 5 new messages
                  </p>
                </li>
                <li>
                  <a href="#">
                    <span class="photo">
                      <img alt="avatar" src="./img/avatar-mini.jpg">
                    </span>
                    <span class="subject">
                      <span class="from">
                        Chintan Pandya
                      </span>
                      <span class="time">
                        Just now
                      </span>
                    </span>
                    <span class="message">
                      Hello, this is an example msg.
                    </span>
                  </a>
                </li>
         
                <li>
                  <a href="#">
                    See all messages
                  </a>
                </li>
              </ul>
            </li>
            <!-- END NOTIFY INBOX BAR -->
            
            <!-- START NOTIFY NOTIFICATION BAR -->
            
            <li id="header_notification_bar" class="dropdown">
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <i class="fa fa-bell-o">
                </i>
                <span class="badge bg-warning">
                  7
                </span>
              </a>
              <ul class="dropdown-menu extended notification">
                <li class="notify-arrow notify-arrow-blue">
                </li>
                <li>
                  <p class="blue">
                    You have 7 new notifications
                  </p>
                </li>
                <li>
                  <a href="#">
                    <span class="label label-danger">
                      <i class="fa fa-bolt">
                      </i>
                    </span>
                    Server #3 overloaded.
                    <span class="small italic">
                      34 mins
                    </span>
                  </a>
                </li>
                
                
                <li>
                  <a href="#">
                    See all notifications
                  </a>
                </li>
              </ul>
            </li>
            <!-- END NOTIFY NOTIFICATION BAR -->
            
          </ul>
          
          
        </nav>
		<!-- END HEADER NAV -->
        
		 <!-- START USER LOGIN DROPDOWN  -->
		
        <div class="top-nav ">
          <ul class="nav pull-right top-menu">
            <li style="margin-top: 15px;color: white;text-align: right;">
              <span id="timedate"></span>
            </li>
            <li class="dropdown">
              <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                <img src="/file/<%=username%>.jpg" onerror="this.src='<%=request.getContextPath()%>/img/photo.jpg'" width="40px;" height="40px;" >
                <span class="username">
                  <%=realname %>
                </span>
                <b class="caret">
                </b>
              </a>
              <ul class="dropdown-menu extended logout">
                <li class="log-arrow-up">
                </li>
                <li>
                  <a href="#">
                    <i class=" fa fa-suitcase">
                    </i>
                    Profile
                  </a>
                </li>
                <li>
                  <a href="#">
                    <i class="fa fa-cog">
                    </i>
                    Settings
                  </a>
                </li>
                <li>
                  <a href="#">
                    <i class="fa fa-bell-o">
                    </i>
                    Notification
                  </a>
                </li>
                <li>
                  <a href="<%=request.getContextPath()%>/loginout.do">
                    <i class="fa fa-key">
                    </i>
                    Log Out
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
		<!-- END USER LOGIN DROPDOWN  -->
      </header>
      <!-- END HEADER -->
      <!-- BEGIN SIDEBAR -->
      <aside>
        <div id="sidebar" class="nav-collapse">
          <ul class="sidebar-menu" id="nav-accordion">
            <li >
              <a href="" class="active">
                <i class="fa fa-dashboard">
                </i>
                <span>
                                                               导航栏
                </span>
              </a>
            </li>
            
              </ul>
            
        </div>
      </aside>
      <!-- END SIDEBAR -->
      <!-- BEGIN MAIN CONTENT -->
      
      
      <section id="main-content">
	  <!-- BEGIN WRAPPER  -->
        <section class="wrapper">
		  <!-- BEGIN ROW  -->
		  <div id="tt" class="easyui-tabs">
		<div title="主页" style="width: 100%;height:100%;">
<div class="row state-overview">
            <div class="col-lg-3 col-sm-6">
              <section class="panel">
                <div class="symbol">
                  <i class="fa fa-tags blue">
                  </i>
                </div>
                <div class="value">
                  <h1 class="count">
                    0
                  </h1>
                  <p>
                    Total Sale
                  </p>
                </div>
              </section>
            </div>
            <div class="col-lg-3 col-sm-6">
              <section class="panel">
                <div class="symbol">
                  <i class="fa fa-money red">
                  </i>
                </div>
                <div class="value">
                  <h1 class=" count2">
                    0
                  </h1>
                  <p>
                    Total Profit
                  </p>
                </div>
              </section>
            </div>
            <div class="col-lg-3 col-sm-6">
              <section class="panel">
                <div class="symbol">
                  <i class="fa fa-user yellow">
                  </i>
                </div>
                <div class="value">
                  <h1 class=" count3">
                    0
                  </h1>
                  <p>
                    New Users
                  </p>
                </div>
              </section>
            </div>
            <div class="col-lg-3 col-sm-6">
              <section class="panel">
                <div class="symbol">
                  <i class="fa fa-shopping-cart purple">
                  </i>
                </div>
                <div class="value">
                  <h1 class=" count4">
                    0
                  </h1>
                  <p>
                    New Orders
                  </p>
                </div>
              </section>
            </div>
          </div>
          </div></div>
		   
		   
        </section>
		<!-- END WRAPPER  -->
      </section>
      <!-- END MAIN CONTENT -->
      <!-- BEGIN FOOTER -->
      <footer class="site-footer" style="bottom: 0px;position: fixed;width:inherit;">
        <div class="text-center">
          2013 &copy; 启航科技
          <a href="" target="_blank">
            Olive Enterprise
          </a>
          <a href="#" class="go-top">
            <i class="fa fa-angle-up">
            </i>
          </a>
        </div>
      </footer>
      <div id="tip">
      </div>
      <!-- END  FOOTER -->
    </section>
    
    <!-- END SECTION -->
    <!-- BEGIN JS -->
    <%@ include file="/utill/meta.jsp" %>
    
    
    <script >
    function tip(title,content){
    	$("#tip").empty();
   	 var head=title;
   	 var body=content;
   	 $("#tip").prepend("<p class='title'>来自："+title+"的消息</p>");
   	 $("#tip").append("<div class='tip'></div>")
   	 $(".tip").append("<span>"+content+"</span>")
   	 $("#tip").animate({bottom:'40px'},"slow");
   	 
   	 setTimeout("$('#tip').animate({bottom:'-90px'},'slow');",2500);
   	
    }
    javascript:window.history.forward(1); 
    window.onload=function(){
   		
    	//js 获取当前时间
    	 function fnDate(){

    	var date=new Date();
    	var year=date.getFullYear();//当前年份
    	var month=date.getMonth();//当前月份
    	var data=date.getDate();//天
    	var hours=date.getHours();//小时
    	var minute=date.getMinutes();//分
    	var second=date.getSeconds();//秒
    	var week=date.getDay();//星期
    	var time=fnW(hours)+"时"+fnW(minute)+"分"+fnW(second)+"秒"+"<br/> "+year+"年"+(month+1)+"月"+data+"日"+" "+"星期"+weeks(week);
    	document.getElementById("timedate").innerHTML=time;
    	}
    	//补位 当某个字段不是两位数时补0
    	function fnW(str){
    	var num;
    	str>9?num=str:num="0"+str;
    	return num;
    	} 
    	function weeks(num){
    		var str;
    		switch(num){
    		case 0:str="日";break;
    		case 1:str="一";break;
    		case 2:str="二";break;
    		case 3:str="三";break;
    		case 4:str="四";break;
    		case 5:str="五";break;
    		case 6:str="六";break;
    		}
    		return str;
    	}
    	setInterval(function(){
    		fnDate();
    		},1000); 
    	
    	
    	 var roleid=$("#roleid").val();
    	    var site=$("#site").val();
    	   
    	    	$.ajax({
    				data:{roleid:roleid},
    				type:"post",
    				url:site+"/init.do",
    				datatype:"text",
    				async: true,
    				success:function(data){
    					var json=eval("("+data+")");
    					console.log(json[0].child[0].title);
    					var size=json.length
    					for(var i=0;i<size;i++){
    		var menu="<li class='sub-menu dcjq-parent-li'><a href='javascript:;'class='dcjq-parent'><i class='fa fa-laptop'></i><span> "+json[i].title+"</span><span class='label label-success span-sidebar'>"+json[i].count+"</span><span class='dcjq-icon'></span></a><ul class='sub' id='menulist"+i+"' style='display: none;'></ul>"
    		$("#nav-accordion").append(menu)
    						if(json[i].count!=0){
    							
    						for(var j=0;j<json[i].child.length;j++){
    							var menulist="";
    							
    							 menulist="<li><a data-stopPropagation='true' onclick='addTab(\""+json[i].child[j].title+"\",\""+json[i].child[j].action+"\")'>"+json[i].child[j].title+" </a></li>"
    							$("#menulist"+i).append(menulist);
    						}
    						
    					}
    		}}
    			})
    			 $("ul.sidebar-menu").on("click", "[data-stopPropagation]", function(e) {  
    			        e.stopPropagation();  
    			    });  
    			
    			 
    			
    			 $(document).on('click', '.sub-menu', function(e) {
    				 var flag=$(this).find("a").attr('class');
    				 if(flag=='dcjq-parent active'){
    					 $(this).find("ul").hide(500);
       				  $(this).find("a").removeClass('active');
    				 }
    				 if(flag=='dcjq-parent'){
    				 $(this).siblings().find("ul").hide(500); 
    				  $(this).siblings().find("a").removeClass('active') ;
    				  $(this).find("ul").show(500);
    				  $(this).find("a").addClass('active');
    				 e.preventDefault(); 
    				 
    				 }
    				 
    		    	}); 
		}
    		
    	
   
    
   
    		
    
      //knob
      
      function addTab(title, url){
			if ($('#tt').tabs('exists', title)){
				$('#tt').tabs('select', title);
			} else {
				var content = '<iframe scrolling="auto" id="myframe" frameborder="0"  src="'+url+'" style="width:100%;height:100%"></iframe>';
				$('#tt').tabs('add',{
					title:title,
					content:content,
					closable:true
				});
			}
		}
      $("#myframe").load(function() {
    		   
    		      var iframeHeight = $(this).contents().find("body").height();
    		      $(this).height(iframeHeight);
    		   
    		  });
      
      window.onbeforeunload = function () {
    	  var site=$("#site").val();
    	  window.location.href=site+"/loginout.do";
    	  }  
    
      
    </script>
    
    <!-- END JS -->
  </body>
</html>





