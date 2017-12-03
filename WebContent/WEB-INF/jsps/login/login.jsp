<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsps/public/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>登录</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
 
<link rel="stylesheet" type="text/css"
	href="${ctx}/common/login/login.css" /> 
<!-- 单个css  单个引入 -->
  
<script type="text/javascript">
		function change(){
		var timedata=(new Date()).getTime();
			$("#vCode").attr("src","<c:url value='/VerfyCode' />?"+timedata);
		}
		
		function alertMessage(){
			alert("不支持外部用户注册。");
		}
</script>
</head>

<body>
	<div class="main">
		<div> 
		<div class="login1">
				<div class="login2">
					<div class="loginTopDiv">
						<span class="loginTop">用户账号登录</span> <span>
						</span>
					</div>
					<div>
						<form target="_top" action="<c:url value='/submit'/>"
							method="post" id="loginForm">
							<table>
								<tr>
									<td width="50"></td>
									<td><label class="error" id="msg">${msg }</label>
									</td>
								</tr>
								<tr>
									<td width="50">用户名</td>
									<td><input class="input" type="text" name="loginname"
										id="loginname" />
									</td>
								</tr>
								<tr>
									<td height="20">&nbsp;</td>
									<td><label id="loginnameError" class="error"></label>
									</td>
								</tr>
								<tr>
									<td>密 码</td>
									<td><input class="input" type="password" name="loginpass"
										id="loginpass" value="${user.loginpass }" />
									</td>
								</tr>
								<tr>
									<td height="20">&nbsp;</td>
									<td><label id="loginpassError" class="error"></label>
									</td>
								</tr>
								<tr>
									<td>验证码</td>
									<td>
									<input class="input yzm" type="text" name="verifyCode"
										id="verifyCode" value="${user.verifyCode }"  maxlength="4"/> <img id="vCode"
										src="<c:url value='/VerfyCode'/>"  onclick="change()"/> 
										<a  href="javascript:change()">换一张</a></td>
								</tr>
								<tr>
									<td height="20px">&nbsp;</td>
									<td><label id="verifyCodeError" class="error"></label>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td align="left"><input type="image" id="submit"
										src="<c:url value='/images/an_06.gif'/>" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<a href='###' onclick="alertMessage();"><img alt="注册" src="<c:url value='/images/dl_08.gif'/>">
										</a>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>
