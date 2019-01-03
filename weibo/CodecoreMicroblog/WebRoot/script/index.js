// JavaScript Document
//鼠标悬停图片效果
function xianshi(img){
	if(myBrowser()=="IE"){
		img.filters.alpha.opacity=100;
	}
	if(myBrowser()=="FF"){
		img.style.opacity=1;
	}
}
//鼠标离开图片效果
function huifu(img){
	if(myBrowser()=="IE"){
		img.filters.alpha.opacity=70;
	}
	if(myBrowser()=="FF"){
		img.style.opacity=0.7;
	}
}		
//表单验证
function checkForm(){
	if(document.getElementById("userid").value == ""){
		alert("用户名必须填写！");
		document.getElementById("userid").focus();
		return false;
	}
	if(document.getElementById("password").value==""){
		alert("密码必须填写！");
		document.getElementById("password").focus();
		return false;
	}
}