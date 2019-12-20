/**
 * 
 */

function reset(title, time, name, content){
	title.text("");
	time.text("");
	name.text("");
	content.text("");
}

function addCloseToDialog(close, dialog) {
    var detail_title = $(".detail_title");
    var detail_time = $(".detail_time");
    var detail_name = $(".detail_name");
    var detail_content = $(".detail_content");
    close.click(function () {
        reset(detail_title, detail_time, detail_name, detail_content);
        dialog.hide();
    });
}

function addSelectListener(selectBtn) {
    selectBtn.click(function () {
        $('.progress').show();
       var title = $("#logistics_title").val();
       var issueDate = $("#time").val();
       var name = $("#issueAdmin").val();
       console.log("issueDate-->" + issueDate);
       $.ajax({
            url: "http://localhost:8080/logisticsinfo/user/findLogisticsInfos",
            method: "POST",
            dataType: "json",
            data: JSON.stringify({//将数据转化为json格式
                "title": title ? title: "",
                "issueDate": issueDate ? issueDate : "",
                "admin": {
                    "name": name ? name: ""
                }
            }),
            contentType: "application/json;charset=UTF-8",
            success: function(data){
                console.log(data);
                resetTable(data);
            },
            error: function(xhr,type,errorThrown){
                var x = 1;
                var int = setInterval(function () {
                    x += 1;
                    $(".msg-con").text("请求出错");
                    $("#error").show();
                    if(x == 3){
                        clearInterval(int);
                        $("#error").hide();
                    }
                }, 1000);
            }
        });
        $('.progress').hide();
    });
}

function resetTable(data) {
    var table = $("table");
    table.children().remove();
    table.append("<caption>物流信息表</caption>");
    table.append("<tr><th width=\"10%\">序号</th><th width=\"20%\">标题</th><th width=\"30%\">发布时间</th><th width=\"20%\">发布人</th><th width=\"20%\">操作</th></tr>")
    var rank = 1;
    var flag = true;
    for (let logis of data){
        flag = false;
        var str = "<tr><td>" + rank++ +"</td><td>" + logis.title + "</td><td>" + logis.issueDate + "</td><td>" + logis.admin.name + "</td><td><button type=\"button\">详情</button></td></tr>"
        table.append(str);
    }
    if(flag){
        table.append("<tr><td colspan='5'>物流信息不存在</td> </tr>")
    }
    //获取详情按钮
    var detail_btns = $("td button");
    addFindDetailToBtns(detail_btns);
}

function addSelectAllLogisToBtn(all) {
    all.click(function () {
        $('.progress').show();
        $.ajax({
            url: "http://localhost:8080/logisticsinfo/user/findAllLogis",
            method: "post",
            success: function (data) {
                resetTable(data);
            },
            error: function () {
                var x = 1;
                var int = setInterval(function () {
                    x += 1;
                    $(".msg-con").text("请求出错");
                    $("#error").show();
                    if(x == 3){
                        clearInterval(int);
                        $("#error").hide();
                    }
                }, 1000);
            }
        })
        $('.progress').hide();
    })
}

function addFindDetailToBtns(detail_btns) {
    var detail_title = $(".detail_title");
    var detail_time = $(".detail_time");
    var detail_name = $(".detail_name");
    var detail_content = $(".detail_content");
    var tds = $("td");
    //获取详情dialog
    var detail_dialog = $(".detail");
    detail_btns.each(function (i, e) {
        detail_btns.eq(i).click(function () {
            $('.progress').show();
            console.log("i -->" + i);
            var index = 5 * i; //表格每一行的首个td的索引
            var title = tds.eq(++index).text().trim();
            var date = tds.eq(++index).text().trim();
            var name = tds.eq(++index).text().trim();
            console.log(title, date, name);
            $.ajax({
                url: "http://localhost:8080/logisticsinfo/user/detail",
                method: "POST",
                dataType: "json",
                data: JSON.stringify({//将数据转化为json格式
                    "title": title,
                    "issueDate": date,
                    "admin": {
                        "name": name
                    }
                }),
                contentType: "application/json;charset=UTF-8",
                success: function(data){
                    //如果成功则显示详情dialog
                    console.log(data);
                    detail_title.text(data.title);
                    detail_time.text(data.issueDate);
                    detail_name.text(data.admin.name);
                    detail_content.text(data.content);
                    detail_dialog.show();
                    $('.progress').hide();
                },
                error: function(xhr,type,errorThrown){
                    var x = 1;
                    var int = setInterval(function () {
                        x += 1;
                        $(".msg-con").text("请求详情出错");
                        $("#error").show();
                        if(x == 3){
                            clearInterval(int);
                            $("#error").hide();
                        }
                    }, 1000);
                }
            });
            $('.progress').hide();
        });
    });
}

function init(){
    $(document).on('click',function(e){
        var e = e || window.event;
        var idValue = $(e.target).attr("class");
        if(idValue != "detail" && idValue != "close" && idValue != "detail_container" && idValue != "detail_name" && idValue != "detail_time" && idValue != "detail_content" && idValue != "detail_body" && idValue != "detail_title"){  //如果是的相等了就执行内容了。
            var detail_title = $(".detail_title");
            var detail_time = $(".detail_time");
            var detail_name = $(".detail_name");
            var detail_content = $(".detail_content");
            reset(detail_title, detail_time, detail_name, detail_content);
            $(".detail").hide();
        }
    });
    //获取详情按钮
    var detail_btns = $("td button");
    var selectBtn = $("#submit").eq(0);
    addSelectListener(selectBtn);
    //获取详情dialog
    var detail_dialog = $(".detail");
    //设置初始状态为隐藏
    detail_dialog.hide();
    //关闭按钮
    var close = $(".img1");
    var all = $(".select div[class='sub']").eq(0);
    console.log(all);
    //为dialog添加关闭功能
    addCloseToDialog(close, detail_dialog);
    addSelectAllLogisToBtn(all);
    addFindDetailToBtns(detail_btns);
}
window.onload = function (){
    a[0].style = "color: blue;";
    a[0].onmouseleave = function(){
        this.style = "color: blue;";
    };
    a[0].onmouseover = function(){
        this.style = "color: blue;border-bottom: 5px solid red;";
    };

    $("#error").hide();



    //将进度条定为到屏幕中央
    left_w=($(document).width()-$('.progress').width())/2;
    top_w = $('html').scrollTop()+($(window).height()-$('.progress').height())/2;
    $('.progress').offset({top:top_w,left:left_w});
    $('.progress').hide();

    $('#time').datepicker({
        timepicker:true,
        autoclose: false, //这里最好设置为false
    });
    init();
}