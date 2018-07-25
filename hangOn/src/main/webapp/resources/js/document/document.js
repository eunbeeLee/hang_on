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
const documentPointerArea = $("#documentShareView");
const eraserSize = 30;
const halfSize = eraserSize/2;
const pos = {
        drawable: false,
        x: -1,
        y: -1,
        type:"mouse",
        color:"#000000"
};
const userProp = {
		userNo : $("#documentUserNo").val(),
		roomNo : parseInt($("#documentRoomNo").val()),
		code : $("#documentRoomCode").val()
}
const MAINHOST = "wss://192.168.0.2";
const docWs = new WebSocket(MAINHOST+'/hangOn/document/docview.do');
var drawData = {};
var canvasProp = {};


$(()=>{
	modalMaker();
	docWs.send(`conn::${userProp.userNo};${userProp.code}`);
})


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
	}else if(data[0]=="clear"){
		onClear(data[1]);
		return;
	}

	let obj = null;
	if(data[1]) obj = JSON.parse(data[1]);
	switch (data[0]) {
	case "conn" : documentConnEvt(obj); break;
	case "start": documentLoadStart(); break;
	case "load" : documentLoadEvt(obj); break;
	case "pointer" : onPointer(obj); break;
	case "text" : onText(obj); break;
	case "draw" : 
		switch (obj.type) {
		case "pen": onDraw(obj); break;
		case "eraser": onEraser(obj); break;
		}
		
	}
}

