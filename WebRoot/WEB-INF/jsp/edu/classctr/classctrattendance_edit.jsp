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
		<title>考勤录入</title>
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
		
<script type="text/javascript">
	//保存
	function save(){
		var param = createParam();
		var actionUrl = "classattendance/saveList.do?data=" + param;
		$.ajax(
							{
								type: "POST",
								url: '<%=basePath%>classattendance/saveList.do?data=' + param + '&ID=' + $("#ID").val(),
								dataType:'json',
								success: function(data){
									if(data == '1'){
										$("#btnSave").hide();
										$("#carId").hide();
										alert('提交成功！');
									}else{
										alert('网络延迟，请重新提交！');
									}
								}
						}
					);
		
		
		
		
	}
	
	function sessionCon(){
		var url = "classattendance/sessionCon";
		$.ajax(
				{
					type: "POST",
					url: url,
					dataType:'json',
					success: function(data){
					
					}
			}
		);
	}
	
	setInterval("sessionCon()", 600000);
	
</script>
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
	<p class="btn_box">
		<input type="text" value="" id="carId" placeholder="请输入学生ID">
	</p>
	<form action="" name="Form" id="Form" method="post">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<input type="hidden" name="varList" id="varList" value='${pd.varList}'/>
		<div id="zhongxin" align="center">
		<table style="margin-top: 40px">
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" id="btnSave" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
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
	var col = "#258604";
	var typ = "t";
	function changeColTyp(){
		col = "#FF7F00";
		typ = "l";
	}
	Date.prototype.format =function(format)
    {
        var o = {
        "M+" : this.getMonth()+1, //month
		"d+" : this.getDate(),    //day
		"h+" : this.getHours(),   //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth()+3)/3),  //quarter
		"S" : this.getMilliseconds() //millisecond
        }
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4- RegExp.$1.length));
        for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
        RegExp.$1.length==1? o[k] :
        ("00"+ o[k]).substr((""+ o[k]).length));
        return format;
    } 
    var d = new Date().format('hh:mm');
  
 	var oTime = "20:20";
 	console.log(d.replace(/:/,"")-oTime.replace(/:/,""))
 	var beginDate = new Date();
	var year = beginDate.getFullYear();    //获取完整的年份(4位,1970-????)
	var month = beginDate.getMonth();       //获取当前月份(0-11,0代表1月)
	var day = beginDate.getDate();        //获取当前日(1-31)
	var hours = beginDate.getHours();       //获取当前小时数(0-23)
	var beginTime = beginDate.getTime();        //获取当前时间(从1970.1.1开始的毫秒数)
	if(hours < 10){
		hours = 10;
	}else if(hours < 14){
		hours = 14;
	}else if(hours < 19){
		hours = 19;
	}
	
	var lateDate = new Date(year,month,day,(hours-1),'30');
	//var lateDate = new Date(year,month,day,"12","47");
	var lateTime = lateDate.getTime();
	setTimeout("changeColTyp()", lateTime - beginTime);
	
	var endDate = new Date(year,month,day,hours);
	//var endDate = new Date(year,month,day,"12","47");
	var endTime = endDate.getTime();
	setTimeout("save()", endTime - beginTime);
	
 	var jsonData =[{"NAME":"张三","CARD_NO":"5"},{"NAME":"sdf","CARD_NO":"6"},{"NAME":"孙","CARD_NO":"7"}]
	jsonData = $.parseJSON($("#varList").val());
   	var obj = document.getElementById("box");
   	var carId = document.getElementById("carId")
   	var str="";
	var ul_inner = obj.getElementsByTagName("ul");
		for (var i = 0; i < jsonData.length; i++) {
  			str+='<li><span card='+jsonData[i].CARD_NO+'></span><span id="second' + i + '" reType="a"></span><span id="third' + i + '" time=""></span><span>'+jsonData[i].NAME+'</span></li>';
	};
	console.log(str);
		 ul_inner[0].innerHTML =str;
 		carId.onkeydown=function (event) {
		 var e = event || window.event || arguments.callee.caller.arguments[0];
		 if(e && e.keyCode==13){ // enter 键
			 green(this);
			 $("#carId").val("");
			}
	}

	function green (obj) {
	                var list = ul_inner[0].getElementsByTagName("li");
	                for (var i = 0; i < list.length; i++) {
	                 		if(list[i].firstChild.getAttribute("card")==obj.value){
	                 			//list[i].firstChild.style.backgroundColor="#258604";
	                 			//$("#second" + i).attr("reType","t");
	                 			list[i].firstChild.style.backgroundColor="#33FF66";
	                 			$("#second" + i).attr("reType",typ);
	                 			$("#third" + i).attr("time",new Date().format("yyyy-MM-dd hh:mm:ss"));
	                 			list[i].lastChild.style.color="#33FF66";
	                 			list[i].lastChild.style.fontWeight="bold"
	                 		}
	                };
	 	}
	function yellow (obj) {
	                var list = ul_inner[0].getElementsByTagName("li");
	                for (var i = 0; i < list.length; i++) {
	                 		if(list[i].firstChild.getAttribute("card")==obj.value){
	                 			list[i].firstChild.style.backgroundColor="#FF7F00";
	                 			//list[i].secondChild.setAttribute("reType","l");
	                 			$("#second" + i).attr("reType","l");
	                 			list[i].lastChild.style.color="#FF7F00";
	                 			list[i].lastChild.style.fontWeight="bold"
	                 		}
	                };
	 	}
	function createParam(){
					var param = "";
					var list = ul_inner[0].getElementsByTagName("li");
	                for (var i = 0; i < list.length; i++) {
                 			param += list[i].firstChild.getAttribute("card") + "=" + document.getElementById("second" + i).attributes["reType"].value + "=" + document.getElementById("third" + i).attributes["time"].value + ",";//t表示正常，l表示迟到，a表示缺席
	                }
	                return param;
	}
	$("#carId").focus();
   </script>
</body>
</html>