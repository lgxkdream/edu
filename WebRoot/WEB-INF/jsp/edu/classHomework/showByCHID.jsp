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
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	</head>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">

	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="classHomework/showHomework.do?JR_CLASS=${pd.JR_CLASS}" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td width="200px">
<%--						班级名称：${classInfo.NAME}--%>
					</td>
					<td>
<%--						&nbsp;&nbsp;&nbsp;班级人数：${countStudent}--%>
					</td>
				</tr>
			</table>
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th>序号</th>
						<th width="100px">姓名</th>
						<th >内容</th>
						<th width="100px">状态</th>
						<th width="100px">分数</th>
<%--						<th>提交时间</th>--%>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
								<td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${var.ID}" /><span class="lbl"></span></label>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td class='center' style="width: 30px;">${var.STUDENT_NAME}</td>
								<td>${var.ANSWER}</td>
								<td>
									<c:choose>
									<c:when test="${var.STATUS=='0'}">未提交</c:when>
									<c:when test="${var.STATUS=='1'}">已提交</c:when>
									<c:when test="${var.STATUS=='2'}" ><a style="color:#ff0000">重做</a></c:when>
									<c:when test="${var.STATUS=='3'}">已评分</c:when>
									</c:choose>
								</td>
								<td>${var.SCORE}</td>
<%--								<td>${var.SCORE}</td>--%>
								<td style="width: 30px;" class="center">
									<div class='hidden-phone visible-desktop btn-group'>
									
										<c:if test="${QX.edit != 1 && QX.del != 1 }">
										<span class="label label-large label-grey arrowed-in-right arrowed-in"><i class="icon-lock" title="无权限"></i></span>
										</c:if>
										<c:if test='${var.ANSWER_PATH!=null && var.ANSWER_PATH!=""}'>
										<button title="下载作业" class="btn btn-mini btn-info" data-toggle="dropdown" onclick="location.href='<%=basePath %>studentHomework/download?ID=${var.ID}'">下载作业</button>
										</c:if>
										<button title="评分" class="btn btn-mini btn-info" data-toggle="dropdown" onclick="setScore('${var.ID}')">评分</button>
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
			
<%--		<div class="page-header position-relative">--%>
<%--		<table style="width:100%;">--%>
<%--			<tr>--%>
<%--				<td style="vertical-align:top;">--%>
<%--					<a class="btn btn-small btn-info" onclick="assignHom('${classInfo.ID}');">布置作业</a>--%>
<%--					<c:if test="${QX.del == 1 }">--%>
<%--					<a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" ><i class='icon-trash'></i></a>--%>
<%--					</c:if>--%>
<%--				</td>--%>
<%--				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>--%>
<%--			</tr>--%>
<%--		</table>--%>
<%--		</div>--%>
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> 
			</a><div align="center"><a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> 
		</a> 
		 
		<!-- 引入 --> 
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script> 
		<script src="static/js/bootstrap.min.js"></script> 
		<script src="static/js/ace-elements.min.js"></script> 
		<script src="static/js/ace.min.js"></script> 
		 
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 --> 
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 --> 
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 --> 
		<!-- 引入 --> 
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框--> 
		</div><script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>class/delete.do?ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function edit(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>class/goEdit.do?ID='+Id;
			 diag.Width = 450;
			 diag.Height = 355;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 nextPage(${page.currentPage});
				}
				diag.close();
			 };
			 diag.show();
		}
		//修改
		function setScore(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="评分";
			 diag.URL = '<%=basePath%>classHomework/goScore.do?ID='+Id;
			 diag.Width = 800;
			 diag.Height = 600;
			 diag.CancelEvent = function(){ //关闭事件
				 setTimeout("location.reload()",100);
				/* if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{*/
						 //nextPage('${page.currentPage}');
					// }
			//	}
				diag.close();
			 };
			 diag.show();
		}
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker();
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});
		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  }
					}
				
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:8
				        });
						
						return;
					}else{
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>classHomework/deleteAlls.do?tm='+new Date().getTime(),
						    	data: {DATA_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage(${page.currentPage});
									 });
								}
							});
						}
					}
				}
			});
		}
		
		//导出excel
		function toExcel(){
			window.location.href='<%=basePath%>class/excel.do';
		}
		</script>
		
	</body>
</html>

