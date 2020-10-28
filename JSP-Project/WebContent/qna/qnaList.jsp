
<%@page import="mvc.qna.model.QnADTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
String sessionId = (String)session.getAttribute("sessionId");
List<QnADTO> qnaBoardList = (List<QnADTO>)request.getAttribute("qnaBoardList");

int total_list = (Integer)request.getAttribute("total_list");
int total_qpage = (Integer)request.getAttribute("total_qpage");
int qpageNum = (Integer)request.getAttribute("qpageNum");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function checkForm(){
	
	if(${sessionId==null}){
		
		alert('Please log in');
		location.href="${pageContext.request.contextPath }/member/loginMember.jsp";
		return false;
	} 
	
	else {
		return;
		
	}
	
	
}
</script>
<style>
table {
  border-collapse: collapse;
  width: 80%;
  margin-top: 20px;
  padding: 50px;
  margin: auto;
}
th, td {
  padding: 8px;
  border-bottom: 1px solid #ddd;
  text-align: center;
}
tr:hover {background-color:#f5f5f5;}
.div1{
display: none;
margin-top: 30px;
padding: 0px;
}
.p1{
display:none;
}
</style>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<body>

<jsp:include page="../menu.jsp"/>

<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Q & A List</strong></div>
        </div>
      </div>
    </div> 

<div class="site-wrap">
	<div class="p-3 p-lg-5 border" style="text-align: center;">
    <div style="margin-bottom: 50px;">
    	<h1 class="h3 mb-3 text-black">Q &nbsp&nbsp & &nbsp A</h1>
    	<div style="margin-left: 70%; margin-bottom: -20px;">
    	<span style="margin-right: 250px; border: solid 1px #7971ea; padding: 5px 5px 5px 5px; 
    	background-color:#7971ea; color:#fff; border-radius: 5px;">
    	Count <%=total_list %></span>
    	
    	</div>
    </div>
    
		
		
		<table>
				<thead>
    				<tr>
    					<th style="width: 180px;">Num</th>
    					<th style="text-align: left;">Question</th>
    					<th style="width: 80px;">Answer</th>
    					<th style=" width: 160px;">Date</th>
    					<th style="width: 160px;">Writer</th>
    				</tr>
    			</thead>
    			<%
    			for(int i=0; i < qnaBoardList.size(); i++){
    				QnADTO notice = qnaBoardList.get(i);
    			%>
    			
					<tbody>
    					<tr>
    						<td><%= notice.getNum() %></td>
    						
    						
    						<td style="text-align: left;">
    						<img src="${pageContext.request.contextPath }/images/lock.png" style="width: 50px; height: 40px;">
    						<a href="#none" id="click<%=i%>"><%= notice.getQnacategory() %></a>
    						
    						<div class="div1" id="div1<%=i %>" style="margin: 0px; padding: 0px;">
    						
    							<input type="password" placeholder="Pwd check" id="pwdC<%=i%>" class="form-control"
    									style="width: 120px; height: 35px; padding: -20px; display: inline-block;">
    							<input type="button" value="check" id="check<%=i%>"
    									class="btn btn-secondary">
    									
    						<form method="post" action="./qna/AddAnswer.jsp?num=<%=notice.getNum()%>&qpageNum=<%=qpageNum%>">		
    						<c:set var="userId" value="admin"/>
    						<c:if test="${sessionId==userId}">
    							<input type="submit" value="Answer"
    									class="btn btn-secondary" style="float: right;">
    						</c:if>		
    						</form>
    						
    						</div>
    							
    							<p class="p1" id="qnacontent<%=i %>"><%= notice.getContent() %><br>
    							
    							<c:set var="answer" value="<%=notice.getAnswer() %>"/>
    							<c:if test="${answer!=null }">
    								<b style="margin-left: 20px;">▶ <%=notice.getAnswer() %></b>
    							</c:if>
    							</p>
    							
    						
    					
    						<input type="hidden" id="num<%=i %>" value="<%=notice.getNum()%>">
    						
    						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
							<script>
							$(document).ready(function(){
								$('#click'+<%=i%>).click(function(){
									
									if($('#update'+<%=i%>).val()==''){
										$('#div1'+<%=i%>).slideToggle("slow")	
									}
									
									else{
										$('#div1'+<%=i%>).slideToggle("slow");
										}
									});
								});
							</script>
    						<script>
    						$(document).ready(function(){
    							$('#check'+<%=i%>).click(function(){
    								var i = $('#pwdC'+<%=i%>).val();
    								if(i==<%=notice.getQnapassword()%>){
    									alert('일치');
    									$('#qnacontent'+<%=i %>).removeClass();
    								}else{
    									alert('불일치');
    								}
    							});
    						});
    						</script>
    						</td>
    						
    						<td>
    						<label id="result<%=i %>" class="badge badge-danger"><%=notice.getResult()%></label>
    						</td>
    						
    						<script>
    						$(document).ready(function(){
    							var rs = $('#result'+<%=i %>).text();
    							var yes = 'YES';
    							if(rs==yes){
    								$('#result'+<%=i %>).removeClass();
    								$('#result'+<%=i %>).addClass('badge badge-success');
    							}
    						});
    						</script>
    						
    						
    						
    						
    						<td style="text-align: right:"><%= notice.getRegist_day() %></td>
    						<td><%= notice.getId() %></td>
    					</tr>
    				</tbody>
    				<%} %>
				</table>

		<div style="margin-bottom: 10px; margin-top: 10px;">
    		<a href="./QnAListAction.no?qpageNum=1" style="margin-right: 10px;">&laquo;&laquo;</a>
    		<c:set var="qpageNum" value="<%=qpageNum %>"/>
    		<c:forEach var="i" begin="1" end="<%=total_qpage %>">
    			<a href="<c:url value="./QnAListAction.no?qpageNum=${i}"/>">
				<c:choose>
					<c:when test="${qpageNum==i}">
						<font color="#3F0099"><b>[${i}]</b></font>
					</c:when>
					<c:otherwise>
						<font color="#3F0099">[${i}]</font>
					</c:otherwise>
				</c:choose>
				</a>
    		</c:forEach>
    		<a href="./QnAListAction.no?qpageNum=<%=total_qpage%>" style="margin-left: 10px;">&raquo;&raquo;</a>
    	</div>
		<a href="./QnAWriteFormAction.no?id=<%=sessionId %>" onclick="return checkForm()" class="btn btn-primary btn-sm">Writing</a>
		
	</div>
</div>



<jsp:include page="../footer.jsp"/>
</body>
</html>