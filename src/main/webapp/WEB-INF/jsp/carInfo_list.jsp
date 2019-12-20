<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/11
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .edit_dialog{
        display: none;
        width: 500px;
        height: 570px;
        border: 1px solid darkgray;
        border-radius: 10px;
        background-color: floralwhite;
        position: absolute;
        z-index: 10;
    }
    .edit_title{
        width: 100%;
        height: 40px;
        text-align: center;
        line-height: 40px;
    }
    .edit_form div{
        width: 80%;
        text-align: right;
        color: #808080;
        font-family: "microsoft sans serif";
        font-size: 16px;
    }
    .edit_form div input{
        width: 200px;
        height: 30px;
        border: 1px solid #87CEEB;
        border-radius: 5px;
        margin-top: 7px;
    }
    .edit_form .edit_submit{
        width: 100%;
        text-align: center;
    }
    .edit_form .edit_submit input{
        background-color: deepskyblue;
        color: white;
        font-weight: bold;
    }
    .tip{
        width: 150px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        background-color: lightgrey;
        border: 1px solid gray;
        display: none;
        position: absolute;
        z-index: 10;
    }
</style>
    <div class="carInfo_collist">
        <c:forEach var="carInfo" items="${carInfos}" varStatus="status">
            <c:if test="${carInfo.left != null}">
                <div class="carbox fl">
                    <div class="carimg">
                        <a href="#" target="_blank">
                            <img src="${pageContext.request.contextPath}/static/images/cars/car${2*status.count-1}.jpg" alt="测试卡车">
                        </a>
                    </div>
                    <div class="carInfo_tradeMark carInfoContent">
                        车牌号：${carInfo.left.tradeMark}
                    </div>
                    <div class="carInfo_brand carInfoContent">
                        车辆品牌：${carInfo.left.brand}
                    </div>
                    <div class="carInfo_style carInfoContent">
                        车辆类型：${carInfo.left.style}
                    </div>
                    <div class="carInfo_carLoad carInfoContent">
                        车辆载重：${carInfo.left.carLoad}
                    </div>
                    <div class="carInfo_driverTime carInfoContent">
                        运输时间：${carInfo.left.driverTime}
                    </div>
                    <div class="carInfo_driverName carInfoContent">
                        驾驶员姓名：${carInfo.left.driverName}
                    </div>
                    <div class="carInfo_licenceNumber carInfoContent">
                        驾照编号：${carInfo.left.licenceNumber}
                    </div>
                    <div class="carInfo_licenceStyle carInfoContent">
                        驾照类型：${carInfo.left.licenceStyle}
                    </div>
                    <div class="carInfo_transportStyle carInfoContent">
                        运输类型：${carInfo.left.transportStyle}
                    </div>
                    <div class="carInfo_linkMan carInfoContent">
                        联系人：${carInfo.left.linkMan}
                    </div>
                    <div class="carInfo_linkPhone carInfoContent">
                        联系电话：${carInfo.left.linkPhone}
                    </div>
                    <div class="carInfo_remark carInfoContent">
                        备注：${carInfo.left.remark}
                    </div>
                    <div class="carInfo_issueDate carInfoContent">
                        发布时间：${carInfo.left.issueDate}
                    </div>
                    <div class="carInfo_user carInfoContent">
                        发布人：${carInfo.left.user.name}
                    </div>
                    <c:if test="${flag == 1}">
                    <div class="operation"><button value="${carInfo.left.id}" class="delete">删除</button><button value="${carInfo.left.id}" class="edit">编辑</button></div>
                    </c:if>
                </div>
            </c:if>
            <c:if test="${carInfo.right != null}">
                <div class="vertical_dotline"></div>
                <div class="carbox fr">
                    <div class="carimg">
                        <a href="http://book.zongheng.com/book/620800.html" target="_blank">
                            <img src="${pageContext.request.contextPath}/static/images/cars/car${2*status.count}.jpg" alt="无限界患之事件继续">
                        </a>
                    </div>
                    <div class="carInfo_tradeMark carInfoContent">
                        车牌号：${carInfo.right.tradeMark}
                    </div>
                    <div class="carInfo_brand carInfoContent">
                        车辆品牌：${carInfo.right.brand}
                    </div>
                    <div class="carInfo_style carInfoContent">
                        车辆类型：${carInfo.right.style}
                    </div>
                    <div class="carInfo_carLoad carInfoContent">
                        车辆载重：${carInfo.right.carLoad}
                    </div>
                    <div class="carInfo_driverTime carInfoContent">
                        运输时间：${carInfo.right.driverTime}
                    </div>
                    <div class="carInfo_driverName carInfoContent">
                        驾驶员姓名：${carInfo.right.driverName}
                    </div>
                    <div class="carInfo_licenceNumber carInfoContent">
                        驾照编号：${carInfo.right.licenceNumber}
                    </div>
                    <div class="carInfo_licenceStyle carInfoContent">
                        驾照类型：${carInfo.right.licenceStyle}
                    </div>
                    <div class="carInfo_transportStyle carInfoContent">
                        运输类型：${carInfo.right.transportStyle}
                    </div>
                    <div class="carInfo_linkMan carInfoContent">
                        联系人：${carInfo.right.linkMan}
                    </div>
                    <div class="carInfo_linkPhone carInfoContent">
                        联系电话：${carInfo.right.linkPhone}
                    </div>
                    <div class="carInfo_remark carInfoContent">
                        备注：${carInfo.right.remark}
                    </div>
                    <div class="carInfo_issueDate carInfoContent">
                        发布时间：${carInfo.right.issueDate}
                    </div>
                    <div class="carInfo_user carInfoContent">
                        发布人：${carInfo.right.user.name}
                    </div>
                    <c:if test="${flag == 1}">
                    <div class="operation"><button value="${carInfo.right.id}" class="delete">删除</button><button value="${carInfo.right.id}" class="edit">编辑</button></div>
                    </c:if>
                </div>
            </c:if>
            <div class="dotline"></div>
        </c:forEach>
    </div>

