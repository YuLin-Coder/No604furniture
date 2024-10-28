

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.uibuilder.*" %>
<%@page import="com.itbaizhan.daowen.bll.*,java.util.*,java.text.*,com.itbaizhan.daowen.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--<audio controls="controls">--%>
<%--&lt;%&ndash;<source src="1.mp3" type="audio/mpeg">&ndash;%&gt;--%>
<%--</audio>--%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>


<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/jquery.iFadeSlide.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/lanmu.css" type="text/css"></link>
<link rel="stylesheet" type="text/css" href="<%=SystemParam.getSiteRoot() %>/e/css/carousel.css" />

<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script type='text/javascript' src='<%=SystemParam.getSiteRoot() %>/e/js/carousel.js'></script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	<div class="fn-clear">
	</div>
    
    <%=FocusgraphicBLL.getFocusgraphic() %>
	
  
	<div class="fn-clear"></div>
	<div class="wrap">
	   <%ShangpinBuilder  shangpinbuilder=new ShangpinBuilder(); %>
	   
	   
	   <!-- 最新商品信息   -->
	   <%=shangpinbuilder.buildHotSale()%>
	   <!-- 推荐商品  -->
	  
	  
	   <%
	      IndexColumnsBuilder icBuilder=new IndexColumnsBuilder();
	      
	   %>
	   <%=icBuilder.buildColumns() %>
	     
	   
	  
	</div>
	
	
	


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>