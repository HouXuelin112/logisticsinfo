<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/1
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="d" uri="/dateConvert" %>
<html>
<head>
    <title>物流动态</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/main.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/user/maini.js"></script>
</head>
<body>
<div class="container">
    <%@include file="header.jsp"%>
    <div class="detail">
        <div class="close"><img src="${pageContext.request.contextPath}/static/images/Transaction_detail.png">物流详情<img class="img1" src="${pageContext.request.contextPath}/static/images/close.png" alt="关闭"></div>
        <div class="detail_container">
            <div class="detail_title">
                标题
            </div>
            <div id="detail_body">
                <div class="detail_time">2019-10-16 22:43:32</div>
                <div class="detail_name">侯雪林</div>
            </div>
            <div class="detail_content">
                内容dd哒哒哒哒哒哒多多多多多多多多多多多多多多多多多dddddddddd sss
            </div>
        </div>
    </div>
    <div class="content">
        <div class="select">
            <form>
                <label for="logistics_title"> 物流标题 </label>
                <input type="text" name="logistics_title" id="logistics_title" class="input" data-toggle="autocomplete" data-lookup="[
                <c:forEach var="val" items="${logisticsInfos}"><%--为输入框提供自动补全--%>
                &quot;${val.title}&quot;
                </c:forEach>
                ]">
                <label for="time">发布时间</label>
                <input type="text" id="time" class="input" name="time">
                <label for="issueAdmin">发布人</label>
                <select name="issueAdmin" id="issueAdmin" class="input">
                    <c:forEach items="${admins}" var="admin">
                        <option>${admin.name}</option>
                    </c:forEach>
                </select>
                <input type="button" value="查询" data-placement="bottom" data-toggle="tooltip" title="根据相应信息查询并显示物流信息" id="submit" class="sub"/>
                <div class="sub" data-placement="bottom" data-toggle="tooltip" title="查询并显示全部物流信息">全部</div>
            </form>
        </div>
        <div class="progress sui-loading loading-inline"><i class="sui-icon icon-pc-loading"></i></div>
        <div id="error" class="sui-msg msg-large msg-error">
            <div class="msg-con">错误信息提示</div>
            <s class="msg-icon"></s>
        </div>
        <div class="userlist">
            <table>
                <caption>物流信息表</caption>
                <tr><th width="10%">序号</th><th width="20%">标题</th><th width="30%">发布时间</th><th width="20%">发布人</th><th width="20%">操作</th></tr>
                <c:forEach var="logisticsInfo" items="${logisticsInfos}" varStatus="status">
                    <tr><td>${status.count}</td><td>${logisticsInfo.title}</td><td>${logisticsInfo.issueDate}</td><td>${logisticsInfo.admin.name}</td><td><button type="button" data-placement="left" data-toggle="tooltip" title="查看第${status.count}条物流信息详情">详情</button></td></tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</body>
</html>
