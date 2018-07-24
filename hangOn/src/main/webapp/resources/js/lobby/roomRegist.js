/**
 * lobby 은진
 */
$( document ).ready(function() {
	$("#roomEntrance").hide();
	$("#roomRegist").show();
});
$("#roomEntranceNav").click(function () {
	$("#roomEntranceNav").attr("class", "active");
	$("#roomRegistNav").attr("class", "");
	
	$("#roomEntrance").show();
    $("#roomRegist").hide();
    $("#roomEntranceNav").children("a").css("color", "#a585c6");
    $("#roomRegistNav").children("a").css("color", "#494949");
})
$("#roomRegistNav").click(function () {
	$("#roomRegistNav").attr("class", "active");
	$("#roomEntranceNav").attr("class", "");
	
	$("#roomEntrance").hide();
    $("#roomRegist").show();
    $("#roomRegistNav").children("a").css("color", "#a585c6");
    $("#roomEntranceNav").children("a").css("color", "#494949");
})

$(".plus").click(function () {
//	$("#roomEntranceBtn").click();
	$("#roomRegistBox").slideDown();
})
$(".close").click(function(){
	$("#roomRegistBox").slideUp(300);
})
$(".back").click(function () {
	$("#roomRegistBox").slideUp(300);
})

// 코드입력, 비밀번호 입력 공백 체크 및 공백 제거
function noSpaceForm(obj) { 
    var str_space = /\s/;  
    if(str_space.exec(obj.value)) { 
    	alert('해당 항목에는 공백을 사용하실 수 없습니다.');
        obj.focus();
        obj.value = obj.value.replace(' ',''); 
        return false;
    }
}
$("input[name=roomJoinCode]").keyup(function () {
	noSpaceForm(this);
});
$("input[name=roomPassword]").keyup(function () {
	noSpaceForm(this);
});

$("#roomFindBtn").click(function (e) {
	var $code = $("input[name=roomJoinCode]");
	var $pass = $("#findPass");
	if($code.val().length == 0) {
		$("roomEnWarn").attr("visibility", "block");
		alert("방 코드를 입력해주세요");
		$code.select();
	} else if($pass.val().length == 0) {
		alert("방 비밀번호를 입력해주세요");
		$pass.select();
	} else if($pass.val().length < 4 || $pass.val().length > 8) {
		alert("방 비밀번호를 4자~8자로 입력해주세요.");
		$pass.select();
	} else {
		$("#roomFindForm").submit();
	}
});

$("#roomRegistBtn").click(function () {
	var $name = $("input[name=roomName]");
	var $pass = $("#roomPassword");
	if($name.val().length == 0) {
		alert("방 이름을 설정해주세요");
		$name.select();
	} else if($pass.val().length == 0) {
		alert("방 비밀번호를 입력해주세요");
		$pass.select();
	} else if($pass.val().length < 4 || $pass.val().length > 8) {
		alert("방 비밀번호는 4자~8자로 설정해주세요.");
		$pass.select();
	} else {
		$("#roomRegistForm").submit();
	}
});

