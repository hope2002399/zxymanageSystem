<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsps/public/taglib.jsp" %>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息管理系统</title>
</head>
<body>
<table>
	<tr>
		<td colspan="1" >
			<marquee scrollamount="1" scrolldelay="60"  direction="up" onmouseover="this.stop();" onmouseout="this.start();" >
					   <p>
					   	 <strong><span id="test">欢迎光临</span></strong>
					   </p> 
			</marquee>
			  
		</td>
	</tr>
	<tr>
		<td>
			<a href="${ctx }/login">去首页</a>
		</td>
		<td>
			<a href="${ctx }/login">去登陆</a>
		</td>
	</tr>
</table>
</body>
</html>