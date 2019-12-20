<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/1
  Time: 21:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
    <title>企业信息</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/enterprise_info.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div class="container">
    <%@include file="header.jsp"%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/user/enterprise_info.js"></script>
    <div class="select">
        <form name="selectForm">
            <label for="enterpriseName"> 公司名称 </label>
            <input type="text" name="enterpriseName" id="enterpriseName" class="input" data-toggle="autocomplete" data-lookup="[
                &quot;${enterpriseInfos[0].enterpriseName}&quot;
                <c:forEach var="val" items="${enterpriseInfos}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.enterpriseName}&quot;
                </c:forEach>
                ]">
            <label for="enterpriseSort"> 公司类别 </label>
            <input type="text" name="enterpriseSort" id="enterpriseSort" class="input" data-toggle="autocomplete" data-lookup="[
                &quot;${enterpriseInfos[0].enterpriseSort}&quot;
                <c:forEach var="val" items="${enterpriseInfos}" begin="1"><%--为输入框提供自动补全--%>
                ,&quot;${val.enterpriseSort}&quot;
                </c:forEach>
                ]">
            <label for="issueUser">发布人</label>
            <select name="issueUser" id="issueUser" class="input">
                <option value="0">--请选择--</option>
                <c:forEach items="${users}" var="user">
                    <option value="${user.id}">${user.name}</option>
                </c:forEach>
            </select>
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
    <div class="enterpriseInfo">
        <%@include file="../enterpriseInfo_list.jsp"%>
    </div>
</div>

</body>
</html>
