<%@page import="com.codecore.dao.InterestBlogDao"%>
<%@page import="com.codecore.entity.Blog"%>
<%@page import="com.codecore.entity.UserInfo"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.codecore.dbutil.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/global.css" />
<link rel="stylesheet" type="text/css" href="css/user.css" />
<title>微博 - CodecoreMicroblog</title>
<script type="text/javascript" src="script/user.js"></script>
<script type="text/javascript" src="script/page.js"></script>
<script type="text/javascript" src="script/imgchange.js"></script>
<script type="text/javascript">
function noLogin(){
	alert('您还未登入，请先登入！');
}
</script>
</head>
<body>
<!-- header开始-->
<table id="header" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" align="center"><img src="images/logo.png" width="178" height="62" /></td>
    <td width="55%" align="right">
      <table border="0" align="right" cellpadding="0" cellspacing="0" id="daohang">
        <tr>
          <td width="20%"><a onclick="noLogin()" href="">我的首页</font></a></td>
          <td width="20%"><a onclick="noLogin()" href="">我的博客</a></td>
          <td width="20%"><a onclick="noLogin()" href="">我的好友</a></td>
          <td width="20%"><a href="visitor.jsp" href="">随便看看</a></td>
        </tr>
      </table>
    </td>
    <td width="25%" align="right">
      <table id="welcome" border="0" cellspacing="0" cellpadding="0">
        <tr>          
          <td width="30" height="30" rowspan="2" class="userface_bg"><img src="" border="0" width="20" height="20" /></td>
          <td>欢迎您，！</td>
        </tr>
        <tr>
          <td><a href="index.jsp">[ 退出 ]</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<!-- header结束-->
