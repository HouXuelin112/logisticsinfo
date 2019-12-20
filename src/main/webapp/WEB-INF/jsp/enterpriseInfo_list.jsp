<%--
  Created by IntelliJ IDEA.
  User: hxl112
  Date: 2019/12/11
  Time: 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" isELIgnored="false" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach items="${enterpriseInfos}" var="enterpriseInfo" varStatus="status">
<div class="enterpriseInfoBox">
    <div class="E_name">
        <a href="http://${enterpriseInfo.http}" target="_blank" style="color: #2b2b2b;">${enterpriseInfo.enterpriseName}</a>
        <c:if test="${EFlag == 1}">
        <button value="${enterpriseInfo.id}" class="deleteBtn">删除</button>
        <button value="${enterpriseInfo.id}" class="editBtn">编辑</button>
        </c:if>
    </div>
    <div class="leftImg">
        <img src="${pageContext.request.contextPath}/static/images/enterprises/e${status.count}.jpg" alt="公司照片"/>
    </div>
    <div class="centerInfo">
        <ul>
            <li>公司类别：${enterpriseInfo.enterpriseSort}</li>
            <li>经营范围：${enterpriseInfo.operation}</li>
            <li>工作区域：${enterpriseInfo.workArea}</li>
            <li>公司地址：${enterpriseInfo.address}</li>
            <li>联系人：${enterpriseInfo.linkMan}</li>
            <li>电话：${enterpriseInfo.phone}</li>
            <li>手机：${enterpriseInfo.handset}</li>
            <li>传真：${enterpriseInfo.fax}</li>
            <li>邮箱：${enterpriseInfo.email}</li>
            <li>网址：<a href="http://${enterpriseInfo.http}" target="_blank" style="color: #2b2b2b;">${enterpriseInfo.http}</a></li>
        </ul>
    </div>
    <div class="rightInfo">
        <ul>
            <li>公司简介<div class="down"></div></li>
            <div class="intro">${enterpriseInfo.intro}</div>
            <li class="E_issueDate">发布日期：${enterpriseInfo.issueDate}</li>
            <li class="E_user">发布人：${enterpriseInfo.user.name}</li>
        </ul>
    </div>
</div>
</c:forEach>

<style>
    .a{
        text-decoration: none;
    }
    .edit_dialog{
        width: 500px;
        padding: 10px;
        top: 10px;
        left: 400px;
        border: 1px solid lightgrey;
        border-radius: 10px;
        background-color: floralwhite;
        z-index: 10;
        position: absolute;
    }
    .edit_title{
        width: 100%;
        text-align: center;
    }
    .edit_form{
        width: 80%;

        text-align: right;
    }
    .edit_form div{
        margin-top: 10px;
    }
    .edit_form input{
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
    #edit_intro{
        width: 200px;
        height: 100px;
        border-radius: 5px;
        max-width: 300px;
        vertical-align: middle;
        border: 1px solid #87CEEB;
    }
    .edit_form .edit_submit input{
        background-color: deepskyblue;
        color: white;
        font-weight: bold;
        margin-bottom: 10px;
        margin-left: 100px;
    }
    .tip{
        width: 150px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        background-color: #f1f1f1;
        border: 1px solid gray;
        display: none;
        position: absolute;
        z-index: 10;
    }
</style>

