 $(document).ready(function() {
     $('#example').dataTable();
     
});
    var userid="";
    function look(str){
    	$(".tip").show();
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
    			+"</td></tr><tr style='text-align: center;'><td colspan='2'><button onclick=\"javascript:$('#result').slideToggle('fast');$('.tip').hide();userid='';\">确定</button></td></tr></table>";
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
    	$(".tip").hide()
    	userid="";
    	$("#content").empty();

   });