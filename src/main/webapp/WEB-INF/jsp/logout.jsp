<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//销毁session
	session.invalidate();
	//跳转到首页
	response.sendRedirect(request.getContextPath() + "/user/login");
%>
