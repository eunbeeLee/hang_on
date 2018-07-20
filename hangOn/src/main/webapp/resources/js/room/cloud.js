// css 동적 추가
function init(){
	$("#page-top > div.content-wrapper > section > table > tbody > tr").on("mouseover",function(){
		$(this).children(".more-btn").css("opacity",1)
	});
	$("#page-top > div.content-wrapper > section > table > tbody > tr").on("mouseout",function(){
		$(this).children(".more-btn").css("opacity",0);
	});
}
init();

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
    });
  
});
// 경로 파일정보 함수
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
function pathList(filePath){
	 $.ajax({
        url:'cloudList.json',
        dataType:"json",
        data:{"path":filePath}
    }).done(function(response){
    	makeCloudList(response);
    });
}
// 파일목록 생성함수
function makeCloudList(response){
    let $cloudTitle =$(".cloud-title");
    let pathArr = response.list[0].filePath.split('\\');
    var title = `<span><a href='javascript:void(0);' onclick="pathList('');">파일</a></span>`;
    var path="";
    for(let i=4; i<pathArr.length;i++ ){
    	path+=pathArr[i];
    	title+=`<i class="material-icons">keyboard_arrow_right
    			</i><span><a href='javascript:void(0);' onclick="pathList('`+'\\'+path+`');">`+pathArr[i]+` </a></span> `;
    	path+="\\";
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
	    	  html +=`<td><a href='javascript:void(0);' onclick="pathList('`+'\\'+path+'\\'+file.fileName+`');" >`+file.fileName+`</a></td>`;
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
				  <div class="dropdown-divider"></div>
				  <a class="dropdown-item" href="#">세부 정보</a>
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
const pdf="ppt,pdf,pptx";
const apk="apk,exe";
const txt="txt";
const zip="zip,gz,7zip";
const jpg="jpg,jpeg,img,png";
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

