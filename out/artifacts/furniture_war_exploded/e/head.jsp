<%@ page language="java" import="com.itbaizhan.daowen.bll.SystemParam" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.itbaizhan.daowen.uibuilder.SitenavBuilder"%>
<%@ page import="com.itbaizhan.daowen.bll.*,com.itbaizhan.daowen.entity.*"%>
 
 <script type="text/javascript">
  
    $(function(){
      
    	  $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != 'null') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      $(".exit").click(function(){
          
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do?actiontype=exit'),
					   method:'get',
					   success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("系统错误，错误编码"+status);
					  }
		     })

      })
    })

</script>
 
<%
      Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
      if(temhy!=null)
         request.setAttribute("huiyuan", temhy);
    
     

 %>

  
  
<div class="index-toolbar">
  <div class="wrap">
  
            
    <%if(temhy!=null){ %>
             欢迎你<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/index.jsp">${huiyuan.accountname }</a>
     <a class="exit" style="cursor:pointer">退出</a>|
    <%}%>
    
  
      <a href="<%=SystemParam.getSiteRoot() %>/e/login.jsp">用户登录</a>|
    
     <a href="<%=SystemParam.getSiteRoot() %>/e/register.jsp">用户注册</a>|
     
     <a href="<%=SystemParam.getSiteRoot()%>/admin/login.jsp">系统后台</a>
  </div>
  
   
</div>
   
     <div class="row-flow white-paper">
    <div class="page-main-box">
        <div style="font-size: 28px; color:#F40; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" class="fn-left">
                                 狗狗商城
            
        </div>
       <form id="searchForm"  action="<%=SystemParam.getSiteRoot() %>/e/searchsp.jsp" method="post" >
           <input   type="hidden" name="actiontype" value="search" />
            <input type="hidden" name="forwardurl" value="/e/searchsp.jsp" />
        <div class="search-box">
            <div class="search-text">
                                 商品搜索:</div>
            <div class="keyword">
                <input type="text" placeholder="商品名称" id="spname" name="spname">
            </div>
            <div class="so">
                <input type="submit" class="sobtn" id="btnSearch" value="搜索" name="btnSearch">
            </div>
            <div class="error-container">
                
            </div>
        </div>
        
        </form>
    </div>

     
 </div>

  


  <%=new SitenavBuilder().build() %>
  
  
  
 <div class="fn-clear"></div>
	<div class="pageinfo">
	     
	</div>

