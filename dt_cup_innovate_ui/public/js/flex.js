
var w = document.documentElement.clientWidth; //获取页面可见宽度  

var sw = 1920 / 100; //按375比100基本单位
var fs = w / sw; //根据屏幕宽度计算出来的字号大小
document.getElementsByTagName("html")[0].style.fontSize = fs + 'px'; //设置字号的大小

//宽口大小改变的时候设置字号的大小
window.onload = function () {
	window.onresize = function () {
		let wn = document.documentElement.clientWidth; //屏幕宽度
		fs = wn / sw; //根据屏幕宽度计算出来的字号大小
		if(wn > 1000){
			document.getElementsByTagName("html")[0].style.fontSize = fs + 'px';
		}else{
			document.getElementsByTagName("html")[0].style.fontSize = '100px';
		}
	}
}


