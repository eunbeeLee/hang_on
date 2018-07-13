/**
 * 
 */
window.onload = function(){
	pageList();
	var btnId="";
	 $('body').click(function(e){
	        var id = e.target.getAttribute('id');
	        if ( ( id != '') && (id != null)){ 
	        btnId=id;
	        if(btnId =="sevenBtn" || btnId =="thirtyBtn" 
	        	||btnId =="sixtyBtn" ||btnId =="ninetyBtn" ||btnId =="allPeriodBtn")
	        	{ recentBtn(btnId);}}
	    });

};
function pageList(pageNo, rDays){
//	console.log("페이지리스트 출력");
//	console.log("pageList 함수 rDays : ", rDays )
	if(pageNo == ""){
		pageNo = 1;
	}
	if(rDays == undefined){
		rDays = 0;
	}
	$.ajax({
		url : "makeHistoryPage.json", 
		data : {"pageNo" : pageNo, "userNo" : 7, "rDays" : rDays}, 
		dateType : "json",
		type : "POST",
//		success : makeTableList,
		error : function(e){
			console.dir(e);
		}
	}).done(makeTableList)
}
/*히스토리 테이블 출력 함수*/
function makeTableList(result){
//	console.log('================');
//			console.log(result.rDays);
			var hTable = document.querySelector("#historyTable");
			html = '<thead>\
		        	  <tr>\
			            <th>방이름</th>\
					    <th>이름</th>\
					    <th>이메일</th>\
					    <th>ip주소</th>\
					    <th>행동</th>\
					    <th>접속일시</th>\
					  </tr>\
					</thead>\
					<tbody>';
			for(var history of result.hList){
				html +='<tr>\
				      	  <td>'+history.roomName+'</td>\
				      	  <td>'+history.userName+'</td>\
				      	  <td>'+history.userEmail+'</td>\
				      	  <td>'+history.ipAddr+'</td>\
				      	  <td>'+history.actName+'</td>\
				      	  <td>'+ dateParser(history.connectTime)+'</td>\
			      		</tr>';
			}
			html +="</tbody>";
			hTable.innerHTML=html;
			
			makePageLink(result);
		};

/* 페이징 함수*/
function makePageLink(data){
//	data = data.pageResult;
//	console.log(data);
//	console.log("makeLink함수 rDays: ",data.rDays);
	var page = document.querySelector("#paginationContent");
	var html = "";
	if (data.pageResult.count != 0) {
		var clz = "";
		if (data.pageResult.prev == false) {
//			console.log("prev 값 : false 확인");
			clz = "disabled";
		}
		html += '<li id="dataTable_previous" class="paginate_button page-item previous '+ clz + '">';
		var fn = "";
		if (data.pageResult.prev == true) {
			fn = "javascript:pageList(" + (data.pageResult.beginPage - 1)  + ");";}
		html +='<a href="'+fn+'" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous\
				</a>\
				</li>';
	    for (var i = data.pageResult.beginPage; i <= data.pageResult.endPage; i++) {
	    	if (i == data.pageResult.pageNo) {
			    html += '<li class="paginate_button page-item active">\
			    	<a href="#'+i+'" aria-controls="dataTable" data-dt-idx="'+i+'" tabindex="0" class="page-link">' + i + '</a></li>';
	    	}
	    	else {
	    		html += '<li class="paginate_button page-item">\
	    			<a href="javascript:pageList(' + i + ','+data.rDays+');" aria-controls="dataTable" data-dt-idx="'+i+'" tabindex="0" class="page-link">'
	    			+ i + '</a></li>';
	    	}
	    }
	    
		clz = "";
		if (data.pageResult.next == false) {
//			console.log("next 값 : false 확인");
			clz = "disabled";
		}
		html += '<li id="dataTable_next" class="paginate_button page-item next ' + clz + '">';
		
		fn = "";
		
		if (data.pageResult.next == true) {
			fn = "javascript:pageList(" + (data.pageResult.endPage + 1) + ");";
		}
		html += '<a href="' + fn + '" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a></li>';
	}
	
	page.innerHTML = html;
	
}


/*날짜 변환 함수*/
function dateParser(date) {
	let dateTime = new Date(date)
	let yy = 1900 + dateTime.getYear();
	let MM = dateTime.getMonth()+1;
	let dd = dateTime.getDate();
	let HH = dateTime.getHours();
	let mm = dateTime.getMinutes();
	let ss = dateTime.getSeconds();
	
	return yy +"-"+dateCipher(MM) +"-"+dateCipher(dd)+" "+dateCipher(HH)+":"+dateCipher(mm)+":"+dateCipher(ss);
}

/*날짜 자릿수 변환 함수*/
function dateCipher(date){
	let dateFormat=date;
	if(date.toString().length <2){
		dateFormat = "0"+date;
	}
	return dateFormat;
}

/*날짜 조회 버튼 구분 함수*/
function recentBtn(btnId){
//	console.log("버튼 아이디 :",btnId);
	var rDays ="";
	switch(btnId){
	case "sevenBtn": rDays=7; break;
	case "thirtyBtn":rDays=30; break;
	case "sixtyBtn" :rDays=60; break;
	case "ninetyBtn":rDays=90; break;
	default : rDays=0; break;
	}
//	console.log("기간날짜 :",rDays);
	searchRecentPeriod(rDays)
}

/*최근 날짜조회 함수*/
function searchRecentPeriod(rDays){
	var hTable = document.querySelector("#historyTable");
	var page = document.querySelector("#paginationContent");
	hTable.innerHTML="";
	page.innerHTML = "";
		$.ajax({
			url : "makeHistoryPage.json",
			data : {"rDays" : rDays, "userNo" : 7},
			dateType : "json",
			type : "POST"
		}).done(makeTableList)
		.fail(function(e){
			console.log(e);
		});
}





















