<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<%@include file="inc/common_head.jsp"%>
</head>
<body>
	<%@include file="inc/header.jsp"%>
	<div class="block block1">
		<div class="blank"></div>
		<div class="usBox clearfix">
			<div class="usBox_1">
				<div class="login_tab">
					<ul>
						<li class="active">用户登录</li>
						<li onclick="location.href='register.jsp';">
							<a href="${pageContext.request.contextPath}/page/register">用户注册</a>
						</li>
					</ul>
				</div>
				
				<!--
					完善表单：
					1. action
					2. method
					3. 表单元素的name属性
				-->
				<form name="formLogin" action="${root}/user/toLogin" method="post"
					onSubmit="return userLogin()">
					<font color=red>${ msg }</font>
					<table width="100%" border="0" align="left" cellpadding="3"
						cellspacing="5">
						<tr>
							<td width="25%" align="right">用户名</td>
							<td width="65%"><input id="username" name="username" type="text" size="25"
								class="inputBg" /></td>
							<script>
								document.getElementById("username").value = decodeURI("${ cookie.username.value }")
							</script>
						</tr>
						<tr>
							<td align="right">密码</td>
							<td><input name="password" type="password" size="15"
								class="inputBg" /></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="checkbox" ${cookie.username.value == null ? '' : "checked"} value="1" name="remember"
								id="remember" /><label for="remember">记住用户名</label></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="left">
								<input type="submit" name="submit" value="" class="us_Submit" />
							</td>
						</tr>
					</table>
				</form>
				<div class="blank"></div>
			</div>
		</div>
		<%@include file="inc/footer.jsp"%>
</body>
</html>