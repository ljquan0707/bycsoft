<%@ page language="java" import="java.util.*" pageEncoding="Utf-8"%> 
<% 
  String path = request.getContextPath(); 
  String basePath = request.getScheme() + "://"
      + request.getServerName() + ":" + request.getServerPort() 
      + path + "/"; 
%> 
  
<!DOCTYPE html> 
<html> 
<head> 
<base href="<%=basePath%>"> 
  
  
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0"> 
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"> 
<meta http-equiv="description" content="This is my page"> 
<!-- 
 <link rel="stylesheet" type="text/css" href="styles.css"> 
--> 
<link href="css/bootstrap.min.css" rel="stylesheet"> 
  
<style type="text/css"> 
.file-box { 
  position: relative; 
  width: 340px 
} 
  
.txt { 
  height: 22px; 
  border: 1px solid #cdcdcd; 
  width: 180px; 
  vertical-align: middle; 
  margin: 0; 
  padding: 0 
} 
  
.btn { 
  border: 1px solid #CDCDCD; 
  height: 24px; 
  width: 70px; 
  vertical-align: middle; 
  margin: 0; 
  padding: 0 
} 
  
.file { 
  position: absolute; 
  top: 0; 
  right: 80px; 
  height: 24px; 
  filter: alpha(opacity :  0); 
  opacity: 0; 
  width: 260px; 
  vertical-align: middle; 
  margin: 0; 
  padding: 0 
} 
</style> 
<%--<script type="text/javascript"> 
    function myInterval() 
    { 
      $("#progress").html(""); 
      $.ajax({ 
        type: "POST", 
        url: "<%=basePath%>UserControllers/getSessions", 
      data : "1=1", 
      dataType : "text", 
      success : function(msg) { 
        var data = msg; 
        console.log(data); 
        $("#pdiv").css("width", data + "%"); 
        $("#progress").html(data + "%"); 
      } 
    }); 
  } 
  function autTime() { 
    setInterval("myInterval()", 200);//1000为1秒钟 
  } 
</script> 
  
  
--%> 
<script type="text/javascript"> 
  function UpladFile() { 
	  var site=site=$("#site").val();
    var fileObj = document.getElementById("file").files[0]; // js 获取文件对象 
    var FileController = site+"/progress"; // 接收上传文件的后台地址  
    // FormData 对象---进行无刷新上传 
    var form = new FormData(); 
    form.append("author", "hooyes"); // 可以增加表单数据 
    form.append("file", fileObj); // 文件对象 
    // XMLHttpRequest 对象 
    var xhr = new XMLHttpRequest(); 
    xhr.open("post", FileController, true); 
    xhr.onload = function() { 
      alert("上传完成!"); 
      //$('#myModal').modal('hide'); 
    }; 
        //监听progress事件 
    xhr.upload.addEventListener("progress", progressFunction, false); 
    xhr.send(form); 
  } 
  function progressFunction(evt) { 
  
    var progressBar = document.getElementById("progressBar"); 
  
    var percentageDiv = document.getElementById("percentage"); 
  
    if (evt.lengthComputable) { 
  
      progressBar.max = evt.total; 
  
      progressBar.value = evt.loaded; 
  
      percentageDiv.innerHTML = Math.round(evt.loaded / evt.total * 100) 
          + "%"; 
  
    } 
  
  } 
</script> 
  
</head> 
  <input style="display: none;" id="site" value="<%=request.getContextPath()%>">
<body style="width: 80%;height: 80%;margin: 0px auto;"> 
  <div class="row bootstrap-admin-no-edges-padding"> 
    <div class="col-md-12"> 
      <div class="panel panel-default"> 
        <div class="panel-heading"> 
          <div class="text-muted bootstrap-admin-box-title">文件管理</div> 
        </div> 
        <div class="bootstrap-admin-panel-content"> 
          <button class="btn btn-primary btn-lg" data-toggle="modal"
            data-target="#myModal">上传</button> 
          <input type="text" id="test"> 
        </div> 
      </div> 
    </div> 
  </div> 
  
  <!-- 模态框（Modal） --> 
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel" aria-hidden="true"> 
    <div class="modal-dialog"> 
      <div class="modal-content"> 
        <div class="modal-header"> 
          <button type="button" class="close" data-dismiss="modal"
            aria-hidden="true">×</button> 
          <h4 class="modal-title" id="myModalLabel">文件上传进度</h4> 
        </div> 
        <div class="modal-body"> 
          <progress id="progressBar" value="0" max="100"
            style="width: 100%;height: 20px; "> </progress> 
          <span id="percentage" style="color:blue;"></span> <br> 
          <br> 
          <div class="file-box"> 
            <input type='text' name='textfield' id='textfield' class='txt' /> 
            <input type='button' class='btn' value='浏览...' /> <input 
              type="file" name="file" class="file" id="file" size="28"
              onchange="document.getElementById('textfield').value=this.value" /> 
            <input type="submit" name="submit" class="btn" value="上传"
              onclick="UpladFile()" /> 
              
          </div> 
        </div> 
        <div class="modal-footer"> 
          <button type="button" class="btn btn-default" data-dismiss="modal">关闭 
          </button> 
        </div> 
      </div> 
      <!-- /.modal-content --> 
    </div> 
    <!-- /.modal --> 
  </div> 
  <script type="text/javascript"
    src="http://code.jquery.com/jquery-2.0.3.min.js"></script> 
  <script src="js/bootstrap.min.js"></script> 
</body> 
</html> 