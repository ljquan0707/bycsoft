function showtable() {
	var mainTable = document.getElementById("showresult");
	var li = mainTable.getElementsByTagName("tr");
	for ( var i = 1; i <= li.length; i++) {
		li[i].style.backgroundColor = "";
		li[i].onmouseover = function() {
			this.style.backgroundColor = "#0099FF";
		}
		li[i].onmouseout = function() {
			this.style.backgroundColor = "white";
		}
	}
}
var n = 1;
/* 收货人地址 */
var consigneeadress = null;
/* 尺寸 */
var sizes = "";
/* 件数 */
var count = 0;
/* 体积 */
var bulk = 0;
/* 打开添加尺寸窗口 */
function addsize() {
	$("#test").show();
	$("#size").slideDown("slow");
	$("#c0").focus();
	if (n != 0) {
		$("#foot").show();
	}
}
/* 添加尺寸 */
function addtr(c) {
	var first = $('#' + c).val();
	var num = parseInt(c.substring(1));
	if (num < n - 1) {
	} else {
		var html = "<tr><td><input id='c" + n + "' onblur='addtr(&quot;c" + n
				+ "&quot;)'> X </td><td><input id='k" + n
				+ "'> X </td><td><input id='g" + n
				+ "'> X </td><td><input id='js" + n + "'></td></tr>";
		if (first == "") {
			$("#foot").show();
		} else {
			$("#mytable").append(html);
			n++;
		}
	}
}
/* 关闭添加尺寸窗口 */
function gb() {
	var js = $("#js").val();
	if (js == "") {
		$("#foot").hide();
		$("#size").slideUp("slow");
		$("#test").hide();
	} else {
		init();
		if (js == count) {
			
			$("#foot").hide();
			$("#size").slideUp("slow");
			$("#test").hide();
		} else {
			showMsg('件数不一致，请修改', 'center');
		}
	}
	$("#sjzl").focus();
}
/* 重置尺寸数据 */
function rs() {
	n = 1;
	$("#mytable").empty();
	$("#size input").val("");
}
/* 获取地址 */
function address() {
	var province = $("#s_province option:selected").val();
	var city = $("#s_city option:selected").val();
	var county = $("#s_county option:selected").val();
	var adress = $("#adress").val();
	consigneeadress = province + "、" + city + "、" + county + "、" + adress;
}
/* 初始化尺寸 */
function init() {
	var c = $("#c0").val();
	var k = $("#k0").val();
	var g = $("#g0").val();
	var js = $("#js0").val();
	count = parseInt(js);
	sizes = c + "X" + k + "X" + g + "X" + js;
	bulk = parseInt(c) * parseInt(k) * parseInt(g) * parseInt(js);
	for ( var a = 1; a < n - 1; a++) {
		var c = $("#c" + a).val();
		var k = $("#k" + a).val();
		var g = $("#g" + a).val();
		var js = $("#js" + a).val();
		sizes = sizes + "," + c + "X" + k + "X" + g + "X" + js;
		count += parseInt(js);
		bulk += parseInt(c) * parseInt(k) * parseInt(g) * parseInt(js);
	}
	var ysfs = $("input[name='ysfs']:checked").val();
	var mz = $("#mz").val();
	if (ysfs == "汽运") {
		if (mz > bulk / 5000) {
			$("#sjzl").val(mz);
		} else {
			$("#sjzl").val((bulk / 5000).toFixed(0));
		}
	} else {
		if (mz > bulk / 6000) {
			$("#sjzl").val(mz);
		} else {
			$("#sjzl").val((bulk / 6000).toFixed(0));
		}
	}
	$("#tj").val((bulk / 1000000).toFixed(3));
}

var flag="true";
/*失去焦点*/
$(function() {
	$("input[id='no']").blur(function() {
		if ($(this).val().length < 10) {
			showMsg('单号必须10位', 'center');
			$(this).css({
				"border" : "1px #FC391C solid"
			});
			flag="false";
		}
	});
	$("input[type='text']").blur(function() {
		
		if ($(this).val()=="") {
			showMsg('必填项', 'center');
			$(this).css({
				"border" : "1px #FC391C solid"
			});
			flag="false";
		}
	});
	$("#khdm").blur(function() {
		if ($(this).val()=="0") {
			showMsg('必选项', 'center');
			$(this).css({
				"border-color" :"#FC391C"
			});
			flag="false";
		}else{
			$(this).css({
				"border-color" :"#3399FF"
			});
			flag="true";
		}
	});
	$("#bz").blur(function() {
		if ($(this).val()=="0") {
			showMsg('必选项', 'center');
			$(this).css({
				"border-color" :"#FC391C"
			});
			flag="false";
		}else{
			$(this).css({
				"border-color" :"#3399FF"
			});
			flag="true";
		}
	});
	$("#fkfs").blur(function() {
		if ($(this).val()=="0") {
			showMsg('必选项', 'center');
			$(this).css({
				"border-color" :"#FC391C"
			});
			flag="false";
			
		}else{
			$(this).css({
				"border-color" :"#3399FF"
			});
			flag="true";
			
		}
	});
	$("#thfs").blur(function() {
		if ($(this).val()=="0") {
			showMsg('必选项', 'center');
			$(this).css({
				"border-color" :"#FC391C"
			});
			flag="false";
		}else{
			$(this).css({
				"border-color" :"#3399FF"
			});
			flag="true";
			
		}
	});
	
});


