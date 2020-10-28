<%@page import="dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ include file="../dbconn.jsp" %>
<% 
String sessionId = (String)session.getAttribute("sessionId"); 

%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>상품 정보</title>
<script>
function addToCart(){
	
	if(${sessionId!=null}){
	
		if(confirm("Do you want to add this product into cart?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	} else {
		alert('Please log in');
		location.href="${pageContext.request.contextPath }/member/loginMember.jsp";
		return false;
	}
}
</script>
<script type="text/javascript">
function checkForm(){
	
	if(${sessionId==null}){
		alert('Please log in');
		location.href="${pageContext.request.contextPath }/member/loginMember.jsp";
		return false;
		
	}
}
</script>
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
<%
   String id=request.getParameter("p_id");
   String sql="select * from product where p_id=?";
   PreparedStatement pstmt = con.prepareStatement(sql);
   pstmt.setString(1, id);
   ResultSet rs=pstmt.executeQuery();
   Product product=new Product();
   if(rs.next()){
	   product.setProductId(rs.getString(1));
	   product.setPname(rs.getString(2));
	   product.setUnitPrice(rs.getInt(3));
	   product.setDescription(rs.getString(4));
	   product.setCategory(rs.getString(5));
	   product.setUnitsInStock(rs.getLong(6));
	   product.setFilename(rs.getString(7));
   }
   
   if(rs!=null) rs.close();
   if(pstmt!=null) pstmt.close();
   if(con!=null) con.close();
%>
<div class="site-wrap">
<jsp:include page="../menu.jsp"/>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black"><%=product.getPname()%></strong></div>
        </div>
      </div>
    </div>
<div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <img src="${pageContext.request.contextPath }/images/<%=product.getFilename()%>" alt="Image" class="img-fluid">
          </div>
          <div class="col-md-6">
            <h2 class="text-black"><%=product.getPname()%></h2>
            <p class="text-black"><%=product.getCategory()%> - <%=product.getProductId()%></p>
            <p class="mb-4"><%=product.getDescription()%></p>
            <p><strong class="text-primary h4">$<%=product.getUnitPrice()%></strong></p>
            <p><form name="addForm" 
       	  	action="${pageContext.request.contextPath }/product/addCart.jsp?id=<%=product.getProductId()%>" 
         	method="post">
            <p><a href="#" class="buy-now btn btn-sm btn-primary" onclick="return addToCart()" style="margin-bottom: 5px; width: 34%">Add To Cart</a><br>
            <a href="${pageContext.request.contextPath }/product/products.jsp" class="buy-now btn btn-sm btn-primary" style="width:34%;background-color:#17a2b8;border-color:#17a2b8; margin-bottom: 5px;">Product List</a><br>
            <a href="${pageContext.request.contextPath }/ReviewWriteFormAction.do?p_fileName=<%=product.getFilename()%>&p_name=<%=product.getPname()%>" onclick="return checkForm()" class="buy-now btn btn-sm btn-primary" style="width:34%;background-color:#6c757d;border-color:#6c757d;">Add Review</a></p><br>
			</form>
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

  <script src="js/main.js"></script>
</body>
</html>