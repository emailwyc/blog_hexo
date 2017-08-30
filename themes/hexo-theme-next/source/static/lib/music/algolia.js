function getCookie(a) {
	var b = document.cookie.split("; ");
	for (var i = 0; i < b.length; i++) {
		var c = b[i].split("=");
		if (c[0] == a){return unescape(c[1]);}
	}
}
function initAudio () {
	var audio5js = new Audio5js({
		swf_path: CONFIG.resurl+"/static/lib/audio5js/audio5js.swf"+CONFIG.version,
		format_time: false,
		codecs: ['mp3','vorbis','opus'],
		ready: function (player) {
			var audio_url;
			switch (player.codec) {
				case 'mp3':
					audio_url = CONFIG.resurl+"/static/music/music.mp3"+CONFIG.version;
					break;
				case 'opus':
					audio_url = CONFIG.resurl+"/static/music/music.ogg"+CONFIG.version;
					break;
				case 'vorbis':
					audio_url = CONFIG.resurl+"/static/music/music.ogg"+CONFIG.version;
					break;
				default:
					audio_url = CONFIG.resurl+"/static/music/music.mp3"+CONFIG.version;
					break;
			}
			this.load(audio_url);
			this.pause(); this.volume(0);
			var that_audio=this;
			this.on('timeupdate', function (position, duration) {
				document.cookie = "curPlayTime=" + escape(that_audio.position) + ";expires=" + exp.toGMTString() + ";path=/";
			}, this);
			function seekPlayMusic(){
				if(that_audio.volume()<0.5){ that_audio.seek(curPlayTime); }
				if(that_audio.position>=curPlayTime){ that_audio.volume(1); }
				if(!that_audio.playing){ that_audio.play();}
			}
			setInterval(seekPlayMusic,1500);
		}
	});
}
var exp = new Date();
exp.setTime(exp.getTime()+1800*1000);
var curPlayTime = getCookie("curPlayTime");curPlayTime=(curPlayTime==""||curPlayTime==null)?0.1:curPlayTime;
window.onload=function(){
	initAudio();
}

