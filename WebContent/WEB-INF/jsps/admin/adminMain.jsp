<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsps/public/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>管理员页面</title>

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
 
 
 function addAdmin(){
	 tb_show("添加管理员","${ctx}/showAddMessage?TB_iframe=true&height=260&width=600", false);	
 }
 function updateAdmin(userId,status){
		$.ajax({
			url :   "${ctx}/updateAdminData",
			async : false,
			data : {
				userId : userId ,
				status : status
			},
			dataType : "text",
			type : "post",
				success : function(msg) {
				  if(msg==1){
					  alert("更新成功");
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
		<font size="10">超级管理员，欢迎您：<span style="color:#FA8072">  ${sessionUser.zh_name }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><a href="${ctx}/login">退出登录</a>
	</div>
	 
   <div style="margin-top: 35px"> 
	  <table style="border-style:solid solid solid solid; width: 100%" id="resId">
	  	<tr style="background-color: #87CEEB">
	  		<th>用户ID</th>
	  		<th>用户姓名</th>
	  		<th>登录名</th>
 	  		<th>邮箱</th>
	  		<th>是否可用</th>
	  		<th>操作</th>
	  	</tr>
	  	<tr style="height: 39px">
	  		<td colspan="6" align="left" style="background-color:#00EEEE"><a href="###" onclick="addAdmin()" style="background-color:#00E5E;font-size:31px">   添加    </a></td>
	  	</tr>
	  	<c:forEach items="${res }" var="res">
	  	<tr>
	  		<td>${res.id }</td>
	  		<td>${res.zh_name }</td>
	  		<td>${res.loginname }</td>
	  		<td>${res.email }</td>
	  		<td><c:if test="${res.status  eq 1}">正常</c:if><c:if test="${res.status  eq 0}">禁用</c:if></td>
 	  		<td><c:if test="${res.status  eq 1}"><a href="#" onclick="updateAdmin('${res.id }','0')">禁用</a></c:if>&nbsp;&nbsp;<c:if test="${res.status  eq 0}"><a href="#" onclick="updateAdmin('${res.id }','1')">启用</a></c:if>&nbsp;&nbsp;<a href="#" onclick="updateAdmin('${res.id }','-1')">删除</a></td>
	  	</tr> 
	  	</c:forEach> 
	  </table> 
  </div>
</div>  
 </body>
</html>
