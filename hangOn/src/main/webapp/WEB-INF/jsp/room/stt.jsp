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

        <blockquote id="blockquote" style="display: none;border-bottom: 0;margin: 0 13%;text-align: center;border-radius: 6px;border-style: solid;border-color: rgb(214, 210, 210);"></blockquote>
        
        <section class="section-divider">
            <h2>음성 또는 텍스트 입력</h2><br>
            <select id="convert-from">
                        <option>en (English)</option>
                        <option>ar (العربية)</option>
                        <option>de (Deutsch)</option>
                        <option>fr (Français)</option>
                        <option>hi (हिंदी)</option>
                        <option>pt (Português)</option>
                        <option>ru (Русский)</option>
                        <option>es (Español)</option>
                        <option>tr (Türk)</option>
                        <option>nl (Nederlands)</option>
                        <option>it (Italiano)</option>
                        <option>pl (Polski)</option>
                        <option>ro (Român)</option>
                        <option>sv (Svensk)</option>
                        <option>vi (Việt)</option>
                        <option>th (ภาษาไทย)</option>
                        <option>zh-CN (中文简体)</option>
                        <option>zh-TW (中國傳統)</option>
                        <option>ko (한국의)</option>
                        <option>ja (日本人)</option>
                        <option>el (ελληνικά)</option>
                        <option>ts (தமிழ்)</option>
                        <option>hy (հայերեն)</option>
                        <option>bs (Bosanski)</option>
                        <option>ca (Català)</option>
                        <option>hr (Hrvatski)</option>
                        <option>dq (Dansk)</option>
                        <option>eo (Esperanto)</option>
                        <option>fi (Suomalainen)</option>
                        <option>ht (Haian kreyòl)</option>
                        <option>hu (Magyar)</option>
                        <option>is (Icelandic)</option>
                        <option>id (Indonesia)</option>
                        <option>la (Latinum)</option>
                        <option>lv (Latvijas)</option>
                        <option>mk (Македонски)</option>
                        <option>no (Norsk)</option>
                        <option>sr (Српски)</option>
                        <option>sk (Slovenský)</option>
                        <option>sw (Kiswahili)</option>
                        <option>cy (Cymraeg)</option>
                    </select>
            
            <br><br>
            <textarea id="textarea-from"></textarea><br>
            <button id="btn-convert-text" style="font-size: 16px;">텍스트 번역</button><br>
            <button id="btn-convert-voice" style="font-size: 16px;">음성 번역</button>
        </section>
        
        <section class="section-divider">
            <h2>번역</h2><br>
            <select id="convert-into">
                        <option>en (English)</option>
                        <option>ar (العربية)</option>
                        <option>de (Deutsch)</option>
                        <option>fr (Français)</option>
                        <option>hi (हिंदी)</option>
                        <option>pt (Português)</option>
                        <option>ru (Русский)</option>
                        <option>es (Español)</option>
                        <option>tr (Türk)</option>
                        <option>nl (Nederlands)</option>
                        <option>it (Italiano)</option>
                        <option>pl (Polski)</option>
                        <option>ro (Român)</option>
                        <option>sv (Svensk)</option>
                        <option>vi (Việt)</option>
                        <option>th (ภาษาไทย)</option>
                        <option>zh-CN (中文简体)</option>
                        <option>zh-TW (中國傳統)</option>
                        <option>ko (한국의)</option>
                        <option>ja (日本人)</option>
                        <option>el (ελληνικά)</option>
                        <option>ts (தமிழ்)</option>
                        <option>hy (հայերեն)</option>
                        <option>bs (Bosanski)</option>
                        <option>ca (Català)</option>
                        <option>hr (Hrvatski)</option>
                        <option>dq (Dansk)</option>
                        <option>eo (Esperanto)</option>
                        <option>fi (Suomalainen)</option>
                        <option>ht (Haian kreyòl)</option>
                        <option>hu (Magyar)</option>
                        <option>is (Icelandic)</option>
                        <option>id (Indonesia)</option>
                        <option>la (Latinum)</option>
                        <option>lv (Latvijas)</option>
                        <option>mk (Македонски)</option>
                        <option>no (Norsk)</option>
                        <option>sr (Српски)</option>
                        <option>sk (Slovenský)</option>
                        <option>sw (Kiswahili)</option>
                        <option>cy (Cymraeg)</option>
                    </select>
            
            <br><br>
            <textarea id="textarea-to" disabled style="background: #f9f9f9!important;border: 1px solid #f7f1f1;cursor: not-allowed;" title="Output! ReadOnly!"></textarea>

            <br>

            <input type="checkbox" id="robot-voice" title="A client-side robot that can speak your voice in target language!" style="vertical-align: middle;">

            <label for="robot-voice" style="vertical-align: middle;" title="Use robot to play translated texts">Robot Speaker?</label>

            </section>

            </section>
</body>

</html>
