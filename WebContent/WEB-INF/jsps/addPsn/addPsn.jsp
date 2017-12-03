<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsps/public/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>新增</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
 <link rel="stylesheet" type="text/css"
	href="${ctx}/images/thickbox/thickbox.css" /> 
 <style type="text/css">
#resId tr td {
 
 </style>
 <script type="text/javascript">
 $(function(){
	 $("#tableId tr:gt(0):even").css("background" , "#fff");	 
	  $("#tableId tr:gt(0):odd").css("background" , "#f5faff");	 
 }); 
 
 function savePsn(){
	 var options = {
				beforeSubmit : function() {
					$("#save").attr("disabled",true);
					 
				}, // 表单提交前的回调函数
				success : function(msg) { 
					 
				parent.location.reload();
				 parent.tb_remove(); 
				}, 
				error : function() {
					 parent.tb_remove();
					 parent.location.reload();
				},
				url: "${ctx}/updatePsn"
			};
		$("#formId").ajaxSubmit(options); 
  } 
 </script>
</head>

<body> 
<form action="" method="post" id="formId">
	  <table style="border-style:solid solid solid solid;"id="tableId" width="98%">
	  <tr>
		  <c:if test="${ empty flag }"> 
		      <td colspan="4"> 添加信息</td>
		  </c:if>
 	    <c:if test="${  not empty flag }"> 
		      <td colspan="4"> 修改信息</td>
		  </c:if> 
	  </tr>
	  	<tr>
	  		<td>姓名：</td>
	  		<td><input name="zhName" type="text" value="${person.zh_name }" ></td> 
	  		<td>出生日期：</td>
	  		<td><input type="date" name="birthday" value="${person.birthDay }"></td>  
	  	</tr>
	  	<tr>
	  		<td>电话：</td>
	  		<td><input name="tel" type="text" value="${person.tel }"></td> 
	  		<td>手机：</td>
	  		<td><input name="phone" type="text" value="${person.phone }"></td> 
	  	</tr>
	  	<tr>
	  		<td>职位：<input type="hidden" name="flag" value="${flag }"/><input name="psnCode"  type="hidden" value = "${person.psn_code }" /></td><!-- 用来标示  修改还是 新增 -->
	  		<td colspan="3"><input name="position" type="text" value="${person.position}"></td> 
	  	 
	  	</tr>
	  	
	     <tr>
	     	<td colspan="2"><a href="###"  onclick="savePsn()" id="save">保存</a></td>
	     	<td colspan="2"><a href="###" onclick="parent.tb_remove();">取消</a></td>
	     </tr> 
	  </table>
</form>
	  
 </body>
</html>
