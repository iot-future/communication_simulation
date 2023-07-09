/**
 * 常用工具库
 */
/**
 * 系统时间
 * 格式：YYYY-MM-DD hh:mm:ss
 * 使用：
 * 使用方法：
 * import {getDayTimer} from "../utils/tools.js"
 * getDayTimer(new Date())
 * 
 */
function getDayTimer(data) {
	var date = new Date(data)
	var y = date.getFullYear()
	var m = date.getMonth() + 1
	m = m < 10 ? ('0' + m) : m
	var d = date.getDate()
	d = d < 10 ? ('0' + d) : d
	var currentdate = y + '-' + m + '-' + d;
	var hh = date.getHours()
	hh = hh < 10 ? ('0' + hh) : hh
	var mm = date.getMinutes()
	mm = mm < 10 ? ('0' + mm) : mm
	var ss = date.getSeconds()
	ss = ss < 10 ? ('0' + ss) : ss
	var time = hh + ':' + mm + ':' + ss;
	return currentdate + " " + time
}

const Debounce = (fn, t) => {
	let delay = t || 500;
	let timer;
	return function() {
	  let args = arguments;
	  if (timer) {
		clearTimeout(timer);
	  }
  
	  let callNow = !timer;
  
	  timer = setTimeout(() => {
		timer = null;
	  }, delay);
  
	  if (callNow) fn.apply(this, args);
	};
  };

// 方法统一抛出
export {
	getDayTimer,
	Debounce,
};
