<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            String id=request.getParameter("id");
            if(id!=null){
            
                Notice n=(Notice)DALBase.load(Notice.class,new Integer(id));
                
                if(n!=null){
                    n.setClickcount(n.getClickcount()+1);
                    DALBase.update(n);
                	request.setAttribute("notice",n);
                }
                
            }
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<link rel="stylesheet" href="css/register.css" type="text/css"></link>

<link rel="stylesheet" href="css/leaveword.css" type="text/css"></link>

<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>



    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="wrap">
	  <div class="cover-title">
                   当前位置：<a href="index.aspx">首页</a> &gt;&gt; <a>系统公告</a>
      </div>
	</div>
	<input type="hidden" id="reUrl" name="reurl" value="/e/noticeinfo.jsp?id=<%=id%>"/>
	

	<div class="fn-clear"></div>
	
	<div class="wrap">
		
		 
		   <div class="info">
                    <h1>
                           ${notice.title}
                    </h1>
                    <h5>
                                                         来源: ${notice.pubren}
                                                        浏览:<span id="count">2次</span>
                                                         发布时间：${notice.pubtime}
                    </h5>
                    <div class="news-content">
                        <p>
                            ${notice.dcontent}  
                        </p>
                        <div id="content_bot">
                        </div>
                        
                    </div>
                    
                    
                    
                    
                </div>
		   <jsp:include page="comment.jsp?commenttype=notice"></jsp:include>
		
		

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>