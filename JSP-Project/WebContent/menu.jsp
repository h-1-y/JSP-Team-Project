<%@page import="dto.Product"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
// 절대경로 설정
String contextPath = request.getContextPath();
String sessionId = (String)session.getAttribute("sessionId");
%>
<script type="text/javascript">
function checkForm(){
if(${sessionId==null}){
	
	alert('Please log in');
	location.href="${pageContext.request.contextPath }/member/loginMember.jsp";
	return false;
} 

location.href="${pageContext.request.contextPath }/member/myPage.jsp?id=<%=sessionId%>";
}
</script>
<header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">

            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="${pageContext.request.contextPath }/product/productSearch.jsp" class="site-block-top-search">
             	<span class="icon icon-search2"></span>
                 <input type="text" name="search" id="search" class="form-control border-0" placeholder="Search Product">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="${pageContext.request.contextPath }/home.jsp" class="js-logo-clone">SHOPPING-MALL</a>
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
                  
                  <li><a href="${pageContext.request.contextPath }/member/myPage.jsp?id=<%=sessionId%>" onclick="return checkForm()"><span class="icon icon-person"></span></a></li>
                  <li>
                    <a href="${pageContext.request.contextPath }/product/cart.jsp" class="site-cart">
                      <span class="icon icon-shopping_cart"></span>
                         <%
                  int count=0;
                  List<Product> cartList 
                        =(List<Product>)session.getAttribute("cartlist");
                  if(cartList==null) cartList = new ArrayList<Product>();
                  
                  for(int i=0;i<cartList.size();i++){
                   Product product=cartList.get(i);
                   int total
                      =product.getCount()+product.getQuantity();
                   count=count +total;
                  %>
                      
                      <%} %>
                      <span class="count"><%=count %></span>
                    </a>
                  </li> 
                  <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
                
                <c:choose>
                	<c:when test="${empty sessionId }">
               			<span style="margin-right: 5px;">[ Not Join ]</span>
                	</c:when>
                	<c:otherwise>
                		<span style="margin-right: 5px;">[ <%=sessionId %> ]</span>
                	</c:otherwise>
                </c:choose>
              </div>
            </div>

          </div>
        </div>
      </div> 
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li>
              <a href="${pageContext.request.contextPath }/home.jsp">Home</a>
            </li>
            <li>
              <a href="${pageContext.request.contextPath }/about.jsp">About</a>
            </li>
            <li class="has-children active">
            <a href="${pageContext.request.contextPath }/product/products.jsp">Shop</a>
            <ul class="dropdown">
                <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Outer">Outer</a></li>
                <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Backpack">Backpack</a></li>
                <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Glasses">Glasses</a></li>
                <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Watch">Watch</a></li>
                <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Ring">Ring</a></li>
                <li class="has-children">
                </li>
              </ul>
            </li>
            <li><a href="${pageContext.request.contextPath }/ReviewListAction.do?pageNum=1">Review</a></li>
            <li><a href="${pageContext.request.contextPath }/QnAListAction.no?qpageNum=1">Q & A</a></li>
            <c:choose>
                	<c:when test="${empty sessionId }">
               			<li><a href="${pageContext.request.contextPath }/member/loginMember.jsp">Login&Join</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="${pageContext.request.contextPath }/member/logoutMember.jsp">Logout</a></li>
                	</c:otherwise>
                </c:choose>
          </ul>
        </div>
      </nav>
      
      
           
                	
                	
                
      <c:choose>
      	<c:when test="${sessionId=='admin'}">
      <nav class="site-navigation text-right text-md-center" role="navigation">
        <div class="container">
          <ul class="site-menu js-clone-nav d-none d-md-block">
            <li><a href="${pageContext.request.contextPath }/product/addProduct.jsp">AddProduct</a></li>
            <li><a href="${pageContext.request.contextPath }/product/editProduct.jsp?edit=update">UpdateProduct</a></li>
            <li><a href="${pageContext.request.contextPath }/product/editProduct.jsp?edit=delete">DeleteProduct</a></li>
            <li><a href="${pageContext.request.contextPath }/product/orderDetails.jsp">Delivery Management</a></li>
          </ul>
        </div>
      </nav>
      	</c:when>
      </c:choose>
      
    </header>