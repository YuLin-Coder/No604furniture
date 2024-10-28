<%@page import="com.itbaizhan.daowen.bll.*,java.util.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="huiyuan/law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/register.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/leaveword.css" type="text/css"></link>


    <script src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    
            $(function(){
              
            	
            })
    
    
    </script>
    
    
    
   

    

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="fn-clear"></div>
	
	<input type="hidden" id="reUrl" name="reurl" value="/e/xiadan.jsp"/>
	<div class="wrap">
	  <div class="cover-title">
                   当前位置：<a href="<%=SystemParam.getSiteRoot() %>/e/index.jsp">首页</a> &gt;&gt; 下单
      </div>
	</div>
	

	<div class="fn-clear"></div>
	
	
	
	<div class="wrap">
	
	
     <div class="cartcon">
       
            <table class="grid" width="100%"   cellpadding="0" cellspacing="0">
            
                <tr>
                    <td height="34px" colspan="2">
                      <div style="height: 50px; color: rgb(136, 136, 136); line-height: 50px; font-family: 微软雅黑;
		                font-size: 18px;margin-left:90px; font-weight: 600;">
		                                                 下单成功!亲继续付款吧
		                </div>
                    </td>
                </tr>
               
            
            
            
            </table>
          
        
    </div>
    
   
	
	</div>
	
	
	
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>