/*得到焦点*/
$(function() {
	
	$("input[id='no']").focus(function() {
		$(this).css({
			"border" : "1px #a29393 solid"
		});
		flag="true";
	});
	$("input[type='text']").focus(function() {
		$(this).css({
			
			"border" : "1px #a29393 solid"
		});
		flag="true";
	});
	$("khdm").focus(function() {
		$(this).css({"border-color":"#a29393"
			});
		flag="true";
		
	});
	$("bz").focus(function() {
		$(this).css({"border-color":"#a29393"
			});
		flag="true";
	});
	$("fkfs").focus(function() {
		$(this).css({"border-color":"#a29393"
			});
		flag="true";
	});
	$("thfs").focus(function() {
		$(this).css({"border-color":"#a29393"
			});
		flag="true";
		
	});
	
});
/* 查询发货人 */
var json;
function searchs() {
	json = null;
	var site = $("#site").val();
	var sname = $("#shippername").val();
	var stel = $("#shippertel").val();
	if (sname == "" && stel == "") {
		showMsg('姓名和电话必填一个', 'center');
	} else {
		   $.ajax({
					url : site + "/searchs.do",
					data : {
						sname : sname,
						stel : stel
					},
					type : "post",
					datatype : "text",
					success : function(data) {
						json = eval("(" + data + ")");
						var size = json.length;
						if(size==0){
							showMsg('无数据', 'center');
						}else{
						if (size == 1) {
							$("#shippercgp").val(json[0].shippercgp);
							$("#shipperadress").val(json[0].shipperadress);
							$("#shippername").val(json[0].shippername);
							$("#shippertel").val(json[0].shippertel);
							$("#shipperadress").focus();
						} else {
							$("#showresult").empty();
							var htm = "<tr><td>公司</td><td>地址</td><td>姓名</td><td>电话</td></tr>";

							$("#showresult").append(htm);
							for ( var n = 0; n < size; n++) {
								var html = "<tr ondblclick='copyshipper(&quot;"
										+ n + "&quot;)'><td>"
										+ json[n].shippercgp + "</td><td>"
										+ json[n].shipperadress + "</td><td>"
										+ json[n].shippername + "</td><td>"
										+ json[n].shippertel + "</td></tr>";
								$("#showresult").append(html);
							}
							$("#result").show();
							showtable();
						}}
					}
				});
	}
}
function copyshipper(str) {
	var a = parseInt(str);
	$("#shippercgp").val(json[a].shippercgp);
	$("#shipperadress").val(json[a].shipperadress);
	$("#shippername").val(json[a].shippername);
	$("#shippertel").val(json[a].shippertel);
	$("#result").hide();
	$("#shipperadress").focus();
}

/* 查询收货人 */
function searchc() {
	json = null;
	var site = $("#site").val();
	var cname = $("#consigneename").val();
	var ctel = $("#consigneetel").val();
	if (cname == "" && ctel == "") {
		showMsg('姓名和电话必填一个', 'center');
	} else {
		    $.ajax({
					url : site + "/searchc.do",
					data : {
						cname : cname,
						ctel : ctel
					},
					type : "post",
					datatype : "text",
					success : function(data) {
						json = eval("(" + data + ")");
						var size = json.length;
						if(size==0){
							showMsg('无数据', 'center');
						}else{
						if (size ==1) {
							$("#consigneecgp").val(json[0].consigneecgp);
							var adress = json[0].consigneeadress;
							var strc = adress.split("、");
							$("#s_province").find(
									"option[value='" + strc[0] + "']").attr(
									"selected", true);
							$("#s_city").append(
									"<option value='" + strc[1]
											+ "' selected='selected' >"
											+ strc[1] + "</option>");
							$("#s_county").append(
									"<option value='" + strc[2]
											+ "' selected='selected' >"
											+ strc[2] + "</option>");
							$("#adress").val(strc[3]);
							$("#consigneename").val(json[0].consigneename);
							$("#consigneetel").val(json[0].consigneetel);
							$("#adress").focus();
						} else {
							$("#showresult").empty();
							var htm = "<tr><td>公司</td><td>地址</td><td>姓名</td><td>电话</td></tr>";

							$("#showresult").append(htm);
							for ( var n = 0; n < size; n++) {
								var html = "<tr ondblclick='copyconsignee(&quot;"
										+ n
										+ "&quot;)'><td>"
										+ json[n].consigneecgp
										+ "</td><td>"
										+ json[n].consigneeadress
										+ "</td><td>"
										+ json[n].consigneename
										+ "</td><td>"
										+ json[n].consigneetel + "</td></tr>";
								$("#showresult").append(html);
							}
							$("#result").show();
							showtable();
						}
					}}
				});
	}
}
function copyconsignee(str) {
	var a = parseInt(str);
	$("#consigneecgp").val(json[a].consigneecgp);
	var adress = json[0].consigneeadress;
	var strc = adress.split("、");
	$("#s_province").find("option[value='" + strc[0] + "']").attr("selected",
			true);
	$("#s_city").append(
			"<option value='" + strc[1] + "' selected='selected' >" + strc[1]
					+ "</option>");
	$("#s_county").append(
			"<option value='" + strc[2] + "' selected='selected' >" + strc[2]
					+ "</option>");
	$("#adress").val(strc[3]);
	$("#consigneename").val(json[a].consigneename);
	$("#consigneetel").val(json[a].consigneetel);
	$("#result").hide();
	$("#adress").focus();
}
function findprice(){
	var site = $("#site").val();
	var sjzl = $("#sjzl").val();
	var tocity = $("#tocity").val();
	var khdm = $("#khdm option:selected").val();
	if(khdm=="0"){
		showMsg('客户代码必填', 'center');
	}else{
	$.ajax({
		url : site + "/findprice.do",
		data : {khdm:khdm,sjzl:sjzl,city:tocity},
		type : "post",
		datatype : "text",
		success : function(data){
			json = eval("(" + data + ")");
			if(json[0].msg=="无数据"){
				showMsg('运价查询失败，请检查目的站是否有误或运价是否上传', 'center');
			}else{
			$("#fl").val(json[0].fl);
			$("#yf").val(json[0].yf);
			}}
		});
	}}
