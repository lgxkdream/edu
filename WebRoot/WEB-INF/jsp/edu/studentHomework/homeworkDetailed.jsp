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
<!-- jsp文件头和头部 -->
<%@ include file="../../system/admin/top.jsp"%>
</head>
<body>

	<div class="container-fluid" id="main-container">


		<div id="page-content" class="clearfix">

			<div class="row-fluid">

				<div class="row-fluid">

						<table id="table_report"
							class="table table-striped table-bordered table-hover">

							<thead>
								<tr>
<%--									<th class="center">--%>
<%--										<label>--%>
<%--											<input type="checkbox" id="zcheckbox" />--%>
<%--											<span class="lbl"></span>--%>
<%--										</label>--%>
<%--									</th>--%>
									<th>序号</th>
									<th>题目</th>
									<!-- <th>分类id</th> -->
<%--									<th>分类名称</th>--%>
									<!-- <th>上传文件名称</th> -->
									<!-- <th>上传文件路径</th> -->
									<!-- <th>答案</th> -->
									<!-- <th>答案文件名称</th> -->
									<!-- <th>答案文件路径</th> -->
<%--									<th>创建时间</th>--%>
									<!-- <th>创建人ID</th> -->
<%--									<th>创建人姓名</th>--%>
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
<%--													<td class='center' style="width: 30px;">--%>
<%--														<label>--%>
<%--															<input type='checkbox' name='ids' value="${var.ID}" />--%>
<%--															<span class="lbl"></span>--%>
<%--														</label>--%>
<%--													</td>--%>
													<td class='center' style="width: 30px;">${vs.index+1}</td>
													<td>${var.TITLE}</td>
													<%-- <td>${var.TYPE}</td> --%>
<%--													<td>${var.TYPE_NAME}</td>--%>
													<%-- <td>${var.FILE_NAME}</td> --%>
													<%-- <td>${var.FILE_PATH}</td> --%>
													<%-- <td>${var.ANSWER}</td> --%>
													<%-- <td>${var.ANSWER_NAME}</td> --%>
													<%-- <td>${var.ANSWER_PATH}</td> --%>
<%--													<td>${var.CREATE_TIME}</td>--%>
													<%-- <td>${var.CREATOR}</td> --%>
<%--													<td>${var.CREATOR_NAME}</td>--%>
													<td style="width: 30px;" class="center">
														<div class="hidden-phone visible-desktop btn-group">
<%--																<button title="查看" class="btn btn-mini btn-info" data-toggle="dropdown" onclick="show('${var.ID}');" ><i class="icon-edit"></i></button>--%>
															<c:if test="${QX.del == 1 }">--%>
<%--																<button title="删除" class="btn btn-mini btn-danger" data-toggle="dropdown" onclick="del('${var.ID}');"><i class="icon-trash"></i></button>--%>
															</c:if>
															<c:if test="${var.FILE_PATH!=null && var.FILE_PATH!=''}">
																<button title="附件" class="btn btn-mini btn-info" data-toggle="dropdown" onclick="location.href='<%=basePath %>homework/download?ID=${var.ID}&OPERATOR=FILE'">附件</button>
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
											<td colspan="100" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>


							</tbody>
						</table>

						<div>
							<table style="width: 100%;">
								<tr>
									<td style="vertical-align: top;">
										<c:if test="${QX.add == 1 }">
<%--											<a class="btn btn-small btn-success" onclick="add();">新增</a>--%>
										</c:if> 
										<c:if test="${QX.del == 1 }">
<%--											<a	class="btn btn-small btn-danger"--%>
<%--												onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除">--%>
<%--												<i class='icon-trash'></i>--%>
<%--											</a>--%>
										</c:if>
									</td>
									<td style="vertical-align: top;">
										<div class="pagination" style="float: right; padding-top: 0px; margin-top: 0px;">${page.pageStr}</div>
									</td>
								</tr>
							</table>
						</div>
				</div>




				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->

		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>

	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->
	<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#Form").submit();
		}
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>homework/goAdd.do';
			 diag.Width = 600;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage(${page.currentPage});
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>homework/delete.do?ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		
		//修改
		function show(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>homework/show.do?ID='+Id;
			 diag.Width = 600;
			 diag.Height = 400;
			 diag.CancelEvent = function(){ //关闭事件
				 //if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 //nextPage(${page.currentPage});
				//}
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
								url: '<%=basePath%>homework/deleteAll.do?tm='+new Date().getTime(),
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
			var form=document.getElementById("Form");
			form.action="homework/excel.do";
			form.submit();
			form.action="homework/list.do";
		}
		</script>

</body>
</html>