<div class="edit_dialog">
    <div class="edit_title"><h3>更改车辆信息</h3></div>
    <div class="edit_form">
        <form>
            <input type="text" hidden name="id" id="car_id"/>
            <div class="edit_tradeMark">
                <label for="edit_tradeMark">车牌号：</label>
                <input type="text" name="tradeMark" id="edit_tradeMark">
            </div>
            <div class="edit_brand">
                <label for="edit_brand">车辆品牌：</label>
                <input type="text" name="brand" id="edit_brand">
            </div>
            <div class="edit_style">
                <label for="edit_style">车辆类型：</label>
                <input type="text" name="style" id="edit_style">
            </div>
            <div class="edit_carLoad">
                <label for="edit_carLoad">车辆载重：</label>
                <input type="text" name="carLoad" id="edit_carLoad">
            </div>
            <div class="edit_driverTime">
                <label for="edit_driverTime">运输时间：</label>
                <input type="text" name="driverTime" id="edit_driverTime">
            </div>
            <div class="edit_driverName">
                <label for="edit_driverName">驾驶员姓名：</label>
                <input type="text" name="driverName" id="edit_driverName">
            </div>
            <div class="edit_licenceNumber">
                <label for="edit_licenceNumber">驾照编号：</label>
                <input type="text" name="licenceNumber" id="edit_licenceNumber">
            </div>
            <div class="edit_licenceStyle">
                <label for="edit_licenceStyle">驾照类型：</label>
                <input type="text" name="licenceStyle" id="edit_licenceStyle">
            </div>
            <div class="edit_transportStyle">
                <label for="edit_transportStyle">运输类型：</label>
                <input type="text" name="transportStyle" id="edit_transportStyle">
            </div>
            <div class="edit_linkMan">
                <label for="edit_linkMan">联系人：</label>
                <input type="text" name="linkMan" id="edit_linkMan">
            </div>
            <div class="edit_linkPhone">
                <label for="edit_linkPhone">联系电话：</label>
                <input type="text" name="linkPhone" id="edit_linkPhone">
            </div>
            <div class="edit_remark">
                <label for="edit_remark">备注：</label>
                <input type="text" name="remark" id="edit_remark">
            </div>
            <div class="edit_submit">
                <input type="button" value="保存修改" onclick="saveEdit()">
            </div>
        </form>
    </div>
</div>
<div class="tip">
    单击鼠标左键取消修改
</div>
<script type="text/javascript">



    function saveEdit() {
        var car_id = $("#car_id").val();
        var tradeMark = $("#edit_tradeMark").val();
        var brand = $("#edit_brand").val();
        var style = $("#edit_style").val();
        var carLoad = $("#edit_carLoad").val();
        var driverTime = $("#edit_driverTime").val();
        var driverName = $("#edit_driverName").val();
        var licenceNumber = $("#edit_licenceNumber").val();
        var licenceStyle = $("#edit_licenceStyle").val();
        var transportStyle = $("#edit_transportStyle").val();
        var linkMan = $("#edit_linkMan").val();
        var linkPhone = $("#edit_linkPhone").val();
        var remark = $("#edit_remark").val();
        $.ajax({
            url: "http://localhost:8080/logisticsinfo/user/edit_carInfo",
            method: "post",
            data: JSON.stringify({
                "id": car_id,
                "tradeMark": tradeMark,
                "brand": brand,
                "style": style,
                "carLoad": carLoad,
                "driverTime": driverTime,
                "driverName": driverName,
                "licenceNumber": licenceNumber,
                "licenceStyle": licenceStyle,
                "transportStyle": transportStyle,
                "linkMan": linkMan,
                "linkPhone": linkPhone,
                "remark": remark
            }),
            contentType: "application/json;charset=UTF-8",
            success: function (data) {
                console.log(data);
                if(data === "ok"){
                    console.log("修改成功！");
                    $(".carInfo").load("http://localhost:8080/logisticsinfo/user/carInfo_list?id=1");
                    $(".edit_dialog").hide();
                }else{
                    console.log("修改失败！");
                    alert("修改失败");
                    $(".edit_dialog").hide();
                }
            },
            error: function (xhr, type, errorThrown) {
                console.log(xhr.status, type, errorThrown);
                console.log("请求失败");
            }
        });
    }



