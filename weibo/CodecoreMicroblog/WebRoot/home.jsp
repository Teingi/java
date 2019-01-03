<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.codecore.dao.AttentionDao ,com.codecore.entity.UserInfo, com.codecore.entity.Blog"%>
<%@page import="com.codecore.dbutil.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.codecore.entity.Comment"%>
<%@page import="com.codecore.dao.CommentDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
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
<link rel="stylesheet" type="text/css" href="css/home.css" />
<%
	int uid=Integer.parseInt(session.getAttribute("userId").toString());
	AttentionDao attentionDao=new AttentionDao();
	UserInfo userInfo=attentionDao.getUserInfo(uid);
	session.setAttribute("userInfo",userInfo);
	session.setAttribute("attention", attentionDao.accountAttention(userInfo.getU_id()));
	session.setAttribute("fans",attentionDao.accountFans(userInfo.getU_id()));
	session.setAttribute("curBlogs",attentionDao.accountBlogs(userInfo.getU_id()));
 %>
<title>微博 - ${userInfo.u_nick}的主页</title>
<script type="text/javascript" src="script/home.js"></script>
<script type="text/javascript" src="script/page.js"></script>
<script type="text/javascript" src="script/imgchange.js"></script>
</head>
<%
 	List<UserInfo> lstInfos=new ArrayList<UserInfo>();
 	lstInfos=attentionDao.getAttention(userInfo.getU_id());
 	//session.setAttribute("attentions",lstInfos);
 	if(lstInfos!=null && lstInfos.size()>0){
 		for(Iterator<UserInfo> it=lstInfos.iterator(); it.hasNext();){
 			pageContext.setAttribute("attentions",it.next());
 		}
 	}
  %>
<script type="text/javascript">  
//微博字数控制函数
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
//display 显示工具
var xmlHttpRequest;
var x, y;
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
//显示信息
function over(id){
	//记录鼠标位置
	x=event.clientX;
	y=event.clientY;
	//创建对象
	createXmlHttpRequest();
	xmlHttpRequest.onreadystatechange=processor;
	//调用方法
	var url="http://localhost:8080/${pageContext.request.contextPath}/ShowAttentonBlogServlet?id="+id;
	xmlHttpRequest.open("GET",url, true);
	//发送请求
	xmlHttpRequest.send();
}
//处理请求
function processor(){
	var result;
	if(xmlHttpRequest.readyState==4 && xmlHttpRequest.status==200){
		result=xmlHttpRequest.responseText;
	}
}  
</script> 
<body onload="<%=request.getContextPath()%>/ShowBlogServlet?uid=${userInfo.u_id}" >
    <a href="javascript:scroll(0,0)" id="top"> <img src="images/returntotop.jpg" border="0" /></a>
<!-- header开始-->
<table id="header" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="20%" align="center"><img src="images/logo.png" width="178" height="62" /></td>
    <td width="55%" align="right">
      <table border="0" align="right" cellpadding="0" cellspacing="0" id="daohang">
        <tr>
          <td width="20%"><a href="<%=request.getContextPath()%>/ShowAttentionBlogServlet?curUid=${userInfo.u_id}">我的首页</font></a></td>
          <td width="20%"><a href="<%=request.getContextPath()%>/PageServlet?curUid=${userInfo.u_id}">我的博客</a></td>
          <td width="20%"><a href="servlet/ShowFriendsServlet?u_id=${userInfo.u_id}">我的好友</a></td>
          <td width="20%"><a href="user.jsp">随便看看</a></td>
        </tr>
      </table>
    </td>
    <td width="25%" align="right">
      <table id="welcome" border="0" cellspacing="0" cellpadding="0">
        <tr>          
          <td width="30" height="30" rowspan="2" class="userface_bg"><img src="${userInfo.u_img}" border="0" width="20" height="20" /></td>
          <td>欢迎您，${userInfo.u_nick}！</td>
        </tr>
        <tr>
          <td><a href="<%=request.getContextPath()%>/RemoveServlet?uid=${userInfo.u_id}">[ 退出 ]</a></td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<!-- header结束-->
