

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.uibuilder.*" %>
<%@page
	import="com.itbaizhan.daowen.bll.*,java.util.*,java.text.*,com.itbaizhan.daowen.entity.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品搜索</title>
<link rel="stylesheet"
	href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>

<link href="<%=SystemParam.getSiteRoot()%>/admin/css/web2table.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="<%=SystemParam.getSiteRoot()%>/e/css/box.all.css" type="text/css"></link>

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>



<script type="text/javascript">
	$(function() {

		$(".tabcontainer dl dt").each(function(index, dom) {

			$(this).mouseenter(function() {

				$(".tabcontainer dl dt").removeClass("on");
				$(this).addClass("on");
				$(".tabcontainer dl dd").hide().eq(index).show();

			})
		})

	});
</script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>


	<div class="fn-clear"></div>
	<div class="wrap">



		<div class="tabcontainer" style="min-height:400px;padding:15px;">

			<dl >

				<div class="fn-clear"></div>
				
			
				
				
				<%
				   String spname=request.getParameter("spname");
				   if(spname!=null)
				   {
				%>
				     <%=new ShangpinBuilder().search(spname, "fn-show")%>

                  <%} %>

			</dl>
		</div>



    </div>

		<div class="fn-clear"></div>


    

		<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>