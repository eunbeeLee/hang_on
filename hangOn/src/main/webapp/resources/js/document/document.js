/**
 * document 진솔
 */
const documentArea = $("#documentArea");
const bodyIdSelector = $("#page-top")
const documentList = $("#documentList");
const documentShareView = $("#documentViewImg");
const documentUpload = $("#documentFileUpload");
const documentReadyScreen = $("#documentReadyScreen");
const documentViewOrder = $("#documentViewPageOrder");
const docIndex = $("#documentMaxIndex");
const documentViewing = {view : false};
const pos = {
        drawable: false,
        x: -1,
        y: -1,
        type:"mouse",
        color:"#000000"
};
const userProp = {
		userNo : $("#documentUserNo").val(),
		roomNo : $("#documentRoomNo").val(),
		code : $("#documentRoomCode").val()
}
const MAINHOST = "ws://localhost";
const docWs = new WebSocket(MAINHOST+'/hangOn/document/docview.do');

$(()=>{
	docWs.send(`conn::${userProp.userNo};${userProp.code}`);
})


var canvasProp = {};
$('#documentNav').click(function(e) { 
	e.preventDefault(); 
	if(!documentViewing.view){
		documentUpload.click();
		return;
	}
	documentArea.slideToggle(300);
	setTimeout(()=>{docWs.send(`docView::${userProp.code};${documentArea.css("display")}`);},400);
});

$(".document-attach").on("click",function(){
	documentUpload.click();
});

docWs.onmessage = function(evt) {
	let data = evt.data.split("::");
	if(data[0]=="pageMove"){
		pageMoveOrder(data[1]);
		return;
	}else if(data[0]=="viewPage"){
		viewPageOrder(data[1]);
		return;
	}else if(data[0]=="docView"){
		docViewOrder(data[1]);
		return;
	}
	let obj = null;
	if(data[1]) obj = JSON.parse(data[1]);
	switch (data[0]) {
	case "conn" : documentConnEvt(obj); break;
	case "start": documentLoadStart(); break;
	case "load" : documentLoadEvt(obj); break;
	}
}

$("#documentFileUpload").on("change",function(){
	if($(this).val().length == 0) return;
	docWs.send(`start::${userProp.code}`);
	$.ajax({
		type:"POST",
		url:'/hangOn/document/parser.json',
		processData: false,
		contentType: false,
		data: new FormData($("#uploadFileForm")[0]),
		error:(err)=>{console.log(err)}
	}).done(function (result) {
		docWs.send(`pdfLoad::${userProp.userNo};${userProp.code};`+JSON.stringify(result));
	});
});

function docViewOrder(result){
	switch (result) {
	case "none": documentArea.slideUp(300); break;
	case "block": documentArea.slideDown(300); break;
	}
};

function documentConnEvt(result){
	if(result){
		documentLoadStart();
		documentLoadEvt(result,true);
	}
};

function documentLoadStart(){
	documentViewing.view = true;
	!bodyIdSelector.hasClass("sidenav-toggled") && bodyIdSelector.addClass("sidenav-toggled");
	documentArea.slideDown(300);
	documentReadyScreen.css("display","block");
};
	
function documentLoadEvt(result,orderPage){
	$(".document-canvas").each(function(index,ele){
		let id = $(ele).prop("id");
		if(canvasProp[id]) canvasProp[id] = null;
		$(ele).remove();
	})
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
		canvasSize(`canvas${index+1}`,`/hangOn/${data.docPath}`);
	});

	$("#canvas1").css("display","block");
	PDFObject.embed("/hangOn"+result.docOriPath,"#documentViewArea",{id:"documentViewer"});
	documentViewOrder.val(1);
	documentViewOrder.attr("value",1);
	documentReadyScreen.fadeOut(300)
	setTimeout(canvasPixel,100);
	if(orderPage){
		setTimeout(pageViewOrderEvt,200);
	}
}
function pageViewOrderEvt() {
	docWs.send(`viewPage::get;${userProp.code}`);
}

function canvasSize(id,src){
	$("#documentShareView").append(`<img id="${id}img" src="${src}">`)
	setTimeout(()=>{
		let size = $(`#${id}img`)[0];
		$("#documentShareView").append(`
				<canvas id="${id}" class="document-canvas"
				width="${size.clientWidth}px" height="${size.clientHeight+50}px"></canvas>
		`);
		$(`#${id}img`).remove();
	},100)
}




$(".document-order-btn").on("click",function(){
	docWs.send(`pageMove::btn;${userProp.code};${$(this).prop("id")}`);
});

documentViewOrder.on("keyup",function(){
	docWs.send(`pageMove::keyup;${userProp.code};${documentViewOrder.val()}`);
});

documentList.on("click",".document-list-prev",function(){
	docWs.send(`pageMove::list;${userProp.code};${$(this).children("span").text()}`);
});

