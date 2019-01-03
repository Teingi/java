// JavaScript Document
//微博文本获取焦点
function blogtextfocus(){
	if(document.getElementById("blogtext").value == "你正在做什么？"){
	document.getElementById("blogtext").value="";
	document.getElementById("blogtext").style.color="#000000";
	}
}
//微博文本失去焦点
function blogtextblur(){
	if(document.getElementById("blogtext").value == ""){
	document.getElementById("blogtext").value="你正在做什么？";
	document.getElementById("blogtext").style.color="#999999";
	}	
}