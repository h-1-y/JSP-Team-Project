<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% String sessionId = (String)session.getAttribute("sessionId"); %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Mukta:300,400,700">
<link rel="stylesheet" href="${pageContext.request.contextPath }/fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function deleteId(){
	
	
		
		if(confirm("Are you sure you want to leave?")){
			location.href="./deleteMember.jsp"
		}else{
			document.addForm.reset();
		}
	
	
	
}

</script>
<jsp:include page="../menu.jsp"/>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">My Page</strong></div>
        </div>
      </div>
    </div>
            
            
            
            <div class='site-section border-bottom' data-aos='fade'>
	    	<div class='container'>
	    	<div class='row justify-content-center mb-5'>
	    	<div class='col-md-7 site-section-heading text-center pt-4'>
	    	<h2 class="text-black">My Page</h2>
	    	<h3>(<%=sessionId %>)</h3>
	    	<p>
	    	<a href="${pageContext.request.contextPath }/member/logoutMember.jsp"class="buy-now btn btn-sm btn-primary" style="width:34%;background-color:#F15F5F;border-color:#F15F5F; margin-bottom: 5px;">LOGOUT</a><br>
	    	<a href="${pageContext.request.contextPath }/member/updateMember.jsp" class="buy-now btn btn-sm btn-primary" style="width:34%; margin-bottom: 5px;">Update</a><br>
            <a href="${pageContext.request.contextPath }/product/userDetails.jsp"class="buy-now btn btn-sm btn-primary" style="width:34%;background-color:#17a2b8;border-color:#17a2b8; margin-bottom: 5px;">Order List</a><br>
            <a href="#" onclick="deleteId()" class="buy-now btn btn-sm btn-primary" style="width:34%;background-color:#6c757d;border-color:#6c757d; margin-bottom: 15px;">Withdrawal</a></p>
	    	<div class='col-md-7 site-section-heading text-center pt-4' style='margin:auto;'>
	    	</div>
	    	</div>
	    	</div>
            
            
            
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