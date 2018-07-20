// css 동적 추가
const pdf="ppt,pdf,pptx";
const apk="apk,exe";
const txt="txt";
const zip="zip,gz,7zip";
const jpg="jpg,jpeg,img,png";
const maxCloudSize=1024*1024*500;
const maxFileSize=1024*1024*100;
var curCloudSize=0;

$(document).ajaxStart(function() {
    // show loader on start
    $("#loader").css("display","block");
    $(".cloud-manager").css("opacity",0.7);
}).ajaxSuccess(function() {
    // hide loader on success
    $("#loader").css("display","none");
    $(".cloud-manager").css("opacity",1);
});

function init(){
	$("#page-top > div.content-wrapper > section > table > tbody > tr").on("mouseover",function(){
		$(this).children(".more-btn").css("opacity",1)
	});
	$("#page-top > div.content-wrapper > section > table > tbody > tr").on("mouseout",function(){
		$(this).children(".more-btn").css("opacity",0);
	});
}
init();



// 용량 계산
function byteCalculation(bytes) {
    var bytes = parseInt(bytes);
    var s = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB'];
    var e = Math.floor(Math.log(bytes)/Math.log(1024));
    if(e == "-Infinity") return "0 "+s[0]; 
    else 
    return (bytes/Math.pow(1024, Math.floor(e))).toFixed(2)+s[e];
}


$('.btn-upload').click(function(){
	$("#cloudForm > input[type=file]").trigger('click');
});
$('.btn-newFolder').click(function(){
	$("#modalNewFolder").toggle( "fast" );
});

$("#modalNewFolder > button").click(function(){
	$("#modalNewFolder").toggle(  "fast" );
	var fileName = $('#modalNewFolder > input[type="text"]').val();
	var filePath = $("input[name='path']").val();
	$.ajax({
		url:'newFolder.json',
		dataType:"json",
		data:{"filePath":filePath,"fileName":fileName}
	}).done(function(response){
		makeCloudList(response);
	});
});
// 파일 목록 가져오기
$("#cloudNav").click(function(){
	var filePath = $("input[name='path']").val();
	 $.ajax({
        url:'cloudList.json',
        dataType:"json",
        data:{"path":filePath}
    }).done(function(response){
    	makeCloudList(response);
    });
})
// 클라우드에 파일 업로드
$('#cloudUpload').bind('change', function() {
    var idx = $(this).parent().parent().index();
    var frm = document.getElementById('cloudForm');
    for(file of frm[2].files){ 	//용량 수정
    	if(file.size>maxFileSize){
    		alert("해당 파일은 "+byteCalculation(file.size)+" 이며 " +byteCalculation(maxFileSize)+" 용량을 초과합니다.");
    		return;
    	}
    	if(file.size+curCloudSize>maxCloudSize){
    		alert("현재 사용량은 "+byteCalculation(curCloudSize)+" 이며 " +byteCalculation(maxFileSize)+" 용량을 초과합니다.");
    		return;
    	}
    }
    frm.method = 'POST';
    frm.enctype = 'multipart/form-data';
    var fileData = new FormData(frm);
  
    // ajax
    $.ajax({
        url:'upload.json',
        type:'POST',
        data:fileData,
        async:false,
        cache:false,
        contentType:false,
        processData:false
    }).done(function(response){
    	makeCloudList(response);
    	$("#cloudUpload").val("");
    });
    
});
//  파일삭제
function cloudDelt(filePath,curPath){
	var curPath = $("input[name='path']").val();
	$.ajax({
		url:'cloudDelt.json',
		dataType:"json",
		data:{"filePath":filePath,"curPath":curPath}
	}).done(function(response){
		makeCloudList(response);
	});
}
// 경로 파일정보 함수
function pathList(filePath){
	 $.ajax({
        url:'cloudList.json',
        dataType:"json",
        data:{"path":filePath}
    }).done(function(response){
    	makeCloudList(response);
    });
}
// 사용량 bar 그리기
function move(Bar) {
	  var elem = document.getElementById("cloudUsageBar");   
	  var width = 1;
	  var id = setInterval(frame, 10);
	  function frame() {
	    if (width >= Bar) {
	      clearInterval(id);
	    } else {
	      width++; 
	      elem.style.width = width + '%'; 
	    }
	  }
};
// 사용량 그리기

function cloudUsage(cloudSize) {
	$("#cloudUsageNum").html(byteCalculation(maxCloudSize)+" 중 "+byteCalculation(cloudSize)+" 사용" );
	move(Math.ceil((cloudSize/maxCloudSize)*100));
}

