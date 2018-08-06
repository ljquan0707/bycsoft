
        // 检查是否正在播放
        var isPlaying = false; 
		var time;
		var current = 0;//转动度数
		var vido;
		var times;
		var count=1;
		var counttatol=0;
		var num=0; //点击判定
		var site="";
        function play() {
        	site=$("#site").val();
			var UL = document.getElementsByTagName('ol')[0];
			UL.style.background="";
			var li=UL.children;
			console.log("当前"+count)
			vido = document.querySelector('#test');
            if (isPlaying) {
                // 如果正在播放, 停止播放并停止读取此音乐文件
                vido.pause();
				window.clearInterval(time);
				window.clearInterval(times);
				$("#name").removeClass("play").addClass("puse");
				
                isPlaying = false;
            } else {
               time=window.setInterval('startctr()',50);
			   times=window.setInterval('timeint()',500);
			   $("#name").removeClass("puse").addClass("play");
			  
               vido.play();
				isPlaying=true;
            }
        }
        var musiccontent="";
        function musiclist(){
        	site=$("#site").val();
        	$.ajax({
        		url:site+"/musiclist.do",
        		type : "get",
				datatype : "text",
				success : function(data) {
					var music=eval('(' + data + ')');
					musiccontent=music;
					pageshow();
					onclickmusic();
				}
        	});
        }
        var pagecount=0; // 总页数
        var nowpage=1// 当前页
        function onclickmusic(){
        	vido = document.querySelector('#test');
  			vido.volume = 0.2;
  			var lis = document.getElementsByTagName("li");
  	                var funny = function(i){
  	                    lis[i].onclick = function(){
  	                        count=i+1;
  	                    }
  	                }
  	                for(var i=0;i<lis.length;i++){
  	                    funny(i);
  						}
  						counttatol=lis.length
  	    $(".second-tag li a").click(function(){
  	        var str = $(this).text();
  	        console.log(str);
  			$("#nowplay").empty();
  			$("#nowplay").append(str);
  			current=0;
  				window.clearInterval(time);
  				window.clearInterval(times);
  				 $("#endtime").text("00:00");
  				  vido.src ="/file/sound/"+str;
  				  
  				  isPlaying=false;
  				  play();
  	    })
        }
        
        function pageshow(){
        	var size=musiccontent.length;
        	pagecount= Math.ceil(size/12);
        	
        	$(".countmusic").text("共"+size+"首");
        	if(size>13){
        		$(".pagecount").show();
        		$(".second-tag").empty();
      			for(var i=0;i<13;i++){
      				var html="<li><label>"+musiccontent[i].key+".&nbsp;&nbsp;</label><a class='tag-name'>"+musiccontent[i].value+"</a></li>";
      				$(".second-tag").append(html);
      			}
      			
        	}else{
        		$(".second-tag").empty();
      			for(var i=0;i<size;i++){
      				var html="<li><label>"+musiccontent[i].key+".&nbsp;&nbsp;</label><a class='tag-name'>"+musiccontent[i].value+"</a></li>";
      				$(".second-tag").append(html);
      			}
        	}
        }
        // 下一页
        function nextpage(){
        	
        	var counts=0;
        	var size=musiccontent.length;
        	console.log(nowpage+"==="+pagecount);
        	if(nowpage<pagecount){
        		nowpage=nowpage+1;
        	if(nowpage*13>size){
        		counts=size;
        		console.log(counts);
        	}else{
        		counts=nowpage*13;
        		
        	}
        	
        	$(".second-tag").empty();
  			for(var i=nowpage*13-13;i<counts;i++){
  				var html="<li><label>"+musiccontent[i].key+".&nbsp;&nbsp;</label><a class='tag-name'>"+musiccontent[i].value+"</a></li>";
  				$(".second-tag").append(html);
  			}
        }
        	onclickmusic();
        }
        // 上一页
        function prepage(){
        	
        	var counts=0;
        	var size=musiccontent.length;
        	console.log(nowpage);
        	if(nowpage>=2){
        		nowpage=nowpage-1;
        	if(nowpage*13>size){
        		counts=size;
        		console.log(counts);
        	}else{
        		counts=nowpage*13;
        		console.log(counts);
        	}
        	
        	$(".second-tag").empty();
  			for(var i=nowpage*13-13;i<counts;i++){
  				var html="<li><label>"+musiccontent[i].key+".&nbsp;&nbsp;</label><a class='tag-name'>"+musiccontent[i].value+"</a></li>";
  				$(".second-tag").append(html);
  			}
  			onclickmusic();
        	}
        }
		/*下一曲*/
		function next(){
		  
			if(count==counttatol){
				count=0;
				}
			if(num==0){
			console.log(count+"下一曲");
			var lis = $('.second-tag').find("a").eq(count).text();
			count++;
			
			}else{
			
			for(var i=0;i<2;i++){
			
				count++;
				if(count==counttatol){
				count=0;
				}
			}
			var lis = $('.second-tag').find("a").eq(count).text();
			count++;	
				num=0;
				console.log(count+"转换");
				}
		$("#nowplay").empty();
		$("#nowplay").append(lis);
			vido.src = "/file/sound/"+lis;
			current=0;
			window.clearInterval(time);
			window.clearInterval(times);
			 $("#endtime").text("00:00");
			  
			  isPlaying=false;
			  play();
			  
			  if(count==counttatol){
				count=0;
				}
				
		}
		/*上一曲*/
		function prev(){
			
			if(num==-1){
			console.log(count+"上一曲");
			var lis = $('.second-tag').find("a").eq(count).text();
			count--;	
				if(count==-1){
				count=counttatol-1;
				
			}
			
			
			}else{
			for(var i=0;i<2;i++){
			
				
				if(count==0){
				count=counttatol;
				}
				count--;
			}
			  var lis = $('.second-tag').find("a").eq(count).text();
			  count--;
			  num=-1;
			  console.log(count+"转换");
			  
			  
				}
			console.log(num)	
			$("#nowplay").empty();
		$("#nowplay").append(lis);
			vido.src = "/file/sound/"+lis;
			current=0;
			window.clearInterval(time);
			window.clearInterval(times);
			 $("#endtime").text("00:00");
			  
			  isPlaying=false;
			  play();
			  
			  
				
		}
		/*时间控制*/
		function timeint(){
			var total=parseInt(vido.duration);
			var nowsec=parseInt(vido.currentTime);
			
			$("#startime").text(secondToDate(nowsec));
			$("#endtime").text(secondToDate(total));
			var vidoweidth=163 /(total/nowsec);
			
			bar.style.width=vidoweidth+"px";
			if(total==nowsec+1){
				next();
				}
			}
         /*图片转动制*/
         function startctr(){
            
         	current=current+1;
            var images=document.getElementById('imagecreter')
			var bar=document.getElementById('bar')
            images.style.transform = 'rotate('+current+'deg)';
            
        };
		/*时间格式化*/
		function secondToDate(result) {
			
    if(result==NaN){
		return result ="00:00" ;
		}else{
    var m = Math.floor((result / 60 % 60)) < 10 ? '0' + Math.floor((result / 60 % 60)) : Math.floor((result / 60 % 60));
    var s = Math.floor((result % 60)) < 10 ? '0' + Math.floor((result % 60)) : Math.floor((result % 60));
    return result = m + ":" + s;
}}

	$("document").ready(function(){
		
	
    
})
	var btn=true;
	var timelist;
	var width=0;
	var olddiv="";
	function openmusic(){
		olddiv=document.getElementById("musiclist");
	     width=olddiv.offsetWidth;
		if(btn){
			timelist=window.setInterval('move()',1)
			}else{
			timelist=window.setInterval('remove()',1)
			}
			}
	function move(){
	     
	 var step=olddiv.style.marginLeft;
	
		
	    
		
		if(width>=460){
			step=parseInt(step)+4;
			olddiv.style.marginLeft=parseInt(step)+"px";
			
		}else{
			width=parseInt(width)+4;
			olddiv.style.width=parseInt(width)+"px";
		}
		 
	
	if(step==0){
		clearInterval(timelist); 
		}
		btn=false;
	}
	function remove(){
	var olddiv=document.getElementById("musiclist");
	
	 var step=olddiv.style.marginLeft;
	   
		if(width<=300){
			
			step=parseInt(step)-4;
	 		olddiv.style.marginLeft=parseInt(step)+"px";
		}else{
	 	
		width=parseInt(width)-10;
		olddiv.style.width=parseInt(width)+"px";
		step=parseInt(step)-4;
 		olddiv.style.marginLeft=parseInt(step)+"px";
		}	
	 	
	if(step==-300){
		clearInterval(timelist); 
		}
		btn=true;
	}
	function tuod(){
	
       var odiv2=document.getElementById('minDiv');
        
         
 
        odiv2.onmousedown=function(ev){
             
         var oEvent=ev||event;
         var disX=oEvent.clientX-odiv2.offsetLeft;
         console.log(oEvent.clientX)
          
          
         document.onmousemove=function(ev)
            {
                var oEvent=ev||event;
                var l2=oEvent.clientX-disX;
				
                if(parseInt(l2)<105&&parseInt(l2)>=5){
					
				vido.volume =(parseInt(l2)-5)/100;
				odiv2.style.left=l2+'px';
				$("#vals").empty();
				$("#vals").append(parseInt(l2)-5);
				if(parseInt(l2)-5==0){
					
					$("#vol").removeClass("vol").addClass("volmin");
					}else{
					$("#vol").removeClass("volmin").addClass("vol");
					}
				return;
				}  
                
                      
            };
            document.onmouseup=function(ev)
            {
			$("#volnum").fadeToggle();
                document.onmousemove=null;
                document.onmouseup=null;
            };
         
            };}
			function showvol(){
			
			
			
			$("#volnum").fadeToggle();
			
	}