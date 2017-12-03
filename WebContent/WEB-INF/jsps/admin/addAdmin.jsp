<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsps/public/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>新增管理员</title>

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
 
 function saveAdmin(){
	var len =  $("#loginName").val().length;
 	if(len<3||len >20 ){
 		 alert("长度请在3-20之间");
 		 return ;
 	}
	 var options = {
				beforeSubmit : function(){
					$("#save").attr("disabled",true);
					 
				}, // 表单提交前的回调函数
				success : function(msg) {  
					parent.location.reload();
					 parent.tb_remove();
				}, 
				error : function(){
					 parent.tb_remove();
					 parent.location.reload();
				},
				url: "${ctx}/addAdmin"
			};
		$("#formId").ajaxSubmit(options); 
  } 
 </script>
</head>

<body> 
<form action="" method="post" id="formId">
	  <table style="border-style:solid solid solid solid;"id="tableId" width="98%">
	  <tr> 
		      <td colspan="4"> 添加信息</td>
	  </tr>
	  	<tr>
	  		<td>姓名：</td>
	  		<td><input name="zhName" type="text"   ></td> 
	  		<td>登录名：</td>
	  		<td><input type="text" name="loginName" id="loginName" ></td>  
	  	</tr> 
	  	<tr>
	  		<td>Email：</td> 
	  		<td colspan="3"><input name="email" type="text" value=""></td> 
	  	</tr>
	     <tr>
	     	<td colspan="2"><a href="###"  onclick="saveAdmin()" id="save">保存</a></td>
	     	<td colspan="2"><a href="###" onclick="parent.tb_remove();">取消</a></td>
	     </tr> 
	  </table>
</form>
	  
 </body>
</html>
