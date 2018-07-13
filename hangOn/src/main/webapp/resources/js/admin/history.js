/**
 * 
 */
window.onload = function(){
	pageList();
	searchCertainPeriod();
	var btnId="";
	var startHistory = document.querySelector("#startHistory");
	var endHistory = document.querySelector("#endHistory");
	 $('body').click(function(e){
	        var id = e.target.getAttribute('id');
	        if ( ( id != '') && (id != null)){ 
	        btnId=id;
	        if(btnId =="sevenBtn" || btnId =="thirtyBtn" 
	        	||btnId =="sixtyBtn" ||btnId =="ninetyBtn" ||btnId =="allPeriodBtn" 
	        	||btnId =="periodSearchBtn")
	        	{ recentBtn(btnId);}
	        }
	    });

};
function pageList(pageNo, rDays){
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
		type : "POST"
	}).done(makeTableList)
}
/*히스토리 테이블 출력 함수*/
function makeTableList(result){
	console.log("makeTableList : ",result);
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
	console.log("시작일 : ", data.startDate);
	console.log("페이지 결과: ", data.pageResult);
	
	var page = document.querySelector("#paginationContent");
	var html = "";
	if (data.pageResult.count != 0) {
		var clz = "";
		if (data.pageResult.prev == false) {
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
	var rDays ="";
	switch(btnId){
	case "sevenBtn": rDays=7; break;
	case "thirtyBtn":rDays=30; break;
	case "sixtyBtn" :rDays=60; break;
	case "ninetyBtn":rDays=90; break;
	case "periodSearchBtn":rDays=100; break;
	default : rDays=0; break;
	}
	searchRecentPeriod(rDays)
}

/*최근 날짜조회 함수*/
function searchRecentPeriod(rDays){
	var hTable = document.querySelector("#historyTable");
	var page = document.querySelector("#paginationContent");
	
	var startDate = document.getElementById("startHistory").value;
	var endDate = document.getElementById("endHistory").value;
//	console.log("검색날짜 :"+rDays);
//	console.log("시작일", startDate);
	hTable.innerHTML="";
	page.innerHTML = "";
		$.ajax({
			url : "makeHistoryPage.json",
			data : {"rDays" : rDays, "userNo" : 7, "beginDate":startDate, "endDate" :endDate},
			dateType : "json",
			type : "POST"
		}).done(makeTableList)
		.fail(function(e){
			console.log(e);
		});
}

/*특정 날짜 조회 검색 함수*/
 function searchCertainPeriod(){
	 let today = dateParser(new Date().toLocaleDateString()).slice(0,10);
	 startHistory.setAttribute("value", today);
	 endHistory.setAttribute("value", today);
 }




















