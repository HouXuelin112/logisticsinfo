<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会员登录</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/static/images/member.png" type="image/png"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/css/user/userLogin.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/sui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/sui-append.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/sui.min.js"></script>
</head>
<body>
	<%@include file="../regist.jsp"%>
	<div class="container">
		<div id="header">
			<h1>物流信息网络</h1>
		</div>
		<hr />
		<div id="body">
			<div id="myCarousel2" class="sui-carousel slide">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel2" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel2" data-slide-to="1"></li>
					<li data-target="#myCarousel2" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="active item"><img src="${pageContext.request.contextPath }/static/images/mountain.JPG">
						<div class="carousel-caption">
							<h4>白龙坡</h4>
							<p>这是乱编的</p>
						</div>
					</div>
					<div class="item"><img src="${pageContext.request.contextPath }/static/images/zjut.jpg">
						<div class="carousel-caption">
							<h4>title</h4>
							<p>content</p>
						</div>
					</div>
					<div class="item"><img src="${pageContext.request.contextPath }/static/images/lib.JPG">
						<div class="carousel-caption">
							<h4>title</h4>
							<p>content</p>
						</div>
					</div>
				</div><a href="#myCarousel2" data-slide="prev" class="carousel-control left">‹</a><a href="#myCarousel2" data-slide="next" class="carousel-control right">›</a>
			</div>
			<div id="loginbox">
				<form action="${pageContext.request.contextPath }/user/handleLogin" method="post" name="form">
					<div class="msg">${msg}</div>
					<div><h3>会员登录</h3></div>
					<div class="log username">
						<img src="${pageContext.request.contextPath }/static/images/user.png"/>
						<input type="text" id="username" name="username" placeholder="请输入用户名" value="${cookie.username.value}"/>
					</div>
					<div class="log password">
						<img src="${pageContext.request.contextPath }/static/images/password.png"/>
						<input type="password" name="password" placeholder="请输入密码" value="${cookie.password.value}"/>
					</div>
					<div>
						<input type="checkbox" name="rem" id="rem" value="rem"
						<c:if test="${not empty cookie.rem.value}">checked</c:if>
						/><label for="rem">记住密码</label>
					</div>
					<div class="log sub"><input type="submit" value="登录"/></div>
					<div class="login_sub"><a href="${pageContext.request.contextPath }/admin/adminLogin" class="left">&lt;&lt;管理员登录</a><a class="right" >忘记密码&gt;&gt;</a></div>
					<script>
						$(".login_sub .right").on("click", function () {
							console.log("ddd");
							if($(".log #username").val().trim() === ""){
								alert("请先输入用户名");
							}else{
								form.action = "${pageContext.request.contextPath }/user/findPassword";
								form.submit();
							}
						});
					</script>
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