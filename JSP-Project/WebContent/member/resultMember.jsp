<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
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
<title>회원 정보</title>
</head>
<body>
<jsp:include page="../menu.jsp"/>

<div class="container" align="center">
	<% String msg=request.getParameter("msg");
	 if(msg!=null){
	   if(msg.equals("0")){
		   out.println("<div class='site-section border-bottom' data-aos='fade'>");
	    	out.println("<div class='container'>");
	    	out.println("<div class='row justify-content-center mb-5'>");
	    	out.println("<div class='col-md-7 site-section-heading text-center pt-4'>");
	    	out.println("<h1>Modification</h1><br>");
	    	out.println("<h1 style='margin-bottom:30px;'>Completed :D</h1>");
	    	out.println("<div class='col-md-7 site-section-heading text-center pt-4' style='margin:auto;'>");
	    	out.println("</div></div></div>");
	    }else if(msg.equals("1")){
	    	out.println("<div class='site-section border-bottom' data-aos='fade'>");
	    	out.println("<div class='container'>");
	    	out.println("<div class='row justify-content-center mb-5'>");
	    	out.println("<div class='col-md-7 site-section-heading text-center pt-4'>");
	    	out.println("<h1>Welcome to the</h1><br>");
	    	out.println("<h1 style='margin-bottom:30px;'>SHOPPERS :D</h1>");
	    	out.println("<div class='col-md-7 site-section-heading text-center pt-4' style='margin:auto;'>");
	    	out.println("</div></div></div>");
	    }else if(msg.equals("2")){
	    	String loginId=(String)session.getAttribute("sessionId");
	    	out.println("<div class='site-section border-bottom' data-aos='fade'>");
	    	out.println("<div class='container'>");
	    	out.println("<div class='row justify-content-center mb-5'>");
	    	out.println("<div class='col-md-7 site-section-heading text-center pt-4'>");
	    	out.println("<h1>Welcome!!</h1><br>");
	    	out.println("<h1>- "+loginId+" -</h1><br>");
	    	out.println("<h1 style='margin-bottom:30px;'>Have a good time :D</h1>");
	    	out.println("<div class='col-md-7 site-section-heading text-center pt-4' style='margin:auto;'>");
	    	out.println("</div></div></div>");
  
	    }
	   }else{
		   	out.println("<div class='site-section border-bottom' data-aos='fade'>");
	    	out.println("<div class='container'>");
	    	out.println("<div class='row justify-content-center mb-5'>");
	    	out.println("<div class='col-md-7 site-section-heading text-center pt-4'>");
	    	out.println("<h1>Completion</h1><br>");
	    	out.println("<h1> Of </h1><br>");
	    	out.println("<h1 style='margin-bottom:30px;'>Withdrawal :(</h1>");
	    	out.println("<div class='col-md-7 site-section-heading text-center pt-4' style='margin:auto;'>");
	    	out.println("</div></div></div>");
	   }
	%>
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