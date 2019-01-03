<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/register.css" />
<title>微博 - 快速注册</title>
<script type="text/javascript" src="script/register.js"></script>
<script type="text/javascript" src="script/chooseCity.js"></script>
<script type="text/javascript">
var xmlHttpRequest;
function createXmlHttpRequest(){
	if(window.ActiveXObject){
		try{
			xmlHttpRequest=new ActiveXObject("Microsoft.XMLHTTP");
		}catch(e){
			xmlHttpRequest=new ActiveXObject("Msxml2.XMLHTTP");
		}
		return xmlHttpRequest;
	}else if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}
}

function checkemail(){
	var email = document.getElementById("email");
	var emailmsg = document.getElementById("emailmsg");
	if(email.value=="" || email.value.indexOf("@") ==-1 || email.value.indexOf(".") ==-1 || email.value.indexOf(".") == email.value.length-1 || email.value.indexOf(".")== email.value.indexOf("@")+1 || email.value.indexOf("@") ==0 || email.value.indexOf(".")< email.value.indexOf("@")) 
	{  
		emailmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>请填写正确的邮箱地址</font>";
	}else{
		//创建xmlHttpRequest对象
		xmlHttpRequest=createXmlHttpRequest();
		//设置回调函数
		xmlHttpRequest.onreadystatechange=ok;
		var url="http://localhost:8080/${pageContext.request.contextPath}/CheckMailServlet?jsemail="+email.value;
		//初始化XMLHttpRequest组件
		xmlHttpRequest.open("GET",url, true);
		//发送请求
		xmlHttpRequest.send();
	} 
}

function ok(){
var emailmsg = document.getElementById("emailmsg");
	if(xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200){
		var msg=xmlHttpRequest.responseText;
		if(msg=="false"){
			emailmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>邮箱已被使用</font>";	
			return false;		
		}else {
			emailmsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'> <font color='green'>邮箱可用</font>";
			return true;
		}
	}
}

