// JavaScript Document
function myBrowser(){
	var userAgent = navigator.userAgent; //È¡µÃä¯ÀÀÆ÷µÄuserAgent×Ö·û´®
	var isOpera = userAgent.indexOf("Opera") > -1;
	if (isOpera){
		return "Opera";
	} //ÅĞ¶ÏÊÇ·ñOperaä¯ÀÀÆ÷ 
	if (userAgent.indexOf("Firefox") > -1){
		return "FF";
	} //ÅĞ¶ÏÊÇ·ñFirefoxä¯ÀÀÆ÷ 
	if (userAgent.indexOf("Safari") > -1){
		return "Safari";
	} //ÅĞ¶ÏÊÇ·ñSafariä¯ÀÀÆ÷ 
	if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera){
		return "IE";
	}  //ÅĞ¶ÏÊÇ·ñIEä¯ÀÀÆ÷
} 