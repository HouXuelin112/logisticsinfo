/**
 * 
 */
var flag = 0;
window.onload = function(){
	a[1].style = "color: blue;";
	a[1].onmouseleave = function(){
		this.style = "color: blue;";
	};
	a[1].onmouseover = function(){
		this.style = "color: blue;border-bottom: 5px solid red;";
	};
	var lis = $(".sui-nav li a");
	addChangeListener(lis);
	select();

};

function selectWithConditions() {
	var tradeMark = $("#tradeMark").val().trim();
	var brand = $("#brand").val().trim();
	var style = $("#style").val().trim();
	var carLoad = $("#carLoad").val().trim();
	var transportStyle = $("#transportStyle").val().trim();
	$.ajax({
		url: "http://localhost:8080/logisticsinfo/user/selectWithConditions?flag=" + flag,
		method: "post",
		data: JSON.stringify({
			"tradeMark": tradeMark,
			"brand": brand,
			"style": style,
			"carLoad": carLoad,
			"transportStyle": transportStyle,
		}),
		contentType: "application/json;charset=UTF-8",
		success: function (data) {
			console.log("查询成功");
			$(".carInfo").load("http://localhost:8080/logisticsinfo/user/conditionCar_list?id=" + flag);
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
				$(".carInfo").load("http://localhost:8080/logisticsinfo/user/carInfo_list?id=0");
				flag = 0;
			}
			if(i === 1){
				$(".carInfo").load("http://localhost:8080/logisticsinfo/user/carInfo_list?id=1");
				flag = 1;
			}
			if (i === 2){
				console.log("adds")
				$(".carInfo").load("http://localhost:8080/logisticsinfo/user/addCarInfo");
				flag = 0;
			}

		}else {
			$(".sui-nav li").eq(i).removeClass("active");
		}
	}
}