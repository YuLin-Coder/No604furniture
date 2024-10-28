<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>系统登录</title>

<meta http-equiv="pragma" content="no-cache">

<link href="<%=SystemParam.getSiteRoot()%>/admin/css/login.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="<%=SystemParam.getSiteRoot() %>/admin/images/favicon.ico" type="image/x-icon" />
<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js" type="text/javascript"></script>

<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery.validate.min.js" type="text/javascript"></script>

<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery.metadata.js" type="text/javascript"></script>

<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/messages_cn.js" type="text/javascript"></script>

<script src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery.validateex.js" type="text/javascript"></script>

<script type="text/javascript">
	
	if(window!=top.window){
		
		top.window.location.href="<%=SystemParam.getSiteRoot()%>/admin/login.jsp";
	}
	
	$(function() {

		$("#txtUsername").keyup(function() {

			if ($(this).val() != "") {

				$("#divLoginnameErrMsg").html("");

			}

		}).focus(function() {

			if ($(this).val() == "用户名") {
				$(this).val("");
			}
		})
		$("#btnLogin").click(function() {

			$("#loginContainer").addClass("hide");
			$("#loginActionContainer").removeClass("hide");
			

		})
		
		

		$.metadata.setType("attr", "validate");

		$("#form1").validate();

	})
</script>

</head>

<body>

	<div class="main-wrap">
		<div class="login-head">
			
		</div>
	 <form  name="form1"  action="<%=basePath %>/admin/usersmanager.do" >
		 
		<input type="hidden" name="actiontype" value="login" />
        <input type="hidden" name="usertype"   value="0"/>  
        <input type="hidden" name="forwardurl"   value="/admin/index.jsp"/>
		<div class="wrap-940">
			<div class="fnclear content">
				<div class="fnleft">
					<img src="<%=SystemParam.getSiteRoot()%>/admin/images/left.jpg" width="500px" height="450">
				</div>
				<div class="login-form">
					<div class="login-title">
						<h2>狗狗网站后台登录</h2>
					</div>
					  ${errmsg}
					<div class="item">
						<div class="label">账号</div>
						<div>
							<input id="txtUsername" name="username" class="text" runat="server"
								validate="{required:true,messages:{required:'请输入账号'}}"
								tabindex="1" type="text" value="用户名" />
						</div>
					</div>
					<div class="item">
						<div class="label">密码</div>
						<div>
							<input id="txtPassword" name="password" class="text " tabindex="2"
								validate="{required:true,messages:{required:'请输入密码'}}"
								runat="server" maxlength="20" type="password" autocomplete="off" />
						</div>
					</div>
					<div id="loginContainer" class="login-wrap">
						<button id="btnLogin" class="login-button" type="submit" tabindex="3">登录</a>

					</div>
					<div id="loginActionContainer" class="login-wrap hide">
						<div class="login-button-now">登录</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</div>
</body>
</html>
