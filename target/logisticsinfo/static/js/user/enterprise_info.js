/**
 * 
 */
var flag = 0;
window.onload = function(){
	a[3].style = "color: blue;";
	a[3].onmouseleave = function(){
		this.style = "color: blue;";
	};
	a[3].onmouseover = function(){
		this.style = "color: blue;border-bottom: 5px solid red;";
	};
	var lis = $(".sui-nav li a");
	addChangeListener(lis);
	select();

};

function selectWithConditions() {
	var enterpriseName = $("#enterpriseName").val().trim();
	var enterpriseSort = $("#enterpriseSort").val().trim();
	var user_id = $("#issueUser").val().trim();
	console.log(enterpriseName, enterpriseSort, user_id);
	$.ajax({
		url: "http://localhost:8080/logisticsinfo/user/selectEnterpriseWithConditions?flag=" + flag,
		method: "post",
		data: JSON.stringify({
			"enterpriseName": enterpriseName,
			"enterpriseSort": enterpriseSort,
			"user": {
				"id": user_id
			}
		}),
		contentType: "application/json;charset=UTF-8",
		success: function (data) {
			console.log("查询成功");
			$(".enterpriseInfo").load("http://localhost:8080/logisticsinfo/user/conditionEnterprise_list?id=" + flag);
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
				$(".enterpriseInfo").load("http://localhost:8080/logisticsinfo/user/enterprise_list?id=0");
				flag = 0;
			}
			if(i === 1){
				$(".enterpriseInfo").load("http://localhost:8080/logisticsinfo/user/enterprise_list?id=1");
				flag = 1;
			}
			if (i === 2){
				console.log("adds")
				$(".enterpriseInfo").load("http://localhost:8080/logisticsinfo/user/addEnterpriseInfo");
				flag = 0;
			}

		}else {
			$(".sui-nav li").eq(i).removeClass("active");
		}
	}
}