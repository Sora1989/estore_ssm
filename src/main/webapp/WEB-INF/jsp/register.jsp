<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<%@include file="inc/common_head.jsp"%>
<script type="text/javascript">
//获取XMLHttpRequest对象
function getXMLHttpRequest() {
	var xmlhttp;
	// code for IE7+, Firefox, Chrome, Opera, Safari
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	// code for IE6, IE5
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	return xmlhttp;
}

// 定义一个变量，用来表示当前用户名是否存在
var cunzai = true;
function checkName(val) {
	// 判断是否有值
	if (val) {
		// 1. 获取XMLHttpRequest对象
		var xmlhttp = getXMLHttpRequest();
		// 2. 监听服务器返回状态
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				// 获取后台返回的结果
				var result = xmlhttp.responseText;
				// 根据结果进行相应的处理
				// 假设服务器返回0：不存在  其他情况：存在
				var notice = document.getElementById("username_notice");
				if ("0" == result) {
					notice.innerHTML = "<font color=green> 可用</font>";
					cunzai = false;
				}
				else {
					notice.innerHTML = " 用户名已被注册，请使用其他用户名！";
					cunzai = true;
				}
			}
		}
		// 3. 打开连接
		xmlhttp.open("POST", "${root}/servlet?op=checkName", true);
		// 使用表单的方式 POST 数据
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		// 4. 发送请求
		xmlhttp.send("username=" + val);
	}
}
</script>
</head>
<body>
	<%@include file="inc/header.jsp"%>
	<div class="block block1">
		<div class="blank"></div>
		<div class="usBox">
			<div class="usBox_1">
				<div class="login_tab">
					<ul>
						<li onclick="location.href='login.jsp';">
							<a href="${pageContext.request.contextPath}/page/toLogin">用户登录</a>
						</li>
						<li class="active">用户注册</li>
					</ul>
				</div>
				
				<!--
					完善form表单：
					action: 提交的服务器地址
					method: post
					表单元素的name属性：添加name属性，值必须和对应的字段名一致，包括大小写！！
				-->
				<form id="myform" action="${root}/user/register" method="post" name="formUser"
					onsubmit="return ( register() );">
					<font color=red>${msg }</font>
					<table width="100%" border="0" align="left" cellpadding="5"
						cellspacing="3">
						<tr>
							<td width="25%" align="right">用户名</td>
							<td width="65%"><input name="username" type="text"
								id="username" onblur="is_registered(this.value);checkName(value);"
								class="inputBg" /> <span id="username_notice"
								style="color:#FF0000"> *</span></td>
						</tr>
						<tr>
							<td align="right">昵称</td>
							<td><input name="nickname" type="text"
								id="nickname" onblur="check_nickname(this.value);"
								class="inputBg" /> <span id="nickname_notice"
								style="color:#FF0000"> *</span></td>
						</tr>
						<tr>
							<td align="right">密码</td>
							<td><input name="password" type="password" id="password1"
								onblur="check_password(this.value);"
								onkeyup="checkIntensity(this.value)" class="inputBg" />
								<span style="color:#FF0000"
								id="password_notice"> *</span></td>
						</tr>
						<tr>
							<td align="right">密码强度</td>
							<td>
								<table width="145" border="0" cellspacing="0" cellpadding="1">
									<tr align="center">
										<td width="33%" style="border-bottom:2px solid #ccc;" id="pwd_lower">弱</td>
										<td width="33%" style="border-bottom:2px solid #ccc;" id="pwd_middle">中</td>
										<td width="33%" style="border-bottom:2px solid #ccc;" id="pwd_high">强</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="right">确认密码</td>
							<td><input name="confirm_password" type="password" 
								id="conform_password"
								onblur="check_conform_password(this.value);" class="inputBg" />
								<span style="color:#FF0000"
								id="conform_password_notice"> *</span></td>
						</tr>
						<tr>
							<td align="right">验证码</td>
							<td><input type="text" size="8" name="code" id="captcha"
								class="inputBg" onblur="check_captcha(this.value);" /> <span style="color:#FF0000"
								id="captcha_notice"> *</span></td>
						</tr>
						<tr>
							<td align="right"></td>
							<td><img src="${root}/page/validatecode"
								style="vertical-align:middle;cursor:pointer;width:130px;height:35px;margin-top:-2px;"
								onClick="src='${root}/page/validatecode?'+Math.random()" /></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><label> <input name="agreement" type="checkbox"
									value="1" checked="checked" /> 我已看过并接受《<a
									href="javascript:;" style="color:blue" target="_blank">用户协议</a>》
							</label></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td align="left">
								<input id="submit-button" name="Submit" type="submit" value="" class="us_Submit_reg">
							</td>
						</tr>
						<tr>
							<td colspan="2">&nbsp;</td>
						</tr>
					</table>
				</form>
				<div class="blank"></div>
			</div>
		</div>
	</div>
	<%@include file="inc/footer.jsp"%>

<script type="text/javascript">
	$("#submit-button").click(function () {
		var data = $("#myform").serializeArray();//自动将form表单封装成json
//		$.ajax({
//			 type: "Post", //访问WebService使用Post方式请求
//			 contentType: "application/json", //WebService 会返回Json类型
//			 url: "/user/register", //调用WebService的地址和方法名称组合 ---- WsURL/方法名
//			 data: data, //这里是要传递的参数，格式为 data: "{paraName:paraValue}",下面将会看到
//			 dataType: 'json',
//			 success: function (result) { //回调函数，result，返回值
//			 	alert(result);
//			 }
//		});

        $.post("/user/register", data, RateArticleSuccess, "json");

        function RateArticleSuccess(result) {
            alert(result);
        }
    });



</script>
</body>
</html>