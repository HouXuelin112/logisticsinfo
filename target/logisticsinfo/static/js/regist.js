
window.onload = function () {
    function reset(){
        $("#name").val("");
        $("#username").val("");
        $("#password").val("");
        $("#ensure").val("");
        $("#phone").val("");
        $("#email").val("");
        $("#question").val("");
        $("#result").val("");
        $("#male").prop("checked", "checked");
    }

    function toAdmin(registbox){
        $(".regist_title h3").text("管理员注册");
        $(".gender").hide();
        $(".question").hide();
        $(".result").hide();
        $(".issueDate").hide();
        registbox.height(370);
        registbox.show()
    }

    function toUser(registbox){
        $(".regist_title h3").text("会员注册");
        $(".gender").show();
        $(".question").show();
        $(".result").show();
        $(".issueDate").show();
        registbox.height(510);
        registbox.show()
    }
    //设置注册日期
    date = new Date();
    issueDate = date.getFullYear() + "-" + (date.getUTCMonth() > 8 ? date.getUTCMonth() + 1 : "0" + (date.getUTCMonth()+1)) + "-" + (date.getUTCDate() > 9 ? date.getUTCDate(): "0"+date.getUTCDate());
    $("#issueDate").val(issueDate);

    //将组建设置在屏幕中间
    function setCenter(divName){
        var top = ($(window).height() - divName.height())/2;
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

    function showCancel(str){
        $(".cancel").text(str === undefined ? "操作取消": str);
        $(".cancel").fadeIn();
        var tag = 0;
        var interval = setInterval(function(){
            tag++;
            if(tag > 2){
                clearInterval(interval);
                $(".cancel").fadeOut();
            }
        },1000);
        $("body").css("background-color","#fff");
    }

    $(window).scroll(function () {
        setCenter($(".registbox"));
        setCenter($(".cancel"));
    });
    $(window).resize(function () {
        setCenter($(".registbox"));
        setCenter($(".cancel"));
    });

    $(".reset").click(reset);

    setCenter($(".cancel"));
    setCenter($(".registbox"));

    var tag = 0;//0为管理员，1为会员
    $(document).on("mousemove", function(e){
        var e = e || window.event;
        var elem = e.target || e.srcElement;
        if(!$(".registbox").is(":visible")){
            $(".tip").hide();
            return;
        }
        while(elem){
            if(elem.className && elem.className == 'registbox'){
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
    /* $('.registbox').hide(); */
    var initialAction = regist_form.action;
    $('#myModal').on('okHide', function(e){
        console.log($(".admin").is(":checked"));
        console.log($(".user").is(":checked"));
        var registbox = $(".registbox");
        if($(".admin").is(":checked")){
            toAdmin(registbox);
            regist_form.action = initialAction + "admin/regist";
            tag = 0;
        }else{
            toUser(registbox);
            regist_form.action = initialAction + "user/regist";
            tag = 1;
        }
        $("body").css("background-color","gray", "z-index","9");
    });

    function isAdminFilled(){
        if($("#name").val().trim() === "" ||
        $("#username").val().trim() === "" ||
        $("#password").val().trim() === "" ||
        $("#ensure").val().trim() === "" ||
        $("#phone").val().trim() === "" ||
        $("#email").val().trim() === ""){
            return false;
        }
        return true;
    }

    function isUserFilled(){
        if(isAdminFilled() && $("#question").val().trim() !== "" && $("#result").val().trim() !== ""){
            return true;
        }
        return false;
    }

    $(document).bind("mouseup", function(e){
        var e = e || window.event;
        var elem = e.target || e.srcElement;
        if(!$(".registbox").is(":visible")){//如果注册框不可见则不作反应
            return;
        }
        if(e.button !== 0){//左0, 中1, 右2, 判断是否为左键
            //如果不为左键,则不作任何反应
            return;
        }
        //遍历节点元素
        while(elem){
            if(elem.className && elem.className == 'registbox'){
                return;
            }
            elem = elem.parentElement;
        }
        $(".registbox").hide();
        showCancel();
    });

    $(".submit").click(function () {
        console.log("tag" , tag);
        console.log("ad", isAdminFilled());
        console.log("u", isUserFilled())
        if(tag === 0){//如果为管理员
            if(!isAdminFilled()){

                showCancel("请填写完整的信息");
                return;
            }
        }
        if(tag === 1){
            if(!isUserFilled()){
                showCancel("请填写完整的信息");
                return;
            }
        }
        if($("#password").val() !== $("#ensure").val()){
            showCancel("两次密码不一致");
            return;
        }
        regist_form.submit();
    });

    //$('#myModal').on('okHidden', function(e){console.log('okHidden')})
    $('#myModal').on('cancelHide', function(e){
        showCancel();
    });

    //$('#myModal').on('cancelHidden', function(e){console.log('cancelHidden')})
}