// 파일목록 생성함수
function makeCloudList(response){
	curCloudSize=response.cloudSize;
	cloudUsage(curCloudSize);
    let $cloudTitle =$(".cloud-title");
    let pathArr = response.list[0].filePath.split('\\');
    var title = `<span><a href='javascript:void(0);' onclick="pathList('');">파일</a></span>`;
    var path="";
    for(let i=4; i<pathArr.length;i++ ){
    	path+=pathArr[i];
    	title+=`<i class="material-icons">keyboard_arrow_right
    			</i><span><a href='javascript:void(0);' onclick="pathList('`+'/'+path+`');">`+pathArr[i]+` </a></span> `;
    	path+="/";
    }
    $("input[name='path']").val(path);
    $cloudTitle.html("");
    $cloudTitle.html(title);
    let html="";
    var cnt=0;
    for(file of response.list ){
    	cnt++;
    	if(cnt==response.list.length){
//    		if(cnt==1){
//    			let html=`<i class="material-icons">keyboard_arrow_right
//    			</i><span><a href='javascript:void(0);' onclick="pathList('`+'\\'+path+`');">`+pathArr[i]+` </a></span> `;
//    			$cloudTitle.append(html);
//    		}
    		break;
    	}
        html += `<tr>
	      <th>`+extension(file.extension)+`</th>`;
	      if(file.extension==null){
	    	  html +=`<td><a href='javascript:void(0);' onclick="pathList('`+'/'+path+'/'+file.fileName+`');" >`+file.fileName+`</a></td>`;
	      }else{
	    	  html +=`<td><a href="cloudDown.do?fileName=`+urlencode(file.fileName)+`&filePath=`+urlencode(path)+`">`+file.fileName+`</a></td>`;
	      }
	      html +=
	      `<td class="more-btn">
		      <div data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			  	<i class="material-icons">more_vert</i>
			  </div>
		      <div class="dropdown-menu">
				  <a class="dropdown-item" href="cloudDown.do?fileName=`+file.fileName+`&filePath=`+path+`">다운로드</a>
				  <a class="dropdown-item" href='javascript:void(0);' onclick="cloudDelt('`+file.fileName+`');">삭제</a>
			  </div>
		  </td>
	      <td colspan="2">`+file.updtDate+`</td>
	      <td>`+file.fileSize+`</td>
	    </tr>`;
    }
    $("#page-top > div.content-wrapper > section > table > tbody").html("");
    $("#page-top > div.content-wrapper > section > table > tbody").append(html);
    init();
}

// 파일 아이콘 생성 

function extension(ext){
	let html = `<img class="FileTypeIcon-icon" `;
	if(pdf.indexOf(ext)>=0){
		html += `title="`+ext+` 파일" 
			src="https://spoprod-a.akamaihd.net/files/odsp-next-prod_2018-07-06_20180712.002/odsp-media/images/itemtypes/20_2x/pptx.png"`;
	}
	else if(txt.indexOf(ext)>=0){
		html += `title="`+ext+` 파일" 
			src="https://spoprod-a.akamaihd.net/files/odsp-next-prod_2018-07-06_20180712.002/odsp-media/images/itemtypes/20_2x/txt.png"`;
	}
	else if(zip.indexOf(ext)>=0){
		html += `title="`+ext+` 파일" 
			src="https://spoprod-a.akamaihd.net/files/odsp-next-prod_2018-07-06_20180712.002/odsp-media/images/itemtypes/20_2x/zip.png"`;
	}
	else if(jpg.indexOf(ext)>=0){
		html += `title="`+ext+` 이미지" 
			src="https://spoprod-a.akamaihd.net/files/odsp-next-prod_2018-07-06_20180712.002/odsp-media/images/itemtypes/20_2x/photo.png"`;
	}
	else if(ext==null){
		html += `title="폴더" 
			src="https://spoprod-a.akamaihd.net/files/odsp-next-prod_2018-07-06_20180712.002/odsp-media/images/itemtypes/20_2x/folder.png"`;
	}else{
		html += `title="`+ext+` 파일" 
			src="https://spoprod-a.akamaihd.net/files/odsp-next-prod_2018-07-06_20180712.002/odsp-media/images/itemtypes/20_2x/genericfile.png"`;
	}
	return (html+` style="width: 20px; height: 20px;">`);
}

function urlencode(str) {
    str = (str + '').toString();
    return encodeURIComponent(str)
        .replace(/!/g, '%21')
        .replace(/'/g, '%27')
        .replace(/\(/g, '%28')
        .replace(/\)/g, '%29')
        .replace(/\*/g, '%2A')
        .replace(/%20/g, '+');
}

