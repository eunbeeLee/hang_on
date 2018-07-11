/**
 * document 진솔
 */
const documentArea = $("#documentArea");
const bodyIdSelector = $("#page-top")
const documentList = $("#documentList");
const documentShareView = $("#documentShareView img");
const documentUpload = $("#documentFileUpload");
const documentReadyScreen = $("#documentReadyScreen");
const documentViewing = {view : false};
$('#documentNav').click(function(e) { 
	e.preventDefault(); 
	if(!documentViewing.view){
		documentUpload.click();
		return;
	}
	documentArea.slideToggle(300);
});

$(".document-attach").on("click",function(){
	documentUpload.click();
});

$("#documentFileUpload").on("change",function(){
	documentViewing.view = true;
	!bodyIdSelector.hasClass("sidenav-toggled") && bodyIdSelector.addClass("sidenav-toggled");
	documentArea.slideDown(300);
    var reader = new FileReader();
    reader.onload = function (e) {
        PDFObject.embed(e.target.result,"#documentViewArea",{id:"documentViewer"});
    };
    reader.readAsDataURL($(this)[0].files[0]);

	$.ajax({
		type:"POST",
		url:'/hangOn/document/parser.json',
		processData: false,
		contentType: false,
		data: new FormData($("#uploadFileForm")[0]),
		error:(err)=>{console.log(err)}
	}).done(function (result) {
		documentList.html("");
		result.document.forEach((data,index)=>{
			index==0 && documentShareView.attr("src",`/hangOn/${data.docPath}`);
			documentList.append(`
				<div class="document-list-prev">
	        		<img src="/hangOn/${data.docPath}">
	        		<span>${index+1}</span>
	        	</div>
			`);
		});
		documentReadyScreen.fadeOut(300)
	}).start(documentReadyScreen.fadeIn(300));
});

documentList.on("click",".document-list-prev",function(){
	documentShareView.attr("src",$(this).children("img").attr("src"));
})

$("#documentChange button").on("click",()=>{documentUpload.click();})