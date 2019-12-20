window.onload = function () {
    addNextListener();
}

function addNextListener() {
    $(".next3").click(function () {
        let a = "<a href='http://localhost:8080/logisticsinfo/user/userLogin'></a>"
        window.location.href="userLogin";
    });
    $(".next2").click(function () {
        let newPassword = $("#newPassword").val().trim();
        if(newPassword === ""){
            alert("新密码不能为空");
        }
        $.ajax({
            url: "http://localhost:8080/logisticsinfo/user/changePassword",
            method: "post",
            data:{
                "newPassword": newPassword
            },
            success: function (data) {
                if(data === "ok"){
                    let newDiv = "<div>修改完成</div>";
                    $(".body").children().remove();
                    $(".body").append(newDiv);
                    let current = $(".current");
                    current.removeClass("current").addClass("finished");
                    current.next().addClass("current").removeClass("todo");
                    $(".next2").hide();
                    $(".next3").show();
                }
            },
            error: function () {
                alert("请求出错");
            }
        })
    });
    $(".next1").bind("click",function(){

        let result = $("#result").val();

        $.ajax({
            url: "http://localhost:8080/logisticsinfo/user/checkResult",
            method: "post",
            data:{
                "result": result
            },
            success: function (data) {
                if(data === "ok"){
                    let newDiv = "<div><label>请输入新密码：</label><input type='text' name='newPassword' id='newPassword'>";
                    $(".body").children().remove();
                    $(".body").append(newDiv);
                    let current = $(".current");
                    current.removeClass("current").addClass("finished");
                    current.next().addClass("current").removeClass("todo");
                    $(".next1").hide();
                    $(".next2").show();
                }else {
                    $("#result").val("");
                    alert("答案错误，请重新输入");
                }
            },
            error: function () {
                alert("请求出错");
            }
        })
    });
}