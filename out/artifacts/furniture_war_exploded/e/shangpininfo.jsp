<%@page import="com.itbaizhan.daowen.uibuilder.ShangpinBuilder"%>
<%@page import="com.itbaizhan.daowen.uibuilder.ProductViewHistory"%>
<%@page import="java.util.*"%>
<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <%
  
            String id=request.getParameter("id");
            if(id!=null){
            
            	Shangpin shangpin=(Shangpin)DALBase.load(Shangpin.class,new Integer(id));
                
                if(shangpin!=null)
                   request.setAttribute("shangpin",shangpin);
                
            }
  
   %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link href="<%=SystemParam.getSiteRoot() %>/e/css/box.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/register.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/leaveword.css" type="text/css"></link>


    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
            $(function(){
               
                 $("#btnAgree").click(function(){
		                  
		                  var temaccountname= $("#hidCurrenthy").val();
		                  var temreurl=$("#reUrl").val();
		                  if(temaccountname==""){
		                          
	                         window.location.href="login.jsp?reurl="+temreurl;
	                         return;
	                        
	                      }
	                      var   xinxiid=$(this).attr("xinxiid");
	                      $.ajax({
		                     
		                        url:encodeURI('<%=SystemParam.getSiteRoot()%>/admin/xinximanager.do?actiontype=agree&id='+xinxiid),
					            method:'get',
					            
					            success:function(data){
					               $("#btnAgree").html("<span>"+data+"</span>");
					            },
					            error:function(xmhttprequest,status,excetpion){
					                alert("系统错误，错误编码"+status);
					            }
		                  })
	                      
                  })
                  
                   $("#btnAgainst").click(function(){
		                  
		                  var temaccountname= $("#hidCurrenthy").val();
		                  var temreurl=$("#reUrl").val();
		                  if(temaccountname==""){
		                          
	                         window.location.href="login.jsp?reurl="+temreurl;
	                         return;
	                        
	                      }
	                      var   xinxiid=$(this).attr("xinxiid");
	                      $.ajax({
		                     
		                        url:encodeURI('<%=SystemParam.getSiteRoot()%>/admin/xinximanager.do?actiontype=against&id='+xinxiid),
					            method:'get',
					            
					            success:function(data){
					                $("#btnAgainst").html("<span>"+data+"</span>");
					            },
					            error:function(xmhttprequest,status,excetpion){
					                alert("系统错误，错误编码"+status);
					            }
		                  })
	                      
                  })
                 
            })
    
    
    </script>
    
    
    <%
     
        ProductViewHistory.View(request, response, id);
    
    
    %>
   

    

</head>
<body>
    <input type="hidden" id="commentresurl" value="/e/shangpininfo.jsp?id=<%=id%>">
	
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="wrap">
	  <div class="cover-title">
                   当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a> &gt;&gt; 商品信息
      </div>
	</div>
	<input type="hidden" id="reUrl" name="reurl" value="/e/shangpininfo.jsp?id=<%=id%>"/>

	<div class="fn-clear"></div>
	
	<div class="wrap">
		<div >
		 
		   <div class="info">
                    <h1>
                           ${shangpin.name}
                    </h1>

				<table cellpadding="0" cellspacing="1" class="grid" width="100%">
					
					
					<tr>
						
						<td width="30%" colspan="2" rowspan="6">
						     <img id="imgTupian" width="200px" height="200px"
							src="${requestScope.shangpin.tupian}" />
					    </td>
					    <td width="10%" align="right">名称:</td>
						<td width="*">${requestScope.shangpin.name}</td>
					    
					</tr>
					
					<tr>
						<td align="right">商品编号:</td>
						<td>${requestScope.shangpin.spno}</td>
					</tr>
					<tr>
						<td align="right">价格:(元)</td>
						<td>${requestScope.shangpin.jiage}￥</td>
					</tr>
					
					
					<tr>
						<td align="right">会员价:（元）</td>
						<td>${requestScope.shangpin.hyjia}￥</td>
					</tr>
					<tr>
						<td colspan="4" >
					
                               <a id="btnIncart" href="<%=SystemParam.getSiteRoot() %>/admin/dingdanmanager.do?actiontype=shopcart&spid=<%=id%>&forwardurl=/e/shopcart.jsp" > <img src="<%=SystemParam.getSiteRoot() %>/e/images/shop/addcart.png"/> </a>
						     
						 </td>
						
					</tr>
				</table>
				
				
				
	    
	             <%=new ShangpinBuilder().buildViewedProduct(request)%>
	
	

                 <div class="news-content">
			
			        ${requestScope.shangpin.jieshao}
			     </div>


			</div>
			
                
           <jsp:include page="comment.jsp?commenttype=shangpin"></jsp:include>
		
		</div>
		
	</div>
	
	
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>