<%@page import="java.sql.ResultSet"%><%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>상품 수정</title>
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
<%@ include file="../dbconn.jsp" %>
<%
    String p_id=request.getParameter("p_id");
    String sql="select * from product where p_id=?";
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1,p_id);
	ResultSet rs=pstmt.executeQuery();
	rs.next();

	String category=rs.getString("p_category");
%>
<div class="site-wrap">
<jsp:include page="../menu.jsp"/>
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="./products.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Update Product</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h2 class="h3 mb-3 text-black">Update Product</h2>
          </div>
          <div class="col-md-7">

            <form name="newProduct" action="${pageContext.request.contextPath }/product/processUpdateProduct.jsp"
  	 		class="form-horizontal" method="post" enctype="multipart/form-data">
              
              <div class="p-3 p-lg-5 border">
                <div class="form-group row">
                  <div class="col-md-12">
                    <label class="text-black">ProductId</label>
                    <input type="text" name="productId" id="productId" class="form-control"
   		  			value="<%=rs.getString("p_id")%>" readonly>
                  </div>
                </div>
               	<div class="form-group row">
                  <div class="col-md-12">
                    <label for="pname" class="text-black">Name</label>
                    <input type="text" name="pname" id="pname" class="form-control" value="<%=rs.getString("p_name")%>" placeholder="">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="unitPrice" class="text-black">Price</label>
                    <input type="text" name="unitPrice" id="unitPrice" class="form-control" value="<%=rs.getInt("p_unitPrice")%>" placeholder="">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="description" class="text-black">Description</label>
                    <textarea name="description" id="description" cols="30" rows="7" class="form-control"><%=rs.getString("p_description")%></textarea>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-md-12">
                    <label for="category" class="text-black">Category</label>
                    <select name="category" class="form-control" id="category">
   					<%
    		  		 String sql2="select categoryName from category order by seq";
     				 PreparedStatement pstmt2=con.prepareStatement(sql2);
      				 ResultSet rs2=pstmt2.executeQuery();
   					%>
  				    <%
    				while(rs2.next()){
   				    out.print("<option value='"+rs2.getString(1)+"' "+
          	 	    (rs2.getString(1).equals(category)?"selected":"") 
    		
    				+" >"
           		    +rs2.getString(1)+"</option>");
   				    }
    				%>
  				    </select>
  				   </div>
  				 </div>
<%
    if(rs2!=null)rs2.close();
	if(pstmt2!=null) pstmt2.close();
%>
	<div class="form-group row">
      <div class="col-md-12">
         <label for="unitsInStock" class="text-black">Stock</label>
            <input type="text" name="unitsInStock" id="unitsInStock" class="form-control"
            value="<%=rs.getLong("p_unitsInStock")%>" placeholder="">
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