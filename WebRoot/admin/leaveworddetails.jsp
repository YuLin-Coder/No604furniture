<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.itbaizhan.daowen.bll.*"%>
<%@ page import="com.itbaizhan.daowen.entity.*"%>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
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
<!-- 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
 -->
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>在线留言信息查看</title>
<link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"></script>
	<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/editor/kindeditor-min.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/editor/lang/zh_CN.js"></script>
	<script type="text/javascript">
	      $(function(){
	        
	          if($('textarea[name="replycontent"]').size()>=1){
		          editor = KindEditor.create('textarea[name="replycontent"]', {
						resizeType : 1,
						allowFileManager : true
				  });
			  }
	          
	      
	      })
	</script>
</head>
<body >
	
			<div class="search-title">
				<h2>
					在线留言管理-> <a
						href="<%=SystemParam.getSiteRoot()%>/admin/leavewordmanager.do?actiontype=load&seedid=102">查看在线留言</a>
				</h2>
				<div class="description"></div>
			</div>
			<form name="form1" method="post" action="<%=SystemParam.getSiteRoot() %>/admin/leavewordmanager.do">
			
			<input type="hidden" name="id"  value="<%=id %>"/>
			<input type="hidden" name="actiontype"  value="reply"/>
			<input type="hidden" name="replyren"  value="${adminuser.username}"/>
			<table cellpadding="0" cellspacing="1" class="grid" width="100%">
				<tr>
					<td width="15%" align="right">标题:</td>
					<td width="*">${requestScope.leaveword.title}</td>
				</tr>
				<tr>
					<td align="right" >留言人:</td>
					<td>${requestScope.leaveword.lwren}</td>
				</tr>
				<tr>
					<td align="right" >留言时间:</td>
					<td>${requestScope.leaveword.pubtime}</td>
				</tr>
				
				<tr>
					<td align="right">内容:</td>
					<td>${requestScope.leaveword.dcontent}</td>
				</tr>
				<tr>
					<td align="right" >回复人:</td>
					<td>${requestScope.leaveword.replyren}</td>
				</tr>
			    <%if(temobjleaveword!=null&&temobjleaveword.getStatus()==0){ %>
			    
			    <tr>
					<td align="right">回复内容:</td>
					<td>
					   <textarea name="replycontent"  style="width:98%;height:130px;" ></textarea>
				    </td>
				</tr>
				 <tr>
					<td colspan="2">
					   <div  class="ui-button">
					       <input type="submit" class="ui-button-text"  value="回复"/>
					    </div>
					</td>
					
				</tr>
			    
			    <%}else{ %>			
				<tr>
					<td align="right">回复内容:</td>
					<td>${requestScope.leaveword.replycontent}</td>
				</tr>
				
				<%} %>
			</table>
		 </form>
	
</body>
</html>
