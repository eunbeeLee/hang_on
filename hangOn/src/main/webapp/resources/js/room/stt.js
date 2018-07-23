/**
 * Unyoung Choi 
 * 18.7.16
 * 음성번역
 */
var translator = new Translator();

function getOption(language) {
    var option = document.createElement('option');
    option.value = language.language;
    if(language.name) {
        option.innerHTML = language.name + ' (' + language.language + ')'
    }
    else {
        option.innerHTML = language.language;
    }

    if(language.language == 'en') {
        option.selected = true;
    }

    return option;
}

var convertFrom = document.getElementById('convert-from');
var convertInto = document.getElementById('convert-into');

//translator.getListOfLanguages(function(languages) {
//    if(!(languages instanceof Array)) return;
//
//    convertFrom.innerHTML = '';
//    convertInto.innerHTML = '';
//
//    languages.forEach(function(language) {
//        var option = getOption(language);
//        convertFrom.appendChild(option);
//
//        var option2 = getOption(language);
//        convertInto.appendChild(option2);
//    });
//
//    localStorageGetItem();
//
//});

var textareaFrom = document.getElementById('textarea-from');
var textareaTo = document.getElementById('textarea-to');

function getLanguages() {
    var from = document.getElementById('convert-from').value.split(' (')[0];
    var to = document.getElementById('convert-into').value.split(' (')[0];
    
    return {
        from: from,
        to: to
    };
}

document.getElementById('btn-convert-voice').onclick = function() {
    this.disabled = true;
    this.innerHTML = '음성 인식중';

    var languages = getLanguages();
    translator.voiceToText(function(text) {
        textareaFrom.value = text;
        
        document.getElementById('btn-convert-text').onclick(true);
    }, languages.from);
};

document.getElementById('btn-convert-text').onclick = function(speakAsWell) {
    var languages = getLanguages();
    
    textareaTo.value = 'Converting into >> ' + document.getElementById('convert-into').value;
    translator.translateLanguage(textareaFrom.value, {
        from: languages.from,
        to: languages.to,
        callback: function(translatedText) {
            textareaTo.value = translatedText;
            localStorage.setItem('textarea-to', textareaTo.value);
        
            if(speakAsWell !== true) return;
            else {
                translator.speakTextUsingGoogleSpeaker({
                    textToSpeak: translatedText,
                    targetLanguage: languages.to,

                    // please use your own API key; if possible
                    api_key: 'AIzaSyBioPgfLWVXr2oLCz7_wo_bfPHOP-E5vUw'
                });
            }
        }
    });
};

document.getElementById('convert-from').onchange = function() {
    localStorage.setItem('convert-from', this.value);
};

document.getElementById('convert-into').onchange = function() {
    localStorage.setItem('convert-into', this.value);
};

textareaFrom.onchange = function() {
    localStorage.setItem('textarea-from', this.value);
};

textareaTo.onchange = function() {
    localStorage.setItem('textarea-to', this.value);
};

function localStorageGetItem() {
    if(localStorage.getItem('convert-from')) {
        document.getElementById('convert-from').value = localStorage.getItem('convert-from');
    }
    
    if(localStorage.getItem('convert-into')) {
        document.getElementById('convert-into').value = localStorage.getItem('convert-into');
    }

    if(localStorage.getItem('textarea-from')) {
        textareaFrom.value = localStorage.getItem('textarea-from');
    }
    
    if(localStorage.getItem('textarea-to')) {
        textareaTo.value = localStorage.getItem('textarea-to');
    }
}

// 채팅창 전송
document.getElementById('btn-trans-chat').onclick = function(){
	document.querySelector("#textBox > textarea").value=document.getElementById('textarea-to').value;
};
localStorageGetItem();