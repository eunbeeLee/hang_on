<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
</head>
<body>
  <section class="experiment">

        <section class="section-divider">
            <select id="convert-from">
                        <option>ko (한국어)</option>
                        <option>en (English)</option>
                        <option>ja (日本人)</option>
            </select>
            <br>
            
            <textarea id="textarea-from" placeholder="번역할 내용을 입력하세요."></textarea><br>
            <button id="btn-convert-text" class="btn-stt btn btn-default">텍스트 번역</button>
            <button id="btn-convert-voice" class="btn-stt btn btn-default">음성 인식</button>
        </section>
        
        <section class="section-divider">
            <select id="convert-into">
                        <option>en (English)</option>
                        <option>ko (한국어)</option>
                        <option>ja (日本人)</option>
                    </select>
            
            <br>
            <textarea id="textarea-to" disabled style="background: #f9f9f9!important;border: 1px solid #f7f1f1;cursor: not-allowed;" title="Output! ReadOnly!"></textarea>
            <br>
            <button id="btn-trans-chat" class="btn-stt btn btn-default">채팅창 전송</button>
			
            </section>

            </section>
</body>

</html>
