<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsps/public/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>数据页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
 <style type="text/css">
#resId tr td {
 text-align: center;
 
 }
 </style>
 <link rel="stylesheet" type="text/css"
	href="${ctx}/images/thickbox/thickbox.css" /> 
 <script type="text/javascript">
 $(function(){
	 $("#resId tr:gt(0):even").css("background" , "#fff");	 
	  $("#resId tr:gt(0):odd").css("background" , "#f5faff");	 	 
 }) ;
 
 
 function addPsn(){
	 tb_show("添加页面","${ctx}/showIndex?TB_iframe=true&height=260&width=600", false);	
 }
 
 function updatePsn(psnCode){
	 tb_show("修改数据","${ctx}/getDateForUpdate?psnCode="+psnCode+"&TB_iframe=true&height=260&width=600", false);	
 }
 function deletePsn(psnCode){
		$.ajax({
			url :   "${ctx}/deletePsn",
			async : false,
			data : {
				psnCode : psnCode 
			},
			dataType : "text",
			type : "post",
				success : function(msg) {
				  if(msg==1){
					  alert("删除成功");
				  }else{
					  alert("失败");
				  }
				  location.reload();
				},
				error : function() {
				 alert("失败");
				 location.reload();
				}
		});
	 
 }
 </script>
</head>

<body> 
<div align="center">
	<div style="height: 30px"> 
		<font size="10">欢迎来到数据管理系统，欢迎您：<span style="color:#FA8072">  ${sessionUser.zh_name }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><a href="${ctx}/login">退出登录</a>
	</div>
	<!-- 超级管理员 -->
	<c:if test="${sessionUser.id eq 0  }">
	<div style="margin-top: 48px;">
		<a href="${ctx }/getAdminManage" target="_blank">添加普通管理员</a>
	</div>	
	</c:if>
   <div style="margin-top: 35px">

	  <table style="border-style:solid solid solid solid; width: 100%" id="resId">
	  	<tr style="background-color: #87CEEB">
	  		<th>姓名</th>
	  		<th>出生日期</th>
	  		<th>电话</th>
	  		<th>手机</th>
	  		<th>所属管理员</th>
	  		<th>操作</th>
	  	</tr>
	  	<tr>
	  		<td colspan="6" align="left" style="background-color: #EE799F"><a href="###" onclick="addPsn()" style="background-color:#EE6AA7;font-size:31px">   添加    </a></td>
	  	</tr>
	  	<c:forEach items="${reults }" var="reult">
	  	<tr style="height: 39px">
	  		<td>${reult.zh_name }</td>
	  		<td>${reult.birthday }</td>
	  		<td>${reult.tel }</td>
	  		<td>${reult.phone }</td>
 	  		<td>${reult.adminName }</td>
	  		<td><a href="#" onclick="updatePsn('${reult.psn_code }')">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" onclick="deletePsn('${reult.psn_code }')">删除</a></td>
	  	</tr>
	  	
	  	</c:forEach> 
	  </table> 
  </div>
</div>  
 </body>
</html>
