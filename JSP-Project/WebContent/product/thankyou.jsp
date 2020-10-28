
<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../dbconn.jsp" %>
<!DOCTYPE html>
<%
String sessionId = (String)session.getAttribute("sessionId");
String shipping_cartId = "";
String shipping_name = "";
String shipping_shippingDate = "";
String shipping_zipCode = "";
String shipping_addressName = "";
String productId = request.getParameter("productId");
String unitprice = request.getParameter("unitprice");
String saleqty = request.getParameter("saleqty");

Cookie[] cookies = request.getCookies();

if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		
		if(n.equals("Shipping_cartId")){
			shipping_cartId = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_name")){
			shipping_name = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_shippingDate")){
			shipping_shippingDate = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_zipCode")){
			shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		if(n.equals("Shipping_addressName")){
			shipping_addressName = URLDecoder.decode(thisCookie.getValue(),"utf-8");
		}
		
	}
}
%>
<%
ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist"); // 카트리스트 사용해서 넘겨 받아도 됨 아니 이렇게 했어야함

con.setAutoCommit(false);
Date saleDate = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
try{
	
	for(int i=0; i<list.size(); i++){
	
String sql1 = "insert into sale(id,saledate,sessionId,productId,unitprice,saleqty) values(?,?,?,?,?,?)";
PreparedStatement pstmt = con.prepareStatement(sql1);
pstmt.setString(1,sessionId);
pstmt.setString(2, sdf.format(saleDate));
pstmt.setString(3, shipping_cartId);
pstmt.setString(4, list.get(i).getProductId());
pstmt.setInt(5, list.get(i).getUnitPrice());
pstmt.setInt(6, list.get(i).getQuantity());

pstmt.executeUpdate();
	}
	// db에 반영
	con.commit();
}catch(Exception e){
	// 이전 상태로 되돌리기
	con.rollback();
}finally{
	con.setAutoCommit(true);
}
%>
<html>
  <head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
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
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Thank you!</strong></div>
        </div>
      </div>
    </div>  

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
            <span class="icon-check_circle display-3 text-success"></span>
            <h2 class="display-3 text-black">Thank you!</h2>
            <p class="lead mb-5">Your order is complete.</p>
            <a href="${pageContext.request.contextPath }/product/userDetails.jsp" class="btn btn-sm btn-primary">Order Information</a>
           <a href="${pageContext.request.contextPath }/product/products.jsp" class="btn btn-sm btn-primary">Back to shop</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  
  <%
//세션정보 삭제
session.removeAttribute("cartlist");
// 쿠키에 저장 된 장바구니 정보 삭제
for(int i=0; i<cookies.length; i++){
	Cookie thisCookie = cookies[i];
	String n = thisCookie.getName();
	if(n.equals("Shipping_cartId")) thisCookie.setMaxAge(0);
	if(n.equals("Shipping_name")) thisCookie.setMaxAge(0);
	if(n.equals("Shipping_shippingDate")) thisCookie.setMaxAge(0);
	if(n.equals("Shipping_addressName")) thisCookie.setMaxAge(0);
	if(n.equals("Shipping_zipCode")) thisCookie.setMaxAge(0);
	//응답객체에 추가
	response.addCookie(thisCookie);
	
}
%>

  <script src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
  <script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/js/aos.js"></script>
  <script src="${pageContext.request.contextPath }/js/main.js"></script>
       <jsp:include page="../footer.jsp"/>
  </body>
</html>