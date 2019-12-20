<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/15
  Time: 15：05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .edit_dialog{
        display: none;
        width: 500px;
        height: 700px;
        border: 1px solid darkgray;
        border-radius: 10px;
        background-color: floralwhite;
        z-index: 10;
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
    .edit_form div input, #edit_car_id{
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
<center style="color: red">${zeroTip}<center>
<div class="goodsInfo_collist">
    <c:forEach var="goodsInfo" items="${goodsInfos}" varStatus="status">
        <c:if test="${goodsInfo.left != null}">
            <div class="goodsbox fl">
                <div class="goodsimg">
                    <a href="#" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/images/goods/g${status.count * 2 - 1}.jpg" alt="测试货物">
                    </a>
                </div>
                <div class="goodsInfo_goodsName goodsInfoContent">
                    货物名称：${goodsInfo.left.goodsName}
                </div>
                <div class="goodsInfo_goodsStyle goodsInfoContent">
                    货物类型：${goodsInfo.left.goodsStyle}
                </div>
                <div class="goodsInfo_goodsCount goodsInfoContent">
                    货物数量：${goodsInfo.left.goodsCount}
                </div>
                <div class="goodsInfo_goodsUnit goodsInfoContent">
                    计数单位：${goodsInfo.left.goodsUnit}
                </div>
                <div class="goodsInfo_startOmit goodsInfoContent">
                    起始省份：${goodsInfo.left.startOmit}
                </div>
                <div class="goodsInfo_startCity goodsInfoContent">
                    起始城市：${goodsInfo.left.startCity}
                </div>
                <div class="goodsInfo_endOmit goodsInfoContent">
                    抵达省份：${goodsInfo.left.endOmit}
                </div>
                <div class="goodsInfo_endCity goodsInfoContent">
                    抵达城市：${goodsInfo.left.endCity}
                </div>
                <div class="goodsInfo_transportTime goodsInfoContent">
                    运输时间：${goodsInfo.left.transportTime}
                </div>
                <div class="goodsInfo_link goodsInfoContent">
                    联系人：${goodsInfo.left.link}
                </div>
                <div class="goodsInfo_phone goodsInfoContent">
                    联系电话：${goodsInfo.left.phone}
                </div>
                <div class="goodsInfo_request goodsInfoContent">
                    车辆要求：${goodsInfo.left.car.style}
                </div>
                <div class="goodsInfo_remark goodsInfoContent">
                    备注：${goodsInfo.left.remark}
                </div>
                <div class="goodsInfo_issueDate goodsInfoContent">
                    发布时间：${goodsInfo.left.issueDate}
                </div>
                <div class="goodsInfo_user goodsInfoContent">
                    发布人：${goodsInfo.left.user.name}
                </div>
                <c:if test="${goodsFlag == 1}">
                    <div class="operation"><button value="${goodsInfo.left.id}" class="delete">删除</button><button value="${goodsInfo.left.id}" class="edit">编辑</button></div>
                </c:if>
            </div>
        </c:if>
        <c:if test="${goodsInfo.right != null}">
            <div class="vertical_dotline"></div>
            <div class="goodsbox fr">
                <div class="goodsimg">
                    <a href="http://book.zongheng.com/book/620800.html" target="_blank">
                        <img src="${pageContext.request.contextPath}/static/images/goods/g${status.count * 2}.jpg" alt="货物">
                    </a>
                </div>
                <div class="goodsInfo_goodsName goodsInfoContent">
                    货物名称：${goodsInfo.right.goodsName}
                </div>
                <div class="goodsInfo_goodsStyle goodsInfoContent">
                    货物类型：${goodsInfo.right.goodsStyle}
                </div>
                <div class="goodsInfo_goodsCount goodsInfoContent">
                    货物数量：${goodsInfo.right.goodsCount}
                </div>
                <div class="goodsInfo_goodsUnit goodsInfoContent">
                    计数单位：${goodsInfo.right.goodsUnit}
                </div>
                <div class="goodsInfo_startOmit goodsInfoContent">
                    起始省份：${goodsInfo.right.startOmit}
                </div>
                <div class="goodsInfo_startCity goodsInfoContent">
                    起始城市：${goodsInfo.right.startCity}
                </div>
                <div class="goodsInfo_endOmit goodsInfoContent">
                    抵达省份：${goodsInfo.right.endOmit}
                </div>
                <div class="goodsInfo_endCity goodsInfoContent">
                    抵达城市：${goodsInfo.right.endCity}
                </div>
                <div class="goodsInfo_transportTime goodsInfoContent">
                    运输时间：${goodsInfo.right.transportTime}
                </div>
                <div class="goodsInfo_link goodsInfoContent">
                    联系人：${goodsInfo.right.link}
                </div>
                <div class="goodsInfo_phone goodsInfoContent">
                    联系电话：${goodsInfo.right.phone}
                </div>
                <div class="goodsInfo_request goodsInfoContent">
                    车辆要求：${goodsInfo.right.car.style}
                </div>
                <div class="goodsInfo_remark goodsInfoContent">
                    备注：${goodsInfo.right.remark}
                </div>
                <div class="goodsInfo_issueDate goodsInfoContent">
                    发布时间：${goodsInfo.right.issueDate}
                </div>
                <div class="goodsInfo_user goodsInfoContent">
                    发布人：${goodsInfo.right.user.name}
                </div>
                <c:if test="${goodsFlag == 1}">
                    <div class="operation"><button value="${goodsInfo.right.id}" class="delete">删除</button><button value="${goodsInfo.right.id}" class="edit">编辑</button></div>
                </c:if>
            </div>
        </c:if>
        <div class="dotline"></div>
    </c:forEach>
</div>

<div class="edit_dialog">
    <div class="edit_title"><h3>更改货物信息</h3></div>
    <div class="edit_form">
        <form>
            <input type="text" hidden name="id" id="goods_id"/>
            <div class="edit_goodsName">
                <label for="edit_goodsName">货物名称：</label>
                <input type="text" name="goodsName" id="edit_goodsName">
            </div>
            <div class="edit_goodsStyle">
                <label for="edit_goodsStyle">货物类型：</label>
                <input type="text" name="goodsStyle" id="edit_goodsStyle">
            </div>
            <div class="edit_goodsCount">
                <label for="edit_goodsCount">货物数量：</label>
                <input type="text" name="goodsCount" id="edit_goodsCount">
            </div>
            <div class="edit_goodUnit">
                <label for="edit_goodsUnit">计数单位：</label>
                <input type="text" name="goodsUnit" id="edit_goodsUnit">
            </div>
            <div class="edit_startOmit">
                <label for="edit_startOmit">起始省份：</label>
                <input type="text" name="startOmit" id="edit_startOmit">
            </div>
            <div class="edit_startCity">
                <label for="edit_startCity">起始城市：</label>
                <input type="text" name="startCity" id="edit_startCity">
            </div>
            <div class="edit_endOmit">
                <label for="edit_endOmit">抵达省份：</label>
                <input type="text" name="endOmit" id="edit_endOmit">
            </div>
            <div class="edit_endCity">
                <label for="edit_endCity">抵达城市：</label>
                <input type="text" name="endCity" id="edit_endCity">
            </div>
            <div class="edit_style">
                <label for="edit_style">运输类型：</label>
                <input type="text" name="style" id="edit_style">
            </div>
            <div class="edit_transportTime">
                <label for="edit_transportTime">运输时间：</label>
                <input type="text" name="transportTime" id="edit_transportTime">
            </div>
            <div class="edit_link">
                <label for="edit_link">联系人：</label>
                <input type="text" name="link" id="edit_link">
            </div>
            <div class="edit_phone">
                <label for="edit_phone">联系电话：</label>
                <input type="text" name="phone" id="edit_phone">
            </div>
            <div class="edit_car_id">
                <label for="edit_car_id">车辆要求：</label>
                <select name="car_id" id="edit_car_id">
                    <c:forEach var="car" items="${cars}">
                        <option value="${car.id}">${car.tradeMark}</option>
                    </c:forEach>
                </select>
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
        var goods_id = $("#goods_id").val();
        var goodsName = $("#edit_goodsName").val();
        var goodsStyle = $("#edit_goodsStyle").val();
        var goodsCount = $("#edit_goodsCount").val();
        var goodsUnit = $("#edit_goodsUnit").val();
        var startOmit = $("#edit_startOmit").val();
        var startCity = $("#edit_startCity").val();
        var endOmit = $("#edit_endOmit").val();
        var endCity = $("#edit_endCity").val();
        var style = $("#edit_style").val();
        var transportTime = $("#edit_transportTime").val();
        var phone = $("#edit_phone").val();
        var car_id = $("#edit_car_id").val();
        var link = $("#edit_link").val();
        var remark = $("#edit_remark").val();
        $.ajax({
            url: "http://localhost:8080/logisticsinfo/user/edit_goodsInfo",
            method: "post",
            data: JSON.stringify({
                "id": goods_id,
                "goodsName": goodsName,
                "goodsStyle": goodsStyle,
                "goodsCount": goodsCount,
                "goodsUnit": goodsUnit,
                "startOmit": startOmit,
                "startCity": startCity,
                "endOmit": endOmit,
                "endCity": endCity,
                "style": style,
                "transportTime": transportTime,
                "phone": phone,
                "link": link,
                "remark": remark,
                "car": {
                    "id": car_id
                }
            }),
            contentType: "application/json;charset=UTF-8",
            success: function (data) {
                console.log(data);
                if(data === "ok"){
                    console.log("修改成功！");
                    $(".goodsInfo").load("http://localhost:8080/logisticsinfo/user/goodsInfo_list?id=1");
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
            top : top + scrollTop -70,
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
    var delete_goodsInfo = $(".operation .delete");
    var edit_goodsInfo = $(".operation .edit");

    delete_goodsInfo.each(function (i, e) {
        console.log(delete_goodsInfo);
        delete_goodsInfo.eq(i).click(function () {
            let flag = confirm("确认删除？");
            console.log(flag);
            if (flag === false) {
                return;
            }
            let goods_id = delete_goodsInfo.eq(i).val();
            console.log(delete_goodsInfo.eq(i).val());
            $.ajax({
                url: "http://localhost:8080/logisticsinfo/user/delete_goodsInfo",
                method: "post",
                data: {
                    "goods_id": goods_id
                },
                success: function (data) {
                    if (data === "ok") {
                        console.log("删除成功");
                        $(".goodsInfo").load("http://localhost:8080/logisticsinfo/user/goodsInfo_list?id=1");
                    } else {
                        console.log("删除失败");
                    }
                },
                error: function () {
                    console.log("请求出错");
                }
            });
        });
    });

    function setFormData(data){
        console.log(data.goodsStyle);
        $("#goods_id").val(data.id);
        $("#edit_goodsStyle").val(data.goodsStyle);
        $("#edit_goodsName").val(data.goodsName);
        $("#edit_goodsCount").val(data.goodsCount);
        $("#edit_goodsUnit").val(data.goodsUnit);
        $("#edit_startOmit").val(data.startOmit);
        $("#edit_startCity").val(data.startCity);
        $("#edit_endCity").val(data.endCity);
        $("#edit_endOmit").val(data.endOmit);
        $("#edit_style").val(data.style);
        $("#edit_transportTime").val(data.transportTime);
        $("#edit_link").val(data.link);
        $("#edit_phone").val(data.phone);
        $("#edit_remark").val(data.remark);
    }

    edit_goodsInfo.each(function (i, e) {
        edit_goodsInfo.eq(i).click(function () {
            console.log("goodsID", edit_goodsInfo.eq(i).val());
            goods_id = edit_goodsInfo.eq(i).val();
            $.ajax({
                url:"http://localhost:8080/logisticsinfo/user/find_goodsInfo",
                method: "post",
                data:{
                    "goods_id": goods_id
                },
                success: function (data) {
                    setFormData(data);
                    $(".edit_dialog").show();
                },
                error:function () {
                    console.log("请求出错！");
                    $("#goods_id").val(goods_id);
                    $(".edit_dialog").show();
                }
            })
        });
    })
</script>