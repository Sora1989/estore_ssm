<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'hello.jsp' starting page</title>
  </head>
  
  <body>
    ${requestScope.msg }<br/>
    ${sessionScope.msg }<br/>
    username:${cookie.username.value }
  </body>
</html>
