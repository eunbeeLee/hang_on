/**
 * 
 */
window.onload = function(){
	roomList();
	swal('Any fool can use a computer');
};

	function roomList(){
		$.ajax({
			url : "makeRoomList.json",
			data : {"userNo" : 7},
			dataType :"json", 
			type : "POST"
		}).done(makeRoomList)
		  .fail(function(e){
			  console.dir(e);
		  });
	}
	
	/*방 리스트, 방 멤버 리스트 화면 출력*/
	function makeRoomList(data){
		var today = new Date();
//		console.dir(data);
		let count = document.querySelector("#countRoomList");
		count.innerHTML = "<h6>생성된 회의방 갯수  : <strong>"+data.roomCount+"</strong>개</h6>"
		
		var roomListContent = document.querySelector("#roomListContent");
		for(let room of data.rList){
		//아코디언 헤드
		html =
			'<div class=" card mb-3 panel-heading" role="tab" id="heading'+room.roomNo+'">\
	           <h6 class="card-header" data-toggle="collapse"\
	 	    	  data-parent="#accordion" href="#collapse'+room.roomNo+'" aria-expanded="true" aria-controls="collapse'+room.roomNo+'">\
	             <strong>'+room.roomName+'</strong>\
	           </h6>\
	         </div>';
		//아코디언 바디
		if(room.roomInfo ==null){
			room.roomInfo = "회의방 설명이 없습니다."
		}
		html += '<div id="collapse'+room.roomNo+'" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading'+room.roomNo+'">\
			      <div class="panel-body">\
				    <div class="container col-md-11">\
					<form>\
				      <div class="form-group row">\
				        <label for="inputPassword" class="col-md-2 control-label">회의방설명</label>\
				         <div class="col-md-10">\
				           <textarea class="form-control pass-input" id="room'+room.roomNo+'Info" placeholder="'+room.roomInfo+'"></textarea>\
				         </div>\
				         </div>\
				         <div class="form-group row">\
				           <label for="inputPassword" class="col-md-2 control-label">비밀번호</label>\
				           <div class="col-md-10">\
				             <input type="password" class="form-control pass-input" id="oldPassAtRoom'+room.roomNo+'" placeholder="기존의 비밀번호를 입력하세요">\
				             <input type="password" class="form-control pass-input" id="newPassAtRoom'+room.roomNo+'" placeholder="새로운 비밀번호를 입력하세요">\
				           </div>\
				         </div>\
				       <div class="form-group row fix-content">\
				         <label class="col-sm-2 control-label">생성날짜</label>\
				           <div class="col-sm-10">\
				             <p class="form-control-static">'+dateParser(room.roomCreateDate)+'</p>\
				           </div>\
				       </div>\
					  <table class="table table-border" id="room'+room.roomNo+'MemberTable">\
					  <thead>\
					    <tr>\
					      <th>이름</th>\
					      <th>이메일</th>\
					      <th>마지막 참여시간</th>\
					      <th>권한</th>\
					      <th>권한부여</th>\
					      <th>삭제</th>\
					    </tr>\
					  </thead>\
					  <tbody>';
						var memberLength =0;
						for(var member of data.rmMap[room.roomNo]){
							memberLength +=1;
							if(member.lastConnectTime == null){
								member.lastConnectTime = "최근 접속 없음";
							}
							
							html += '<tr>\
								<td>'+member.userName+'</td>\
								<td>'+member.userEmail+'</td>\
								<td>'+member.lastConnectTime+'</td>\
								<td id="authInfo_'+room.roomNo+'_'+member.userNo+'">'+member.authInfo+'</td>\
								<td>\
								<label class="switch">';
							if(member.authInfo == "참여자"){
								html+='<input id="authSwitch_'+room.roomNo+'_'+member.userNo+'" type="checkbox">';
							}else{
								html +='<input id="authSwitch_'+room.roomNo+'_'+member.userNo+'" type="checkbox" checked>';
							}
								html+='<span class="slider round"></span>\
								</label>\
								</td>\
								<td>\
							 	  <button type="button" class="btn btn-sm btn-danger mem-del-btn">내보내기</button>\
								</td>\
							 </tr>';
								
						}
						if(memberLength ==0){
							html+='<tr>\
								<td colspan=6>참여 인원이 없습니다.</td>\
							 </tr>';
						}
					  html +='</tbody>\
					  </table>\
					  <button type="button" class="btn btn-default room-edit-btn" id="'+room.roomNo+'_roomModBtn">수정</button>\
					  <button type="button" class="btn btn-default room-edit-btn" id="'+room.roomNo+'_roomDelBtn">삭제</button>\
					</form>\
				</div>\
				</div>\
				</div>';
		roomListContent.innerHTML += html;
		clickTarget();
		}
//		editRoomInfo();
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
	
	/*클릭 객체 얻어오는 함수*/
	function clickTarget(){
		document.body.onclick = function(e){
			if(e.target.id!= null){
				/*방 수정, 삭제 함수*/
				editRoomInfo(e.target.id);
				/*회원 권한 슬라이더*/
				let authInfo = document.querySelector("#authInfo_"+e.target.id.split('_')[1]+"_"+e.target.id.split('_')[2]);
				if(authInfo!= null){
					console.log(authInfo.innerHTML);
					if(authInfo.innerHTML == "참여자"){
						authInfo.innerHTML = "관리자";
					}else{
						authInfo.innerHTML = "참여자";
					}
					
				}
			}
		};
	}
	/*방 정보 수정 함수*/
	function editRoomInfo(id){
		if(id.split('_')[1] == "roomModBtn"){
			var oldPass = document.querySelector("#oldPassAtRoom"+id.split('_')[0])
//			console.log(oldPass.value);
			if(oldPass.value == ""){
				alert("기존 비밀번호를 입력하세요.");
			}
		}
		if(id.split('_')[1] == "roomDelBtn"){
			
		}
	}


















