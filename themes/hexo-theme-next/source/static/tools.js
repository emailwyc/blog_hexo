function getCookie(a) {
	var b = document.cookie.split("; ");
	for (var i = 0; i < b.length; i++) {
		var c = b[i].split("=");
		if (c[0] == a){return unescape(c[1]);}
	}
}
function createMusicFunction(p){
	var x = document.createElement("audio");
	x.setAttribute("loop", "loop");
	var y = document.createElement("SOURCE");
	y.setAttribute("src", CONFIG.resurl+"/static/music/music.mp3"+CONFIG.version);
	y.setAttribute("type", "audio/mpeg");
	x.appendChild(y);
	var z = document.createElement("SOURCE");
	z.setAttribute("src", CONFIG.resurl+"/static/music/music.ogg"+CONFIG.version);
	z.setAttribute("type", "audio/ogg");
	x.appendChild(z);
	x.preload=p;
	document.body.appendChild(x);
	return x;
}

var exp = new Date();
exp.setTime(exp.getTime()+1800*1000);
var curPlayTime = getCookie("curPlayTime");curPlayTime=(curPlayTime==""||curPlayTime==null)?0.1:curPlayTime;
var audio=null;
document.addEventListener('touchstart', function(){
	audio.play();
	if(audio.currentTime<curPlayTime){
		audio.currentTime = curPlayTime;
	}
}, false);
$(document).one('WeixinJSBridgeReady', function () {
	audio.play();
	if(audio.currentTime<curPlayTime){
		audio.currentTime = curPlayTime;
	}
});
window.addEventListener('devicemotion', function () {
	audio.play();
	if(audio.currentTime<curPlayTime){
		audio.currentTime = curPlayTime;
	}
}, false);
function showLogin() {
	document.cookie = "curPlayTime=" + escape(audio.currentTime) + ";expires=" + exp.toGMTString() + ";path=/";
	if(audio.volume<0.5){
		audio.currentTime = curPlayTime; 
	}
	if(audio.currentTime>=curPlayTime){ audio.volume=0.98; }
	if(audio.paused){ audio.play(); }
}
window.onload=function(){
	audio=createMusicFunction("auto");
	audio.volume="0.1";
	audio.play();
	setInterval("showLogin()","800");
}


