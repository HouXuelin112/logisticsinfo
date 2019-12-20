/**
 *
 */
var flag = 0;
window.onload = function(){
	a[2].style = "color: blue;";
	a[2].onmouseleave = function(){
		this.style = "color: blue;";
	};
	a[2].onmouseover = function(){
		this.style = "color: blue;border-bottom: 5px solid red;";
	};
	var lis = $(".sui-nav li a");
	addChangeListener(lis);
	select();
};

function selectWithConditions() {
	var goodsStyle = $("#goodsStyle").val().trim();
	var goodsName = $("#goodsName").val().trim();
	$.ajax({
		url: "http://localhost:8080/logisticsinfo/user/selectGoodsWithConditions?flag=" + flag,
		method: "post",
		data: JSON.stringify({
			"goodsStyle": goodsStyle,
			"goodsName": goodsName
		}),
		contentType: "application/json;charset=UTF-8",
		success: function (data) {
			console.log("查询成功");
			$(".goodsInfo").load("http://localhost:8080/logisticsinfo/user/conditionGoods_list?id=" + flag);
			selectForm.reset();
		},
		error: function (xhr) {
			console.log("请求失败",xhr);
		}
	})
}

function select() {
	$("#submit").click(function () {
		selectWithConditions();
	});
}


function addChangeListener(lis) {
	lis.each(function (i, e) {
		console.log(i, e);
		lis.eq(i).on("click", function () {

			addActive($(".sui-nav li").eq(i));
			console.log("flag", flag);
		})
	})
}

function addActive(li) {
	let lis = $(".sui-nav li");
	for (let i=0; i < lis.length; i++){
		if(lis[i] === li[0]){
			$(".sui-nav li").eq(i).addClass("active");
			console.log(i)
			if(i === 0){
				$(".goodsInfo").load("http://localhost:8080/logisticsinfo/user/goodsInfo_list?id=0");
				flag = 0;
			}
			if(i === 1){
				$(".goodsInfo").load("http://localhost:8080/logisticsinfo/user/goodsInfo_list?id=1");
				flag = 1;
			}
			if (i === 2){
				console.log("adds")
				$(".goodsInfo").load("http://localhost:8080/logisticsinfo/user/addGoodsInfo");
				flag = 0;
			}

		}else {
			$(".sui-nav li").eq(i).removeClass("active");
		}
	}
}