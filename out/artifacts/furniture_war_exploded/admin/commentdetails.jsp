<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%@ page import="com.itbaizhan.daowen.bll.*"%>
<%@ page import="com.itbaizhan.daowen.entity.*" %>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    String command="add";
    if( id!=null)
    {
      command="update";
      Comment temobjcomment=(Comment)DALBase.load("comment"," where id="+ id);
      request.setAttribute("comment",temobjcomment);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>评论信息查看</title>
   	<link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
 <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
</head>
<body >

	<div class="search-title">
		<h2>评论管理-> 查看评论</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td align="right" class="title">标题:</td>
			<td>${requestScope.comment.title}</td>
		</tr>
		<tr>
			<td align="right" class="title">备注:</td>
			<td>${requestScope.comment.commenttime}</td>
		</tr>
		<tr>
			<td align="right" class="title">评论人:</td>
			<td>${requestScope.comment.commentren}</td>
		</tr>
		<tr>
			<td align="right" class="title">内容:</td>
			<td>${requestScope.comment.commentcontent}</td>
		</tr>
		<tr>
			<td align="right" class="title">评论类型:</td>
			<td>${requestScope.comment.xtype}</td>
		</tr>
		<tr>
			<td align="right" class="title">宿主编号:</td>
			<td>${requestScope.comment.belongid}</td>
		</tr>
	</table>

</body>
</html>
