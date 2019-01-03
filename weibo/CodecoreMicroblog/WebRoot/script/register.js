// JavaScript Document
var code ; //在全局 定义验证码
function createCode(){ 
code = "";
var codeLength = 4;//验证码的长度
var checkCode = document.getElementById("checkcode");
checkCode.value = "";

var selectChar = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','J','K','L','M','N','P','Q','R','S','T','U','V','W','X','Y','Z');

for(var i=0;i<codeLength;i++) {
   var charIndex = Math.floor(Math.random()*34);
   code +=selectChar[charIndex];
}
if(code.length != codeLength){
   createCode();
}
checkCode.value = code;
}

function validate () {
var inputCode = document.getElementById("input2").value.toUpperCase();

if(inputCode.length <=0) {
   alert("请输入验证码！");
   return false;
}
else if(inputCode != code ){
   alert("验证码输入错误！");
   createCode();
   return false;
}
}

 var xhr;
	function checkNick() {  
	var nick=document.getElementById("nickname").value;
	var nickmsg=document.getElementById("nickmsg");
	xhr = new XMLHttpRequest();
	if (nick=="") {  
		nickmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>昵称不能为空</font>";
	}else{
		nickmsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'> <font color='green'>输入正确</font>";
	}
	//指定交互路径
	xhr.open("get", "/CodecoreMicroblog/RegisterServlet?name="+nickname , true);
	//指定回调函数
	xhr.onreadystatechange = handler ;
	//开始交互
	xhr.send();
	}	
	function handler() {
		if(xhr.status == 200 && xhr.readyState == 4) {
		var str = xhr.responseText;
		var flag = eval('('+str+')');
		if(flag) {
			nickmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>昵称已被使用</font>";
		}else {
			nickmsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'> <font color='green'>可以使用</font>";
		}
	}
}