$("#documentFileUpload").on("change",function(){
	if($(this).val().length == 0) return;
	let fileext = $(this).val();	
	fileext = fileext.slice(fileext.indexOf(".")+1).toUpperCase();
	if(fileext != "PDF"){
		$("#pdfCheckMsgBtn").click();
		return;
	}
	$("#documentRoomNoForm").val(userProp.roomNo);
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
	setTimeout(function(){docWs.send(`getDrawInfo::${userProp.code};canvas${viewPage}`);},200);
}

function pageMoveKeyup(data){
	let realPage = documentViewOrder.attr("value");
	let orderPage = parseInt(data);
	if(isNaN(orderPage)){return;}
	documentShareView.attr("src",$("#documentIndex"+orderPage).children("img").attr("src"));
	documentViewOrder.val(orderPage);
	documentViewOrder.attr("value",orderPage);
	canvasPixel(orderPage);
	docWs.send(`viewPage::set;${userProp.code};${orderPage}`);
	setTimeout(function(){docWs.send(`getDrawInfo::${userProp.code};canvas${orderPage}`);},200);
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
	setTimeout(function(){docWs.send(`getDrawInfo::${userProp.code};canvas${viewPage}`);},200);
	
	$("#textInputViewArea").css({
		"height":documentShareView[0].clientHeight+"px",
		"width":documentShareView[0].clientWidth+"px"
	})
}



$("#documentChange button").on("click",()=>{documentUpload.click();})

function canvasPixel(index = 1){
	let view = $(`#canvas${index}`);
	$(".document-canvas").each((index,ele)=>{$(ele).css("display","none");});
	view.css({"display":"block"});
	getCanvas("canvas"+index);
}

function getCanvas(id){
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
	if(pos.type == "mouse") return;
	if(pos.type == "pointer"){
		pointer(event);
		return;
	}
    switch(event.type){
        case "mousedown":
            initDraw(event,id);
            break;

        case "mousemove":
        	switch (pos.type) {
			case "pen": if(pos.drawable) draw(event,id); break;
			case "eraser": if(pos.drawable) eraser(event,id); break;
			}    
            break;

        case "mouseout":
        case "mouseup":
            finishDraw(id);
            break;
    }
}

function pointer(event){
	var coors = getPosition(event);
	let id = event.target.id;
	let canvas = $("#"+id)[0];
	let pointerInfo = {};
	pointerInfo["top"] = coors.Y / canvas.clientHeight;
	pointerInfo["left"] = coors.X / canvas.clientWidth;
	pointerInfo["color"] = pos.color;
	pointerInfo["userNo"] = userProp.userNo;
	pointerInfo["canvas"] = id;

	if(!$(`#${userProp.userNo}pointer`).attr("value")){
		documentPointerArea.append(`
				<div id="${userProp.userNo}pointer" class="document-pointer-view" value="true"></div>
		`)
	}
	switch(event.type){
    case "mousedown":
    	$(`#${userProp.userNo}pointer`).css({"top":coors.Y,"left":coors.X,"border":`5px solid ${pos.color}`});
    	if($(`#${userProp.userNo}pointer`).css("display") == "none"){
    		$(`#${userProp.userNo}pointer`).css("display","block");
    		pointerInfo["display"] = "block";
    	}else{
    		$(`#${userProp.userNo}pointer`).css("display","none");
    		pointerInfo["display"] = "none";
    	}
    	pointerInfo["type"] = "view";
        break;

    case "mousemove":
    	$(`#${userProp.userNo}pointer`).css({"top":coors.Y,"left":coors.X});
    	pointerInfo["type"] = "move";
        break;
	}
	docWs.send(`pointer::${userProp.code};${JSON.stringify(pointerInfo)}`);
}
function onPointer(pointerInfo){
	let canvas = $("#"+pointerInfo.canvas)[0];
	let x = pointerInfo.left * canvas.clientWidth;
	let y = pointerInfo.top * canvas.clientHeight;
	
	
	if(!$(`#${pointerInfo.userNo}pointer`).attr("value")){
		documentPointerArea.append(`
				<div id="${pointerInfo.userNo}pointer" class="document-pointer-view" value="true"></div>
		`)
	}
	switch (pointerInfo.type) {
	case "view": $(`#${pointerInfo.userNo}pointer`).css({
						"display":pointerInfo.display,
						"top":y,
						"left":x,
						"border":`5px solid ${pointerInfo.color}`
				 }); break;
	case "move": $(`#${pointerInfo.userNo}pointer`).css({"top":y,"left":x}); break;
	}
}

function initDraw(event,id){
	canvasProp[id].ctx.beginPath(0,0);
    pos.drawable = true;
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    canvasProp[id].ctx.moveTo(pos.X, pos.Y);
    
    let canvas = $("#"+id)[0];
    drawData["id"] = id;
    drawData["moveX"] = pos.X / canvas.clientWidth;
    drawData["moveY"] = pos.Y / canvas.clientHeight;
}

function draw(event,id){
	canvasProp[id].ctx.strokeStyle = pos.color;
    var coors = getPosition(event);
    canvasProp[id].ctx.lineTo(coors.X, coors.Y);
    pos.X = coors.X;
    pos.Y = coors.Y;
    canvasProp[id].ctx.stroke();
    
    
    let canvas = $("#"+id)[0];
    let emitX = coors.X / canvas.clientWidth;
    let emitY = coors.Y / canvas.clientHeight;
    
    drawData["color"] = pos.color;
    if(drawData["line"]) drawData["line"].push({x:emitX,y:emitY});
    else drawData["line"] = [{x:emitX,y:emitY}];

}

function eraser(event,id) {
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    canvasProp[id].ctx.clearRect(pos.X,pos.Y,halfSize,halfSize);
    canvasProp[id].ctx.clearRect(pos.X-halfSize,pos.Y-halfSize,halfSize,halfSize);
    canvasProp[id].ctx.clearRect(pos.X-halfSize,pos.Y,halfSize,halfSize);
    canvasProp[id].ctx.clearRect(pos.X,pos.Y-halfSize,halfSize,halfSize);
    
    let canvas = $("#"+id)[0];
    let emitX = coors.X / canvas.clientWidth;
    let emitY = coors.Y / canvas.clientHeight;
    if(drawData["line"]) drawData["line"].push({x:emitX,y:emitY});
    else drawData["line"] = [{x:emitX,y:emitY}];
}

function finishDraw(id){
    pos.drawable = false;
    pos.X = -1;
    pos.Y = -1;
    drawData["type"] = pos.type;
    docWs.send(`draw::${userProp.code}:/:${id}:/:${JSON.stringify(drawData)}`);
    drawData["moveX"] = 0;
    drawData["moveY"] = 0;
    drawData["line"] = [];
}

function getPosition(event){
    var x = event.offsetX;
    var y = event.offsetY;
    return {X: x, Y: y};
}


$("#documentUtilBtns button").on("click",function(e){
	let types = $(this).val();
	if(types) pos.type = $(this).val()
});

$("#documentColorBtn").on("click",function(){
	$("#documentColor").click();
	$("#documentColor").on("change",function(){
		let color = $(this).val();
		pos.color = color;
		$("#colorLens").css("color",color)
	});
})



function onDraw(drawDatas){
	let id = drawDatas["id"];
	let canvas = $("#"+id)[0];

	canvasProp[id].ctx.strokeStyle = drawDatas["color"];
	canvasProp[id].ctx.beginPath(0,0);
	canvasProp[id].ctx.moveTo(drawDatas["moveX"] * canvas.clientWidth,drawDatas["moveY"] * canvas.clientHeight);
    for(let line of drawDatas["line"]){
        let onX = line.x * canvas.clientWidth;
        let onY = line.y * canvas.clientHeight;
    	canvasProp[id].ctx.lineTo(onX,onY);
    	canvasProp[id].ctx.stroke();
	}
    canvasProp[id].ctx.closePath();
}

function onEraser(drawDatas) {
	let id = drawDatas["id"];
	let canvas = $("#"+id)[0];
	
    for(let line of drawDatas["line"]){
        let onX = line.x * canvas.clientWidth;
        let onY = line.y * canvas.clientHeight;
    	canvasProp[id].ctx.clearRect(onX,onY,halfSize,halfSize);
        canvasProp[id].ctx.clearRect(onX-halfSize,onY-halfSize,halfSize,halfSize);
        canvasProp[id].ctx.clearRect(onX-halfSize,onY,halfSize,halfSize);
        canvasProp[id].ctx.clearRect(onX,onY-halfSize,halfSize,halfSize);
	}
}

$("#documentAllClear").on("click",()=>{
	canvas = `canvas${documentViewOrder.val()}`;
	docWs.send(`clear::${userProp.code};${canvas}`);
})

function onClear(id) {
	canvas = $(`#${id}`)[0];
    let X = canvas.clientWidth;
    let Y = canvas.clientHeight;
    canvasProp[id].ctx.clearRect(0,0,X,Y);
}

$("#documentTextBtn").on("click",function(){
	$("#textInputViewArea").css("display","block");
	$("#textInputBox").remove();
	$("#textInputViewArea").append(`
        	<div id="textInputBox" class="document-text-area">
				<div id="textInputMsg" class="input-text-area" contenteditable="true">
				</div>
				<button id="textRemoveBtn" class="text-btn-info btn btn-default"><i>취소<i/></button>
				<button id="textInsertBtn" class="text-btn-info btn btn-default"><i>입력</i></button>
			</div>
	`)
});

$("#textInputViewArea")
.on("mousedown",".document-text-area",function() {
    $(this).draggable({ disabled: false });
})
.on("click",".document-text-area",function(){
	$(this).draggable({ disabled: true });
})
.on("mouseup",".document-text-area",function(){
	let textBox = $(this);
	textBoxJoin(textBox);
})
.on("mouseout",".document-text-area",function(){
	let textBox = $(this);
	textBoxJoin(textBox);
});

function textBoxJoin(textBox){
	let area = $("#textInputViewArea")[0];
	let boxX = textBox[0].offsetLeft;
	let boxY = textBox[0].offsetTop;
	let areaX = area.clientWidth;
	let areaY = area.clientHeight;
	
	if(boxX<0) textBox.css("left","0px");
	if(boxY<0) textBox.css("top","0px");
	if(boxX>areaX) textBox.css("left",`${areaX-textBox[0].clientWidth}px`);
	if(boxY>areaY) textBox.css("top",`${areaY-textBox[0].clientHeight}px`);
};
$("#textInputViewArea").on("click","#textRemoveBtn",function(){
	$("#textInputBox").remove();
});
$("#textInputViewArea").on("click","#textInsertBtn",function(){
	let textInfo = $("#textInputMsg");
	let textInputBox = $("#textInputBox");
	if(textInfo.text().replace(/^\s+|\s+$/g, "").length < 1){
		textInputBox.remove();
		return;
	}
	let textBox = $("#textInputBox");
	$(".document-canvas").each((index,ele)=>{
		if($(ele).css("display") == "block"){	
			let id = $(ele).prop("id");
			let obj = {
					"id"  : id,
					"x"   : (textBox[0].offsetLeft+5)/$(ele)[0].clientWidth,
					"y"   : (textBox[0].offsetTop+51)/$(ele)[0].clientHeight,
					"msg" : textInfo.html().replace(/&nbsp;/g," "),
					"color" : pos.color
			}
			docWs.send(`text::${userProp.code};${id};${JSON.stringify(obj)}`);
			textInputBox.remove();
			return;
		}
	});
});
function onText(textData){
	let id = textData["id"];
	let canvas = $("#"+id)[0];
	let ctx = canvas.getContext('2d');
	ctx.font = "normal 20px 고딕";
	ctx.textBaseline = "top";
    let x = textData["x"]*canvas.clientWidth;
    let y = textData["y"]*canvas.clientHeight;
    
    console.log(textData["msg"]);
    let texts = textData["msg"].replace(/<\/div>/g,"").split("<div>");
    for(let text of texts){
    	if(text == "<br>"){
    		y = y+20;
    		continue;
    	}
    	ctx.fillStyle = textData["color"];
        ctx.fillText(text,x,y);
        y = y+20;
    }
}



/*모달 생성함수*/
function modalUp(modalId, modalBody){
	var modalWrapper = document.querySelector("#backGroundByDocument");
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
				        <div class="modal-footer">'
				        if(modalId == "delModal" || modalId == "delMemberModal"  ){
				        	modal += '<a class="btn btn-danger" href="#" id="'+modalId+'CheckBtn" data-dismiss="modal" aria-label="Close">확인</a>';
				        }else{
				        	modal += '<a class="btn btn-primary" href="#" data-dismiss="modal" aria-label="Close">확인</a>';
				        }
				 modal +='</div>\
				      </div>\
				    </div>\
				  </div>\
				  <button style ="display : none;" id="'+modalId+'Btn" data-toggle="modal" data-target="#'+modalId+'"></button>';
	 modalWrapper.innerHTML += modal;
}
/*필요한 모달 추가 함수*/
function modalMaker(){
	modalUp("pdfCheckMsg", "PDF 확장자만 업로드가 가능합니다!");
}

