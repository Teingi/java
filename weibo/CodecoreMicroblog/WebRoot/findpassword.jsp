<%@ page language="java" import="java.util.*"import="com.codecore.dao.*" import="com.codecore.entity.*"  pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/myface.css" />
<title>微博 - 找回密码</title>
<script type="text/javascript" src="script/myface.js"></script>
</head>
<body>
<!-- header开始-->
<table id="header" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" align="center"><img src="images/logo.png" width="178" height="62" /></td>
    <td width="55%" align="left">&nbsp; </td>
    <td width="55%" align="right"><a href="index.jsp"><h3 style="color: #F0F0F0">返回登入</h3></a></td>
    <td width="25%" align="right">&nbsp;</td>
  </tr>
</table>

 
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" valign="top">
    
    <form action="servlet/FindpasswordServlet" method="post">
      <table border="0" align="center" cellpadding="0" cellspacing="0" id="userinfo">
        <tr>
          <td class="title">找回密码</td>
          </tr>
        
        <tr>
              <td align="right">邮箱：</td>
              <td><input name="email" type="text" class="input1" id="email" /></td>
              </tr>
            
               <tr>
              <td align="right">密保问题：</td>
              <td>  
              <select>
              <option>你最喜欢的颜色？</option>
              <option>你最喜欢的歌曲？</option>
              <option>你最喜欢的明星？</option>
              </select>
              </td>
              </tr>
              <tr>
               <tr>
              <td align="right">密保答案：</td>
              <td><input name="question" type="text" class="input1" id="question" /></td>
              </tr>
              <tr>
              <td align="right">&nbsp;</td>
              <td align="left"> 
               <input name="dosubmit" type="submit" id="dosubmit" value="发到我的邮箱" style="background: border-style:none; 
               background-color:buttonshadow; width:150px; height:37px; background-repeat:no-repeat;color: blue" />
              </tr>
            </table></td>
          </tr>
        </table>
        
      
      </form>
         <%
  if(request.getParameter("msg")!=null){
  int res=Integer.parseInt(request.getParameter("msg"));
  if(res==7){
  out.print("<script>alert('信息错误，请重新输入');</script>");
  }else if(res==10){
  	out.print("<script>alert('您的密码已帮您找回，已发到您的邮箱，请您注意查收！');</script>");
  }
  }
   %>
    </td>
  </tr>
	</table>
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