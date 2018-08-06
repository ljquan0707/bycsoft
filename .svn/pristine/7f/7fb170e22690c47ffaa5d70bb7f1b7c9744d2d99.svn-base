<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="com.spring.pojo.User"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!doctype html>
<html>
<head>
<%
	User user = (User) session.getAttribute("users");
	String realname = user.getRealname();
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/utill/utill.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/waybill/waybill.css"></link>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/area.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/waybill/waybill.js"></script>
<title>运单录入</title>
</head>
<body bgcolor="D7D2CF" style="position: relative;">
	<input style="display: none;" id="site" value="<%=request.getContextPath()%>">

	<div id="waybill">
		<fieldset>
			<legend align="top">新增运单</legend>

			<div id="top">
				<div style="float: left">
					<span class="tip">*</span>单号：<input pattern="[0-9]" autofocus="autofocus" id="no" />
				</div>
				<div style="float: left; margin-left: 150px;">
					<span class="tip">*</span>客户代码：<select id="khdm"><option value="0">请选择</option>
							<c:forEach items="${clist}" var="cl">
							<option value="${cl[0]}">${cl[1]}</option>
							</c:forEach>
						</select>
				</div>
				<div style="float: left; margin-left: 150px;">
					   运输方式：<input style="width: 40px;" type="radio" name="ysfs"
								value="汽运" checked="checked">汽运 <input
								style="width: 40px;" type="radio" name="ysfs" value="空运">空运
				</div>
				<div style="clear: both"></div><br>
				<div>始发站：<input style="width: 50px;" id="fromcity" value="北京">————<span class="tip">*</span>目的站：<input style="width: 50px;" id="tocity" type="text"/></div>
			</div>
			<div id="result">
			     <div class="show" align="center">信息展示</div>
			     <div style="overflow: auto;height: 129px;">
				<table id="showresult">
					
					
				</table>
			</div></div>
			<div style="margin: 2px; padding: 4px; width: 48%; float: left;font-size: 13px;">
				<fieldset>
					<legend>发货人</legend>
					<table height="85">
					<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tip">*</span>姓名：<input id="shippername" type="text"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="button" class="btn" onclick="searchs();">
							  <img alt="" src="<%=request.getContextPath()%>/img/menusearch.gif" title="搜索"></button></td>
							
						</tr>
						<tr><td>
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tip">*</span>电话：<input id="shippertel" type="text"/>
						 <button type="button" class="btn" onclick="searchs();">
							  <img alt="" src="<%=request.getContextPath()%>/img/menusearch.gif" title="搜索"></button>
						</td></tr>
						<tr>
							<td><span class="tip">*</span>公司名称：<input style="width: 250px;" id="shippercgp" type="text"/></td>
						</tr>
						<tr>
							<td><span class="tip">*</span>公司地址：<input style="width: 250px;" id="shipperadress" type="text"/></td>
						</tr>
						
					</table>
				</fieldset>
			</div>
			<div style="padding: 4px; width: 50%; float: left; font-size: 13px;">
				<fieldset>
					<legend>收货人</legend>
					<table height="85">
					<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tip">*</span>姓名：<input id="consigneename" type="text"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="tip">*</span>电话：<input id="consigneetel" type="text"/>
							<button type="button" class="btn" onclick="searchc();">
							  <img alt="" src="<%=request.getContextPath()%>/img/menusearch.gif" title="搜索"></button></td>
						</tr>
						<tr>
							<td>公司名称：<input style="width: 250px;" id="consigneecgp" /></td>
						</tr>
						<tr>
							<td>公司地址：<select id="s_province" name="s_province"></select>  
								<select id="s_city" name="s_city"></select>   <select
								id="s_county" name="s_county"></select>&nbsp;&nbsp;&nbsp;</td>
							
						</tr>
						<tr><td>
							详细地址：<input style="width: 250px;" id="adress" onblur="address();"/>
						</td></tr>
					</table>
				</fieldset>
				<div id="show"></div>
			</div>
			<div style="clear: both"></div>
			<div id="hwxx" style="margin: 2px; padding: 4px; font-size: 13px;">
				<fieldset>
					<legend>货物信息</legend>
					<table width="90%" height="70">
						<tr>
							<td><span class="tip">*</span>货物名称：<input id="hwmc" type="text"/></td>
							<td><span class="tip">*</span>件数：<input id="js" type="text"/></td>
							<td><span class="tip">*</span>包装：<select id="bz">
									<option value="0" selected="selected">请选择</option>
									<option value="纸箱">纸箱</option>
									<option value="木箱">木箱</option>
									<option value="木箱">编织袋</option>
									<option value="铁桶">铁桶</option>
									<option value="其他">其他</option>
							</select></td>
							<td><span class="tip">*</span>毛重：<input id="mz" type="text"/>&nbsp;kg
							</td>
							<td><span class="tip">*</span>尺寸(cm)：
								<button class="btn" type="button" onclick="addsize()">
									<img alt=""
										src="<%=request.getContextPath()%>/img/edit_add.png" title="添加">
								</button>
							</td>
						</tr>
						<tr>
							<td>&nbsp;计费重量：<input id="sjzl" value="0.00" readonly="readonly" style="background-color: #DEDED8"/>&nbsp;kg
							</td>
							<td>&nbsp;体积：<input value="0.00" readonly="readonly" id="tj" onblur="findprice();"/>&nbsp;m³
							</td>
							<td>&nbsp;费率：<input tabindex="-1" value="0.00" readonly="readonly" style="background-color: #DEDED8"/ id="fl">&nbsp;元/kg
							</td>
							<td>&nbsp;运费：<input tabindex="-1" value="0.00" readonly="readonly" style="background-color: #DEDED8" id="yf"/>&nbsp;元
							</td>
						</tr>
					</table>
				</fieldset>
			</div>
			<div style="margin: 2px; padding: 4px; font-size: 13px;">
				<fieldset>
					<legend>附加信息</legend>
					<table width="100%" height="90">
						<tr>
							<td>是否投保:<input style="width: 40px;" type="radio" name="bf"
								value="否" checked="checked">否 <input
								style="width: 40px;" type="radio" name="bf" value="是">是
							</td>
							<td>保险金额：<input style="width: 120px;" value="0.00" id="bxje" onblur="bfcount();"/>&nbsp;元
							</td>
							<td>保费：<input readonly tabindex="-1" style="width: 120px;background-color: #DEDED8;" value="0.00" id="bf"/>&nbsp;元
							</td>
						</tr>
						<tr>
							<td><span class="tip">*</span>付款方式：<select id="fkfs"><option value="0">请选择</option>
									<option value="现金">现金</option>
									<option value="月结">月结</option>
									<option value="到付">到付</option>
									<option value="第三方代付">第三方代付</option>
							</select></td>
							<td>到付金额：<input value="0.00" id="dfje"/>&nbsp;元
							</td>
							<td><span class="tip">*</span>提货方式：<select id="thfs"><option value="0">请选择</option>
									<option value="自提">自提</option>
									<option value="送货">送货</option>

							</select></td>
						</tr>
						<tr>
							<td>&nbsp;费用名称：<input value="无" id="fymc"/>&nbsp;
							</td>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金额：<input value="0.00" id="qtfy" onblur="yfcount();"/>&nbsp;元
							</td>
							<td>总金额：<input tabindex="-1" value="0.00" readonly="readonly" style="background-color: #DEDED8" id="zje"/>&nbsp;元
							</td>
							<td>制单人：<input tabindex="-1" readonly="readonly"
								value="<%=realname%>" style="background-color: #D7D2CF; border: none;" id="zdr"/></td>
							<td>制单时间：<input style="background-color: #D7D2CF; border: none;"
								tabindex="-1" readonly="readonly"
								value="<%out.print(new java.text.SimpleDateFormat("MM-dd hh:mm")
					.format(new Date()));%>" />
						</tr>
					</table>
				</fieldset>
			</div>
			<table width="30%" height="50" style="margin-left: 50px;">
				<tr>
					<td><button class="btn" type="button" onclick="savewaybill();"><img alt="" src="<%=request.getContextPath()%>/img/filesave.png" title="保存"></button></td>
					<td><button class="btn" type="button"><img alt="" src="<%=request.getContextPath()%>/img/print.png" title="打印"></button></td>
					<td><button class="btn" type="button"><img alt="" src="<%=request.getContextPath()%>/img/menusearch.gif" title="打印预览"></button></td>
					<td><button class="btn" type="button"><img alt="" src="<%=request.getContextPath()%>/img/pencil.png" title="修改"></button></td>
					<td><button class="btn" type="button"><img alt="" src="<%=request.getContextPath()%>/img/no.png" title="删除"></button></td>
					<td><button class="btn" type="button" onclick="javascript:window.location.href='<%=request.getContextPath()%>/waybilllist.do'"><img alt="" src="<%=request.getContextPath()%>/img/redo.png" title="下一个"></button></td>
				</tr>
			</table>
		</fieldset>
	</div>
	<div id="size" align="center">
		<div style="font-size: 15px; background-color: green; height: 30px;">尺寸</div>
		<div style="padding-left: 30px;">
			<label>长</label><label>宽</label><label>高</label><label>件数</label>
		</div>
		<div>
			<input id="c0" onblur="addtr('c0');"> X <input id="k0"> X <input id="g0">
			X <input id="js0">
		</div>
		<table id="mytable">

		</table>
		<div id="foot"
			style="display: none; position: absolute; bottom: 5px; left: 55px;">
			<button type="button" style="margin-right: 30px;" onclick="rs();">清空</button>
			<button onclick="gb();">确定</button>
		</div>
	</div>
	<div id=test></div>
</body>
<script type="text/javascript">
_init_area();
</script>
</html>