function pageMoveOrder(order){
	let arr = order.split(";")
	switch (arr[0]) {
	case "list": pageMoveList(arr[1]); break;
	case "keyup": pageMoveKeyup(arr[1]); break;
	case "btn": pageMoveBtn(arr[1]); break;
	}
};

function pageMoveList(data){
	let viewPage = parseInt(data);
	documentShareView.attr("src",$(this).children("img").attr("src"));
	documentViewOrder.val(viewPage);
	documentViewOrder.attr("value",viewPage);
	documentShareView.attr("src",$("#documentIndex"+viewPage).children("img").attr("src"));
	canvasPixel(viewPage);
	docWs.send(`viewPage::set;${userProp.code};${viewPage}`);
}

function pageMoveKeyup(data){
	let realPage = documentViewOrder.attr("value");
	let orderPage = parseInt(data);
	if(isNaN(orderPage)){return;}
	documentShareView.attr("src",$("#documentIndex"+orderPage).children("img").attr("src"));
	documentViewOrder.attr("value",orderPage);
	canvasPixel(orderPage);
	docWs.send(`viewPage::set;${userProp.code};${orderPage}`);
}

function pageMoveBtn(data){
	let viewPage = parseInt(documentViewOrder.attr("value"));
	switch (data) {
	case "doc-util-btn-left": 
		viewPage -= 1;
		if(viewPage == 0) return;
		break;
	case "doc-util-btn-right":
		viewPage += 1;
		if(viewPage > docIndex.text()) return;
		break;
	} 
	viewPageOrder(viewPage);
	docWs.send(`viewPage::set;${userProp.code};${viewPage}`);
}

function viewPageOrder(viewPage){
	documentViewOrder.val(viewPage);
	documentViewOrder.attr("value",viewPage);
	documentShareView.attr("src",$("#documentIndex"+viewPage).children("img").attr("src"));
	canvasPixel(viewPage);
}



$("#documentChange button").on("click",()=>{documentUpload.click();})

function canvasPixel(index){
	if(index==undefined) index = 1;
	let view = $(`#canvas${index}`);
	$(".document-canvas").each((index,ele)=>{$(ele).css("display","none");});
	view.css({"display":"block"});
	getCanvas("canvas"+index);
}

function getCanvas(id){
	if(canvasProp[id]) return;
    let canvas = document.getElementById(id);
    let ctx = canvas.getContext("2d");
    canvasProp[id] = {"canvas" : canvas , "ctx" : ctx};
    canvasProp[id].canvas.addEventListener("mousedown", listener);
    canvasProp[id].canvas.addEventListener("mousemove", listener);
    canvasProp[id].canvas.addEventListener("mouseup", listener);
    canvasProp[id].canvas.addEventListener("mouseout", listener);
}


function listener(event){
	let id = event.target.id;
    switch(event.type){
        case "mousedown":
            initDraw(event,id);
            break;

        case "mousemove":
        	switch (pos.type) {
			case "mouse": return; break;
			case "pen": if(pos.drawable) draw(event,id); break;
			case "eraser": if(pos.drawable) eraser(event,id); break;
			}    
            break;

        case "mouseout":
        case "mouseup":
            finishDraw();
            break;
    }
}
function initDraw(event,id){
	canvasProp[id].ctx.beginPath(0,0);
    pos.drawable = true;
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    canvasProp[id].ctx.moveTo(pos.X, pos.Y);
}

function draw(event,id){
	canvasProp[id].ctx.strokeStyle = pos.color;
    var coors = getPosition(event);
    canvasProp[id].ctx.lineTo(coors.X, coors.Y);
    pos.X = coors.X;
    pos.Y = coors.Y;
    canvasProp[id].ctx.stroke();
}

function eraser(event,id) {
	let eraserSize = 30;
	let halfSize = eraserSize/2;
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    canvasProp[id].ctx.clearRect(pos.X,pos.Y,halfSize,halfSize);
    canvasProp[id].ctx.clearRect(pos.X-halfSize,pos.Y-halfSize,halfSize,halfSize);
    canvasProp[id].ctx.clearRect(pos.X-halfSize,pos.Y,halfSize,halfSize);
    canvasProp[id].ctx.clearRect(pos.X,pos.Y-halfSize,halfSize,halfSize);
}

function finishDraw(){
    pos.drawable = false;
    pos.X = -1;
    pos.Y = -1;
}

function getPosition(event){
    var x = event.offsetX;
    var y = event.offsetY;
    return {X: x, Y: y};
}


$("#documentUtilBtns button").on("click",function(e){
	let types = $(this).val();
	if(types) pos.type = $(this).val()
	console.log(types)
});

$("#documentColorBtn").on("click",function(){
	$("#documentColor").click();
	$("#documentColor").on("change",function(){
		let color = $(this).val();
		pos.color = color;
		$("#colorLens").css("color",color)
	});
})

