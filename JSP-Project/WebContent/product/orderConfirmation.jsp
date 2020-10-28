<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("utf-8");

String cartId = session.getId();

String shipping_cartId = "";
String shipping_name = "";
String shipping_shippingDate = "";
String shipping_country = "";
String shipping_zipCode = "";
String shipping_addressName = "";

//request객체로 부터 쿠키 정보 얻기 getCookies()

Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		
		if(n.equals("Shipping_cartId")){
			shipping_cartId = URLDecoder.decode(thisCookie.getValue());
		}
		if(n.equals("Shipping_name")){
			shipping_name = URLDecoder.decode(thisCookie.getValue());
		}
		if(n.equals("Shipping_shippingDate")){
			shipping_shippingDate = URLDecoder.decode(thisCookie.getValue());
		}
		if(n.equals("Shipping_country")){
			shipping_country = URLDecoder.decode(thisCookie.getValue());
		}
		if(n.equals("Shipping_zipCode")){
			shipping_zipCode = URLDecoder.decode(thisCookie.getValue());
		}
		if(n.equals("Shipping_addressName")){
			shipping_addressName = URLDecoder.decode(thisCookie.getValue());
		}
	}
}
%>

<html>
<head>

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
<jsp:include page="../menu.jsp"/>
<div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath }/home.jsp">Home</a> <span class="mx-2 mb-0">/</span> <strong class="text-black">Order Information</strong></div>
        </div>
      </div>
    </div> 
<div class="row mb-5">
					<div class="col-md-12">
						<div class="border p-4 rounded" role="alert">
						<div style="text-align:center">
							<span style="color: black; font-size: 40px"> <strong>Order Information</strong>
							</span>
				

	
	<div style="font-size: 20px; margin-bottom: 50px;">
		<label style="margin-top: 10px;"><strong>- Ordering person -</strong></label><br>
		<p><%=shipping_name  %></p>
		<label style="margin-top: 10px;"><strong>- Address -</strong></label><br>
		<p><%=shipping_addressName %></p>
		<label style="margin-top: 10px;"><strong>- PostCode -</strong></label><br>
		<p><%=shipping_zipCode %></p>
		<label style="margin-top: 10px;"><strong>- Shipping Date -</strong></label><br>
		<p><%=shipping_shippingDate %></p>
	</div>
	<h3 style="margin-bottom: 50px;">Order List</h3>
		<table class="table table-hover" style="width: 60%; margin: auto;">
			<tr>
				<th class="text-center">Product Name</th>
				<th class="text-center">Quantity</th>
				<th class="text-center">Price</th>
				<th class="text-center">Subtotal</th>
			</tr>
			<%
			int sum = 0; // 총계
			List<Product> cartList = (List<Product>)session.getAttribute("cartlist");
			if(cartList==null) cartList = new ArrayList<Product>();
			//상품리스트 하나씩 출력
			for(int i=0; i<cartList.size(); i++){
				Product product = cartList.get(i);
				int total = product.getUnitPrice() * product.getQuantity();
				sum += total;
			%>
			<tr>
				<td class="text-center"><em><%=product.getPname() %></em></td>
				<td class="text-center"><em><%=product.getQuantity() %></em></td>
				<td class="text-center"><em><%=product.getUnitPrice() %></em></td>
				<td class="text-center"><em><%=total %></em></td>
			</tr>
			
			<%} %>
			<tr>
				<td></td>
				<td></td>
				<td class="text-right"><strong>Total : </strong></td>
				<td class="text-center text-danger"><strong><%=new DecimalFormat("#,###").format(sum) %></strong></td>
			</tr>
		</table>
	
	
	<div style="margin: auto;">
		<!-- 확정메뉴 -->
		<a href="./thankyou.jsp" class="btn btn-sm btn-primary" role="button">Ordering</a>
		<a href="./checkOutCancelled.jsp" class="btn btn-sm btn-primary" role="button">Cancel</a>
	</div>
		</div>
					</div>
				</div>
			</div>

<jsp:include page="../footer.jsp"/>
</body>
</html>