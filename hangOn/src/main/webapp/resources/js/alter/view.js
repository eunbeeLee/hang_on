/**
 * mypage 진솔
 */

const myPageImgInput = $("#myPageImgInput");
const myPageImgURL = $("#myPageImgURL");
const myPageName = $("#myPageName");
const myPage = $("#myPage");
const myPageUserNo =  $("#myPageUserNo").val();
var checkType = null;
var passTimer = null;
var myPageUser = {
		"userNo" : myPageUserNo
};

$("#myPageAttachImgBtn").on("click",function(){
    myPageImgInput.click();
});
myPageImgInput.on("change",function(){
    if($(this).val().length == 0) return;
	let fileext = $(this).val();	
	fileext = fileext.slice(fileext.indexOf(".")+1).toUpperCase();
	if(fileext != "JPG"
   	 &&fileext != "PNG"
   	 &&fileext != "GIF"
   	 &&fileext != "BMP"
   	){
		$("#imgErrModalBtn").click();
		return;
	}
    myPageImgURL.val(this.value);
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#myPageProfileArea img").prop("src",e.target.result);
    };
    reader.readAsDataURL($(this)[0].files[0]);
    $("#myPageProfileImgBtn2").prop("checked",true);
	$.ajax({
		type:"POST",
		url:'/hangOn/alter/profile.json',
		processData: false,
		contentType: false,
		data: new FormData($("#uploadFileForm")[0]),
		error:(err)=>{console.log(err)}
	}).done(function (result) {
		$("#myPageProfileImgBtn2").prop("checked",true);
	});
});
$("#myPageProfileImgBtn2").on("click",function(){
    myPageImgInput.click();
});
$("#myPageProfileImgBtn1").on("click",function(){
    $("#myPageProfileArea img").prop("src","/hangOn/resources/image/defalutImg.jpg");
    myPageImgURL.val("");
    myPageUser["userProfilePath"] = "/resources/image/defalutImg.jpg";
    alterAjax('/hangOn/alter/updateInfo.json',myPageUser);
});
$("#myPageNameUpdateBtn").on("click",function(){
	if(myPageName.prop("readonly")){
		myPageName.css("background-color","white").prop("readonly",false);
		$("#myPageNameUpdateBtn i").text("check");
	}else{
		if($("#myPageName").val().length < 1 ){
			$("#nameErrModalBtn").click();
			return;
		}
		
		myPageName.css("background-color","khaki").prop("readonly",true);
		$("#myPageNameUpdateBtn i").text("create");
		myPageUser["userName"] = $("#myPageName").val();
		$("#userNameView").text(myPageUser["userName"]);
		alterAjax('/hangOn/alter/updateInfo.json',myPageUser);
	};
});
$("#openMyPageBtn").on("click",function(){
	myPage.fadeIn(300);
});
$("#myPageClose").on("click",function(){
	myPage.fadeOut(300);
});


$("#myPagePassBtn").on("click",function(){
	checkType = "pass";
	$("#passwordModalBtn").click();
})

$("#myPageOutBtn").on("click",function(){
	checkType = "exist";
	$("#passwordModalBtn").click();
})

function alterAjax(url,data,fn){
	$.ajax({
		type:"POST",
		url:url,
		data: data,
		error:(err)=>{console.log(err)}
	}).done(function (result) {
		myPageUser = {
				"userNo" : myPageUserNo
		};
		if(fn) fn(result);
	});
}



/*모달 생성함수*/
function modalUp(modalId, modalBody, btnText){
	var modalWrapper = document.querySelector("#backGroundByMyPage");
	var modal = '<div class="modal fade" id="'+modalId+'" tabindex="-1" role="dialog" aria-labelledby="'+modalId+'Label" aria-hidden="true">\
			      <div class="modal-dialog" role="document">\
				      <div class="modal-content">\
				        <div class="modal-header">\
				          <h5 class="modal-title" id="exampleModalLabel"><strong>알림</strong></h5>\
				          <button class="close" type="button" data-dismiss="modal" aria-label="Close">\
				            <span aria-hidden="true">×</span>\
				          </button>\
				        </div>\
				        <div class="modal-body">'+modalBody+'</div>\
				        <div class="modal-footer"> <span id="'+modalId+'ErrMsg" class="modal-err-msg"></span>\
				        <a id="'+modalId+'Close" class="btn btn-primary" href="#" data-dismiss="modal" aria-label="Close">'+btnText+'</a>\
				        </div>\
				      </div>\
				    </div>\
				  </div>\
				  <button style ="display : none;" id="'+modalId+'Btn" data-toggle="modal" data-target="#'+modalId+'"></button>';
	 modalWrapper.innerHTML += modal;
}
/*필요한 모달 추가 함수*/
function modalMaker(){
	modalUp("passwordModal", "<input id='passwordCheckInput' type='password' placeholder='현재 비밀번호를 입력해주세요!' />","취소");
	modalUp("passwordUpdateModal", `
	<input id='passUpdateInput' type='password' placeholder='새 비밀번호'/>
	<input id='passUpCheckInput' type='password' placeholder='비밀번호 확인'/>
	`,"취소");
	modalUp("nameErrModal", "올바른 이름을 입력해주세요!","확인");
	modalUp("imgErrModal", "이미지 파일만 등록이 가능합니다!","확인");
	modalUp("existModal", "정말 탈퇴하시겠습니까?","취소");
}

$(()=>{modalMaker()});

function checkPassFn(){
	
}
$("#backGroundByMyPage").on("keyup","#passwordCheckInput",function(){
	let thisEle = $(this);
	let pass = thisEle.val();
	clearTimeout(passTimer);
	passTimer = setTimeout(()=>{
		myPageUser["userPw"] = pass;
		alterAjax('/hangOn/alter/retrievePass.json',myPageUser,function(result){
			if(result == "err"){
				$("#passwordModalErrMsg").html("올바른 비밀번호를 입력해주세요!");
			}else{
				$(".modal-backdrop").remove();
				$("#passwordModal").fadeOut(100);
				$("#passwordModalErrMsg").html("");
				thisEle.val("");
				if(checkType == "pass"){
					checkType = null;
					$("#passwordUpdateModalBtn").click();
				}else{
					checkType = null;
					$("#existModalBtn").click();
					$("#existModalErrMsg").html("3");
					setTimeout(()=>{
						$("#existModalErrMsg").html("2");
						setTimeout(()=>{
							$("#existModalErrMsg").html("1");
							setTimeout(()=>{
								$("#existModalErrMsg").html(`
								<a id="existOkBtn" class="btn btn-primary" href="/hangOn/alter/exist.do?userNo=${myPageUser.userNo}">탈퇴</a>
								`);
							},1000)
						},1000)
					},1500)
				}
			}
		});
	},300);
});


