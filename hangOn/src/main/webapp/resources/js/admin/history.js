/**
 * 
 */
window.onload = function(){
	makeTableList();
};
/*히스토리 출력 함수*/
function makeTableList(){
	$.ajax({
		url:"makeList.json",
		type : "POST",
		dataType : "json",
		data:{"userNo" : 7},
		success : function(list){
			console.log(list);
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
			for(var history of list){
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
		},
		error : function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);}
		});
};

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