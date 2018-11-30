<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
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
		<!-- 检索  -->
			<form action="lesson/goEdit.do" method="post" name="searchForm" id="searchForm" >
			<table>
				<tr>
					<td style="vertical-align:top;">
					 	<select name="CAMPUS_ID" id="CAMPUS_ID" data-placeholder="请选择校区" style="vertical-align:top;width: 120px;" onchange="search();">
							<c:if test="${not empty DIC_CAMPUS}">
								<c:forEach var="data" items="${DIC_CAMPUS}" >
						    		<option value='${data.ID}' <c:if test='${data.ID==pd.CAMPUS_ID}'>selected</c:if>>${data.NAME}</option>
						    	</c:forEach>
							</c:if>
					  	</select>
					</td>
<%--					<td><input class="span10 date-picker" name="START_DATE" id="START_DATE" value="${pd.START_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="日期" onchange="search();"/></td>--%>
					<td>
						<select name="START_DATE" id="START_DATE" style="vertical-align:top;width: 230px;" onchange="search();" onclick="listDate();">
							<option value = "${pd.START_DATE}">${pd.START_DATE}———${pd.END_DATE}</option>
						</select>
					</td>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();"  title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<c:if test="${empty varList }">
						<td style="vertical-align:top;">
							<button title="新建课表" class="btn btn-mini btn-info" data-toggle="dropdown" onclick="add();">新建课表</button>
						</td>
