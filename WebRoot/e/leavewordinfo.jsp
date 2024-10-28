<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/index.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/register.css" type="text/css"></link>
<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="<%=SystemParam.getSiteRoot() %>/e/css/leaveword.css" type="text/css"></link>

<script
	src="<%=SystemParam.getSiteRoot()%>/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>
     <script type="text/javascript">
         
              $(function(){
                
                  $("#btnLeaveword").click(function(){
                      var temaccountname= $("#hidCurrenthy").val();
                      var temreurl=$("#reUrl").val();
                      var temtitle=$("#txtTitle").val();
                      var temdcontent=$("#txtDcontent").val();
                      if(temaccountname==""){
                         
                         window.location.href="login.jsp?reurl="+temreurl;
                         return false;
                        
                      }
                      
                      if(temtitle==""){
                       
                         alert("请输入留言标题");
                         return false;
                      }
                      if(temdcontent==""){
                          alert("请填写留言内容");
                          return false;
                      }
                      if(temdcontent.length<8){
                       
                           alert("留言内容至少8个字符");
                           return false;
                      }
                      
                      
                  })

              })
        
     </script>


</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap">
		<div class="cover-title">
			当前位置：<a href="<%=SystemParam.getSiteRoot()%>/e/index.jsp">首页</a> &gt;&gt; <a
				href="<%=SystemParam.getSiteRoot()%>/e/leavewordinfo.jsp">在线留言</a>
		</div>
	</div>


	<div class="fn-clear"></div>

	<div class="wrap">
		<div class="comment-box">
			<div class="comment-list">
				
				<%=LeavewordBLL.getLeaveword() %>
				<!-- -
				<ul>
					<li>
						<div class="title">暂无评论，快来抢沙发吧！</div>
						<div class="content">测试</div>
						<div class="reply">亲回复了</div>
				    </li>


				</ul>
				
				 -->
			</div>

			<h3 class="add">
				在线留言<a name="Add" id="Add"></a>
			</h3>
			<div class="comment-add">
				<form id="leavewordForm" method="post"
					action="<%=SystemParam.getSiteRoot()%>/admin/leavewordmanager.do">
					<input type="hidden" id="reUrl" name="reurl" value="/e/leavewordinfo.jsp"/>
					<input type="hidden" name="actiontype" value="save"/>
					<input type="hidden" id="hidCurrenthy" name="currenthy" value="${huiyuan.accountname}"/>
					<table>
						<tr>
							<td>标题</td>
							<td><input type="text" id="txtTitle" style="width:320px;"
								class="ui-input" name="title"  />
							</td>
							
						</tr>


						<input type="hidden" id="hidusername" name="pubren"
							value="${requestScope.student.xuehao}" />

						<tr>
							<td>内容:</td>
							<td>
							      <textarea id="txtDcontent" style="width:400px;height:130px" name="dcontent" ></textarea>
							</td>
							
						</tr>
						<tr>
							<td colspan="2">
							   <input id="btnLeaveword" name="btnSubmit" type="submit" value="留言" class="red-button" />
						    </td>

						</tr>

					</table>


				</form>
			</div>


		</div>

	</div>

	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>