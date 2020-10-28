<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<footer class="site-footer border-top">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0">
            <div class="row">
              <div class="col-md-12">
                <h3 class="footer-heading mb-4">Navigations</h3>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="${pageContext.request.contextPath }/product/products.jsp">All Products</a></li>
                  <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Outer">Outer</a></li>
                  <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Backpack">Backpack</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Glasses">Glasses</a></li>
                  <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Watch">Watch</a></li>
                  <li><a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Ring">Ring</a></li>
                </ul>
              </div>
              <div class="col-md-6 col-lg-4">
                <ul class="list-unstyled">
                  <li><a href="${pageContext.request.contextPath }/home.jsp">Home</a></li>
                  <li><a href="${pageContext.request.contextPath }/ReviewListAction.do?pageNum=1">Review</a></li>
                  <li><a href="${pageContext.request.contextPath }/about.jsp">About</a></li>
                  <li><a href="${pageContext.request.contextPath }/QnAListAction.no?qpageNum=1">Q & A</a>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
            <h3 class="footer-heading mb-4">Promo</h3>
            <a href="${pageContext.request.contextPath }/product/product.jsp?p_id=A1009&p_filename=A1009.jpg" class="block-6">
              <img src="${pageContext.request.contextPath }/images/A1009.jpg" alt="Image placeholder" class="img-fluid rounded mb-4">
              <h3 class="font-weight-light  mb-0">Mens Wool Cardigan Jacket</h3>
              <p>Promo from July 28 &mdash; Aug 4, 2020</p>
            </a>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="block-5 mb-5">
              <h3 class="footer-heading mb-4">Contact Info</h3>
              <ul class="list-unstyled">
                <li class="address">7-7 Teheran St. Esco Building, Gangnam, Seoul, Korea</li>
                <li class="phone"><a href="tel://82025611911">+82 02 561 1911</a></li>
                <li class="email">h-1-y @ naver.com</li>
              </ul>
            </div>
            
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
             <p>
            Copyright &copy;All rights reserved | This Semi-Project is made by Class3 Team2</a>
            </p>
          </div>
          
        </div>
      </div>
    </footer>

  </body>
</html>