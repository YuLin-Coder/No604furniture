<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.itbaizhan.daowen.bll.*"%>
<%@page import="com.itbaizhan.daowen.entity.*,com.itbaizhan.daowen.dal.*"%>
 <%   
   
      String gcommentbelongid=request.getParameter("id");
      
      String commenttype=request.getParameter("commenttype");
 
 
  %>
  
      <script type="text/javascript">
         
              $(function(){
                
                  $("#btnLeaveword").click(function(){
                      var temaccountname= $("#hidCurrenthy").val();
                      var temreturnurl=$("#commentresurl").val();
                     
                      var temtitle=$("#txtTitle").val();
                      var temdcontent=$("#txtDcontent").val();
                      $("#forwardurl").val(temreturnurl);
                     
                      //alert(temaccountname);
                      if(temaccountname==""){
                         
                         window.location.href="login.jsp?reurl="+temreturnurl;
                         return false;
                        
                      }
                      
                      if(temtitle==""){
                       
                         alert("请输入评论标题");
                         return false;
                      }
                      if(temdcontent==""){
                          alert("请填写评论内容");
                          return false;
                      }
                      if(temdcontent.length<8){
                       
                           alert("评论内容至少8个字符");
                           return false;
                      }
                     
                      
                      
                  })

              })
        
     </script>
<div class="comment-box">
			<div class="comment-list">
				
				<%=CommentBLL.getComments(commenttype,gcommentbelongid) %>
				
			</div>

			<h3 class="add">
				在线评论<a name="Add" id="Add"></a>
			</h3>
			<div class="comment-add">
				<form id="commentForm" method="post"
					action="<%=SystemParam.getSiteRoot()%>/admin/commentmanager.do">
					<input type="hidden" id="reUrl" name="reurl" value=""/>
					<input name="forwardurl" type="hidden" id="forwardurl"  value=""/>
					<input type="hidden" name="actiontype" value="save"/>
					 <input type="hidden"   name="belongid"  value="<%=gcommentbelongid%>"/>
                     <input type="hidden"  name="type"   value="<%=commenttype%>"/>
					<input type="hidden" id="hidCurrenthy" name="currenthy" value="${huiyuan.accountname}"/>
					<table>
						<tr>
							<td>标题</td>
							<td><input type="text" id="txtTitle" style="width:320px;"
								class="ui-input" name="title"  />
							</td>
							
						</tr>


						

						<tr>
							<td>内容:</td>
							<td>
							      <textarea id="txtDcontent" style="width:400px;height:130px" name="dcontent" ></textarea>
							</td>
							
						</tr>
						<tr>
							<td colspan="2">
							  <div class="ui-button">
							     <input id="btnLeaveword" name="btnSubmit" type="submit" value="评论" class="ui-button-text" />
							  </div>
							   
						    </td>

						</tr>

					</table>


				</form>
			</div>


	</div>
    