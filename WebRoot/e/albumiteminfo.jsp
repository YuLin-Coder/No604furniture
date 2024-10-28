
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.uibuilder.*,com.itbaizhan.daowen.bll.*,java.util.*" %>
<%@ page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/list.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/leaveword.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
 <%
    String  id=request.getParameter("id");
    
    if( id!=null)
    {
      
      Albumitem temobjalbumitem=(Albumitem)DALBase.load("albumitem"," where id="+ id);
      request.setAttribute("albumitem",temobjalbumitem);
      if(temobjalbumitem!=null){
    	  
    	  Album  album =(Album)DALBase.load("album", "where id="+temobjalbumitem.getAlbumid());
    	  if(album.getPrivilege().equals("2")){
	    	  Huiyuan loginhuiyuan=(Huiyuan)request.getSession().getAttribute("huiyuan");
	          if(loginhuiyuan==null)
	          {
	        	  response.sendRedirect(SystemParam.getSiteRoot()+"/e/albumrefuse.jsp");
	        	  
	          }else
	          {
	        	  
	        	  if(!loginhuiyuan.getAccountname().equals(album.getPubren()))
	        		  response.sendRedirect(SystemParam.getSiteRoot()+"/e/albumrefuse.jsp");
	 	        	   
	          }
    	  }
      }
    }
  %>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl" value="/admin/albumitemmanager.do?actiontype=load&id=<%=id%>&forwardurl=/e/albumiteminfo.jsp">
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a>
			&gt;&gt;<a href="<%=SystemParam.getSiteRoot() %>/admin/albumitemmanager.do?actiontype=get&albumid=${album.id}&seedid=m101&forwardurl=/e/albumitemlist.jsp">${album.name}</a>
		</div>
	</div>
	<div class="fn-clear"></div>
	<div class="row-flow">
		 <div class="page-main-box">
        <div class="news-info">
           
            <div class="show-content">
                <div class="content">
                	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					<tr>
						
						<td><img id="imgTupian" width="200px" height="200px"
							src="${requestScope.albumitem.tupian}" /></td>
					</tr>

				</table>
            </div>
                <jsp:include page="comment.jsp?commenttype=album"></jsp:include>
        </div>
    </div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
