<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript">
	//提交
	function submitHomework() {
		/*
		 * 答案
		 */
		if ($("#ANSWER").val() == "") {
			$("#ANSWER").tips({
				side : 3,
				msg : '请输入答案',
				bg : '#AE81FF',
				time : 2
			});
			$("#ANSWER").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	function deleteFuJian() {
		bootbox.confirm("确定要删除吗?", function(result) {
			if(result) 
				{
					document.getElementById("fujian").style.display="";
					document.getElementById("div_fujian").style.display="none";
					$.ajax(
							{
								type: "POST",
								url: '<%=basePath%>studentHomework/deleteFileEdit.do?',
								data: {ID:'${pd.ID}'},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									$.each(data.list, function(i, list)
										{
											nextPage('${page.currentPage}');
										}
									);
								}
						}
					);
				}
			}
		);
	}
</script>
</head>
<body>
	<form action="studentHomework/${msg}.do" name="Form" id="Form"
		method="post" enctype="multipart/form-data">
		<input type="hidden" name="ID" id="ID" value="${pd.ID}" />
		<div id="zhongxin" align="center" style="margin-top: 25px">
			<table>

				<tr>
					<td>作业答案： <textarea name="ANSWER" id="ANSWER" style="width: 650px;height: 450px"
							placeholder="这里输入答案" title="答案">${pd.ANSWER}</textarea></td>
				</tr>
				<tr>
					<td><input type="file" id="fujian" name="fujian" title="附件" placeholder="这里选择附件"
						<c:if test='${pd.ANSWER_PATH!=null && pd.ANSWER_PATH!=""}'>style="display: none;"</c:if> />
						<c:if test='${pd.ANSWER_PATH!=null && pd.ANSWER_PATH!=""}'>
							<div id="div_fujian">
								下载： <a href="<%=basePath%>studentHomework/download?ID=${pd.ID}">${pd.ANSWER_NAME}</a>
								<a href="javascript:void(0)" onclick="deleteFuJian();">删除</a>
							</div>
						</c:if>
					</td>
				</tr>
				<tr>
					<td style="text-align: center;"><a
						class="btn btn-mini btn-primary"  onclick="submitHomework();">提交</a>
						<a class="btn btn-mini btn-danger" id="cancelButton" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>

		<div id="zhongxin2" class="center" style="display: none">
			<br /> <br /> <br /> <br /> <br /> <img
				src="static/images/jiazai.gif" /> <br />
			<h4 class="lighter block green">提交中...</h4>
		</div>

	</form>


	<!-- 引入 -->
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>
	<script src="static/js/bootstrap.min.js">
		
	</script>
	<script src="static/js/ace-elements.min.js">
		
	</script>
	<script src="static/js/ace.min.js">
		
	</script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js">
		
	</script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js">
		
	</script>
	<!-- 日期框 -->
	<script type="text/javascript">
		$(top.hangge());
		$(function() {

			//单选框
			$(".chzn-select").chosen();
			$(".chzn-select-deselect").chosen({
				allow_single_deselect : true
			});

			//日期框
			$('.date-picker').datepicker();

		});

		$(document).ready(function() {
			$("#picFile").change(function() {
				ajaxFileUpload();
			});
		});
		rat('star', 'result', 1);
	</script>
</body>
</html>