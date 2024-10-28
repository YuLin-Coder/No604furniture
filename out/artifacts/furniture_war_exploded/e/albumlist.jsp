<%@page import="com.itbaizhan.daowen.bll.*"%>

<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
  List<Album> listalbum = DALBase.getEntity("album", "");
	
  request.setAttribute("listalbum", listalbum);  
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/leaveword.css" type="text/css"></link>


    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
            $(function(){
               
            })
    
    
    </script>
    
    
    
   

    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="wrap">
	  <div class="cover-title">
                   当前位置>>相册信息
      </div>
	</div>

	<div class="fn-clear"></div>
	
	<div style="min-height: 600px;" class="wrap">
		
		 	<div class="picture-box2">
					<ul>
						<%
									
										for (Album temalbum : listalbum) {
											
											 Albumitem ai=(Albumitem)DALBase.load("albumitem","where albumid="+temalbum.getId());
								%>
						<li>
						
						 <%if(ai!=null){ %>
						  <a
							href="<%=SystemParam.getSiteRoot()%>/admin/albumitemmanager.do?actiontype=get&albumid=<%=temalbum.getId()%>&seedid=m101&forwardurl=/e/albumitemlist.jsp">
								<img width="180" height="180" src="<%=ai.getTupian()%>" />
						</a> <span><%=temalbum.getName()%></span></li>
						 <%}else{ %>
						  <a
							href="<%=SystemParam.getSiteRoot()%>/admin/albumitemmanager.do?actiontype=get&albumid=<%=temalbum.getId()%>&seedid=m101&forwardurl=/e/albumitemlist.jsp">
								<img width="180" height="180" src="<%=temalbum.getTupian()%>" />
						</a> <span><%=temalbum.getName()%></span></li>
						 <%} %>
						</li>
						<%
						   }
						   if(listalbum.size()==0){
						%>
						   暂无相册信息
						<%}%>
					</ul>
				</div>
               
               
	
		

	</div>
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>