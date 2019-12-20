<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理员登录</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/admin.png" type="image/png"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/admin/adminLogin.css"/>
</head>
<body>
<%@include file="../regist.jsp"%>
	<div class="container">
		<div id="header">
			<h1>物流信息网络</h1>
		</div>
		<hr />
		<div id="body">
			<div id="loginbox">
				<form action="${pageContext.request.contextPath }/admin/handleLogin" method="post">
					<div><h3>管理员登录</h3></div>
					<div class="log username">
						<img src="${pageContext.request.contextPath }/static/images/admin.png"/>
						<input type="text" name="username" placeholder="请输入用户名"/> 
					</div>
					<div class="log password">
						<img src="${pageContext.request.contextPath }/static/images/password.png"/>
						<input type="text" name="password" placeholder="请输入密码"/> 
					</div>
					<div>
						<input type="checkbox" name="rem" id="rem"/><label for="rem">记住密码</label>
					</div>
					<div class="log sub"><input type="submit" value="登录"/></div>
					<div><a class="left" href="${pageContext.request.contextPath }/user/userLogin">&lt;&lt;会员登录</a><a class="right" href="${pageContext.request.contextPath }/admin/findPassword">忘记密码&gt;&gt;</a></div>
					<div><a data-toggle="modal" data-target="#myModal">注册新账号</a></div>
				</form>
			</div>
		</div>
		<div id="footer">
			底部啥也没有
		</div>
	</div>
</body>
</html>