
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.text.*"%>
<%@ page import="com.itbaizhan.daowen.bll.*"%>
<%@ page import="com.itbaizhan.daowen.entity.*"%>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String id = request.getParameter("id");
	String command = "add";
	if (id != null) {
		command = "update";
		Users temobjusers = (Users) DALBase.load("users", " where id="
				+ id);
		request.setAttribute("users", temobjusers);
	}
%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看用户信息</title>
  <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    

<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.9.0.js"
	type="text/javascript"></script>
<link href="<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/uploadify.css"
	rel="stylesheet" type="text/css" />
<script
	src="<%=SystemParam.getSiteRoot()%>/uploadifyv3.1/jquery.uploadify-3.1.js"
	type="text/javascript"></script>
<link
	href="<%=SystemParam.getSiteRoot()%>/webui/artDialog/skins/green.css"
	rel="stylesheet" type="text/css" />

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/artDialog/jquery.artDialog.source.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="<%=SystemParam.getSiteRoot()%>/webui/jqueryui/themes/base/jquery.ui.all.css"
	type="text/css"></link>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jqueryui/ui/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=SystemParam.getSiteRoot()%>/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script src="<%=SystemParam.getSiteRoot()%>/admin/js/combo.js"
	type="text/javascript"></script>


</head>
<body>
	
			<div class="search-title">
				<h2>查看用户信息</h2>
				<div class="description"></div>
			</div>
			<table cellpadding="0" width="100%" cellspacing="1" class="grid">
				<tr>
					<td width="8%" align="right" class="title">用户名:</td>
					<td width="30%">${requestScope.users.username}</td>
					<td width="*" colspan="2" rowspan="6"><img id="imgXiangpian" width="200px" height="200px"
						src="${requestScope.users.xiangpian}" />
					</td>
				</tr>
				
			   <tr>
					<td align="right" class="title">性别:</td>
					<td>${requestScope.users.sex}</td>
				</tr>
				
				<tr>
					<td align="right" class="title">创建时间:</td>
					<td>${requestScope.users.createtime}</td>
				</tr>
				<tr>
					<td align="right" class="title">绑定邮箱:</td>
					<td>${requestScope.users.email}</td>
				</tr>
				<tr>
					<td align="right" class="title">电话:</td>
					<td>${requestScope.users.tel}</td>
				</tr>
				<tr>
					<td align="right" class="title">登录次数:</td>
					<td>${requestScope.users.logtimes}</td>
				</tr>
				<tr>
					<td width="8%" align="right" class="title">真名:</td>
					<td width="30%">${requestScope.users.realname}</td>
				
					<td width="8%" align="right" class="title">昵称:</td>
					<td width="*%">${requestScope.users.nickname}</td>
				</tr>
				<tr>
					<td align="right" class="title">创建人:</td>
					<td colspan="3">${requestScope.users.creator}</td>
				</tr>
				
			</table>



</body>
</html>