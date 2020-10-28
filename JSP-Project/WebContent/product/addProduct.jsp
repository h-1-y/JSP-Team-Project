<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>
<%
	String sql = "select concat('A',cast(substr(max(p_id),2) as unsigned)+1) from product";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs= pstmt.executeQuery();
	String pid = "";
	if(rs.next()) pid=rs.getString(1).trim();
%>    
<!DOCTYPE html><html><head>
<meta charset="UTF-8"><title>상품 등록</title>
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
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">New Product</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">New Product</h2>
          </div>
          <div class="col-md-7">

            <form name="newProduct" action="./processAddProduct.jsp"
  	 		class="form-horizontal" method="post" enctype="multipart/form-data">
              
              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label class="text-black">ProductId</label>
                    <input type="text" name="productId" id="productId" class="form-control"
   		  			value="<%=pid %>" readonly>
                  </div>
                </div>
               	<div class="form-group row">
                  <div class="col-md-12">
                    <label for="pname" class="text-black">Name</label>
                    <input type="text" name="pname" id="pname" class="form-control" placeholder="">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="unitPrice" class="text-black">Price($)</label>
                    <input type="text" name="unitPrice" id="unitPrice" class="form-control"placeholder="">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="description" class="text-black">Description</label>
                    <textarea name="description" id="description" cols="30" rows="7" class="form-control"></textarea>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="category" class="text-black">Category</label>
                    <select name="category" class="form-control" id="category">
   			   	<%
   					sql="select categoryName from category order by seq";
   					pstmt=con.prepareStatement(sql);
   					rs=pstmt.executeQuery();
  			    %>
  			    <%
   					 while(rs.next()){
 					 out.print("<option value='"+rs.getString(1)+"'>"
   	  	             +rs.getString(1)+"</option>");
   				}
  			    %>
   				</select>
                  </div>
                </div>
                <%
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
				%>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="unitsInStock" class="text-black">Stock</label>
                    <input type="text" name="unitsInStock" id="unitsInStock" class="form-control" placeholder="">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="productImage" class="text-black">Image</label>
                    <input type="file" name="productImage" class="form-control">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-lg-12">
                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Confirm" onclick="return CheckAddProduct()">
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="col-md-5 ml-auto">
            <div class="p-4 border mb-3">
              <span class="d-block text-primary h6 text-uppercase">Gangnam Campus</span>
              <p class="mb-0">7-7 Teheran St. Esco Building, Gangnam, Seoul, Korea</p>
            </div>
            <div class="p-4 border mb-3">
              <span class="d-block text-primary h6 text-uppercase">Shinchon Campus</span>
              <p class="mb-0">176 Shinchon St. Choongang Building, Mapo, Seoul, Korea</p>
            </div>
           
          </div>
        </div>
      </div>
    </div>
    <jsp:include page="../footer.jsp"/>
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