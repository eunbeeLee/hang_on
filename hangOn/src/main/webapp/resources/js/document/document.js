/**
 * document 진솔
 */
const bodyIdSelector = $("#page-top")
$('#documentNav').click(function(e) { 
	e.preventDefault(); 
	$("#documentArea").slideToggle(300);
});

$(".document-attach").on("click",function(){
	$("#documentFileUpload").click();
});

$("#documentFileUpload").on("change",function(){
	!bodyIdSelector.hasClass("sidenav-toggled") && bodyIdSelector.addClass("sidenav-toggled");
	$("#documentReadyScreen").fadeOut(300);
    var reader = new FileReader();
    reader.onload = function (e) {
        PDFObject.embed(e.target.result,"#documentViewArea",{id:"documentViewer"});
    };
    reader.readAsDataURL($(this)[0].files[0]);
});