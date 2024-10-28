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
        <div class="cartneirong">
            <div style="height: 35px; line-height: 35px; border-bottom-color: rgb(204, 204, 204);
                border-bottom-width: 1px; border-bottom-style: solid;">
             
             
                <ul>
                    <li style="width: 100px;"><b>商品图片</b></li>
                    <li style="width: 130px;"><b>商品编号</b></li>
                    <li style="width: 200px;"><b>商品名称</b></li>
                   
                    <li style="width: 100px;"><b>价格</b></li>
                    <li style="width: 100px;"><b>会员价格</b></li>
                    <li style="width: 100px;"><b>数量</b></li>
                   
                </ul>
            </div>
             <div class="cart_prolist">
                       
                        
                        <%
                             List<Dingdanitems> listcart=(List<Dingdanitems>)request.getSession().getAttribute("cart");
                           
                            if(listcart==null)
                            {
                            	 listcart=new ArrayList<Dingdanitems>();
                            	 request.getSession().setAttribute("cart",listcart);
                            }
                            	
                            
                            for(Dingdanitems  dditem2 : listcart)
                            {
                         
                        %>
                          <ul>
                            <li style="width: 100px;clear:both;"><a href="#" target="_blank">
                                <img style="margin-top: 5px;" src="<%=dditem2.getSpimage() %>" width="60" height="60"></a></li>
                            <li style="width: 130px;">
                                <input id="itemid" name="itemid" value="079725" type="hidden">
                                <a href="shangpindetails.jsp?id=<%=dditem2.getId() %>" target="_blank"><%=dditem2.getSpno() %></a>
                            </li>
                            <li style="width: 200px;height:60px;overflow:hidden;"><%=dditem2.getSpname() %></li>
                            
                          
                            <li style="width: 100px;"><%=dditem2.getJiage() %></li>
                            <li style="width: 100px;"><%=dditem2.getJiage() %></li>
                            <li style="width: 120px;"> <span id="sp<%=dditem2.getSpno() %>Shuliang"> <%=dditem2.getShuliang() %></span>
                                  <span style="display:none;" id="sp<%=dditem2.getSpno() %>Edit"> <input id="txt<%=dditem2.getSpno() %>Shuliang" type="text" value="<%=dditem2.getShuliang() %>" style="width:20px" /> </span>
                             </li>
                               
                            
                              
                              </ul>
                             <%} %>
                              
                        
                        <div style="height: 1px; line-height: 1px; clear: both;">
                        </div>
                    </div>
                    
           <div style="height: 50px; line-height: 50px; padding-left: 20px; clear: both;">
                <div style="width: 400px; margin-top: 0px !important; float: left;">
                  
                </div>
                <div style="width: 520px; float: right;">
                    <table style="margin-right: 20px; float: right;">
                        <tbody>
                            <tr>
                                <td style="font-size: 14px;" width="150">
                                    应付总额：
                                    
                                    <font style="font-family: 微软雅黑; font-size: 16px; font-weight: 600;" color="#ec435a">
                                       
                                        ${totalfee}
                                    
                                    </font>
                                </td>
                               
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!--购物车底部总计-->
            <div style="height: 1px; line-height: 1px; clear: both; font-size: 1px;">
            </div>
        </div>
    </div>
	</div>
	
	<div class="wrap">
	
	  <form id="xiadanForm" method="post" action="<%=SystemParam.getSiteRoot() %>/admin/dingdanmanager.do" name="xiadanform">
     
      <input type="hidden"  name="forwardurl" value="/e/xiadanresult.jsp"/>
       <input type="hidden"  name="actiontype" value="save"/>
     <input type="hidden" id="hidHuiyuanname" name="xdren" value="${huiyuan.accountname}"/>
     <div class="cartcon">
        <div class="cartneirong">
        
        
            <table class="grid" width="100%"   cellpadding="0" cellspacing="0">
            
                <tr>
                    <td height="34px" colspan="2">
                      <div style="height: 50px; color: rgb(136, 136, 136); line-height: 50px; font-family: 微软雅黑;
		                font-size: 18px;margin-left:90px; font-weight: 600;">
		                                                 订购人信息
		                </div>
                    </td>
                </tr>
                 <tr>
                    <td width="15%" align="right" height="34px">
                                           付款方式:
                    </td>
                    <td>
                        <input type="radio" value="货到付款" name="status"/>货到付款
                        
                        <input type="radio" value="待付款" checked="checked" name="status"/>在线支付
                    </td>
                </tr>
                <tr>
                    <td width="15%" align="right" height="34px">
                                                            订购 人:
                    </td>
                    <td>
                        ${huiyuan.accountname } 
                        
                    </td>
                </tr>
                 <tr>
                    <td width="15%" align="right" height="34px">
                                                            订购人姓名:
                    </td>
                    <td>
                         <input style="height: 20px;" name="xdrname" value="${requestScope.huiyuan.name }"  class="input-txt"   type="text">
                    </td>
                </tr>
                
                 <tr>
                    <td width="15%" align="right" height="34px">
                                                            订购人电话:
                    </td>
                    <td>
                         <input style="height: 20px;" name="shrtel" runat="server"    class="input-txt" type="text">
                    </td>
                </tr>
                 
                 <tr>
                    <td width="15%" align="right" height="34px">
                                                          收货地址:
                    </td>
                    <td>
                         <input style="width: 530px; height: 20px;" name="shouhuodizhi" runat="server"   class="input-txt" type="text">
                    </td>
                </tr>
                
                  
               <tr>
                    <td width="15%" align="right" height="34px">
                                                        说明备注:
                    </td>
                    <td>
                      <textarea style="width: 820px; height: 100px;" name="des"  class="inputclass" cols="20" rows="5" ></textarea>
                    </td>
                </tr>
                
                  <tr>
                    <td colspan="2" height="34px">
                          <div class="ui-button">
		                        <input  class="ui-button-text" type="submit" value="提交订单"/>
		                   </div>
                    </td>
                   
                </tr>
            
            
            
            
            </table>
          
           
        </div>
    </div>
    
    </form>
	
	</div>
	
	
	
	
	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>