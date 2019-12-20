<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/11
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="d" uri="/dateConvert" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    .add_enterpriseInfo{
        width: 500px;
        padding: 10px;
         margin: 0 auto;
        border: 1px solid gray;
    }

    .add_enterpriseInfo div{
        width: 80%;
        text-align: right;
        line-height: 30px;
        font-size: 16px;
        font-family: "microsoft yahei";
        color: #808080;
        margin-top: 10px;
    }
    .add_enterpriseInfo .add_title{
        width: 100%;
        text-align: center;
        color: #000000;
    }
    .add_enterpriseInfo form input, .add_enterpriseInfo form select{
        border: 1px solid #87CEEB;
        width: 200px;
        height: 25px;
        border-radius: 5px;
    }

    .add_enterpriseInfo .add_submit input{
        width: 80px;
        height: 30px;
        margin-right: 30px;
        background-color: deepskyblue;
        color: white;
    }

    .add_enterpriseInfo textarea{
        width: 200px;
        height: 100px;
        max-width: 300px;
        border: 1px solid #87CEEB;
    }
    .add_tip{
        width: 100%;
        height: 30px;
        line-height: 30px;
        text-align: center;
        color: red;
        font-size: 14px;
        display: none;
    }
</style>
<div class="add_tip">各项均不能为空，请输入完整信息！,若没有请填“无”</div>
<div class="add_enterpriseInfo">
    <div class="add_title"><h4>添加企业信息</h4></div>
    <form action="${pageContext.request.contextPath}/user/handleAddEnterpriseInfo" method="post" name="add_form">
        <div class="add_enterpriseName">
            <label for="add_enterpriseName">企业名称：</label>
            <input type="text" name="enterpriseName" id="add_enterpriseName">
        </div>
        <div class="add_enterpriseSort">
            <label for="add_enterpriseSort">企业类别：</label>
            <input type="text" name="enterpriseSort" id="add_enterpriseSort">
        </div>
        <div class="add_operation">
            <label for="add_operation">经营范围：</label>
            <input type="text" name="operation" id="add_operation">
        </div>
        <div class="add_workArea">
            <label for="add_workArea">工作区域：</label>
            <input type="text" name="workArea" id="add_workArea">
        </div>
        <div class="add_address">
            <label for="add_address">公司地址：</label>
            <input type="text" name="address" id="add_address">
        </div>
        <div class="add_linkMan">
            <label for="add_linkMan">联系人：</label>
            <input type="text" name="linkMan" id="add_linkMan">
        </div>
        <div class="add_phone">
            <label for="add_phone">电话：</label>
            <input type="text" name="phone" id="add_phone">
        </div>
        <div class="add_handset">
            <label for="add_handset">手机：</label>
            <input type="text" name="handset" id="add_handset">
        </div>
        <div class="add_fax">
            <label for="add_fax">传真：</label>
            <input type="text" name="fax" id="add_fax">
        </div>
        <div class="add_email">
            <label for="add_email">邮箱：</label>
            <input type="text" name="email" id="add_email">
        </div>
        <div class="add_http">
            <label for="add_http">网址：</label>
            <input type="text" name="http" id="add_http">
        </div>
        <div class="add_intro">
            <label for="add_intro">公司简介：</label>
            <textarea name="intro" id="add_intro">
                </textarea>
        </div>
        <div class="add_issueDate">
            <label for="add_issueDate">发布时间：</label>
            <input type="text" value="<d:formatDate date="${addDate}"/>" readonly="readonly" name="issueDate" id="add_issueDate">
        </div>
        <div class="add_submit">
            <input type="button" value="添加" onclick="addEnterpriseInfo()">
            <input type="reset" value="重置">
        </div>
    </form>
</div>

<script type="text/javascript">
    function addEnterpriseInfo() {
        console.log("add")
        var enterpriseName = $("#add_enterpriseName").val().trim();
        var enterpriseSort = $("#add_enterpriseSort").val().trim();
        var operation = $("#add_operation").val().trim();
        var workArea = $("#add_workArea").val().trim();
        var address = $("#add_address").val().trim();
        var linkMan = $("#add_linkMan").val().trim();
        var phone = $("#add_phone").val().trim();
        var handset = $("#add_handset").val().trim();
        var fax = $("#add_fax").val().trim();
        var email = $("#add_email").val().trim();
        var http = $("#add_http").val().trim();
        var intro = $("#add_intro").val().trim();
        var issueDate = $("#add_issueDate").val().trim();
        if(enterpriseName === "" || enterpriseSort === "" || operation === "" || workArea === "" || address === "" || handset ==="" || fax === "" ||
            linkMan === "" || email === "" || http === "" || intro === "" || phone === "") {
            $(".add_tip").show();
            return;
        }
       add_form.submit();
        $(".add_tip").hide();
    }
</script>