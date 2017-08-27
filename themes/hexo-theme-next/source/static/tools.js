function getCookie(a) {
	var b = document.cookie.split("; ");
	for (var i = 0; i < b.length; i++) {
		var c = b[i].split("=");
		if (c[0] == a){return unescape(c[1]);}
	}
}
var exp = new Date();
exp.setTime(exp.getTime()+1800*1000);
var curPlayTime = getCookie("curPlayTime");curPlayTime=(curPlayTime==""||curPlayTime==null)?0.1:curPlayTime;
var audio=document.getElementById("music_curtime"); audio.volume=0.1;
document.addEventListener('touchstart', function(){
	audio.play();
	if(audio.currentTime<curPlayTime){
		audio.currentTime = curPlayTime;
	}
}, false);
$(document).one('WeixinJSBridgeReady', function () {
    audio.load();
    audio.setAttribute('src', '/static/music.mp3');
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
	if(audio.paused){
		audio.play();
	}
}
$(document).ready(function(){
    setInterval("showLogin()","800");
});

