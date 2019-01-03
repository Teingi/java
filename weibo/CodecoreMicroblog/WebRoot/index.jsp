<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
<link rel="stylesheet" type="text/css" href="css/index.css" />
<title>CodeCore MicroBlog</title>    
<script type="text/javascript" src="script/global.js"></script>
<script type="text/javascript" src="script/index.js"></script>
 <script type="text/javascript">
   
	function init() {
	   //LoginServlet
	   var s=document.forms['faceFrm'];  		  
	   s.submit();	 
	   
	   //alert(s.id);
	}
</script>
</head>
<body>
<!--header 开始-->
<table id="header" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="right"><table border="0" align="right" cellpadding="0" cellspacing="0" id="daohang">
      <tr>
        <td align="center"><a href="<%=request.getContextPath()%>/ShowInterestBlogServlet">随便看看</a>&nbsp; |&nbsp; <a href="about.jsp">关于微博</a></td>
        </tr>
    </table></td>
  </tr>
</table>
<!--header 结束-->
<!--container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="70%" valign="top">
    <!-- content开始 -->
    <table id="content" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="phototitle"><img src="icon/huangguan.gif" width="24" height="19" align="absmiddle" /> 他（她）们正在用微博</td>
     </tr>
     <tr>
       <td>
         <!-- photolist开始 -->
         <form action="/CodecoreMicroblog/LoginServlet" name="faceFrm" method="post" id="frm">
         <table id="photolist" border="0" cellspacing="0" cellpadding="0">
         	<tr>
         	<c:forEach var="faces" varStatus="su" items="${applicationScope.face}">
				<td> <a href="<%=request.getContextPath()%>/ShowInterestBlogServlet?uid=${faces.u_id}" target="_blank">
				<img src="${faces.u_img}" id="${faces.u_id}" alt="${faces.u_nick}" title="${faces.u_nick}"
					 onmouseover="xianshi(this)" onmouseout="huifu(this)" /></a>
				</td>
				<c:if test="${su.count%8 == 0 }">
			</tr>
			<tr>
				</c:if>
				</c:forEach>
			</tr>
         
         </table>
         </form>
         <!-- photolist结束 -->
       </td>
     </tr>
     <tr>
       <td>
          <!--counter开始-->
          <table id="counter" border="0" cellpadding="0" cellspacing="0" align="center">
             <tr>
               <td valign="middle">
                 <table width="150" border="0" align="center" cellpadding="0" cellspacing="0">
                   <tr>
                     <td class="counternum">${applicationScope.info}</td>
                   </tr>
                 </table>
               </td>
             </tr>
          </table>
        </td>
      </tr>
    </table>
    <!-- content结束 -->
    </td>
    <td>
    <!-- pageright开始 -->
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center">
        <!--login开始-->
        <form id="form1" name="form1" method="post" action="<%=request.getContextPath()%>/LoginServlet" onsubmit="return checkForm()">
        <table id="login" width="220" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td colspan="2"><a href="register.jsp"><img src="images/regbtn.png" width="200" height="37" border="0" /></a></td>
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
            <td width="120"><input name="save" type="checkbox" id="save" value="yes"/>下次自动登录</td>
            <td width="100"><a href="findpassword.jsp" style="text-decoration:none"><font color="#0066CC">找回登录密码</font></a></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><input name="Submit" type="submit" class="loginbtn" id="Submit" value="  登录微博  " /></td>
          </tr>
        </table>
        
        
        <%
  if(request.getParameter("msg")!=null){
  int res=Integer.parseInt(request.getParameter("msg"));
  if(res==5){
  out.print("<script>alert('账号或密码不正确，请重新输入');</script>");
  }
  
  }
   %>
        </form>
        <!--login结束-->
        </td>
      </tr>
	  <tr>
        <td height="20" valign="bottom"><hr color="#CCCCCC" width="97%" size="1" /></td>
      </tr>
      <tr>
        <td>
        <!-- messge 开始-->
          <table id="message" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>              
              <td class="title">公告</td>
            </tr>
            <tr>
              <td>
                <ul type="disc">					
			      <li>微博系统开始测试火爆进行中</li>
                  <li>有啥新鲜事，跟大家说说</li>	
                  <li>完善资料寻找志同道合的朋友</li>	
                  <li>客服热线：022-88888888</li>						
			      <li><a href="#" target="_blank">更多历史公告...</a></li>
			    </ul>
              </td>
            </tr>
            <tr>
			  <td align="center">
				<a href="#" target="_blank"></a>
			  </td>
			</tr>
          </table>
        </td>
      </tr>
    </table>
    <!-- pageright结束 -->
    </td>
  </tr>
</table>
<!--container 结束-->
<!--footer开始-->
<table id="index_footer" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr>
 
    <td width="534" align="left"><a href="http://help.sina.com.cn/p/i_12.html">帮助</a>&nbsp;&nbsp; <a href="http://weibo.com/signup/signup.php?c=&type=&inviteCode=&code=&spe=&lang=">意见反馈</a>&nbsp;&nbsp; 
    <a href="http://weibo.com/login.php?url=http%3A%2F%2Fweibo.com%2Fpub%2Fverified">微博认证及合作</a>&nbsp;&nbsp;
     <a href="http://open.weibo.com/">开放平台</a>&nbsp;&nbsp; <a href="http://hr.t.sina.com.cn/">微博招聘</a>&nbsp;&nbsp;
      <a href="http://news.sina.com.cn/guide/">微博导航</a></td>        
    <td width="447" align="right">Copyright: 2011-2015<a href="http://corp.sina.com.cn/chn/copyright.html"> 微博系统 版权所有</a></td>
 <td width="166" align="right">语言：
      <select name="select" id="select">
        <option>中文(简体)</option>
        <option>中文(繁体)</option>
    </select></td>
  </tr>        
</table>
<!--footer结束-->
</body>
</html>
