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
		<meta charset="utf-8" />
	<title>${pd.SYSNAME}</title>
	<meta name="description" content="overview & stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- basic styles -->
	<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
	<!--引入弹窗组件start-->
	<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
	</head>
<body>
		<input id="test">

		
		<script type="text/javascript">
		var arr=["1","2","3","4"];
<%--		$.each(arr,function(i,value){--%>
<%--			alert(i+"--"+value);--%>
<%--			}--%>
<%--		)--%>
		var diag = new Dialog();
		diag.Width = 900;
		diag.Height = 400;
		diag.Title = "内容页为外部连接的窗口";
		diag.URL = "http://www.baidu.com/";
		diag.show();
		</script>
		
	</body>
</html>

