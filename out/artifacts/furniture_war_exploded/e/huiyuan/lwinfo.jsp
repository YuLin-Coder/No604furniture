<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id = request.getParameter("id");
	String command = "add";
	Leaveword temobjleaveword=null;
	if (id != null) {
		command = "update";
	    temobjleaveword = (Leaveword) DALBase.load("leaveword", " where id=" + id);
		request.setAttribute("leaveword", temobjleaveword);
	}
%>
<head>
<%@ include file="law.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>留言查看</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>

<link rel="stylesheet" href="css/register.css" type="text/css"></link>

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>





</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">会员中心</a>
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					
			
			
			<table cellpadding="0" cellspacing="1" class="grid" width="100%">
				<tr>
					<td width="15%" align="right" class="title">标题:</td>
					<td width="*">${requestScope.leaveword.title}</td>
				</tr>
				<tr>
					<td align="right" class="title">留言人:</td>
					<td>${requestScope.leaveword.lwren}</td>
				</tr>
				<tr>
					<td align="right" class="title">留言时间:</td>
					<td>${requestScope.leaveword.pubtime}</td>
				</tr>
				
				<tr>
					<td align="right" class="title">内容:</td>
					<td>${requestScope.leaveword.dcontent}</td>
				</tr>
				<tr>
					<td align="right" class="title">回复人:</td>
					<td>${requestScope.leaveword.replyren}</td>
				</tr>
			    <%if(temobjleaveword!=null&&temobjleaveword.getStatus()==0){ %>
			    
			    <tr>
					<td colspan="2" align="right" >待回复:</td>
					
				</tr>
				
			    
			    <%}else{ %>			
				<tr>
					<td align="right" class="title">回复内容:</td>
					<td>${requestScope.leaveword.replycontent}</td>
				</tr>
				
				<%} %>
			</table>
		
					
					</div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>