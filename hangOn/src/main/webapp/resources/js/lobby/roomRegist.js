/**
 * lobby 은진
 */
$(".room-find").click(function () {
	$("#roomEntrance").show();
    $("#roomRegist").hide();
})
$(".room-regist").click(function () {
	$("#roomEntrance").hide();
    $("#roomRegist").show();
})

$(".plus").click(function () {
	$("#roomRegistBox").slideDown();
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
	var $pass = $("input[name=roomPassword]");
	if($code.val().length == 0) {
		alert("방 코드를 입력해주세요");
		$code.select();
	} else if($pass.val().length == 0) {
		alert("방 비밀번호를 입력해주세요");
		$pass.select();
	} else if($pass.val().length < 8 || $pass.val().length > 10) {
		alert("방 비밀번호를 확인해주세요");
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
	} else if($pass.val().length < 8 || $pass.val().length > 10) {
		alert("방 비밀번호를 확인해주세요");
		$pass.select();
	} else {
		$("#roomRegistForm").submit();
	}
});





