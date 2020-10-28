<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
<link rel="stylesheet" href="fonts/icomoon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
</head>
<% String category=request.getParameter("category"); %>
<body>
<div class="site-wrap">
<jsp:include page="../menu.jsp"/>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/product/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Shop</strong></div>
        </div>
      </div>
    </div>
<div class="site-section">
      <div class="container">

        <div class="row mb-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h3 class="text-black h5">Products</h3></div>
              </div>
            </div>
<%@include file="../dbconn.jsp"%>
<% String sql = null;
	if(category.equals("Outer")){
    sql="select * from product where p_category='Outer'";
}else if(category.equals("Backpack")){
	sql="select * from product where p_category='Backpack'";
}else if(category.equals("Glasses")){
	sql="select * from product where p_category='Glasses'";
}else if(category.equals("Watch")){
	sql="select * from product where p_category='Watch'";
}else{
	sql="select * from product where p_category='Ring'";
}
   PreparedStatement pstmt=con.prepareStatement(sql);
   ResultSet rs=pstmt.executeQuery();
%>
		 <div class="row mb-5">
		  <%
    		while(rs.next()){
     	  %>
              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
                <div class="block-4 text-center border" style="width:255px;height:440px;">
                  <figure class="block-4-image"">
                    <a href="${pageContext.request.contextPath }/product/product.jsp?p_id=<%=rs.getString("p_id")%>&p_filename=<%=rs.getString("p_fileName")%>"><img style="width:253px;height:253px;" src="${pageContext.request.contextPath }/images/<%=rs.getString("p_fileName")%>" alt="Image placeholder" class="img-fluid"></a>
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="${pageContext.request.contextPath }/product/product.jsp?p_id=<%=rs.getString("p_id")%>"><%=rs.getString("p_name")%></a></h3>
                    <p class="mb-0"><%=rs.getString("p_description")%></p>
                    <p class="text-primary font-weight-bold">$<%=rs.getInt("p_unitPrice")%></p>
                  </div>
                </div>
              </div>
              <%		 
      		  }
   			  %>
             
 
            </div>
          </div>
			<div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              <ul class="list-unstyled mb-0">
                <li class="mb-1"><a href="${pageContext.request.contextPath }/product/products.jsp" class="d-flex"><span>ALL</span></a></li>
                <li class="mb-1"><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Outer" class="d-flex"><span>Outer</span></a></li>
                <li class="mb-1"><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Backpack" class="d-flex"><span>Backpack</span></a></li>
                <li class="mb-1"><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Glasses" class="d-flex"><span>Glasses</span></a></li>
                <li class="mb-1"><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Watch" class="d-flex"><span>Watch</span></a></li>
                <li class="mb-1"><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Ring" class="d-flex"><span>Ring</span></a></li>
              </ul>
            </div>
            </div>
            </div>           
          </div>
        </div>
        <jsp:include page="../footer.jsp"/>
      </div>
    </div>
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