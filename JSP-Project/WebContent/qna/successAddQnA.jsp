<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Contact</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <span class="icon-check_circle display-3 text-success"></span>
            <h2 class="display-3 text-black">Thank you!</h2>
            <p class="lead mb-5">Your Q & A is complete :D </p>
            <p><a href="${pageContext.request.contextPath }/QnAListAction.no?qpageNum=1" class="btn btn-sm btn-primary">Back to Q & A</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>

 <jsp:include page="../footer.jsp"/>

</body>
</html>