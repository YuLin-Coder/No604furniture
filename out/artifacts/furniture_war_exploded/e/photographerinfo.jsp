<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.uibuilder.*,com.itbaizhan.daowen.bll.*" %>
<%@ page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>摄影师</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.css" type="text/css"></link>
<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<%
String id=request.getParameter("id");
            if(id!=null){
                Photographer photographer=(Photographer)DALBase.load("photographer","where id="+id);
                if(photographer!=null)
                   request.setAttribute("photographer",photographer);
            }
   %>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a>
			&gt;&gt; <a
				href="<%=SystemParam.getSiteRoot() %>/e/photographerlist.jsp">摄影师</a>
		</div>
	</div>
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="wrap" style="min-height:600px;">
			<table cellpadding="0" cellspacing="1" class="grid" width="100%">
				<tr>
					<td width="10%" align="right">姓名:</td>
					<td>${requestScope.photographer.name}</td>
					<td cospan="2" rowspan="6"><img id="imgPhoto" width="200px" height="200px"
						src="${requestScope.photographer.photo}" /></td>
				</tr>
				<tr>
					<td align="right">性别:</td>
					<td>${requestScope.photographer.sex}</td>
				</tr>
				
				<tr>
					<td width="10%" align="right">籍贯:</td>
					<td>${requestScope.photographer.jiguan}</td>
				</tr>
				<tr>
					<td width="10%" align="right">民族:</td>
					<td>${requestScope.photographer.nation}</td>
				</tr>
				<tr>
					<td width="10%" align="right">特长:</td>
					<td>${requestScope.photographer.techang}</td>
				</tr>
				<tr>
					<td width="10%" align="right">设计年限:</td>
					<td>${requestScope.photographer.sytime}</td>
				</tr>
				<tr>
					<td align="right">简介:</td>
					<td colspan="3">${requestScope.photographer.des}</td>
				</tr>
			</table>
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
