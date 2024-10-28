<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统注册</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot()%>/e/css/register.css" type="text/css"></link>

<script  src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>
  <script  type="text/javascript" src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="<%=SystemParam.getSiteRoot() %>/webui/jquery/messages_cn.js" ></script>	
   <script type="text/javascript">
    
       $(function(){
    	   
    	   $.metadata.setType("attr","validate");
    	   $("#form1").validate();
       })
   
   </script>


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="register.jsp">系统注册</a>
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">
		<div class="whitebox">

			<h1>用户注册</h1>
           <form name="form1" id="form1" method="post" action="<%=SystemParam.getSiteRoot()%>/admin/huiyuanmanager.do">
			<input type="hidden" name="actiontype" value="save" />
			<div class="reg-box">

				<div class="reg-title">
					${errormsg}
					
				</div>
				<div class="reg-content">
					<dl>
						<dt>用户名:</dt>
						<dd>
							<input type="text" value="${accountname}" validate="{required:true,messages:{required:'请输入账户名'}}" class="input width250" id="txtHuiyuanname"
								name="accountname"> 

						</dd>

					</dl>

					<dl>
						<dt>密码:</dt>
						<dd>
							<input type="password" validate="{required:true,messages:{required:'请输入密码'}}" class="input width250" id="txtPassword"
								name="password"> 

						</dd>

					</dl>

					<dl>
						<dt>再次输入密码:</dt>
						<dd>
						<input type="password" validate="{required:true,equalTo:'#txtPassword',messages:{required:'请再次输入密码',equalTo:'两次密码不一致'}}" class="input width250" id="txtPassword2"
								name="password2"> 

						</dd>

					</dl>

					<dl>
						<dt>邮箱:</dt>
						<dd>
							<input type="text"  value="${email}" validate="{required:true,email:true,messages:{required:'请输入邮箱',email:'请输入正确邮箱'}}" class="input width250" id="txtEamil"
								name="email"> 

						</dd>

					</dl>
					<dl>
						<dt></dt>
						<dd>
							<input type="submit" class="red-button" id="btnReigster"
								value="注册" name="btnReigster">
						</dd>

					</dl>

                
				</div>


			</div>
          </form>

		</div>
		

	</div>

	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>