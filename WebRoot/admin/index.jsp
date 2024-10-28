<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.itbaizhan.daowen.bll.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path ;
%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>后台首页</title>

    <link href="<%=basePath%>/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>/admin/css/redstyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <script src="<%=basePath%>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
    
    <link href="<%=basePath%>/webui/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />

    <script src="<%=basePath%>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>

    <script src="<%=basePath%>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <style type="text/css">
      
         body {
	         overflow-y: hidden;
           }
           
    </style>
</head>

<body>
	<jsp:include page="/admin/head.jsp"></jsp:include>
	<div class="sys-main">
		<jsp:include page="/admin/menu.jsp"></jsp:include>
		
		<div id="main-right" class="right-content">
            <iframe src="<%=SystemParam.getSiteRoot() %>/admin/usersmanager.do?actiontype=get" scrolling="auto" frameborder="0" height="100%" width="100%" name="main"
                id="main">
            </iframe>
        </div>
    </div>
    
	<jsp:include page="/admin/bottom.jsp"></jsp:include>
</body>
</html>
