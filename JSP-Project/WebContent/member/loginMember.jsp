<%@ page contentType="text/html; charset=UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html><html><head>
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

    
<meta charset="UTF-8">
<title>login</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Login & Join</strong></div>
        </div>
      </div>
    </div>
<div class="container" align="center" style="margin-top: 150px; margin-bottom: 150px;">
	<div class="col-md-4 col-md-offset-4">
		<h2 class="form-signin-heading">Member Login</h3>
		<%
			String error = request.getParameter("error");
			if(error != null){
				out.print("<div class='alert alert-danger'><strong>");
				out.print("Please Id & Password check!");
				out.print("</strong></div>");
			}
		%>
		
		<form class="form-signin" action="processLoginMember.jsp" method="post">
			<div class="form-group">
				<label for="inputUserName" class="sr-only">User Name</label>
				<input type="text" class="form-control" name="id" 
						  placeholder="ID" required autofocus>
			</div>
			
			<div class="form-group">
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" class="form-control" name="password" 
						  placeholder="Password" required >
			</div>

			<button type="submit" class="btn btn-primary btn-sm">Login</button>
			<button type="button" class="btn btn-primary btn-sm" onclick="location.href='addMember.jsp'">JOIN</button>
		</form>
		
	</div>
</div>
</body>
<jsp:include page="../footer.jsp"/>
</html>