$(".edit_dialog").hide();
    function setCenter(divName){
        var top = ($(window).height() - divName.height())/2 -20;
        var left = ($(window).width() - divName.width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        divName.css({
            top : top + scrollTop,
            left : left + scrollLeft
        });
        /*left_w=($(document).width()-component.width())/2;
        top_w = $('body').scrollTop + ($(window).height()-component.height())/2;
        component.offset({top:top_w,left:left_w});*/
    }

    $(document).bind("mouseup", function(e){
        var e = e || window.event;
        var elem = e.target || e.srcElement;
        if(!$(".edit_dialog").is(":visible")){//如果注册框不可见则不作反应
            return;
        }
        if(e.button !== 0){//左0, 中1, 右2, 判断是否为左键
            //如果不为左键,则不作任何反应
            return;
        }
        //遍历节点元素
        while(elem){
            if(elem.className && elem.className == 'edit_dialog'){
                return;
            }
            elem = elem.parentElement;
        }
        $(".edit_dialog").hide();
    });

    $(document).on("mousemove", function(e){
        var e = e || window.event;
        var elem = e.target || e.srcElement;
        if(!$(".edit_dialog").is(":visible")){
            $(".tip").hide();
            return;
        }
        while(elem){
            if(elem.className && elem.className === 'edit_dialog'){
                $(".tip").hide();
                return;
            }
            elem = elem.parentElement;
        }
        x = e.pageX;
        y = e.pageY;
        $(".tip").offset({top: y, left: x});
        $(".tip").show();
    });

    setCenter($(".edit_dialog"));
    $(window).scroll(function () {
        setCenter($(".edit_dialog"));
    });
    $(window).resize(function () {
        setCenter($(".edit_dialog"));
    });
    var delete_carInfo = $(".operation .delete");
    var edit_carInfo = $(".operation .edit");
    delete_carInfo.each(function (i, e) {
        console.log(delete_carInfo);
        delete_carInfo.eq(i).click(function () {
            let flag = confirm("确认删除？");
            if (flag === false) {
                return;
            }
            let car_id = delete_carInfo.eq(i).val();
            console.log(delete_carInfo.eq(i).val());
            $.ajax({
                url: "http://localhost:8080/logisticsinfo/user/delete_carInfo",
                method: "post",
                data: {
                    "car_id": car_id
                },
                success: function (data) {
                    if (data === "ok") {
                        $(".carInfo").load("http://localhost:8080/logisticsinfo/user/carInfo_list?id=1");
                    } else {
                        console.log("删除失败");
                    }
                },
                error: function () {
                    console.log("请求出错");
                }
            });
        });
    })

    function setFormData(data){
        console.log(data.tradeMark);
        $("#car_id").val(data.id);
        $("#edit_tradeMark").val(data.tradeMark);
        $("#edit_brand").val(data.brand);
        $("#edit_style").val(data.style);
        $("#edit_carLoad").val(data.carLoad);
        $("#edit_driverTime").val(data.driverTime);
        $("#edit_driverName").val(data.driverName);
        $("#edit_licenceNumber").val(data.licenceNumber);
        $("#edit_licenceStyle").val(data.licenceStyle);
        $("#edit_transportStyle").val(data.transportStyle);
        $("#edit_linkMan").val(data.linkMan);
        $("#edit_linkPhone").val(data.linkPhone);
        $("#edit_remark").val(data.remark);
    }

    edit_carInfo.each(function (i, e) {
        edit_carInfo.eq(i).click(function () {
            console.log(edit_carInfo.eq(i).val());
            car_id = edit_carInfo.eq(i).val();
            $.ajax({
                url:"http://localhost:8080/logisticsinfo/user/find_carInfo",
                method: "post",
                data:{
                    "car_id": car_id
                },
                success: function (data) {
                    setFormData(data);
                    $(".edit_dialog").show();
                },
                error:function () {
                    console.log("请求出错！");
                    $("#car_id").val(car_id);
                    $(".edit_dialog").show();
                }
            })
        });
    })
</script>