 
 
<%@page import="com.codecore.entity.UserInfo"%>
<%@ page language="java" import="java.util.*" import="com.codecore.dao.*" import="com.codecore.entify.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <script type="text/javascript">
	    function init() {
		/////////填充Radio
		var hidden_sex = document.getElementById('e_sex').value; //隐藏域中记录的值
		var frm_sex = document.frm.sex; //HTML 控件值
		//遍历Sex控件数组，如果某一个值和隐藏域中的值相等，则让此控件的Checked属性为true;
		 for ( var i = 0; i < frm_sex.length; i++) {
			if (frm_sex[i].value == hidden_sex) {
				frm_sex[i].checked = true;
				break;
			}
	}
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/userinfo.css" />
<title>微博 - 账号管理</title>
<script type="text/javascript" src="script/userinfo.js"></script>
</head>
<body onload="init()" >
<!-- header开始-->
<table id="header" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" align="center"><img src="images/logo.png" width="178" height="62" /></td>
    <td width="55%" align="left">账号设置</td>
    <td width="55%" align="right"><a href="home.jsp"><h3 style="color: #F0F0F0">修改完成！</h3></a></td>
    <td width="25%" align="right">&nbsp;</td>
  </tr>
</table>
<% 
	  int id=Integer.parseInt(request.getSession().getAttribute("userId").toString());
       UserDao userDao=new UserDao(); 
       UserInfo  obj=userDao.getUserInfoById(id); 
       pageContext.setAttribute("userInfo",obj);
      	 
	 %>
<!-- header结束-->
<!-- container 开始-->

  <form  name="frm" action="servlet/UpdateuserInfoServlet?id=${userInfo.u_id}" method="post">
     <!-- 记录Radio的值 -->
<input type="hidden" id="e_sex" value="${userInfo.u_sex}" />
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="600" valign="top">
     <table border="0" align="center" cellpadding="0" cellspacing="0" id="userinfo">
        <tr>
          <td class="title">个人资料</td>
          </tr>
        <tr>
          <td class="menu">基本资料 | <a href="mypassword.jsp">修改密码</a> | <a href="myface.jsp">修改头像</a></td>
        </tr>
        <tr>
          <td align="center"><table width="90%" border="0" cellpadding="5" cellspacing="0" id="userinfo_content">
            <tr>
              <td width="20%" align="right" >登录账号：</td>
              <td width="53%"  name="mail"> ${userInfo.u_mail}</td>
              </tr>
            <tr>
              <td align="right">昵称：</td>
              <td><input name="nick" type="text" class="input1" id="password" value="${userInfo.u_nick }"/></td>
              </tr>
            <tr>
              <td align="right">真实姓名：</td>
              <td><input name="name" type="text"class="input1" value="${userInfo.u_name}"/></td>
              </tr>
            <tr>
              <td align="right">所在地：</td>
              <td><input name="addr" type="text" class="input1" value="${userInfo.u_addr}"/></td>
              </tr>
            <tr>
              <td align="right">性别：</td>
              <td><label> <input type="radio" name="sex" value="男" />男</label>&nbsp;&nbsp;
                <label> <input type="radio" name="sex" value="女" />女</label></td>
              </tr>
            <tr>
              <td align="right">出生日期：</td>
              <td><input name="date" type="text"class="input1" value="${userInfo.u_date}"/></td>
              </tr>
              <tr>
              <td></td>
              <td>(请用yyyy-mm-dd的形式输入出生日期)</td>
              </tr>
              <tr>
              <td align="right">密保问题：</td>
              <td><select>
              <option>你最喜欢的颜色？</option>
              <option>你最喜欢的歌曲？</option>
              <option>你最喜欢的明星？</option>
              </select>
              </td>
              </tr>
             <tr>
              <td align="right">答案：</td> 
              <td><input name="question" type="text"class="input1" value="${userInfo.u_question}"/></td>
              </tr> 
            <tr>
              <td align="right">QQ：</td>
              <td><input name="qq" type="text" class="input1" value="${userInfo.u_qq}"/></td>
              </tr>
            <tr>
              <td align="right">MSN：</td>
              <td ><input name="msn" type="text" class="input1" value="${userInfo.u_msn}" /></td>
              </tr>
            <tr>
              <td align="right">签名：</td>
              <td ><input name="sign" type="text" class="input1" value="${userInfo.u_sign}"/></td>
              </tr>
            <tr>
              
              <td align="right">&nbsp;</td>
               <td align="left"> 
              <input name="dosubmit" type="submit" id="dosubmit" value="" style="background:url(images/editbtn.png); border-style:none; width:150px; height:37px; background-repeat:no-repeat;" />
            </tr>
            </table></td>
          </tr>
        </table>
      
      
    </td>
  </tr>
  
  
  
	</table>
	</form>
<!-- container 结束-->

<!--footer开始-->
<table id="footer" border="0" align="center" cellpadding="3" cellspacing="0">
  <tr>
    <td width="534" align="left"><a href="#">帮助</a>&nbsp;&nbsp; <a href="#">意见反馈</a>&nbsp;&nbsp; <a href="#">微博认证及合作</a>&nbsp;&nbsp; <a href="#">开放平台</a>&nbsp;&nbsp; <a href="#">微博招聘</a>&nbsp;&nbsp; <a href="#">微博导航</a></td>        
    <td width="447" align="right">Copyright: 2011-2015<a href="#"> 微博系统 版权所有</a></td>
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


 <%
   if(request.getParameter("msg")!=null){
   int res=Integer.parseInt(request.getParameter("msg"));
   switch (res) {
    case 1:
	out.print("<script>alert('修改信息成功！');</script>");
	break;
	case 2:
	out.print("<script>alert('修改信息失败！');</script>");
	break;
	
	case 3:
	out.print("<script>alert('修改密码成功！');</script>");
	break;
	
	 
	 
	
}}
   
    %>
</body>
</html>
 