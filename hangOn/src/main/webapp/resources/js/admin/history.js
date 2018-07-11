/**
 * 
 */
window.onload = function(){
	pageList();
};
function pageList(pageNo){
	if(pageNo == ""){
		pageNo = 1;
	}
	$.ajax({
		url : "makeHistoryPage.json", 
		data : {"pageNo" : pageNo, "userNo" : 7}, 
		dateType : "json",
		type : "GET",
		success : makeTableList,
		error : function(e){
			console.dir(e);
		}
	})
}
/*히스토리 테이블 출력 함수*/
function makeTableList(result){
			console.log(result.hList);
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
			
			makePageLink(result.pageResult);
		};

/* 페이징 함수*/
function makePageLink(data){
	console.dir(data);
	var page = document.querySelector("#paginationContent");
	
	var html = "";
	if (data.count != 0) {
		var clz = "";
		if (data.prev == false) {
			clz = "disabled";
		}
		html += '<li class="paginate_button page-item previous '+ clz + 'id="dataTable_previous">';
		
		var fn = "";
		
		if (data.prev == true) {
			fn = "javascript:pageList(" + (data.beginPage - 1) + ");";
		}
//		html += '<a href="' + fn + '" aria-label="Previous">';
//		html += '    <span aria-hidden="true">&laquo;</span>';
//		html += '</a>';
//	    html += '</li>';
		
		html +='<a href="'+fn+'" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous\
				</a>\
				</li>';
		
	    for (var i = data.beginPage; i <= data.endPage; i++) {
	    	if (i == data.pageNo) {
			    html += '<li class="paginate_button page-item active">\
			    	<a href="#1" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">' + i + '</a></li>';
	    	}
	    	else {
	    		html += '<li><a href="javascript:pageList(' + i + ');">' + i + '</a></li>';
	    	}
	    }
	    
		clz = "";
		if (data.next == false) {
			clz = "disabled";
		}
		html += '<li class="paginate_button page-item next' + clz + '">';
		
		fn = "";
		
		if (data.next == true) {
			fn = "javascript:pageList(" + (data.endPage + 1) + ");";
		}
		html += '<a href="' + fn + '" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">\
					Next</a></li>';
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

function makePagination(){
	
}