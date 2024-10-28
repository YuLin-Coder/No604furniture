<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.uibuilder.*,com.itbaizhan.daowen.bll.*,java.util.*" %>
<%@ page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/list.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/DB_gallery.css" type="text/css"></link>

<script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="<%=SystemParam.getSiteRoot() %>/e/js/jquery.DB_gallery.js" type="text/javascript"></script>
<script type="text/javascript">

        

</script>

   <%
        String id=request.getParameter("albumid");
            
   %>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<%
	     String albumid=request.getParameter("albumid");
	   
	     if(albumid!=null){
	    	  Album  album =(Album)DALBase.load("album", "where id="+albumid);
	    	  request.setAttribute("album", album);
	    	  
	     }
	%>
	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a>
			&gt;&gt;${album.name}
		</div>
	</div>
	<div class="fn-clear"></div>
	<div class="row-flow">
		<div class="page-main-box">
			<div class="news-info">

				<center>
                    <%
                      if(request.getAttribute("listalbumitem")!=null)
				      {
					    List<Albumitem> listalbumitem=( List<Albumitem>)request.getAttribute("listalbumitem");
				        Albumitem ai=(Albumitem)DALBase.load("albumitem", "where albumid="+id);
                    %>
					<div id="DB_gallery">
						<div class="DB_imgSet">
							<div class="DB_imgWin">
							  <%if(ai!=null){ %>
								<img src="<%=ai.getTupian()%>" alt="" />
							   <%} %>
							</div>
							<div class="DB_page">
								<span class="DB_current">0</span>-<span class="DB_total">0</span>
							</div>
							<div class="DB_prevBtn">
								<img src="<%=SystemParam.getSiteRoot() %>/e/images/prev_off.png" alt="jquery相册" />
							</div>
							<div class="DB_nextBtn">
								<img src="<%=SystemParam.getSiteRoot() %>/e/images/next_off.png" alt="图片相册" />
							</div>
						</div>
						<div class="DB_thumSet">
							<ul class="DB_thumMove">

								<%
									
														     for(Albumitem  temalbumitem  :  listalbumitem)
														      {
								%>

								<li><a href="<%=temalbumitem.getTupian()%>"><img
										src="<%=temalbumitem.getTupian()%>" alt="图片相册" /></a></li>
								<%
									}}
								%>

							</ul>
							<div class="DB_thumLine"></div>
							<div class="DB_prevPageBtn">
								<img
									src="<%=SystemParam.getSiteRoot()%>/e/images/prev_page.png"
									alt="上一页" />
							</div>
							<div class="DB_nextPageBtn">
								<img
									src="<%=SystemParam.getSiteRoot()%>/e/images/next_page.png"
									alt="下一页" />
							</div>
						</div>
					</div>
					<script type="text/javascript">
						$('#DB_gallery').DB_gallery({
							thumWidth : 110,
							thumGap : 8,
							thumMoveStep : 4,
							moveSpeed : 300,
							fadeSpeed : 500
						});
					</script>
				</center>



				<div class="clear"></div>


			</div>
		</div>
		<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