<!-- container 开始-->
            <% 
            int uid1=3;
            String strSQL1 = "SELECT * FROM userinfo where u_id!=? and u_id not in (select f_gid from friends where f_state=1 and f_uid=?) and u_id not in (select f_gid from friends where f_state=2 and f_uid=?) and u_id not in (select f_uid from friends where f_state=2 and f_gid=?) limit 0,1";
			DBConn dbConn1 = new DBConn();
			ResultSet rs1 = dbConn1.execQuery(strSQL1, new Object[]{uid1,uid1,uid1,uid1});
			UserInfo user = new UserInfo();
			if(rs1.next()) {
			%>
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="600" valign="top"><table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" id="curruser">
      <tr>
        <td width="24%"><img src="<%=rs1.getString("u_img")%>" width="120" height="120" class="userphoto" /></td>
        <td width="76%" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="curruserdetail">
          <tr>
            <td class="title"><%=rs1.getString("u_nick")%></td>
          </tr>
          <tr>
            <td><p><a href="user.jsp"><%=rs1.getString("u_url")%><br />
              </a><%=rs1.getString("u_addr")%><br />
            签名：<%=rs1.getString("u_sign")%><br/>
            <a id="fmsg" href="<%=request.getContextPath()%>/AddAttentionServlet?goal_uid=<%=rs1.getInt("u_id")%>&flag=user" onclick="checkfollowing()">+添加关注</a></p></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="menu">
          <tr>
            <td width="33%" align="center"><table width="165" border="0" align="center" cellpadding="0" cellspacing="0">
            </table></td>
            <td width="18%" align="right">&nbsp;</td>
            <td width="49%" align="center"><form id="form1" name="form1" method="post" action="">
              <input name="textfield" type="text" class="input" id="textfield" />
              <input name="button" type="submit" class="btnsearch" id="button" value="搜索" />
            </form></td>
          </tr>
      </table>
        <!-- weibo 开始-->
        <%
          int listid = rs1.getInt("u_id"); 
	      List<Blog> interestbloglist  = new InterestBlogDao().getInterestBlogByUid(listid);
	      request.setAttribute("interestbloglist", interestbloglist );
	      List<Blog> bloglist = (List<Blog>)request.getAttribute("interestbloglist"); 
  		  pageContext.setAttribute("bloglist",bloglist); 
        
         %>
          <c:forEach items="${bloglist}" var="obj" >
        <table id="weibo" width="90%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr>
            <td width="88%" class="content">${obj.b_content}</td>
          </tr>
          <tr>
            <td><img src="${obj.b_img}" width="89" height="120" name="image1" id="imgid${obj.b_id}" style="cursor:url(mouse/0001.ani)" onclick="bigsmall(${obj.b_id})"/>
            </td>
          </tr>
          <tr>
            <td height="25"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="weibo_status">
              <tr>
                <td>${obj.b_time}&nbsp;${obj.b_date}</td>
                
              </tr>
            </table></td>
          </tr>
    </table>
    </c:forEach>
            <%
			}
			dbConn1.closeConn();
			%> 
    <!-- weibo 结束-->
    </td>
	    <td width="280" align="center" valign="top" class="pageright">
        <!-- userinfo 开始-->
        <table align="center" id="userinfo">
          <tr>
            <td width="25%" rowspan="2"><img src="${userInfo.u_img}" width="50" height="50" /></td>
            <td width="75%"><a href="profile.jsp">${userInfo.u_nick}</a></td>
          </tr>
          <tr>
            <td valign="top">${userInfo.u_addr}</td>
          </tr>
          <tr>
            <td colspan="2" align="left"><table width="80%" border="0" align="left" cellpadding="3" cellspacing="0">
              <tr>
                <td align="center" class="split2"><a onclick="noLogin()">关注</a><br>0</td>
                <td align="center" class="split2"><a onclick="noLogin()">粉丝</a><br>0
                </td>
                <td align="center"><a onclick="noLogin()">微博</a><br>
                0
                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2" class="split1"><a onclick="noLogin()">个人账户设置</a></td>
          </tr>
            <tr>
            <td colspan="2" class="split1"><a onclick="noLogin()"> 我的收藏</a></td>
          </tr> 
        </table>
        <table border="0" align="center" cellpadding="0" cellspacing="0" id="userlist">
          <tr>
            <td class="title" height="29">可能感兴趣的人</td>
            <td align="right" class="title"></td>
                   </tr>
           <%
            int uid=2;
            int intPageSize=5;
            int intPageCount;
            int intRowCount;
            int intPage;
            int i;
            String strPage;
            strPage = request.getParameter("page");
            if(strPage==null){
            intPage=1;
            }else{
            intPage=Integer.parseInt(strPage);
            if(intPage<1) intPage = 1;
            }
             	String strSQL = "SELECT * FROM userinfo where u_id!=? and u_id not in" +
				" (select f_gid from friends where f_state=1 and f_uid=?) and u_id not in " +
				"(select f_gid from friends where f_state=2 and f_uid=?) and u_id not in " +
				"(select f_uid from friends where f_state=2 and f_gid=?) limit 0,1000";
			DBConn dbConn = new DBConn();
			ResultSet rs = dbConn.execQuery(strSQL, new Object[]{uid,uid,uid,uid});
			rs.last();
			intRowCount= rs.getRow();
			intPageCount = (intRowCount+intPageSize-1)/intPageSize;
			if(intPage>intPageCount)
			      intPage = intPageCount;
			if(intPageCount>0){
			      rs.absolute((intPage-1)*intPageSize+1);
			      i=0;
			      while(i<intPageSize&&!rs.isAfterLast()){%>      	
          <tr>
            <td colspan="2"><table border="0" cellpadding="0" cellspacing="0" class="userdetail">
              <tr>
                <td width="26%"><a onclick="noLogin()"><img src="<%=rs.getString("u_img")%>" width="50" height="50" border="0" /></a></td>
                <td width="74%"><a onclick="noLogin()"><%=rs.getString("u_nick")%></a> <a onclick="noLogin()" class="btnguanzhu">+关注</a>
                <br />
                <%=rs.getString("u_addr")%><br />生日：<%=rs.getString("u_date")%></td>
              </tr>
            
            </table></td>
            
              <%
              rs.next();
              i++;
              }
              }
               %>
          </tr>
                 
        </table>
            <table class="userdetail">  <tr><td > <%
                if(intPage<intPageCount){
                
              %>
                 <center> <a  onclick="noLogin()">[换一换]</a> </center><%} %>
             </td>
             </tr> 
          </table>
         
        <!-- userinfo 结束--></td>
          
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