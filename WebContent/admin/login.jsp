<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<body>
	<s:property value="#session.error" />
	<s:form method="POST" action="login.action">
		用户名：<s:textfield name="user.username" />
		<br>
		密码：<s:password name="user.password" />
		<br>
		<s:submit value="登录" />
		<s:reset value="重置" />
	</s:form>
</body>
</html>