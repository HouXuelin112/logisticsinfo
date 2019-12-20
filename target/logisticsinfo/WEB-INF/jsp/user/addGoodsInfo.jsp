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
    .add_goodsInfo{
        width: 500px;
        height:730px;
         margin: 0 auto;
        border: 1px solid gray;
    }

    .add_goodsInfo div{
        width: 80%;
        height: 30px;
        text-align: right;
        line-height: 30px;
        font-size: 16px;
        font-family: "microsoft yahei";
        color: #808080;
        margin-top: 10px;
    }
    .add_goodsInfo .add_title{
        width: 100%;
        text-align: center;
        color: #000000;
    }
    .add_goodsInfo form input, .add_goodsInfo form select{
        border: 1px solid #87CEEB;
        width: 200px;
        height: 25px;
        border-radius: 5px;
    }

    .add_goodsInfo .add_submit input{
        width: 80px;
        margin-right: 30px;
        background-color: deepskyblue;
        color: white;
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
<div class="add_goodsInfo">
    <div class="add_title"><h4>添加货物信息</h4></div>
    <form action="${pageContext.request.contextPath}/user/handleAddGoodsInfo" method="post" name="add_form">
        <div class="add_goodsStyle">
            <label for="add_goodsStyle">货物类型：</label>
            <input type="text" name="goodsStyle" id="add_goodsStyle">
        </div>
        <div class="add_goodsName">
            <label for="add_goodsName">货物名称：</label>
            <input type="text" name="goodsName" id="add_goodsName">
        </div>
        <div class="add_goodsCount">
            <label for="add_goodsCount">货物数量：</label>
            <input type="text" name="goodsCount" id="add_goodsCount">
        </div>
        <div class="add_goodUnit">
            <label for="add_goodsUnit">计数单位：</label>
            <input type="text" name="goodsUnit" id="add_goodsUnit">
        </div>
        <div class="add_startOmit">
            <label for="add_startOmit">起始省份：</label>
            <input type="text" name="startOmit" id="add_startOmit">
        </div>
        <div class="add_startCity">
            <label for="add_startCity">起始城市：</label>
            <input type="text" name="startCity" id="add_startCity">
        </div>
        <div class="add_endOmit">
            <label for="add_endOmit">抵达省份：</label>
            <input type="text" name="endOmit" id="add_endOmit">
        </div>
        <div class="add_endCity">
            <label for="add_endCity">抵达城市：</label>
            <input type="text" name="endCity" id="add_endCity">
        </div>
        <div class="add_style">
            <label for="add_style">运输类型：</label>
            <input type="text" name="style" id="add_style">
        </div>
        <div class="add_transportTime">
            <label for="add_transportTime">运输时间：</label>
            <input type="text" name="transportTime" id="add_transportTime">
        </div>
        <div class="add_link">
            <label for="add_link">联系人：</label>
            <input type="text" name="link" id="add_link">
        </div>
        <div class="add_phone">
            <label for="add_phone">联系电话：</label>
            <input type="text" name="phone" id="add_phone">
        </div>
        <div class="add_car_id">
            <label for="add_car_id">车辆要求：</label>
            <select name="car.id" id="add_car_id">
                <c:forEach var="car" items="${cars}">
                    <option value="${car.id}">${car.tradeMark}</option>
                </c:forEach>
            </select>
        </div>
        <div class="add_remark">
            <label for="add_remark">备注：</label>
            <input type="text" name="remark" id="add_remark">
        </div>
        <div class="add_issueDate">
            <label for="add_issueDate">发布时间：</label>
            <input type="text" value="<d:formatDate date="${addDate}"/>" readonly="readonly" name="issueDate" id="add_issueDate">
        </div>
        <div class="add_submit">
            <input type="button" value="添加" onclick="addGoodsInfo()">
            <input type="reset" value="重置">
        </div>
    </form>
</div>

<script type="text/javascript">
    function addGoodsInfo() {
        var goodsName = $("#add_goodsName").val().trim();
        var goodsStyle = $("#add_goodsStyle").val().trim();
        var goodsCount = $("#add_goodsCount").val().trim();
        var goodsUnit = $("#add_goodsUnit").val().trim();
        var startOmit = $("#add_startOmit").val().trim();
        var startCity = $("#add_startCity").val().trim();
        var endOmit = $("#add_endOmit").val().trim();
        var endCity = $("#add_endCity").val().trim();
        var style = $("#add_style").val().trim();
        var transportTime = $("#add_transportTime").val().trim();
        var phone = $("#add_phone").val().trim();
        var car_id = $("#add_car_id").val().trim();
        var link = $("#add_link").val().trim();
        var remark = $("#add_remark").val().trim();
        var issueDate = $("#add_issueDate").val().trim();
        if(link === "" || goodsName === "" || goodsStyle === "" || style === "" || goodsCount === "" || goodsUnit ==="" || startOmit === "" ||
            startCity === "" || endOmit === "" || endCity === "" || transportTime === "" || phone === "" || remark ==="" || car_id === "") {
            $(".add_tip").show();
            return;
        }
       add_form.submit();
        $(".add_tip").hide();
    }
</script>