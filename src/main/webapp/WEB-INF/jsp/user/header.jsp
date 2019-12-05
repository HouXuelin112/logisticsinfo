<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	if(request.getSession().getAttribute("user") == null){
		response.sendRedirect("userLogin");
	}
%>
		<style type="text/css">
			body{
				margin: 0;
				padding: 0;
			}
			#nav li img{
				width: 50px;
				height: 49px;
				vertical-align: middle;
			}
			#nav ul{
				width: 100%;
				height: 50px;
				margin: 0;
				padding: 0;
				list-style: none;
				border-bottom: 1px dashed grey;
			}
			#nav ul li{
				display: inline-block;
				margin-right: 10px;
			}
			.nav{
				margin-right: 20px;
			}
			#nav ul li a{
				padding: 13px;
				text-align: center;
				text-decoration: none;
				font-family: "microsoft yahei";
				font-size: 18px;
				font-weight: bold;
				color: #000000;
			}
			#out{
				float: right;
			}
			#out a{
				height: 30px;
				text-decoration: none;
				border: none;
			}
			#nav a img{
				width: 40px;
				height: 39px;
				vertical-align: middle;
			}

		</style>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/sui.min.css" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/sui-append.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/sui.min.js"></script>
		<div id="nav">
			<ul>
				<li><img src="${pageContext.request.contextPath}/static/images/logistics.png" ></li>
				<li><a class="nav" href="${pageContext.request.contextPath }/user/main">物流动态</a></li>
				<li><a class="nav" href="${pageContext.request.contextPath }/user/car_info">车辆信息</a></li>
				<li><a class="nav" href="${pageContext.request.contextPath }/user/goods_info">货物信息</a></li>
				<li><a class="nav" href="${pageContext.request.contextPath }/user/enterprise_info">企业信息</a></li>
				<li  id="out">
					<a>
						欢迎您&nbsp;${sessionScope.user.name}
						<img src="${pageContext.request.contextPath}/static/images/setting.png"/>
						<a href="${pageContext.request.contextPath}/user/logout">退出登陆</a>
					</a>
				</li>
			</ul>
			<div class="dialog">

			</div>
		</div>
		<script type="text/javascript">
			var a = document.getElementsByClassName("nav");
			for (var i = 0; i < a.length; i++) {
				a[i].onmouseover = function(){
					this.style = "border-bottom: 5px solid red;";
				}
				a[i].onmouseleave = function(){
					this.style = "border-bottom: 0px solid red;";
				}
			}
		</script>