<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	Date currentDate=new Date();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title></title>
<%@ include file="../../system/admin/top.jsp"%> 
	<base href="<%=basePath%>">
	<meta name="description" content="overview & stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link href="static/css/bootstrap.min.css" rel="stylesheet" />
	<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	<link rel="stylesheet" href="static/css/chosen.css" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="static/css/ace-skins.min.css" />	
	<link rel="stylesheet" href="static/css/datepicker.css" /><!-- 日期框 -->
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery.raty.js"></script>
		
</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<!-- 检索  -->
			<form action="studentHomework/list.do" method="post" name="Form" id="Form">
<%--			<table>--%>
<%--				<tr>--%>
<%--					<td>--%>
<%--						<span class="input-icon">--%>
<%--							<input autocomplete="off" id="TITLE" type="text" name="TITLE" value="${pd.TITLE}" placeholder="这里输入标题内容" />--%>
<%--							<i id="nav-search-icon" class="icon-search"></i>--%>
<%--						</span>--%>
<%--					</td>--%>
<%--					<td><input class="span10 date-picker" name="CREATE_TIME_START" id="lastLoginStart" value="${pd.CREATE_TIME_START}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期"/></td>--%>
<%--					<td><input class="span10 date-picker" name="CREATE_TIME_END" id="lastLoginEnd" value="${pd.CREATE_TIME_END}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期"/></td>--%>
<%--					<td style="vertical-align:top;">		--%>
<%--					<button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>--%>
<%--					<c:if test="${QX.cha == 1 }">--%>
<%--					<td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>--%>
<%--					</c:if>--%>
<%--				</tr>--%>
<%--			</table>--%>
			</form>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>序号</th>
						<th>布置时间</th>
						<th>作业名称</th>
						<th>状态</th>
						<th>截止日期</th>
						<th>分数</th>	
						<th>提交时间</th>						
						<th>操作</th>
					</tr>
				</thead>	
				<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								
								<td class='center' style="width: 30px;">${vs.index+1}<input type='hidden'value="${var.ID}" /></td>
								<td style="width: 120px;">${var.HOMEWORK_CREATE_TIME}</td>
								<td>${fn:substring(var.TITLE,0,30)}<c:if test="${fn:length(var.TITLE)>30}">...</c:if></td>
								<td style="width: 40px;">
								<c:choose>
								<c:when test="${var.STATUS=='0'}">未提交</c:when>
								<c:when test="${var.STATUS=='1'}">已提交</c:when>
								<c:when test="${var.STATUS=='2'}" ><a style="color:#ff0000">要重新提交</a></c:when>
								</c:choose>
								</td>
								<td style="width: 120px;">${var.END_TIME}</td>
								<td style="width: 30px;">${var.SCORE}</td>
								<td style="width: 120px;">${var.SUBMIT_TIME}</td>
								<td style="width: 30px;" class="center">
										<fmt:parseDate value="${var.END_TIME}" var="endTime" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
										<c:set var="currentDate"><%=currentDate%></c:set>
									<div class='hidden-phone visible-desktop btn-group'>
										<button title="查看作业详细" class="btn btn-mini btn-info" data-toggle="dropdown" onclick="top.siMenu('${var.ID}','${var.ID}','${var.TITLE}-查看作业详细','studentHomework/homeworkDetailed.do?ID=${var.ID}')">查看作业详细</button>
										<c:if test="${var.SCORE==null||var.SCORE==''}">
										
										
										<button title="提交" <c:if test="${currentDate>endTime}">disabled="disabled"</c:if> class="btn btn-mini btn-info" data-toggle="dropdown" onclick="goSubmitHomework('${var.ID}');">提交作业</button>
										</c:if>
										<c:if test='${var.ANSWER_PATH!=null && var.ANSWER_PATH!=""}'>
										<button title="下载作业" class="btn btn-mini btn-info" data-toggle="dropdown" onclick="location.href='<%=basePath %>studentHomework/download?ID=${var.ID}'">下载作业</button>
										</c:if>
									</div>
								</td>
							</tr>
						</c:forEach>
						</c:if>
						<c:if test="${QX.cha == 0 }">
							<tr>
								<td colspan="100" class="center">您无权查看</td>
							</tr>
						</c:if>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				</tbody>
			</table>
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	</div>
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript">
		$(top.hangge());
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		//修改
		function goSubmitHomework(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="提交作业";
			 diag.URL = '<%=basePath%>studentHomework/goSubmitHomework.do?ID='+Id;
			 diag.Width = 800;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{*/
						 nextPage('${page.currentPage}');
					// }
			//	}
				diag.close();
			 };
			 diag.show();
		}

		$(function() {
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			//日期框
			$('.date-picker').datepicker();
			
		});
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>studentHomework/excel.do';
		};
		</script>
</body>
</html>

