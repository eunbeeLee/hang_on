/**
 * mypage 진솔
 */

const myPageImgInput = $("#myPageImgInput");
const myPageImgURL = $("#myPageImgURL");
const myPageName = $("#myPageName");
$("#myPageAttachImgBtn").on("click",function(){
    myPageImgInput.click();
});
myPageImgInput.on("change",function(){
    myPageImgURL.val(this.value);
    var reader = new FileReader();
    reader.onload = function (e) {
        $("#myPageProfileArea img").prop("src",e.target.result);
    };
    reader.readAsDataURL($(this)[0].files[0]);
    $("#myPageProfileImgBtn2").prop("checked",true)
});
$("#myPageProfileImgBtn2").on("click",function(){
    myPageImgInput.click();
});
$("#myPageProfileImgBtn1").on("click",function(){
    $("#myPageProfileArea img").prop("src","/hangOn/resources/image/defalutImg.jpg");
    myPageImgURL.val("");
});
$("#myPageNameUpdateBtn").on("click",function(){
	if(myPageName.prop("readonly")){
		myPageName.css("background-color","white").prop("readonly",false);
		$("#myPageNameUpdateBtn i").text("check");
	}else{
		myPageName.css("background-color","khaki").prop("readonly",true);
		$("#myPageNameUpdateBtn i").text("create");
	}
})