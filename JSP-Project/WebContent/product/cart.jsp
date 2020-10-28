<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String cartId=session.getId();
String sessionId = (String)session.getAttribute("sessionId");
%>
<!DOCTYPE html>
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
 <script>
function change(seq){
	var id=document.getElementById("id"+seq).value;
	    id=id.substring(0,id.indexOf("-"));
	var qty = document.getElementById("qty"+seq).value;
	var yesno=confirm("수정하시겠습니까?");
	if(yesno) location.href="changeCart.jsp?id="+id+"&qty="+qty;
}
function k(seq){
	var btn=document.getElementById("btn"+seq);
	btn.disabled="";
}
function click(){
	var yesno=confirm("삭제 하시겠습니까?");
	if(yesno) location.href="deleteCart.jsp?id="+id+"&qty="+qty;
}
function apply(){
	alert("쿠폰이 적용되었습니다.");
}
function ucart(){
	location.href="cart.jsp";
}
function cshopping(){
	location.href="products.jsp";
}
</script>

  </head>
  <body> 
  <jsp:include page="../menu.jsp"/>
  <div class="site-wrap">
    <div class="bg-light py-3">
      <div class="container">
        <div class="row">
          <div class="col-md-12 mb-0">
          <a href="menu.jsp">Home</a>
           <span class="mx-2 mb-0">/</span>
            <strong class="text-black">Cart</strong>
           </div>
        </div>
      </div>
    </div>

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <form class="col-md-12" method="post">
            <div class="site-blocks-table">
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <th class="p_filename">Image</th>
                    <th class="p_productId">Product</th>
                    <th class="p_unitPrice">Price</th>
                    <th class="p_quantity">Quantity</th>
                    <th class="p_total">Total</th>
                    <th class="p_remove">Remove</th>
                  </tr>
                </thead>
                <tbody>
     <%
     String filename = request.getParameter("p_filename");
       int sum=0;
       List<Product> cartList 
             =(List<Product>)session.getAttribute("cartlist");
       if(cartList==null) cartList = new ArrayList<Product>();
       
       for(int i=0;i<cartList.size();i++){
    	 Product product=cartList.get(i);
    	 int total
    	    =product.getUnitPrice()*product.getQuantity();//단가*수량
    	 sum=sum +total;//sum(총금액) =개별상품의 가격 합.
    %>
    <tr>
    <td><img src="${pageContext.request.contextPath }/images/<%=product.getFilename()%>" width="75px"></td>
    <td><input type="text" 
         value="<%=product.getProductId()%>-<%=product.getPname()%>" 
         id="id<%=i%>" readonly>
    </td>
    <td>$<%=product.getUnitPrice()%></td>
    <td><input type="number" id="qty<%=i%>" 
              value="<%=product.getQuantity()%>" 
               onchange="k(<%=i%>)" min="1">
        <input type="button" class="btn btn-primary" 
               onclick="change(<%=i%>)" value="UPDATE" 
               id="btn<%=i%>"
               disabled="disabled"/>
    </td>
    <td><%=total%></td>
    <td><a href="${pageContext.request.contextPath }/product/removeCart.jsp?id=<%=product.getProductId()%>" 
               class="btn btn-primary btn-sm">DELETE</a></td>
    </tr>
    <%} %>
                </tbody>
              </table>
            </div>
          </form>
        </div>

        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6 mb-3 mb-md-0">
                <button class="btn btn-primary btn-sm btn-block" onclick="ucart()">Update Cart</button>
              </div>
              <div class="col-md-6">
                <button class="btn btn-outline-primary btn-sm btn-block" onclick="cshopping()">Continue Shopping</button>
              </div>
            </div>
            <!-- <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">Coupon</label>
                <p>Enter your coupon code if you have one.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
              </div>
              <div class="col-md-4">
                <button class="btn btn-primary btn-sm" onclick="apply()">Apply Coupon</button>
              </div>
            </div> -->
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                  
                    <strong class="text-black">$<%=sum %></strong>
                  
                  </div>
                </div>
				
				<script type="text/javascript">
				function checkForm2(){
					
					
					if(${sessionId==null}){
						
						alert('Please log in');
						location.href="${pageContext.request.contextPath }/member/loginMember.jsp";
						return false;
					} else if(<%=sum%>==0){
						alert('There is no prize in the shopping basket');
						return false;
					}
					
					
					else {
						location.href="${pageContext.request.contextPath }/product/checkout.jsp?cartId=<%=cartId %>";
					}
				}
				</script>
				
                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-primary btn-lg py-3 btn-block" onclick="return checkForm2()">Proceed To Checkout</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<jsp:include page="../footer.jsp"/>
  <script src="js/jquery-3.3.1.min.js"></script>
  <script src="js/jquery-ui.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/main.js"></script>  
  </body>
</html>