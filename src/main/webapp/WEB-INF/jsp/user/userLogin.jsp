<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会员登录</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/member.png" type="image/png"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/user/userLogin.css"/>
</head>
<body>
	<div class="container">
		<div id="header">
			<h1>物流信息网络</h1>
		</div>
		<hr />
		<div id="body">
			<div id="loginbox">
				<form action="${pageContext.request.contextPath }/user/handleLogin" method="post">
					<div class="msg">${msg}</div>
					<div><h3>会员登录</h3></div>
					<div class="log username">
						<img src="${pageContext.request.contextPath }/static/images/user.png"/>
						<input type="text" name="username" placeholder="请输入用户名" value="${cookie.username.value}"/>
					</div>
					<div class="log password">
						<img src="${pageContext.request.contextPath }/static/images/password.png"/>
						<input type="text" name="password" placeholder="请输入密码" value="${cookie.password.value}"/>
					</div>
					<div>
						<input type="checkbox" name="rem" id="rem" value="rem"/><label for="rem">记住密码</label>
					</div>
					<div class="log sub"><input type="submit" value="登录"/></div>
					<div><a href="${pageContext.request.contextPath }/admin/adminLogin" class="left">&lt;&lt;管理员登录</a><a class="right" href="${pageContext.request.contextPath }/user/findPassword">忘记密码&gt;&gt;</a></div>
					<div><a href="${pageContext.request.contextPath }/regist">注册新账号</a></div>
				</form>
			</div>
		</div>
		<div id="footer">
			底部啥也没有
		</div>
	</div>
</body>
</html>