<!-- container 开始-->
<table border="0" align="center" cellpadding="0" cellspacing="0" id="container">
  <tr>
    <td width="670" height="600" valign="top">
  <form action="servlet/BlogPublishServlet?curUid=${userInfo.u_id}" method="post" name="blogpublish" enctype="multipart/form-data">
	<table width="100%" border="0" cellpadding="0" cellspacing="0" id="input">
      <tr>
        <td width="160" height="48">&nbsp;</td>
        <td width="479">
		<table width="483" border="0">
            <tr>
              <td width="477" height="1">&nbsp;</td>
            </tr>
            <tr>
              <td height="15" align="right" class="STYLE1">
              		<input disabled style="visibility:hidden" maxLength="4" name="total" size="3" value="140" class="inputtext">
                    <input disabled style="visibility:hidden" maxLength="4" name="used" size="3" value="0" class="inputtext">
                 还可以输入<input disabled maxLength="4" name="remain" size="3" value="140" class="inputtext" style="border:none;background:transparent;font-size:20px;">个字 </td>
            </tr> 
          </table></td>
        <td width="31">&nbsp;</td>
      </tr>
      <tr>
        <td height="89"><span class="STYLE2"></span></td>
        <td><textarea  name="b_content" rows="6" cols="40" wrap=PHYSICAL onKeyDown="gbcount(this.form.b_content,this.form.total,this.form.used,this.form.remain);" onKeyUp="gbcount(this.form.b_content,this.form.total,this.form.used,this.form.remain);"></textarea></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="35">&nbsp;</td>
        <td align="right" valign="middle">

          选择图片:<input type="file" name="b_img"  value="上传图片" style="border:none;background:transparent;" />
          
          
          <input name="blogpublish" type="submit" class="STYLE1" style="background-image:url(images/btn_input .png)"; font-size:20px;" value="发 布" />
          </td>
    <td>&nbsp;</td>
      </tr>
    </table>
