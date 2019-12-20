<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/11
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="d" uri="/dateConvert" %>

<style type="text/css">
    .add_carInfo{
        width: 500px;
        height:600px;
         margin: 0 auto;
        border: 1px solid gray;
    }

    .add_carInfo div{
        width: 80%;
        height: 30px;
        text-align: right;
        line-height: 30px;
        font-size: 16px;
        font-family: "microsoft yahei";
        color: #808080;
        margin-top: 10px;
    }
    .add_carInfo .add_title{
        width: 100%;
        text-align: center;
        color: #000000;
    }
    .add_carInfo form input{
        border: 1px solid #87CEEB;
        width: 200px;
        height: 25px;
        border-radius: 5px;
    }

    .add_carInfo .add_submit input{
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
<div class="add_tip">各项均不能为空，请输入完整信息！</div>
<div class="add_carInfo">
    <div class="add_title"><h4>添加车辆信息</h4></div>
    <form action="${pageContext.request.contextPath}/user/handleAddCarInfo" method="post" name="add_form">
        <div class="add_tradeMark">
            <label for="add_tradeMark">车牌号：</label>
            <input type="text" name="tradeMark" id="add_tradeMark">
        </div>
        <div class="add_brand">
            <label for="add_brand">车辆品牌：</label>
            <input type="text" name="brand" id="add_brand">
        </div>
        <div class="add_style">
            <label for="add_style">车辆类型：</label>
            <input type="text" name="style" id="add_style">
        </div>
        <div class="add_carLoad">
            <label for="add_carLoad">车辆载重：</label>
            <input type="text" name="carLoad" id="add_carLoad">
        </div>
        <div class="add_driverTime">
            <label for="add_driverTime">运输时间：</label>
            <input type="text" name="driverTime" id="add_driverTime">
        </div>
        <div class="add_driverName">
            <label for="add_driverName">驾驶员姓名：</label>
            <input type="text" name="driverName" id="add_driverName">
        </div>
        <div class="add_licenceNumber">
            <label for="add_licenceNumber">驾照编号：</label>
            <input type="text" name="licenceNumber" id="add_licenceNumber">
        </div>
        <div class="add_licenceStyle">
            <label for="add_licenceStyle">驾照类型：</label>
            <input type="text" name="licenceStyle" id="add_licenceStyle">
        </div>
        <div class="add_transportStyle">
            <label for="add_transportStyle">运输类型：</label>
            <input type="text" name="transportStyle" id="add_transportStyle">
        </div>
        <div class="add_linkMan">
            <label for="add_linkMan">联系人：</label>
            <input type="tel" name="linkMan" id="add_linkMan">
        </div>
        <div class="add_linkPhone">
            <label for="add_linkPhone">联系电话：</label>
            <input type="text" name="linkPhone" id="add_linkPhone">
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
            <input type="button" value="添加" onclick="addCarInfo()">
            <input type="reset" value="重置">
        </div>
    </form>
</div>

<script type="text/javascript">
    function addCarInfo() {
        var tradeMark = $("#add_tradeMark").val().trim();
        var brand = $("#add_brand").val().trim();
        var style = $("#add_style").val().trim();
        var carLoad = $("#add_carLoad").val().trim();
        var driverTime = $("#add_driverTime").val().trim();
        var driverName = $("#add_driverName").val().trim();
        var licenceNumber = $("#add_licenceNumber").val().trim();
        var licenceStyle = $("#add_licenceStyle").val().trim();
        var transportStyle = $("#add_transportStyle").val().trim();
        var linkMan = $("#add_linkMan").val().trim();
        var linkPhone = $("#add_linkPhone").val().trim();
        var remark = $("#add_remark").val().trim();
        if(tradeMark === "" || brand === "" || style === "" || carLoad === "" || driverTime ==="" || linkMan === "" ||
        driverName === "" || licenceNumber === "" || licenceStyle === "" || transportStyle === "" || linkPhone === "" || remark ===""){
            $(".add_tip").show();
            return;
        }
        add_form.submit();
        $(".add_tip").hide();
    }
</script>