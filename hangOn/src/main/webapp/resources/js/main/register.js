		
	$(document).ready( function () {
		modalMaker();
	});
	
	function modalUp(modalId, modalBody){
		var modalWrapper = document.querySelector("#loginModalWrapper");
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
					 modal += '<a class="btn btn-primary" href="#" data-dismiss="modal" aria-label="Close">확인</a>';
					 modal +='</div>\
					      </div>\
					    </div>\
					  </div>\
					  <button style ="display : none;" id="'+modalId+'Btn" data-toggle="modal" data-target="#'+modalId+'"></button>';
		 modalWrapper.innerHTML += modal;
	}
	
	/*필요한 모달 추가 함수*/
	function modalMaker(){
		modalUp("emailModal", "이메일을 입력해주세요");
		modalUp("nameModal", "이름을 입력해주세요");
		modalUp("pwModal", "비번을 입력해주세요");
		modalUp("pwCheckModal", "비번 확인을 입력해주세요");
		modalUp("pwEqualModal", "같은 비번을 다시 한번 입력해주세요");
		modalUp("emailDuplicateModal", "사용할 수 없는 이메일입니다");
		modalUp("shortPwModal", "비밀번호는 8자 이상이어야 합니다");
		modalUp("pwWithoutSpaceModal", "비밀번호에 공백이 없어야 합니다");
		modalUp("wrongEmailModal", "잘못된 이메일 형식입니다");
		modalUp("longNameModal", "이름은 20자 이내로 작성하세요");
		modalUp("nameWithoutNumberModal", "이름에 숫자가 들어가면 안됩니다");
		modalUp("emailWithoutKoreanModal", "이메일에 한글이 들어가면 안됩니다");
	}