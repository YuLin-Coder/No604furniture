<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.itbaizhan.daowen.bll.*,com.itbaizhan.daowen.util.PagerMetal"%>
<%@ page import="com.itbaizhan.daowen.entity.*" %>
<%@page import="com.itbaizhan.daowen.dal.DALBase"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>订单信息</title>
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   
    <link href="<%=SystemParam.getSiteRoot() %>/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery-1.9.0.js"></script>
     <link href="<%=SystemParam.getSiteRoot() %>/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="<%=SystemParam.getSiteRoot() %>/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="<%=SystemParam.getSiteRoot() %>/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="<%=SystemParam.getSiteRoot() %>/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
			    $("#btnDelete").click(function(){
			        if($(".check:checked").length<1)
			        {
			           $.dialog.alert("请选择需要删除的记录");
			           return;
			        } 
			        $(".check:checked").each(function(index,domEle){
			             var id=$(domEle).val();
			             $.dialog.confirm("你确定要注销订单信息?", function(){
				             window.location.href=encodeURI('<%=SystemParam.getSiteRoot()%>/admin/dingdanmanager.do?actiontype=delete&id='+id);
				          });
			        });
			    });
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
			   <div class="search-title">
					  <h2>
	                       订单管理
	                </h2>
                <div class="description">
                    
                </div>
              </div>
					<!-- 搜索控件开始 -->
					  <div class="search-options">
					  <form id="searchForm"  action="<%=SystemParam.getSiteRoot() %>/admin/dingdanmanager.do" method="post" >
					   <table  cellspacing="0" width="100%">
					        <tbody>
					          <tr>
					             <td>
					               订单号
                                            <input name="ddno"  value="${ddno}" class="input-txt" type="text" id="ddno"  />
					                  <input type="hidden"   name="actiontype" value="search"/>
					                  <input type="hidden"   name="seedid" value="${seedid}"/>
					                 <div class="ui-button">
					                    <input type="submit" value="搜索" id="btnSearch" class="ui-button-text" /> 
					                 </div>
					             </td>
					          </tr>
					        </tbody>
					   </table>
					   </form>
					</div>
					<!-- 搜索控件结束 -->
					<div class="clear">
					</div>
					 <div class="action-details">
							      <a href="#"  id="btnCheckAll" class="action-button">选择</a>
							     <a id="btnDelete" class="action-btn" href="#">
					<em class="icon-delete"></em>
					                  <b>删除</b>
				                 </a>
                    </div>
	<table id="module" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				
				<th><b>订单号</b>
				</th>
				<th><b>下单时间</b>
				</th>
				<th><b>下单人</b>
				</th>
				<th><b>总价格</b>
				</th>
				<th><b>状态</b>
				</th>
				<th><b>收货人电话</b>
				</th>
				<th><b>收货人地址</b>
				</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		
		
		     <%
					   
					       if(request.getAttribute("listdingdan")!=null){
					    	
					        List<Dingdan> listdingdan=(List<Dingdan>)request.getAttribute("listdingdan");
					     
					        
					        if(listdingdan.size()==0){
					        	
					 %>
					 
					 <tr>
								<td colspan="20">没有相关订单信息</td>
					 </tr>
					 
					 <%
					        	
					        	
					        }
					        
					        
					        for(Dingdan temdingdan :listdingdan){
					        
					   
					   %>
					
					
						
							<tr>
							   <td>&nbsp<input id="chk<%=temdingdan.getId()%>" class="check"
									name="chk<%=temdingdan.getId()%>" type="checkbox"
									value='<%=temdingdan.getId()%>'>
								</td>
								<td><%=temdingdan.getDdno() %></td>
								<td><%=temdingdan.getXiadantime() %></td>
								<td><%=temdingdan.getXiadanren() %></td>
								<td><%=temdingdan.getTotalprice() %></td>
								<td><%=temdingdan.getStatus() %></td>

								<td><%=temdingdan.getShrtel() %></td>
								<td><%=temdingdan.getShouhuodizhi() %></td>
								
								<td>
								
								  <%
								    if(temdingdan.getStatus().equals("已付款")){
								  %>
								  
								   <a href="<%=SystemParam.getSiteRoot() %>/admin/fahuo.jsp?id=<%=temdingdan.getId()%>">发货</a>
								  <%} %>
								    <a href="<%=SystemParam.getSiteRoot() %>/admin/dingdandetails.jsp?id=<%=temdingdan.getId()%>">查看</a>
								</td>
							</tr>
						
						
						<%}
					        
					       
					       
					       } %>
						
					   
			
			
		</tbody>
	</table>
	<div class="clear"></div>
						<daowen:pager id="pager1"  attcheform="searchForm" />
	</body>
</html>