</form>	

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="menu">
          <tr>
            <td width="33%" align="center"><table width="165" border="0" align="center" cellpadding="0" cellspacing="0">
          
            </table></td>
            <td width="18%" align="right">&nbsp;</td>
            <td width="49%" align="center"><form id="form1" name="form1" method="post" action="servlet/SearchHomeServlet">
              <input name="textfield1" type="text" class="input" id="textfield1" />
              <input name="button" type="submit" class="btnsearch" id="button" value="搜索" />
            </form></td>
          </tr>
      </table>
        <!-- weibo 开始-->
        <%
        	ArrayList<Blog> lstBlogs=(ArrayList<Blog>) session.getAttribute("listAll");
        	Iterator it=lstBlogs.iterator();
        	while(it.hasNext()){
        		Blog blog=new Blog();
        		AttentionDao attentionDao2=new AttentionDao();
        		blog=(Blog)it.next();
        		//blog.getB_id();
        		String portrait=attentionDao2.getPortrait(blog.getU_id());
        		String nick=attentionDao2.getNick(blog.getU_id());
        		pageContext.setAttribute("portrait",portrait);
        		pageContext.setAttribute("nick", nick);
        		pageContext.setAttribute("blogs", blog);
        		CommentDao commentDao=new CommentDao();
        		session.setAttribute("c_degree", commentDao.accountComment(blog.getB_id()));
        	%>
       <table id="weibo" width="90%" border="0" align="center" cellpadding="3" cellspacing="0">
          <tr>
            <td rowspan="3" align="center" valign="top"><a href="<%=request.getContextPath()%>/ShowInterestBlogServlet?uid=${blogs.u_id}"><img src="${portrait}" width="50" height="50" title="${nick}"/></a> </td>
            <td width="88%" class="content"><a href="user.jsp">${nick}</a><img src="icon/v.gif" width="11" height="10" align="middle" />：${blogs.b_content}</td>
          </tr>
          <tr>
            <td><%if(blog.getB_img()!=null){%>
            	<img src="${blogs.b_img}" width="89" height="120" name="image1" id="imgid${blogs.b_id}" style="cursor:url(mouse/0001.ani)"  ondblclick="" onclick="bigsmall(${blogs.b_id})"/>
           <% } %></td>
          </tr>
          <tr>
            <td height="25"><table width="100%" border="0" cellpadding="0" cellspacing="0" id="weibo_status" >
              <tr>
                <td>${blogs.b_time}&nbsp;${blogs.b_date}</td>
                <td align="right"><a style="text-decoration:none;color:#09C" href="<%=request.getContextPath()%>/DispatchBlogServlet?bid=${blogs.b_id}">转发(${blogs.b_degree})</a> 
                &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/servlet/AddCollectServlet?bid=${blogs.b_id}&type=home" style="text-decoration: none;color:#09C">收藏</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                <label onclick="display(<%=blog.getB_id()%>)">评论(${c_degree})</label><form action="<%=request.getContextPath()%>/AddCommentServlet?curUid=${userInfo.u_id}&bid=${blogs.b_id}" method="post">
                <div id="divtext<%=blog.getB_id()%>" style="display: none">
                <textarea rows="1" cols="35" name="txtContent" id="textarea" ></textarea><br />
                <input type="submit" value="评论"/>&nbsp;&nbsp;&nbsp;
                <input type="button" onclick="display(<%=blog.getB_id()%>)" value="取消"/> 
                <table width="70%" border="0" >
                	<%
                		ArrayList<Comment> lstComment=new ArrayList<Comment>();
                		lstComment=commentDao.getContentById(blog.getB_id());
                		Iterator cit=lstComment.iterator();
                		while(cit.hasNext()){
                			Comment comment=new Comment();
                			comment=(Comment)cit.next();
							AttentionDao dao=new AttentionDao();
							String uNick=dao.getUserInfo(comment.getU_id()).getU_nick();
							pageContext.setAttribute("unick",uNick);%>
					<tr>
						<td width="30%">${unick}说：</td>
						<td align="left"><%=comment.getC_content()%></td>
					</tr>
							
						<%
                		}
                	 %>
                </table>
                </div> </form> 
               </td>
              </tr>
            </table></td>
          </tr>
    	</table>
        	<%
        	}
         %>
     <!-- 分页处理 -->
	<table align="center" id="page">
		<form action="/CodecoreMicroblog/ShowAttentionBlogServlet?pageNumber=1" id="navigatorForm">
      <tr>
        <td align="right"><a style="text-decoration: none;color:#09C" href="<%=request.getContextPath()%>/ShowAttentionBlogServlet?pageNumber=1">首页</a>&nbsp;
        	第 <select name="pageNumber" onchange="gotoSelectedPage();">
        			  <c:forEach begin="1" end="${totalPages}" step="1" var="pageIndex">  
       					 <c:choose>  
            				<c:when test="${pageIndex eq pageNumber}">  
               					 <option value="${pageIndex}" selected="selected">${pageIndex}</option>  
            				</c:when>  
           				 <c:otherwise>  
                			<option value="${pageIndex}">${pageIndex}</option>  
            			 </c:otherwise>  
       					</c:choose>  
    				</c:forEach>  
				  </select>&nbsp;页
           &nbsp;<c:choose>
           			<c:when test="${pageIndex eq totalPages}"></c:when>
           			<c:otherwise>
           				<a style="text-decoration: none;color:#09C" href="<%=request.getContextPath()%>/ShowAttentionBlogServlet?pageNumber=${pageNumber+1}">下一页</a>
           			</c:otherwise>
           		</c:choose>
	</td>
      </tr>
      </form>
    </table>
    <!-- weibo 结束-->
    </td>
	    <td width="280" align="center" valign="top" class="pageright">
        <!-- userinfo 开始-->
        <table align="center" id="userinfo">
          <tr>
            <td width="25%" rowspan="2"><a href="myface.jsp"><img src="${userInfo.u_img}" width="50" height="50" /></a></td>
            <td width="75%"><a href="profile.jsp">${userInfo.u_nick}</a></td>
          </tr>
          <tr>
            <td valign="top">${userInfo.u_addr}</td>
          </tr>
          <tr>
            <td colspan="2" align="left"><table width="80%" border="0" align="left" cellpadding="3" cellspacing="0">
              <tr>
                <td align="center" class="split2"><a href="servlet/ShowFollowingServlet?u_id=${userInfo.u_id}">关注</a><br>${attention}</td>
                <td align="center" class="split2"><a href="servlet/ShowFansServlet?u_id=${userInfo.u_id}">粉丝</a><br>${fans}
                </td>
                <td align="center"><a href="<%=request.getContextPath()%>/PageServlet?curUid=${userInfo.u_id}">微博</a><br>
                ${curBlogs}</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2" class="split1"><a href="userinfo.jsp">个人账户设置</a></td>
          </tr>
           <tr>
            <td colspan="2" class="split1"><a href="<%=request.getContextPath()%>/servlet/ShowCollectServlet?curUid=${userInfo.u_id}"> 我的收藏</a></td>
          </tr> 
        </table>
        <table border="0" align="center" cellpadding="0" cellspacing="0" id="userlist">
          <tr>
            <td class="title" height="29">可能感兴趣的人</td>
            <td align="right" class="title"></td>
          </tr>
           <%
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
                <td width="26%"><a href="<%=request.getContextPath()%>/ShowInterestBlogServlet?uid=<%=rs.getString("u_id")%>"><img src="<%=rs.getString("u_img")%>" width="50" height="50" border="0" /></a></td>
                <td width="74%"><a href="user.jsp"><%=rs.getString("u_nick")%></a> 
                <a href="<%=request.getContextPath()%>/AddAttentionServlet?goal_uid=<%=rs.getInt("u_id")%>&flag=home" class="btnguanzhu">+关注</a>
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
                 <center> <a  href="home.jsp?page=<%=intPage+1%>" style="text-decoration: none">[换一换]</a> </center><%} %>
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
<%if(request.getParameter("msg")!=null){
    int res=Integer.parseInt(request.getParameter("msg"));
      if(res==1){
      out.print("<script>alert('收藏成功！');</script>");
     }else{
      out.print("<script>alert('收藏失败！');</script>");
     }
    }
     %>  
</body>
</html>
</html>