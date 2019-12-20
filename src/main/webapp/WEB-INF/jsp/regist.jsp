<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<link href="${pageContext.request.contextPath }/static/css/sui.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/static/css/sui-append.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/regist.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/sui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/js/regist.js"></script>
<div class="registbox">
    <div class="regist_title">
        <h3></h3>
    </div>
    <div class="regist_body">
        <form method="post" name="regist_form" action="${pageContext.request.contextPath}/">
            <div class="realname">
                <label for="name">真实姓名：</label>
                <input type="text" id="name" name="name" required="required"/>
            </div>
            <div class="username">
                <label for="username">登录名：</label>
                <input type="text" id="username" name="username" required />
            </div>
            <div class="password">
                <label for="password">密码：</label>
                <input type="password" id="password" name="password" required/>
            </div>
            <div class="ensure">
                <label for="ensure">确认密码：</label>
                <input type="password" id="ensure" name="ensure" required/>
            </div>
            <div class="phone">
                <label for="phone">电话：</label>
                <input type="text" id="phone" name="phone" required/>
            </div>
            <div class="email">
                <label for="email">邮箱：</label>
                <input type="text" id="email" name="email" required/>
            </div>
            <div class="gender">
                性别：
                <input type="radio" name="gender" id="male" checked="checked" value="男"/>
                <label for="male">男</label>
                <input type="radio" id="female" name="gender" value="女"/>
                <label for="female">女</label>
            </div>
            <div class="question">
                <label for="question">找回密码：</label>
                <input type="text" id="question" name="question" required />
            </div>
            <div class="result">
                <label for="result">答案：</label>
                <input type="text" id="result" name="result" required />
            </div>
            <div class="issueDate">
                <label for="issueDate">注册日期：</label>
                <input type="text" id="issueDate" name="issueDate" readonly/>
            </div>
            <div class="sub">
                <input type="button" value="注册" class="submit"/>
                <input type="button" value="重置" class="reset"/>
            </div>
        </form>
    </div>
</div>

<!-- Modal-->
<div id="myModal" tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
                <h4 id="myModalLabel" class="modal-title">身份选择</h4>
            </div>
            <div class="modal-body">
                请选择注册的身份：<br/>
                <div>
                    <input type="radio" class="admin" name="identity" disabled id="d_admin"/><label for="d_admin">管理员</label>
                </div>
                <div>
                    <input type="radio" class="user" checked="checked" name="identity" id="d_user"/><label for="d_user">普通会员</label>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" data-ok="modal" class="sui-btn btn-primary btn-large">确定</button>
                <button type="button" data-dismiss="modal" class="sui-btn btn-default btn-large">取消</button>
            </div>
        </div>
    </div>
</div>
<div class="cancel">操作取消</div>
<div class="tip">
    单击鼠标左键取消注册
</div>
