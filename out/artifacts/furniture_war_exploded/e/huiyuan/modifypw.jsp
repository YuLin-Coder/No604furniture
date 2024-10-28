<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<%@ include file="law.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>密码修改</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/register.css" type="text/css"></link>

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>
  <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
  <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
  <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>	
  <script type="text/javascript">
   
        $(function(){
        	
        	 $.metadata.setType("attr", "validate");
             $("#formModifypw").validate();
        	
        })
  
  </script>
  
  

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="myindex.jsp">会员中心</a>
		</div>
	</div>


	<div class="fn-clear"></div>

		<div class="wrap">
		
		   <div class="main">
		   
		       <jsp:include  page="menu.jsp"></jsp:include>
		       <div class="main-content">
					
					 <form name="formModifypw" action="<%=SystemParam.getSiteRoot() %>/admin/huiyuanmanager.do" id="formModifypw" method="post">
					   <input type="hidden" name="id" value="${huiyuan.id}"/>
					   <input type="hidden" name="actiontype" value="modifyPw"/>
					   <input type="hidden" name="forwardurl" value="/e/huiyuan/modifypwres.jsp"/>
						<table border="0" cellspacing="1" class="grid" cellpadding="0"
							width="100%">
							
							<tr>
								<td align="right">修改密码 :</td>
								<td align="left">
								    <input name="repassword1" type="password" validate="{required:true,messages:{required:'请输入密码'}}"
									id="repassword1" class="input-txt" /></td>
								<td align="left">
									<div id="repassword1Tip"></div>
							    </td>
							</tr>
							<tr>
								<td align="right">确认密码 :</td>
								<td align="left"><input name="repassword2" validate="{required:true,equalTo:'#repassword1',messages:{required:'请输入确定密码',equalTo:'两次密码不一致'}}" type="password"
									id="repassword2" class="input-txt" /></td>
								<td align="left">
									<div id="repassword2Tip"></div>
							    </td>
							</tr>
							
						</table>
						
						    <div style="margin-left: 120px;">
								<input type="submit" value="修改密码" class="red-button">
						    </div>
						
					</form>
					</div>
		   </div>
			
		</div>
		


	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>