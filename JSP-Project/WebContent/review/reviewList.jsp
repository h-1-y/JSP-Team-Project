<%@page import="mvc.review.model.ReviewDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
String sessionId = (String)session.getAttribute("sessionId");
List<ReviewDTO> reviewBoardList = (List<ReviewDTO>)request.getAttribute("reviewBoardList");
int total_record = (Integer)request.getAttribute("total_record");
int total_page = (Integer)request.getAttribute("total_page");
int pageNum = (Integer)request.getAttribute("pageNum");

String items = (String)session.getAttribute("items");
String text = (String)session.getAttribute("text");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
String date = sdf.format(new Date());

%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.div1{
display: none;
margin-top: 30px;
padding: 0px;
}
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
</style>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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

<div class="site-wrap">

    <jsp:include page="../menu.jsp"/>
    
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Review List</strong></div>
        </div>
      </div>
    </div> 
    
    <div class="p-3 p-lg-5 border" style="text-align: center;">
    <form method="post" name="form">
    <div style="margin-bottom: 50px;">
    	<h1 class="h3 mb-3 text-black">A L L &nbsp&nbspR E V I E W</h1>
    	<div style="margin-left: 70%; margin-bottom: -20px;">
    	<span style="margin-right: 10px; border: solid 1px #7971ea; padding: 0px 5px 0px 5px; 
    	background-color:#7971ea; color:#fff; border-radius: 5px;">
    	Count <%=total_record %></span>
    	<a class="btn btn-primary btn-sm" href="./ReviewListAction.do?pageNum=1">All List</a>
    	</div>
    </div>
    	<table>
    		<thead>
    			<tr >
    				<th style="width: 50px;">Num</th>
    				<th style="width: 200px;">Sortation</th>
    				<th style="text-align: left;">Title</th>
    				<th style="width: 120px;">Date</th>
    				<th style="width: 30px;">Score</th>
    				<th style="width: 20px;">Writer</th>
    			</tr>
    		</thead>
    		
    	
    		
    		<%
    		for(int i=0; i < reviewBoardList.size(); i++){
    			ReviewDTO notice = reviewBoardList.get(i);
    		%>
    		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
			<script>
			$(document).ready(function(){
				
				$('#click'+<%=i%>).click(function(){
					if($('#update'+<%=i%>).val()==''){
						
					$('#update'+<%=i%>).hide();
					$('#delete'+<%=i%>).hide();
					$('#div1'+<%=i%>).slideToggle("slow");
					}
					
					else{
						$('#div1'+<%=i%>).slideToggle("slow");
					}
					
					
				});
			});
			</script>
			
    				
    		<tbody>
    			<tr>
    				<td><%=notice.getNum() %></td>
    				<td><%=notice.getP_name() %></td>
    				
    				<td style="text-align: left;">
    				
    				<img src="${pageContext.request.contextPath }/images/<%=notice.getP_fileName() %>"
    				 style="width: 50px; height: 50px; margin-right: 10px;">
    				<input type="hidden" name="filename" value="<%=notice.getP_fileName() %>">
    				<a href="#none" class="click" id="click<%=i %>"><%=notice.getSubject() %></a>
    				
    				
    					<div class="div1" id="div1<%=i %>" style="margin: 0px; padding: 0px;">
    						<p style="display: inline-block; width: 60%; margin-top: 20px;"><%= notice.getContent() %><br>
    						
    					
    						
    						
    						<%-- <input type="hidden" value="<%=notice.getP_Id()%>" id="writer"> --%>
    						<c:set var="writer" value="<%=notice.getP_Id() %>"/>
    						<c:choose>
    							<c:when test="${sessionId=='admin' or sessionId==writer}">
    						<input type="submit" class="btn btn-primary btn-sm" id="update<%=i%>" 
    						value="Update" id="update" onclick="javascript:form.action=
    							'ReviewUpdateViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>';">
    						<input type="submit" class="btn btn-primary btn-sm" id="delete<%=i%>" 
    						value="Delete" id="delete" onclick="javascript:form.action=
    							'ReviewDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>';">
    							</c:when>
    						</c:choose>
    						
    					</div>
    				</td>
    				<td><%=notice.getRegist_day() %></td>
    				<td><%=notice.getStar() %></td>
    				<td><%=notice.getP_Id() %></td>
    			</tr>
    		</tbody>
    		<%} %>
    	</table>
    	
    	<div style="margin-bottom: 10px;">
    		<a href="./ReviewListAction.do?pageNum=1&items=${items}&text=${text}" style="margin-right: 10px;">&laquo;&laquo;</a>
    		<c:set var="pageNum" value="<%=pageNum %>"/>
    		<c:forEach var="i" begin="1" end="<%=total_page %>">
    			<a href="<c:url value="./ReviewListAction.do?pageNum=${i}&items=${items}&text=${text}"/>">
				<c:choose>
					<c:when test="${pageNum==i}">
						<font color="#3F0099"><b>[${i}]</b></font>
					</c:when>
					<c:otherwise>
						<font color="#3F0099">[${i}]</font>
					</c:otherwise>
				</c:choose>
				</a>
    		</c:forEach>
    		<a href="./ReviewListAction.do?pageNum=<%=total_page%>&items=${items}&text=${text}" style="margin-left: 10px;">&raquo;&raquo;</a>
    	</div>
    	
    	<div style="margin-bottom: 20px;">
    		<select name="items" style="margin-right: 10px;">
    			<option value="p_name">ProductName</option>
    			<option value="subject">Title</option>
    		</select>
    		<input type="text" name="text" style="width: 400px; margin-right: 10px;">
    		<input type="submit" class="btn btn-primary btn-sm" value="search" 
    				onclick="javascript:form.action='ReviewListAction.do';">
    	</div>
    	
    	
    	</form>
    
  </div> 
</div>
<jsp:include page="../footer.jsp"/>
  <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
  <script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/aos.js"></script>
  <script src="${pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>