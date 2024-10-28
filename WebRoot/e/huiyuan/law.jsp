<%@ page language="java" import="com.itbaizhan.daowen.bll.*,com.itbaizhan.daowen.entity.*"%>
<%@ page import="java.util.*"%>

<%
      Huiyuan tem_huiyuan=null;
      
      if(request.getSession().getAttribute("huiyuan")!=null)
      {
         tem_huiyuan=(Huiyuan)request.getSession().getAttribute("huiyuan");
      }
      else
      {
         response.sendRedirect(SystemParam.getSiteRoot()+"/e/login.jsp");
      }  
      
 %>