<div class="edit_dialog">
    <div class="edit_title"><h3>更改企业信息</h3></div>
    <div class="edit_form">
        <form>
            <input type="text" hidden name="id" id="e_id"/>
            <div class="edit_enterpriseName">
                <label for="edit_enterpriseName">企业名称：</label>
                <input type="text" name="enterpriseName" id="edit_enterpriseName">
            </div>
            <div class="edit_enterpriseSort">
                <label for="edit_enterpriseSort">企业类别：</label>
                <input type="text" name="enterpriseSort" id="edit_enterpriseSort">
            </div>
            <div class="edit_operation">
                <label for="edit_operation">经营范围：</label>
                <input type="text" name="operation" id="edit_operation">
            </div>
            <div class="edit_workArea">
                <label for="edit_workArea">工作区域：</label>
                <input type="text" name="workArea" id="edit_workArea">
            </div>
            <div class="edit_address">
                <label for="edit_address">公司地址：</label>
                <input type="text" name="address" id="edit_address">
            </div>
            <div class="edit_linkMan">
                <label for="edit_linkMan">联系人：</label>
                <input type="text" name="linkMan" id="edit_linkMan">
            </div>
            <div class="edit_phone">
                <label for="edit_phone">电话：</label>
                <input type="text" name="phone" id="edit_phone">
            </div>
            <div class="edit_handset">
                <label for="edit_handset">手机：</label>
                <input type="text" name="handset" id="edit_handset">
            </div>
            <div class="edit_fax">
                <label for="edit_fax">传真：</label>
                <input type="text" name="fax" id="edit_fax">
            </div>
            <div class="edit_email">
                <label for="edit_email">邮箱：</label>
                <input type="text" name="email" id="edit_email">
            </div>
            <div class="edit_http">
                <label for="edit_http">网址：</label>
                <input type="text" name="http" id="edit_http">
            </div>
            <div class="edit_intro">
                <label for="edit_intro">公司简介：</label>
                <textarea name="http" id="edit_intro">
                </textarea>
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
        var id = $("#e_id").val();
        var enterpriseName = $("#edit_enterpriseName").val();
        var enterpriseSort = $("#edit_enterpriseSort").val();
        var operation = $("#edit_operation").val();
        var workArea = $("#edit_workArea").val();
        var address = $("#edit_address").val();
        var linkMan = $("#edit_linkMan").val();
        var phone = $("#edit_phone").val();
        var handset = $("#edit_handset").val();
        var fax = $("#edit_fax").val();
        var email = $("#edit_email").val();
        var http = $("#edit_http").val();
        var intro = $("#edit_intro").val();
        $.ajax({
            url: "http://localhost:8080/logisticsinfo/user/edit_enterpriseInfo",
            method: "post",
            data: JSON.stringify({
                "id": id,
                "enterpriseName": enterpriseName,
                "enterpriseSort": enterpriseSort,
                "operation": operation,
                "workArea": workArea,
                "address": address,
                "linkMan": linkMan,
                "phone": phone,
                "handset": handset,
                "fax": fax,
                "email": email,
                "http": http,
                "intro": intro,
            }),
            contentType: "application/json;charset=UTF-8",
            success: function (data) {
                console.log(data);
                if(data === "ok"){
                    console.log("修改成功！");
                    $(".enterpriseInfo").load("http://localhost:8080/logisticsinfo/user/enterprise_list?id=1");
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


    var editBtns = $(".editBtn");
    var deleteBtns = $(".deleteBtn");

    editBtns.each(function (i, e) {
        editBtns.eq(i).click(function () {
            var e_id = editBtns.eq(i).val();
            $.ajax({
                url: "http://localhost:8080/logisticsinfo/user/find_enterpriseInfo",
                method: "post",
                data: {
                    "id": e_id
                },
                success: function (data) {
                    console.log(data, data.enterpriseName);
                    setFormData(data);
                    $(".edit_dialog").show();
                },
                error: function (xhr, data, error) {
                    console.log("请求失败");
                }
            })
        });
    });

    deleteBtns.each(function (i, e) {
        deleteBtns.eq(i).click(function () {
            let flag = confirm("确认删除？");
            console.log(flag);
            if (flag === false) {
                return;
            }
            var e_id = deleteBtns.eq(i).val();
            $.ajax({
                url: "http://localhost:8080/logisticsinfo/user/deleteEnterpriseInfo",
                method: "post",
                data: {
                    "id": e_id
                },
                success: function (data) {
                    if (data === "ok"){
                        console.log("删除成功！");
                        $(".enterpriseInfo").load("http://localhost:8080/logisticsinfo/user/enterprise_list?id=1");
                    }else{
                        console.log("删除失败！");
                    }
                },
                error: function (xhr, data, error) {
                    console.log("请求失败！");
                }
            })
        })
    })

    $(".edit_dialog").hide();
    function setFormData(data){
        console.log(data.enterpriseName);
        $("#e_id").val(data.id);
        $("#edit_enterpriseName").val(data.enterpriseName);
        $("#edit_enterpriseSort").val(data.enterpriseSort);
        $("#edit_operation").val(data.operation);
        $("#edit_workArea").val(data.workArea);
        $("#edit_address").val(data.address);
        $("#edit_linkMan").val(data.linkMan);
        $("#edit_phone").val(data.phone);
        $("#edit_handset").val(data.handset);
        $("#edit_fax").val(data.fax);
        $("#edit_email").val(data.email);
        $("#edit_http").val(data.http);
        $("#edit_intro").val(data.intro);
    }
    function setCenter(divName){
        var top = ($(window).height() - divName.height())/2 -20;
        var left = ($(window).width() - divName.width())/2;
        var scrollTop = $(document).scrollTop();
        var scrollLeft = $(document).scrollLeft();
        divName.css({
            top : scrollTop,
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
</script>
