<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title>考勤展示</title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<!-- 下拉框 -->
		<link rel="stylesheet" href="static/css/chosen.css" />
		
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		
		<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	</head>
	<style>
	*{ margin: 0; padding: 0;}
	#box{ width: 90%; height: 400px; border:1px solid #000; margin:5% auto;}
	#box ul li{ width:10%; float: left; margin-top: 20px; list-style: none;}
	#box ul li span:nth-child(1){ display:block; margin: auto; margin-bottom: 10px; width:10px; height: 10px; border-radius:10px; background: #666;}
	#box ul li span:nth-child(2){ display:block; text-align:center;}
	.btn_box{ text-align:right; margin-right: 5%;}
</style>
<body>
<div id="box">
		<ul>
			<li>
				<span></span>
				<span>name</span>
 			</li>
 			<li>
				<span></span>
				<span>name</span>
 			</li>
 			<li>
				<span></span>
				<span>name</span>
 			</li>
 			<li>
				<span></span>
				<span>name</span>
 			</li>
 			<li>
				<span></span>
				<span>name</span>
 			</li>
		</ul>
	</div>
	<form action="" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<input type="hidden" name="varList" id="varList" value='${pd.varList}'/>
		<div id="zhongxin" align="center">
		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
		
	</form>
	
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		$(function() {
			//单选框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
		});
		
		</script>
	<script>

Date.prototype.format =function(format){
	var o = {
		"M+" : this.getMonth()+1, //month
		"d+" : this.getDate(),    //day
		"h+" : this.getHours(),   //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth()+3)/3),  //quarter
		"S" : this.getMilliseconds() //millisecond
	}
	if(/(y+)/.test(format)) format=format.replace(RegExp.$1,(this.getFullYear()+"").substr(4- RegExp.$1.length));
	for(var k in o)if(new RegExp("("+ k +")").test(format))
	format = format.replace(RegExp.$1,
	RegExp.$1.length==1? o[k] :
	("00"+ o[k]).substr((""+ o[k]).length));
	return format;
} 
var d = new Date().format('hh:mm');

var oTime = "20:20";
console.log(d.replace(/:/,"")-oTime.replace(/:/,""))
var jsonData =[{"NAME":"张三","CARD_NO":"5"},{"NAME":"sdf","CARD_NO":"6"},{"NAME":"孙","CARD_NO":"7"}]
jsonData = $.parseJSON($("#varList").val());

var obj = document.getElementById("box");
var carId = document.getElementById("carId")
var str="";
var ul_inner = obj.getElementsByTagName("ul");
for (var i = 0; i < jsonData.length; i++) {
	str+='<li><span card='+jsonData[i].CARD_NO+'></span><span id="second' + i + '" reType="a"></span><span>'+jsonData[i].NAME+'</span></li>';
};
console.log(str);
ul_inner[0].innerHTML =str;
var list = ul_inner[0].getElementsByTagName("li");
for (var i = 0; i < list.length; i++) {
if('t' == jsonData[i].TYPE){
	list[i].firstChild.style.backgroundColor="#258604";
	list[i].lastChild.style.color="#258604";
	list[i].lastChild.style.fontWeight="bold"
}else if('l' == jsonData[i].TYPE){
	list[i].firstChild.style.backgroundColor="#FF7F00";
	list[i].lastChild.style.color="#FF7F00";
	list[i].lastChild.style.fontWeight="bold"
}else if('a' == jsonData[i].TYPE){
	list[i].firstChild.style.backgroundColor="#FF0000";
	list[i].lastChild.style.color="#FF0000";
	list[i].lastChild.style.fontWeight="bold"
	}
};
   </script>
</body>
</html>