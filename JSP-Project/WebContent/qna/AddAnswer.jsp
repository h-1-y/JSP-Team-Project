<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>
<%
String num = request.getParameter("num");
String sql = "select id,p_name,qnacategory,content from qnaBoard where num=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(num));
ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Add Review</strong></div>
        </div>
      </div>
    </div> 


	<div class="p-3 p-lg-5 border" style="text-align: center;">
		<div style="margin-bottom: 30x;">
    		<h1 class="h3 mb-3 text-black">Admin Answer</h1>
   		</div>
   		
   		<% if(rs.next()){ %>
   		
   		<form action="./processAddAnswer.jsp?num=<%=num %>" method="post">
   		
   		<label style="margin-top: 10px;">- Writer -</label><br>
   		<input type="text" name="p_id" value="<%=rs.getString(1) %>" readonly 
   		style="text-align:center; border: none; background: transparent;"><br>
   		<label style="margin-top: 10px;">- Product Name -</label><br> 
   		<input type="text" name="p_name" value="<%=rs.getString(2) %>" readonly 
   		style="text-align:center; border: none; background: transparent;"><br>
   		
   		<div>
   		<label style="margin-top: 10px;">- Question Category -</label><br>
   		<input type="text" name="p_name" value="<%=rs.getString(3) %>" readonly 
   		style="text-align:center; border: none; background: transparent;"><br>
   		</div>
   		
   		<div>
   		<label style="margin-top: 10px;">- User Question -</label><br>
   		<textarea rows="5" cols="30" name="content" id="content"><%=rs.getString(4) %></textarea><br>
   		</div>
   		
   		<%} %>
   		
   		<div>
   		<label style="margin-top: 10px;">- Admin Answer -</label><br>
   		<textarea rows="5" cols="30" name="Answer" id="Answer"></textarea><br>
   		</div>
   		
   		<div style="margin-top: 20px;">
   			<input type="submit" value="Submit" class="btn btn-sm btn-primary">
   			<a class="btn btn-sm btn-primary" href="#" onclick="history.back();">Cancel</a>
   			
   		</div>
   		</form>
    </div>

<%
if(con!=null) con.close();
if(pstmt!=null) pstmt.close();
if(rs!=null) rs.close();
%>
</div>
<jsp:include page="../footer.jsp"/>

</body>
</html>