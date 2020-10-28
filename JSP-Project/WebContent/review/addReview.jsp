<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String p_name = request.getParameter("p_name");
String p_fileName = request.getParameter("p_fileName");
String sessionId = (String)session.getAttribute("sessionId");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function submitClick(){
	
	var a = document.getElementById("subject").value;
	var b = document.getElementById("content").value;
	
	if(a=="" || b==""){
		
	alert('Please enter a letter :D');
	document.getElementById("subject").focus();
	return false;
	
	}
	
	var conf = confirm('Would you like to add review it?');
	
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
<div class="site-wrap">
<jsp:include page="../menu.jsp"/>

<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Writing a Review</strong></div>
        </div>
      </div>
    </div> 

<form action="./review/processAddReview.jsp">
	<div class="p-3 p-lg-5 border" style="text-align: center;">
		<div style="margin-bottom: 30x;">
    		<h1 class="h3 mb-3 text-black">ADD   REVIEW</h1>
   		</div>
   		
   		
   		
   		<label style="margin-top: 10px;">- Writer -</label><br>
   		<input type="text" name="p_id" value="<%=sessionId %>" readonly 
   		style="text-align:center; border: none; background: transparent;"><br>
   		<label style="margin-top: 10px;">- Product Name -</label><br> 
   		<input type="text" name="p_name" value="<%=p_name%>" readonly 
   		style="text-align:center; border: none; background: transparent;"><br>
   		<label style="margin-top: 10px;">- Star Score -</label><br>
   		<select name="star" class="btn btn-secondary btn-sm dropdown-toggle">
   			<option value="☆☆☆☆☆">☆☆☆☆☆</option>
   			<option value="★☆☆☆☆">★☆☆☆☆</option>
   			<option value="★★☆☆☆">★★☆☆☆</option>
   			<option value="★★★☆☆">★★★☆☆</option>
   			<option value="★★★★☆">★★★★☆</option>
   			<option value="★★★★★" selected="selected">★★★★★</option>
   		</select><br>
   		<label style="margin-top: 10px;">- Title -</label><br>
   		<input type="text" name="subject" id="subject"><br>
   		
   		<div>
   		<label style="margin-top: 10px;">- Content -</label><br>
   		<textarea rows="10" cols="50" name="content" id="content"></textarea><br>
   		</div>
   		
   		<div style="margin-top: 20px;">
   			<input type="submit" value="Submit" class="btn btn-sm btn-primary" onclick="return submitClick()">
   			<a class="btn btn-sm btn-primary" href="#" onclick="history.back();">Cancel</a>
   			<input type="hidden" name="p_fileName" value="<%=p_fileName%>">
   		</div>
    </div>
</form>

</div>
<jsp:include page="../footer.jsp"/>

</body>
</html>