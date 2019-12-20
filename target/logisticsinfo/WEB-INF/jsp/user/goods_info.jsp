<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/1
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <title>货物信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/goods_info.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="container">
<%@include file="header.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/user/goods_info.js"></script>
    <div class="select">
        <form name="selectForm">
            <label for="goodsStyle"> 货物类型 </label>
            <input type="text" name="goodsStyle" id="goodsStyle" class="input" data-toggle="autocomplete" data-lookup="[
                &quot;${goods[0].goodsStyle}&quot;
                <c:forEach var="val" items="${goods}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.goodsStyle}&quot;
                </c:forEach>
                ]">
            <label for="goodsName">货物名称</label>
            <input type="text" id="goodsName" class="input" name="goodsName" data-toggle="autocomplete" data-lookup="[
                &quot;${goods[0].goodsName}&quot;
                <c:forEach var="val" items="${goods}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.goodsName}&quot;
                </c:forEach>
                ]">
            <input type="button" value="查询" data-placement="bottom" data-toggle="tooltip" title="根据相应信息查询并显示货物信息" id="submit" class="sub"/>
        </form>
    </div>
    <div class="sui-navbar">
        <div class="navbar-inner"><a href="#" class="sui-brand"></a>
            <ul class="sui-nav">
                <li class="active carInfo_all"><a href="#">全部</a></li>
                <li class="carInfo_mine"><a href="#">我发布的</a></li>
                <li class="carInfo_add"><a href="#">添加</a></li>
            </ul>
        </div>
    </div>
    <div class="goodsInfo">
        <%@include file="../goodsInfo_list.jsp"%>
    </div>
</div>
</body>
</html>
