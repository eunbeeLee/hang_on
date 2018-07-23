/**
 * mypage 진솔
 */

const myPageImgInput = $("#myPageImgInput");
const myPageImgURL = $("#myPageImgURL");
const myPageName = $("#myPageName");
const myPage = $("#myPage");
const myPageUserNo =  $("#myPageUserNo").val();
var myPageUser = {
		"userNo" : myPageUserNo
};

$("#myPageAttachImgBtn").on("click",function(){
    myPageImgInput.click();
});
myPageImgInput.on("change",function(){
    myPageImgURL.val(this.value);
    if($(this).val().length == 0) return;
	let fileext = $(this).val();	
	fileext = fileext.slice(fileext.indexOf(".")+1).toUpperCase();
	if(fileext != "JPG"
   	 &&fileext != "PNG"
   	 &&fileext != "GIF"
   	 &&fileext != "BMP"
   	){
		alert("이미지 파일만 등록이 가능합니다.");
		return;
	}
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

function alterAjax(url,data){
	$.ajax({
		type:"POST",
		url:url,
		data: data,
		error:(err)=>{console.log(err)}
	}).done(function (result) {
		myPageUser = {
				"userNo" : myPageUserNo
		};
	});
}



