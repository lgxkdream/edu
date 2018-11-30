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
		<title></title>
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
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	
</script>
	</head>
<body>
	<form action="showClassAttendance/${msg }.do" name="Form" id="Form" method="post">
		<input type="hidden" name="STUDENT_ATTENDANCE_ID" id="STUDENT_ATTENDANCE_ID" value="${pd.ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td><input type="text" name="NAME" id="NAME" value="${pd.NAME}" readonly="readonly" title="姓名"/></td>
			</tr>
			<tr>
				<td>
					<select class="chzn-select" name="TYPE" id="TYPE" data-placeholder="状态">
					  <option value='a' <c:if test="${'a'==pd.TYPE}">selected</c:if>>缺勤</option>
					  <option value='l' <c:if test="${'l'==pd.TYPE}">selected</c:if>>迟到</option>
					  <option value='t' <c:if test="${'t'==pd.TYPE}">selected</c:if>>正常</option>
					  <option value='q' <c:if test="${'q'==pd.TYPE}">selected</c:if>>请假</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<div class="row-fluid input-append date">
						<input class="date-picker" id="INPUT_TIME" name="INPUT_TIME" type="text" data-date-format="yyyy-mm-dd" value="${pd.INPUT_TIME}" placeholder="签到时间" title="签到时间"/>
						<span class="add-on"><i class="icon-calendar"></i></span>
						&nbsp;<span style="color:#ff0000">*</span>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
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
</body>
</html>