<%--					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="add();"  title="新建课表"><i id="nav-search-icon" class="icon-edit"></i></button></td>--%>
					</c:if>
				</tr>
			</table>
		</form>
		<!-- 检索  -->
			<form action="lesson/edit.do" method="post"  name="editForm" id="editForm">
			<table id="table_report" class="table table-striped table-bordered">
				<thead>
					<tr>
						<th colspan="10" class="center">
							<input name="CAMPUS_ID" id="CAMPUS_ID" type="hidden" value="${pd.CAMPUS_ID}">
							<input name="START_DATE" id="START_DATE" type="hidden" value="${pd.START_DATE}">
							<input name="END_DATE" id="END_DATE" type="hidden" value="${pd.END_DATE}">
							本周课表&nbsp;&nbsp;${pd.START_DATE}———${pd.END_DATE}
						</th>
					</tr>
					<tr>
						<th>校区</th>
						<th>时间</th>
						<th>教室</th>
						<th>一  (${pd.MON})</th>
						<th>二  (${pd.TUE})</th>
						<th>三  (${pd.WED})</th>
						<th>四  (${pd.THU})</th>
						<th>五  (${pd.FRI})</th>
						<th>六  (${pd.SAT})</th>
						<th>日  (${pd.SUN})</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty varList}">
						<c:if test="${QX.cha == 1 }">
						<c:forEach items="${varList}" var="var" varStatus="vs">
							<tr>
									<c:if test="${vs.first}">
										<td rowspan="${fn:length(varList)}"style="vertical-align: middle">
											${pd.CAMPUS_NAME}
										</td>
									</c:if>
								<c:if test="${vs.count % (fn:length(varList)/fn:length(DIC_TIME))==1}">
									<td rowspan="${(fn:length(varList))/fn:length(DIC_TIME)}" style="vertical-align: middle">
										${DIC_TIME[vs.count / (fn:length(varList)/fn:length(DIC_TIME))].TIME_MARK}<br>${DIC_TIME[vs.count / (fn:length(varList)/fn:length(DIC_TIME))].TIME}
									</td>
								</c:if>
								<td>
									<input name="ID" id="ID" type="hidden" value="${var.ID}"/>
									${var.CLASSROOM_NAME} 
								</td>
								<td>
									<select class="form-control"  name="MON_CLASS" id="MON_CLASS" data-placeholder="请选择班级" style="vertical-align:top;width: 120px;">
										<c:if test="${not empty DIC_CLASS}">
											<option value='null' <c:if test='${empty var.MON_CLASS_ID}'>selected</c:if>></option>
											<c:forEach var="data" items="${DIC_CLASS}" >
						    					<option value='${data.ID}@${data.NAME}' <c:if test='${data.ID==var.MON_CLASS_ID}'>selected</c:if>>${data.NAME}</option>
						    				</c:forEach>
										</c:if>
									</select>
								</td>
								<td>
									<select name="TUE_CLASS" id="TUE_CLASS" data-placeholder="请选择班级" style="vertical-align:top;width: 120px;">
										<c:if test="${not empty DIC_CLASS}">
											<option value='null' <c:if test='${empty var.TUE_CLASS_ID}'>selected</c:if>></option>
											<c:forEach var="data" items="${DIC_CLASS}" >
						    					<option value='${data.ID}@${data.NAME}' <c:if test='${data.ID==var.TUE_CLASS_ID}'>selected</c:if>>${data.NAME}</option>
						    				</c:forEach>
										</c:if>
									 </select>
								</td>
								<td>
									<select name="WED_CLASS" id="WED_CLASS" data-placeholder="请选择班级" style="vertical-align:top;width: 120px;">
										<c:if test="${not empty DIC_CLASS}">
						    				<option value='null' <c:if test='${empty var.WED_CLASS_ID}'>selected</c:if>></option>
											<c:forEach var="data" items="${DIC_CLASS}" >
						    					<option value='${data.ID}@${data.NAME}' <c:if test='${data.ID==var.WED_CLASS_ID}'>selected</c:if>>${data.NAME}</option>
						    				</c:forEach>
										</c:if>
									 </select>
								</td>
								<td>
									<select name="THU_CLASS" id="THU_CLASS" data-placeholder="请选择班级" style="vertical-align:top;width: 120px;">
										<c:if test="${not empty DIC_CLASS}">
											<option value='null' <c:if test='${empty var.THU_CLASS_ID}'>selected</c:if>></option>
											<c:forEach var="data" items="${DIC_CLASS}" >
						    					<option value='${data.ID}@${data.NAME}' <c:if test='${data.ID==var.THU_CLASS_ID}'>selected</c:if>>${data.NAME}</option>
						    				</c:forEach>
										</c:if>
									 </select>
								</td>
								<td>
									<select name="FRI_CLASS" id="FRI_CLASS" data-placeholder="请选择班级" style="vertical-align:top;width: 120px;">
										<c:if test="${not empty DIC_CLASS}">
											<option value='null' <c:if test='${empty var.FRI_CLASS_ID}'>selected</c:if>></option>
											<c:forEach var="data" items="${DIC_CLASS}" >
						    					<option value='${data.ID}@${data.NAME}' <c:if test='${data.ID==var.FRI_CLASS_ID}'>selected</c:if>>${data.NAME}</option>
						    				</c:forEach>
										</c:if>
									 </select>
								</td>
								<td>
									<select name="SAT_CLASS" id="SAT_CLASS" data-placeholder="请选择班级" style="vertical-align:top;width: 120px;">
										<c:if test="${not empty DIC_CLASS}">
											<option value='null' <c:if test='${empty var.SAT_CLASS_ID}'>selected</c:if>></option>
											<c:forEach var="data" items="${DIC_CLASS}" >
						    					<option value='${data.ID}@${data.NAME}' <c:if test='${data.ID==var.SAT_CLASS_ID}'>selected</c:if>>${data.NAME}</option>
						    				</c:forEach>
										</c:if>
									 </select>
								</td>
								<td>
									<select name="SUN_CLASS" id="SUN_CLASS" data-placeholder="请选择班级" style="vertical-align:top;width: 120px;">
										<c:if test="${not empty DIC_CLASS}">
											<option value='null' <c:if test='${empty var.SUN_CLASS_ID}'>selected</c:if>></option>
											<c:forEach var="data" items="${DIC_CLASS}" >
						    					<option value='${data.ID}@${data.NAME}' <c:if test='${data.ID==var.SUN_CLASS_ID}'>selected</c:if>>${data.NAME}</option>
						    				</c:forEach>
										</c:if>
									 </select>
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
						<td style="vertical-align:top;">
							<c:if test="${QX.add == 1&&(not empty varList) }">
								<a class="btn btn-small btn-success" onclick="edit();">保存</a>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
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
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
		
		$(top.hangge());
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
        if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
        (this.getFullYear()+"").substr(4- RegExp.$1.length));
        for(var k in o)if(new RegExp("("+ k +")").test(format))
        format = format.replace(RegExp.$1,
        RegExp.$1.length==1? o[k] :
        ("00"+ o[k]).substr((""+ o[k]).length));
        return format;
    	}
		function listDate() {
			var now  = new Date();
			var date = new Date();
			var start_String = $("#START_DATE").val();
			$("#START_DATE").empty();
			date.setFullYear(date.getFullYear(),0,1);
			date.setDate(date.getDate()-date.getDay()+1);
			var reg=new RegExp("/","g");
				for(var i = 0;i<55;i++){
					var start = date;
					var startDate = date.format('yyyy-MM-dd');
					var end = date.setDate(date.getDate()+6);
					var endDate = date.format('yyyy-MM-dd');
					if(startDate == start_String){
						$("select.#START_DATE").append("<option value='"+startDate+"'"+"selected='selected'"+">"+startDate+"———"+endDate+"</option>");
					}else{
						$("select.#START_DATE").append("<option value='"+startDate+"'>"+startDate+"———"+endDate+"</option>");
					}
					date.setDate(date.getDate()+1);
				}
		};
		//检索
		function search(){
			$("#searchForm").attr("action", "<%=basePath%>lesson/goEdit.do");
			$("#searchForm").submit();
			top.jzts();
		}
		//新建课表
		function add(){
			$("#searchForm").attr("action", "<%=basePath%>lesson/add.do");
			$("#searchForm").submit();
			top.jzts();
		}
		//删除
		function del(Id){
			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>classattendance/delete.do?CLASSATTENDANCE_ID="+Id+"&tm="+new Date().getTime();
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				}
			});
		}
		//修改
		function edit(){
			top.jzts();
			if($("#START_DATE").val()==""){
			$("#START_DATE").tips({
				side:3,
	            msg:'请选择日期',
	            bg:'#AE81FF',
	            time:3
	        });
			$("#START_DATE").focus();
			return false;
		}
			$("#editForm").submit();
		}
		function showDetail(Id){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>classattendance/goEdit.do?CLASSATTENDANCE_ID='+Id;
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
		</script>
		
		<script type="text/javascript">
		
		$(function() {
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//日期框
			$('.date-picker').datepicker({
    			 weekStart: 1,
                 maxViewMode: 0,
                 daysOfWeekDisabled: "0,2,3,4,5,6",
                 daysOfWeekHighlighted: "0,1",
                 calendarWeeks: true,
                 autoclose: true
				});
			
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
								url: '<%=basePath%>classattendance/deleteAll.do?tm='+new Date().getTime(),
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
			window.location.href='<%=basePath%>classattendance/excel.do';
		}
		</script>
		
	</body>
</html>

