<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/1
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>车辆信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/car_info.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
<style>
</style>
</head>
<body>
<div class="container">
<%@include file="header.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/user/car_info.js"></script>
    <div class="select">
        <form name="selectForm">
            <label for="tradeMark"> 车牌号 </label>
            <input type="text" name="tradeMark" id="tradeMark" class="input" data-toggle="autocomplete" data-lookup="[
                &quot;${cars[0].tradeMark}&quot;
                <c:forEach var="val" items="${cars}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.tradeMark}&quot;
                </c:forEach>
                ]">
            <label for="brand">车辆品牌</label>
            <input type="text" id="brand" class="input" name="brand" data-toggle="autocomplete" data-lookup="[
                &quot;${cars[0].brand}&quot;
                <c:forEach var="val" items="${cars}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.brand}&quot;
                </c:forEach>
                ]">
            <label for="style">车辆类型</label>
            <input type="text" name="style" id="style" class="input" data-toggle="autocomplete" data-lookup="[
                &quot;${cars[0].style}&quot;
                <c:forEach var="val" items="${cars}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.style}&quot;
                </c:forEach>
                ]">
            <label for="carLoad">车辆载重</label>
            <input type="text" name="carLoad" id="carLoad" class="input" data-toggle="autocomplete" data-lookup="[
                 &quot;${cars[0].carLoad}&quot;
                <c:forEach var="val" items="${cars}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.carLoad}&quot;
                </c:forEach>
                ]">
            <label for="transportStyle">运输类型</label>
            <input type="text" name="transportStyle" id="transportStyle" class="input" data-toggle="autocomplete" data-lookup="[
                &quot;${cars[0].transportStyle}&quot;
                <c:forEach var="val" items="${cars}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.transportStyle}&quot;
                </c:forEach>
                ]">
            <input type="button" value="查询" data-placement="bottom" data-toggle="tooltip" title="根据相应信息查询并显示车辆信息" id="submit" class="sub"/>
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
    <div class="carInfo">
    <%@include file="../carInfo_list.jsp"%>
    </div>
</div>
</body>
</html>
