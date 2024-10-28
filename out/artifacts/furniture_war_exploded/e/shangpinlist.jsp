

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.uibuilder.*" %>
<%@page import="com.itbaizhan.daowen.bll.*,java.util.*,java.text.*,com.itbaizhan.daowen.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot() %>/e/css/box.css"  rel="stylesheet" type="text/css"/>

<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

    <script src="<%=SystemParam.getSiteRoot() %>/e/js/jquery.iFadeSldie.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function () {

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
  
	<div class="fn-clear"></div>
	<div class="wrap">
      
		<%
		   String strspcid=request.getParameter("spcid");
		   int  spcid=1;
		   if(strspcid!=null)
		   {
		     spcid= Integer.parseInt(strspcid);
		   }
		%>
		
		<%ShangpinBuilder  shangpinbuilder=new ShangpinBuilder(); %>
        <%=shangpinbuilder.buildImageShangpin(spcid, -1) %>
		
				
	</div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>