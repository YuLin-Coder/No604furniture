<%@page import="com.itbaizhan.daowen.bll.SystemParam"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu">

  
    <div class="menu-group">
		<h2>
			信息发布
		</h2>
		<ul>
			
			<li id="101" >
				<a  href="<%=SystemParam.getSiteRoot() %>/admin/dingdanmanager.do?seedid=101&xiadanren=${huiyuan.accountname}&isurl=1&actiontype=get&forwardurl=/e/huiyuan/dingdanmanager.jsp">我的订单</a>
			</li>
			
			<li id="102" >
				<a  href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/lwmanager.jsp?seedid=102">我的留言</a>
			</li>
			
			

		</ul>
	</div>
    
	<div class="menu-group">
		<h2>
			账户信息
		</h2>
		<ul>
			<li id="m201" class="current">
				<a  href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/accountinfo.jsp?seedid=m201">账户信息</a>
			</li>
			<li id="m202" >
				<a  href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/yue.jsp?seedid=m202">账户余额</a>
			</li>
			<li id="m206" >
				<a  href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/jifen.jsp?seedid=m206">我的积分</a>
			</li>
			<li id="m203">
				<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/modifypw.jsp?seedid=m203" target="_self">密码修改</a>
			</li>
			<li id="m204">
				<a href="<%=SystemParam.getSiteRoot() %>/e/huiyuan/modifyinfo.jsp?seedid=m204" target="_self">信息修改</a>
			</li>
          
		</ul>
	</div>




</div>