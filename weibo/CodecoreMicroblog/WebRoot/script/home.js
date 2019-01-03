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

	//微博字数控制

function checktext(text){
	allValid = true;
	for (i = 0;  i < text.length;  i++)
	{
		if (text.charAt(i) != " ")
				{
					allValid = false;
					break;
				}
			}
	return allValid;
	}

	function gbcount(message,total,used,remain)
	{
		var max;
		max = total.value;
		if (message.value.length > max) {
		message.value = message.value.substring(0,max);
		used.value = max;
		remain.value = 0;
		alert("留言不能超过 140 个字!");
		}
		else {
		used.value = message.value.length;
		remain.value = max - used.value;
		}
	}
}

//textaera 现实与隐藏
function display(mid){
	var text=document.getElementById("divtext"+mid);
	if(text.style.display=="none"){
		text.style.display="block";
	}else{
		text.style.display="none";
	}
	}