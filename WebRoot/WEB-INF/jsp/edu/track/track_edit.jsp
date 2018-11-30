<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	int yixiangInit=2;
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
		<script type="text/javascript" src="<%=basePath %>js/jquery.raty.js"></script>
		
<script type="text/javascript">
	
	
	//保存
	function save(){
			if($("#YIXIANG").val()==""){
			$("#YIXIANG").tips({
				side:3,
	            msg:'请输入意向',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#YIXIANG").focus();
			return false;
		}
		if($("#REMARK").val()==""){
			$("#REMARK").tips({
				side:3,
	            msg:'请输入备注',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#REMARK").focus();
			return false;
		}
		$("#Form").submit();
		$("#zhongxin").hide();
		$("#zhongxin2").show();
	}
	function rat(star,result,m){
		var score=<c:choose ><c:when test="${pd.YIXIANG!=null}">${pd.YIXIANG}</c:when><c:otherwise ><%=yixiangInit%></c:otherwise></c:choose>
		
		star= '#' + star;
		result= '#' + result;
		$(result).hide();//将结果DIV隐藏
		$(star).raty({
			hints: ['1','2', '3', '4', '5'],
			path: "images",
			starOff: 'star-off-big.png',
			starOn: 'star-on-big.png',
			size: 24,
			start: 4,
			number: 5,
			score: score,
			showHalf: true,
			target: result,
			targetKeep : true,//targetKeep 属性设置为true，用户的选择值才会被保持在目标DIV中，否则只是鼠标悬停时有值，而鼠标离开后这个值就会消失
			click: function (score, evt) {
				//第一种方式：直接取值
				//alert('你的评分是'+score*m+'分');
				$("#YIXIANG").val(score*m);
			}
		});
	}
	function addFile(){
		var div=document.getElementById("file_div");
		//div.innerHTML=div.innerHTML+"<input type=\"file\" name=\"IMG_PATH\"/>";
		var  aElement=document.createElement("input"); //创建input  
	  	aElement.name="IMG_PATH";  
	  	//aElement.id=inputFileID;  
	  	aElement.type="file";//设置类型为file 
		div.appendChild(aElement);
	}
	function delImg(imgId){
		//var basePath='<%=basePath%>';
		var td_1=document.getElementById('td_1_'+imgId);
		var td_2=document.getElementById('td_2_'+imgId);
		var src=document.getElementById('img_hid_'+imgId).value;
		//alert(src);
		var old_img_path=document.getElementById('OLD_IMG_PATH');
		
		td_1.style.display='none';
		td_2.style.display='none';
		//var src2=src.substr(basePath.length);
		
		//alert(basePath.length);
		//alert(src);
		//alert(old_img_path.value);
		
		//alert(src2);
		//alert(old_img_path.value);
		var startIndex=old_img_path.value.indexOf(src);
		//alert(startIndex);
		var startStr=old_img_path.value.substr(0,startIndex)
		//alert(startStr);
		var endStr=old_img_path.value.substr(startIndex+src.length)
		//alert(endStr);
		
		//alert(old_img_path.value.substr(startIndex,src2.length));
		old_img_path.value=startStr+endStr;
		if(old_img_path.value.indexOf(',,')>=0){
			old_img_path.value=old_img_path.value.substr(1);
		}
		if(old_img_path.value==','){
			old_img_path.value='';
		}
		//alert(old_img_path.value);
		
	}
</script>
	</head>
<body>
	<form action="track/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="ID" id="ID" value="${pd.ID}"/>
		<div id="zhongxin">
		<table>
			<tr>
				<td>
				意向：
					<div id="star"></div>
					<div id="result"></div>
				</td>
			</tr>
			<tr>
				<td>
					<textarea name="REMARK" id="REMARK" placeholder="这里输入备注" title="备注" rows="8" cols="500" >${pd.REMARK}</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<c:if test='${pd.IMG_PATH!=null && pd.IMG_PATH!=""}'>
					<c:set value="${ fn:split(pd.IMG_PATH, ',') }" var="imgPathArray" />
					<table border="0">
						<tr align="center">
							<c:forEach items="${ imgPathArray }" var="imgPath" varStatus="status">
							<td id="td_1_${status.index}">
							<img src='${ imgPath }' width="50px" height="50px" id='img_${status.index}'/> 
							</td>
						</c:forEach>
						</tr>
						<tr align="center">
							<c:forEach items="${ imgPathArray }" var="imgPath" varStatus="status">
							<td id="td_2_${status.index}">
							<input type="hidden"  value="${ imgPath }" id='img_hid_${status.index}'>
							<input type="button" class="btn btn-minier btn-yellow" onclick="delImg('${status.index}')" value="删除">
							</td>
							</c:forEach>
						
						</tr>
					</table>
					</c:if>
					<input type="file" name="IMG_PATH"/>
					<input type="file" name="IMG_PATH"/>
					<input type="file" name="IMG_PATH"/>
					<input type="file" name="IMG_PATH"/>
					<input type="file" name="IMG_PATH"/>
					<br/>
					<input class="btn btn-mini" type="button" value="继续添加" onclick="addFile()">
					<div id="file_div"></div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<input type="hidden" name="YIXIANG" id="YIXIANG" value="<c:choose ><c:when test="${pd.YIXIANG!=null}">${pd.YIXIANG}</c:when><c:otherwise ><%=yixiangInit%></c:otherwise></c:choose>" />
					<input type="hidden" name="STD_ID" value="${pd.STD_ID}"/>
					<input type="hidden" name="OLD_IMG_PATH" id="OLD_IMG_PATH" value="${pd.IMG_PATH}"/>
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
		rat('star','result',1);
		</script>
</body>
</html>