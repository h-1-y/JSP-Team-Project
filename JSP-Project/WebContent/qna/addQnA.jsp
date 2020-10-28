<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../dbconn.jsp" %>
<%
String sessionId = (String)session.getAttribute("sessionId");
String sql = "select p_name from product";
PreparedStatement pstmt = con.prepareStatement(sql);
ResultSet rs = pstmt.executeQuery();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function submitClick(){
	
	var a = document.getElementById("password").value;
	var b = document.getElementById("content").value;
	
	if(a=="" || b==""){
		
	alert('Please enter a letter :D');
	document.getElementById("content").focus();
	return false;
	
	}
	
	var conf = confirm('Would you like to add Q & A it?');
	
	if(conf==true){
		alert('Success :D');
	document.getElementById('submit').submit();
	}else if(conf==false){
		alert('cancel :(');
		return false;
	}
}
</script>
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

<jsp:include page="../menu.jsp"/>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Writing a QnA</strong></div>
        </div>
      </div>
    </div> 
<form action="./qna/processAddQnA.jsp" method="post" id="submit">
	<div class="p-3 p-lg-5 border" style="text-align: center;">
		<div style="margin-bottom: 30x;">
    		<h1 class="h3 mb-3 text-black">ADD   Q n A</h1>
   		</div>
   		
   		
   		
   		<label style="margin-top: 10px;">- Writer -</label><br>
   		<input type="text" name="p_id" value="<%=sessionId %>" readonly 
   		style="text-align:center; border: none; background: transparent;"><br>
   		
   		<label style="margin-top: 10px;">- Product Name -</label><br> 
   		<select name="productname" class="btn btn-secondary btn-sm dropdown-toggle">
   		<%while(rs.next()){ %>
   			<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
   		<%} 
   		if(pstmt!=null) pstmt.close();
   		if(rs!=null) rs.close();
   		%>
   		</select><br>
   		
   		<%
   		String sql2 = "select description from qnaCategory";
   		PreparedStatement pstmt2 = con.prepareStatement(sql2);
   		ResultSet rs2 = pstmt2.executeQuery();
   		%>
   		
   		<label style="margin-top: 10px;">- Category -</label><br>
   		<select name="qnacategory" class="btn btn-secondary btn-sm dropdown-toggle">
   		<%while(rs2.next()){ %>
   			<option value="<%=rs2.getString(1) %>"><%=rs2.getString(1) %></option>
   		<%} 
   		if(con!=null) con.close();
   		if(pstmt2!=null) pstmt2.close();
   		if(rs2!=null) rs2.close();
   		%>
   		</select><br>
   		
   		<div>
   		<label style="margin-top: 10px;">- Content -</label><br>
   		<textarea rows="10" cols="50" name="content" id="content"></textarea><br>
   		</div>
   		
   		<label style="margin-top: 10px;">- Password -</label><br>
   		<input type="text" name="qnapassword" id="password" placeholder="(****)"><br>
   		<input type="hidden" name="result">
   		
   		<div style="margin-top: 20px;">
   			<input type="submit" value="Submit" class="btn btn-sm btn-primary" onclick="return submitClick()">
   			<a class="btn btn-sm btn-primary" href="#" onclick="history.back();">Cancel</a>
   		</div>
    </div>
</form>

<jsp:include page="../footer.jsp"/>

</body>
</html>