function checkNull()
{
     var num=0;
     $("input[type='text']").each(function(n){
          if($(this).val()=="")
          {
            num++;
               $(this).css("border","1px red solid");
          }
     });
     if(num>0)
     {
        flag="false";
          }
     
}
	/*计算保费*/
function bfcount(){
	var bxje=$("#bxje").val();
	var bf=parseFloat(bxje)*0.002;
	$("#bf").val(bf);
}

function yfcount(){
	var yf=$("#yf").val();
	var bf=$("#bf").val();
	var qtfy=$("#qtfy").val();
	var totalyf=parseFloat(yf)+parseFloat(bf)+parseFloat(qtfy);
	$("#zje").val(totalyf);
	
}
/* 保存运单 */
function savewaybill() {
	var site = $("#site").val();
	var no = $("#no").val();
	var ysfs = $("input[name='ysfs']:checked").val();
	var fromcity = $("#fromcity").val();
	var tocity = $("#tocity").val();
	var khdm = $("#khdm option:selected").val();
		if(khdm=="0"){
			$("#khdm").css("border-color", "red");
			flag="false";
		}
	var scgp = $("#shippercgp").val();
	var sads = $("#shipperadress").val();
	var sname = $("#shippername").val();
	var stel = $("#shippertel").val();
	var ccgp = $("#consigneecgp").val();
	var cads = consigneeadress;
	var cname = $("#consigneename").val();
	var ctel = $("#consigneetel").val();
	var hwmc = $("#hwmc").val();
	var js = $("#js").val();
	var bz = $("#bz option:selected").val();
	if(bz=="0"){
		$("#bz").css("border-color", "red");
		flag="false";
	}
	var mz = $("#mz").val();
	var cc = "" + sizes;
	var sjzl = $("#sjzl").val();
	var tj = $("#tj").val();
	var fl = $("#fl").val();
	var yf = $("#yf").val();
	var tb = $("input[name='bf']:checked").val();
	var bxje = $("#bxje").val();
	var fkfs = $("#fkfs option:selected").val();
	if(fkfs=="0"){
		$("#fkfs").css("border-color", "red");
		flag="false";
	}
	var dfje = $("#dfje").val();
	var qsr="";
	var thfs = $("#thfs option:selected").val();
	if(thfs=="0"){
		$("#thfs").css("border-color", "red");
		flag="false";
	}
	if(thfs=="自提"){
		qsr="无";
	}
	if(thfs=="送货"){
		qsr="未填写";
	}
	var qtfy = $("#qtfy").val();
	var bf=$("#bf").val();
	var beiz="无";
	var state="未完成";
	var fymc=$("#fymc").val();
	var zdr = $("#zdr").val();
	
	var arr = [ no, ysfs, khdm, fromcity, tocity, scgp, sads, sname, stel,
			ccgp, cads, cname, ctel, hwmc, js, bz, mz, cc, sjzl, tj, fl, yf,
			tb, bxje, fkfs, dfje, thfs, qtfy,zdr,bf,beiz,qsr,state,fymc ];
	checkNull();
	
	if(flag=="true"){
	$.ajax({
		url : site + "/waybillsave.do",
		data : {array : arr},
		traditional : true,
		type : "post",
		datatype : "text",
		success : function(data){
			if(data=="true"){
				showMsg('保存成功', 'center');
				$("#waybill input").attr("readOnly","true");
				$("#waybill input").css("background-color","#DEDED8");
			}else{
				showMsg('保存失败', 'center');
			}
		}
	});}else{
		showMsg('信息不完整，无法保存', 'center');
		
	}
}