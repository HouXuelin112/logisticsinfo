<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/9
  Time: 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>找回密码</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/user/findPassword.css">
</head>
<body>
<%@include file="../sui_tools.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/user/findPassword.js"></script>
<div class="container">
    <div class="title">
        <div class="sui-steps-round">
            <div class="current">
                <div class="wrap">
                    <div class="round">1</div>
                    <div class="bar"></div>
                </div>
                <label>找回密码</label>
            </div>
            <div class="todo">
                <div class="wrap">
                    <div class="round">2</div>
                    <div class="bar"></div>
                </div>
                <label>重置密码</label>
            </div>
            <div class="todo last">
                <div class="wrap">
                    <div class="round">3</div>
                </div>
                <label>修改完成</label>
            </div>
        </div>
    </div>
    <div class="body">
        <div class="question">
           问题： ${question}
        </div>
        <div class="result">
            <label for="result">输入答案：</label><input type="text" name="result" id="result" />
        </div>
    </div>
    <div class="footer">
        <button class="next next1">下一步</button>
        <button class="next next2">下一步</button>
        <button class="next next3">去登陆</button>
    </div>
</div>

</body>
</html>
