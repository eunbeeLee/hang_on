/**
 * document 진솔
 */
const documentArea = $("#documentArea");
const bodyIdSelector = $("#page-top")
const documentList = $("#documentList");
const documentShareView = $("#documentShareView img");
const documentUpload = $("#documentFileUpload");
const documentReadyScreen = $("#documentReadyScreen");
const documentViewOrder = $("#documentViewPageOrder");
const docIndex = $("#documentMaxIndex");
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
	if($(this).val().length == 0) return;
	documentViewing.view = true;
	!bodyIdSelector.hasClass("sidenav-toggled") && bodyIdSelector.addClass("sidenav-toggled");
	documentArea.slideDown(300);
	documentReadyScreen.css("display","block")
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
				<div id="documentIndex${index+1}" class="document-list-prev">
	        		<img src="/hangOn/${data.docPath}">
	        		<span>${index+1}</span>
	        	</div>
			`);
			docIndex.html(index+1);
			$("#documentShareView").append(`
					<canvas id="canvas${index+1}" class="document-canvas"
					></canvas>
			`);
		});
		console.dir(documentShareView)
		$("#canvas1").css("display","block");
		PDFObject.embed("/hangOn"+result.docOriPath,"#documentViewArea",{id:"documentViewer"});
		documentViewOrder.val(1);
		documentViewOrder.attr("value",1);
		documentReadyScreen.fadeOut(300)
	});
});

$(".document-order-btn").on("click",function(){
	let viewPage = parseInt(documentViewOrder.attr("value"));
	switch ($(this).prop("id")) {
	case "doc-util-btn-left": 
		viewPage -= 1;
		if(viewPage == 0) return;
		break;
	case "doc-util-btn-right":
		viewPage += 1;
		if(viewPage > docIndex.text()) return;
		break;
	} 
	documentViewOrder.val(viewPage);
	documentViewOrder.attr("value",viewPage);
	documentShareView.attr("src",$("#documentIndex"+viewPage).children("img").attr("src"));
})

documentViewOrder.on("keyup",function(){
	let realPage = documentViewOrder.attr("value");
	let orderPage = parseInt(documentViewOrder.val());
	if(isNaN(orderPage)){return;}
	documentShareView.attr("src",$("#documentIndex"+orderPage).children("img").attr("src"));
	documentViewOrder.attr("value",orderPage);
})

documentList.on("click",".document-list-prev",function(){
	let viewPage = $(this).children("span").text();
	documentShareView.attr("src",$(this).children("img").attr("src"));
	documentViewOrder.val(viewPage);
	documentViewOrder.attr("value",viewPage);
})

$("#documentChange button").on("click",()=>{documentUpload.click();})



