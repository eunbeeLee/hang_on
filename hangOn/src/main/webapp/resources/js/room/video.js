/**
 * 
 */ 
var config = {
    // via: https://github.com/muaz-khan/WebRTC-Experiment/tree/master/socketio-over-nodejs
    openSocket: function(config) {
        var SIGNALING_SERVER = 'https://socketio-over-nodejs2.herokuapp.com:443/';

		//config.channel	httpslocalhosthangOnroomtestdo4427510558793153
        config.channel = config.channel || location.href.replace(/\/|:|#|%|\.|\[|\]/g, '');
		//sender 난수
        var sender = Math.round(Math.random() * 999999999) + 999999999;
        
        io.connect(SIGNALING_SERVER).emit('new-channel', {
            channel: config.channel,
            sender: sender
        });

        var socket = io.connect(SIGNALING_SERVER + config.channel);
        socket.channel = config.channel;
        socket.on('connect', function () {
            if (config.callback) config.callback(socket);
        });

        socket.send = function (message) {
            socket.emit('message', {
                sender: sender,
                data: message
            });
        };

        socket.on('message', config.onmessage);
    },
    onRemoteStream: function(media) {
        var mediaElement = getMediaElement(media.video, {
            width: 260,
            buttons: ['mute-audio', 'mute-video', 'volume-slider']
        });
        console.dir(media.video);
        mediaElement.id = media.stream.streamid;
        
        mediaElement.onclick = function(event) {
        	/* 화면복사 */      	
        	let dom = $('.main-doc');
        	var video = document.createElement('video');
        	    video.muted = true;
        	    video.volume = 0;
    	    try {
    	        video.setAttributeNode(document.createAttribute('autoplay'));
    	        video.setAttributeNode(document.createAttribute('playsinline'));
    	        video.setAttributeNode(document.createAttribute('controls'));
    	    } catch (e) {
    	        video.setAttribute('autoplay', true);
    	        video.setAttribute('playsinline', true);
    	        video.setAttribute('controls', true);
    	    }
    	    getUserMedia({
    	        video: video,
    	        onsuccess: function(stream) {
	            config.attachStream = media.video.srcObject;
	            video.srcObject = media.video.srcObject;
	            var mediaElement = getMediaElement(video, {
	                width: '100%',
	                buttons: []
	            });
	            dom.append(mediaElement);
    	        },
    	        onerror: function() {
    	        }
    	    });
		};
        videosContainer.appendChild(mediaElement);
    },
    onRemoteStreamEnded: function(stream, video) {
        if (video.parentNode && video.parentNode.parentNode && video.parentNode.parentNode.parentNode) {
            video.parentNode.parentNode.parentNode.removeChild(video.parentNode.parentNode);
        }
    },
    onRoomFound: function(room) {
        var alreadyExist = document.querySelector('button[data-broadcaster="' + room.broadcaster + '"]');
        if (alreadyExist) return;

        if (typeof roomsList === 'undefined') roomsList = document.body;

        var tr = document.createElement('tr');
        tr.innerHTML = '<td><strong>' + room.roomName + '</strong> shared a conferencing room with you!</td>' +
            '<td><button class="join">Join</button></td>';
        roomsList.appendChild(tr);

        var joinRoomButton = tr.querySelector('.join');
        joinRoomButton.setAttribute('data-broadcaster', room.broadcaster);
        joinRoomButton.setAttribute('data-roomToken', room.roomToken);
        joinRoomButton.onclick = function() {
            this.disabled = true;

            var broadcaster = this.getAttribute('data-broadcaster');
            var roomToken = this.getAttribute('data-roomToken');
            captureUserMedia(function() {
                conferenceUI.joinRoom({
                    roomToken: roomToken,
                    joinUser: broadcaster
                });
            }, function() {
                joinRoomButton.disabled = false;
            });
        };
    },
    onRoomClosed: function(room) {
        var joinButton = document.querySelector('button[data-roomToken="' + room.roomToken + '"]');
        if (joinButton) {
            // joinButton.parentNode === <li>
            // joinButton.parentNode.parentNode === <td>
            // joinButton.parentNode.parentNode.parentNode === <tr>
            // joinButton.parentNode.parentNode.parentNode.parentNode === <table>
            joinButton.parentNode.parentNode.parentNode.parentNode.removeChild(joinButton.parentNode.parentNode.parentNode);
        }
    },
    onReady: function() {
//        console.log('접속준비가 완료됨');
    }
};
/*접속하기 */
setTimeout(function(){
	let joinBtn = $('.join');
	if(joinBtn.attr('data-roomToken')){ //기존 접속자가 있을때
		joinBtn.trigger("click"); 
	}else{
		$('#setup-new-room').trigger("click");
	}
}, 4000);

function setupNewRoomButtonClickHandler() {
    btnSetupNewRoom.disabled = true;
    document.getElementById('conference-name').disabled = true;
    captureUserMedia(function() {
        conferenceUI.createRoom({
            roomName: (document.getElementById('conference-name') || { }).value || 'Anonymous'
        });
    }, function() {
        btnSetupNewRoom.disabled = document.getElementById('conference-name').disabled = false;
    });
}


function captureUserMedia(callback, failure_callback) {
    var video = document.createElement('video');
    video.muted = true;
    video.volume = 0;

    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
        video.setAttributeNode(document.createAttribute('controls'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
        video.setAttribute('controls', true);
    }
    // 클릭시 핀고정 전체화면
    video.onclick = pinVideo;
    
    getUserMedia({
        video: video,
        onsuccess: function(stream) {
            config.attachStream = stream;

            var mediaElement = getMediaElement(video, {
                width: 260,
                buttons: ['mute-audio', 'mute-video',  'volume-slider']
            });
            mediaElement.toggle('mute-audio');
            videosContainer.appendChild(mediaElement);

            callback && callback();
        },
        onerror: function() {
            alert('unable to get access to your webcam');
            callback && callback();
        }
    });
}

var conferenceUI = conference(config);

/* UI specific */
var videosContainer = document.getElementById('videos-container') || document.body;
var btnSetupNewRoom = document.getElementById('setup-new-room');
var roomsList = document.getElementById('rooms-list');

if (btnSetupNewRoom) btnSetupNewRoom.onclick = setupNewRoomButtonClickHandler;

function rotateVideo(video) {
    video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(0deg)';
    setTimeout(function() {
        video.style[navigator.mozGetUserMedia ? 'transform' : '-webkit-transform'] = 'rotate(360deg)';
    }, 1000);
}

(function() {
    var uniqueToken = document.getElementById('unique-token');
    if (uniqueToken)
        if (location.hash.length > 2) uniqueToken.parentNode.parentNode.parentNode.innerHTML = '<h2 style="text-align:center;display: block;"><a href="' + location.href + '" target="_blank">Right click to copy & share this private link</a></h2>';
        else uniqueToken.innerHTML = uniqueToken.parentNode.parentNode.href = '#' + (Math.random() * new Date().getTime()).toString(36).toUpperCase().replace( /\./g , '-');
})();

function scaleVideos() {
    var videos = document.querySelectorAll('video'),
        length = videos.length, video;

    var minus = 130;
    var windowHeight = 700;
    var windowWidth = 600;
    var windowAspectRatio = windowWidth / windowHeight;
    var videoAspectRatio = 4 / 3;
    var blockAspectRatio;
    var tempVideoWidth = 0;
    var maxVideoWidth = 0;

    for (var i = length; i > 0; i--) {
        blockAspectRatio = i * videoAspectRatio / Math.ceil(length / i);
        if (blockAspectRatio <= windowAspectRatio) {
            tempVideoWidth = videoAspectRatio * windowHeight / Math.ceil(length / i);
        } else {
            tempVideoWidth = windowWidth / i;
        }
        if (tempVideoWidth > maxVideoWidth)
            maxVideoWidth = tempVideoWidth;
    }
    for (var i = 0; i < length; i++) {
        video = videos[i];
        if (video)
            video.width = maxVideoWidth - minus;
    }
}

window.onresize = scaleVideos;

//클릭시 이벤트 설정 함수
function pinVideo(stream) {
	let dom = $('.main-doc');
	var video = document.createElement('video');
    video.muted = true;
    video.volume = 0;
    
    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
        video.setAttributeNode(document.createAttribute('controls'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
        video.setAttribute('controls', true);
    }
    getUserMedia({
        video: video,
        onsuccess: function(stream) {
            config.attachStream = stream;
            var mediaElement = getMediaElement(video, {
                width: '100%',
                buttons: []
            });
            dom.append(mediaElement);
        },
        onerror: function() {
        }
    });
}