function checkForm(){
	var email=document.getElementById("email");
	if(email.value == ""){
		alert("我的邮箱必须填写！");
		document.getElementById("email").focus();
		return false;
	}
	 if(ok()==false){
	 	alert("此邮箱已被注册，请重新输入！");
		document.getElementById("email").focus();
		return false;
	 }
    if(document.getElementById("npassword").value==""){
		alert("创建密码必须填写！");
		document.getElementById("npassword").focus();
		return false;
	}else{
		if(document.getElementById("npassword").value.length<6){
			alert("密码长度不能小于六位！");
			document.getElementById("npassword").focus();
			return false;
		}
	}
	if(document.getElementById("rpassword").value == ""){
		alert("确认密码必须填写！");
		document.getElementById("rpassword").focus();
		return false;
	}
	if(document.getElementById("nickname").value==""){
		alert("昵称必须填写！");
		document.getElementById("nickname").focus();
		return false;
	}
	if(document.getElementsByName("sex").value==""){
		alert("性别必须填写！");
		document.getElementById("sex1").focus();
		document.getElementById("sex2").focus();
		return false;
	}		 
	 
	if(document.getElementById("city").value==""){
		alert("所在地必须填写！");
		document.getElementById("city").focus();
		return false;
	}
	var inputCode = document.getElementById("input2").value.toUpperCase();
	if(inputCode.length <=0) {
   		alert("请输入验证码！");
   		return false;
	}else if(inputCode != code ){
   		alert("验证码输入错误！");
   		createCode();
   		return false;
	}
}
 function checkForm1(){
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

function checkPwd(){
	var pwd=document.getElementById("npassword");
	var rpwd=document.getElementById("rpassword");
	var pwdmsg=document.getElementById("pwdmsg");
	if (pwd.value=="") {  
		pwdmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>密码不能为空</font>";  
	}else{
		if (pwd.value.length < 6) {
			pwdmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>密码长度不能小于六位</font>";
		}else
			pwdmsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'> <font color='green'>输入正确</font>";
	}
}
function checkRpwd(){
	var pwd=document.getElementById("npassword");
	var rpwd=document.getElementById("rpassword");
	var rpwdmsg=document.getElementById("rpwdmsg");
	if (rpwd.value!=pwd.value||rpwd.value==""||rpwd.value.length<6) {  
		rpwdmsg.innerHTML = "<img src='icon/err.png' align='absmiddle'> <font color='red'>密码不正确</font>";
	}else{
		rpwdmsg.innerHTML = "<img src='icon/ok.png' align='absmiddle'> <font color='green'>输入正确</font>";
	}
	}  

</script>

</head>
<body onload="createCode()">
<!-- header开始-->
<table id="header" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" align="center"><img src="images/logo.png" width="178" height="62" /></td>
    <td width="55%" align="left">&nbsp;</td>
    <td width="25%" align="right">&nbsp;</td>
  </tr>
</table>
<!-- header结束-->
<!-- container 开始-->

<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" valign="top">
    <form action="<%=request.getContextPath()%>/RegisterServlet" method="post" onsubmit="return checkForm()" >
      <table border="0" align="center" cellpadding="0" cellspacing="0" id="register">
        <tr>
          <td class="title">30秒快速开通微博</td>
        </tr>
        <tr>
          <td><table width="90%" border="0" cellpadding="5" cellspacing="0" id="register_content">
            <tr>
              <td width="20%" align="right">我的邮箱：</td>
              <td width="53%"><input name="email" type="text" class="input1" id="email" onblur="checkemail()" value="${param.emailExist}"/></td>
              <td width="27%"><span id="emailmsg"><a href="https://www.google.com/accounts/NewAccount">还没有邮箱?</a><span></td>
            </tr>
            <tr>
              <td width="20%" align="right">创建密码：</td>
              <td width="53%"><input name="npassword" type="password" class="input1" id="npassword" onblur="checkPwd()"/></td>
              <td width="27%"><span id="pwdmsg"><span></td>
            </tr>
            <tr>
              <td width="20%" align="right">确认密码：</td>
              <td width="53%"><input name="rpassword" type="password" class="input1" id="rpassword" onblur="checkRpwd()"/></td>
              <td width="27%"><span id="rpwdmsg"><span></td>
            </tr>
            <tr>
              <td  width="20%" align="right">昵称：</td>
              <td width="53%"><input name="nickname" type="text" class="input1" id="nickname" onblur="checkNick()"/></td>
              <td width="27%"><span id="nickmsg"><span></td>
            </tr>
            <tr>
              <td width="20%" align="right">性别：</td>
              <td width="53%"><input type="radio" name="sex" id="sex1" value="男" />
                男
                  &nbsp; &nbsp; &nbsp; &nbsp; <input type="radio" name="sex" id="sex2" value="女" />
                  女</td>
              <td width="27%"><span id="sexmsg"><span></td>
            </tr>
             <tr>
              <td width="20%" align="right">密保问题：</td>
              <td width="53%">
              <select>
              <option>你最喜欢的颜色？</option>
              <option>你最喜欢的歌曲？</option>
              <option>你最喜欢的明星？</option>
              </select>
                                     </td>
              <td width="27%"><span id="addrmsg"><span></td>
            </tr>
            <tr>
              <td width="20%" align="right">密保答案：</td>
              <td width="53%">
              <input name="question" type="text" class="input1" id="question" /></td>
              <td width="27%"><span id="addrmsg"><span></td>
            </tr>
            <tr>
              <td width="20%" align="right">所在地：</td>
              <td width="53%">
              <input name="city" type="text" class="input1" id="city" /></td>
              <td width="27%"><span id="addrmsg"><span></td>
            </tr>
            <tr>
               <td align="right">验证码：</td>
              <td><input name="yzm" type="text" id="input2" class="input2" id="yzm" />
                <input type="text" id="checkcode" class="code" style="width: 55px; height: 20px;" readonly="readonly"/> 
                <a onclick="createCode()" href="" style="text-decoration: none">&nbsp;&nbsp;看不清楚</a></td>
              <td> &nbsp;</td>
            </tr>
            <tr>
              <td align="center">&nbsp;</td>
              <td align="left"><input type="submit" style="background-image: url('images/regbtn1.png'); height: 37px; width: 150px;" value=""/></td>
              <td align="center">&nbsp;</td>
              </tr>
            <tr>
              <td align="center">&nbsp;</td>
              <td align="left"><input type="checkbox" checked="checked"/>同意 《微博网络使用协议》</td>
              <td align="center">&nbsp;</td>
            </tr>
          </table></td>
        </tr>
      </table>
      
    </form>
     
    </td>
	    <td width="280" align="center" valign="top" class="pageright">
        <!-- userlogin 开始-->
        <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/LoginServlet" onsubmit="return checkForm1()">
        <table id="login" width="220" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2" class="title">已有微博登录账号？</td>
          </tr>
          <tr>
            <td colspan="2" align="left">邮箱/会员账号/手机号：<br />
              <input name="userid" type="text" class="logininput" id="userid" onmouseover="this.focus()" />
            </td>
          </tr>
          <tr>
            <td colspan="2" align="left">输入你的登录密码：<br />
              <input name="password" type="password" class="logininput" id="password" onmouseover="this.focus()"/>
            </td>
          </tr>
          <tr>
            <td width="120"><input name="save" type="checkbox" id="save" value="yes" />下次自动登录</td>
            <td width="100"><a href="findpassword.jsp" style="text-decoration:none"><font color="#0066CC">找回登录密码</font></a></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><input name="Submit" type="submit" class="loginbtn" id="Submit" value="登录微博  " /></td>
          </tr>
        </table>
        </form>
    	<!-- userlogin 结束-->
        <table id="msnlogin">
         <tr>
          <td align="center"><img src="images/msnlogin.png" width="143" height="32" /></td></tr>
        </table>
    </td>
  </tr>
	</table>
	
	       <%
  if(request.getParameter("msg")!=null){
  int res=Integer.parseInt(request.getParameter("msg"));
  if(res==6){
  out.print("<script>alert('注册失败，请重新输入');</script>");
  }
  
  }
   %>
<!-- container 结束-->

<!--footer开始-->
<table id="footer" border="0" align="center" cellpadding="3" cellspacing="0">
   <tr>
    <td width="534" align="left"><a href="http://help.sina.com.cn/p/i_12.html">帮助</a>&nbsp;&nbsp; <a href="http://weibo.com/signup/signup.php?c=&type=&inviteCode=&code=&spe=&lang=">意见反馈</a>&nbsp;&nbsp; 
    <a href="http://weibo.com/login.php?url=http%3A%2F%2Fweibo.com%2Fpub%2Fverified">微博认证及合作</a>&nbsp;&nbsp;
     <a href="http://open.weibo.com/">开放平台</a>&nbsp;&nbsp; <a href="http://hr.t.sina.com.cn/">微博招聘</a>&nbsp;&nbsp;
      <a href="http://news.sina.com.cn/guide/">微博导航</a></td>        
    <td width="447" align="right">Copyright: 2011-2015<a href="http://corp.sina.com.cn/chn/copyright.html"> 微博系统 版权所有</a></td>
  </tr>
  <tr>
    <td align="left">客服电话：400 123 12345（按当地市话标准收费）</td>
    <td align="right">语言：
      <select name="select" id="select">
        <option>中文(简体)</option>
        <option>中文(繁体)</option>
    </select></td>
  </tr>        
</table>
<!--footer结束-->
</body>
</html>
</html>