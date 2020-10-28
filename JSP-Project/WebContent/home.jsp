<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shoppers &mdash; Colorlib e-Commerce Template</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="fonts/icomoon/style.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/style.css">  
  </head>
  <body>
  
  <div class="site-wrap">
   <jsp:include page="menu.jsp"/>

    <div class="site-blocks-cover" style="background-image: url(images/BigWatch.jpg);" data-aos="fade">
      <div class="container">
        <div class="row align-items-start align-items-md-center justify-content-end">
          <div class="col-md-5 text-center text-md-left pt-5 pt-md-0">
            <h1 class="mb-2">Gorgeous Watch For Gentleman</h1>
            <div class="intro-text text-center text-md-left">
              <p class="mb-4">Branded Watches For All Gentlemen From Choongang.</p>
              <p>
                <a href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Watch" class="btn btn-sm btn-primary">Shop Now</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="site-section site-section-sm site-blocks-1">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="">
            <div class="icon mr-4 align-self-start">
              <span class="icon-truck"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Non-Free Shipping</h2>
              <p>Chakbull or Sunbull 2500Won. Islands and Mountain might require another 2000Won. </p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="100">
            <div class="icon mr-4 align-self-start">
              <span class="icon-refresh2"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Non-Free Returns</h2>
              <p>Without valid reasons, Return Fee will be required to Buyer. </p>
            </div>
          </div>
          <div class="col-md-6 col-lg-4 d-lg-flex mb-4 mb-lg-0 pl-4" data-aos="fade-up" data-aos-delay="200">
            <div class="icon mr-4 align-self-start">
              <span class="icon-help"></span>
            </div>
            <div class="text">
              <h2 class="text-uppercase">Customer Support</h2>
              <p>Maybe you can get answers in few days. Good Luck.</p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section site-blocks-2">
      <div class="container">
        <div class="row">
          <div class="col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0" data-aos="fade" data-aos-delay="">
            <a class="block-2-item" href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Outer">
              <figure class="image">
                <img src="${pageContext.request.contextPath }/images/A1001.jpg" alt="" class="img-fluid">
              </figure>
              <div class="text">
                <span class="text-uppercase">Collections</span>
                <h3>Outer</h3>
              </div>
            </a>
          </div>
          <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="100">
            <a class="block-2-item" href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Watch">
              <figure class="image">
                <img src="${pageContext.request.contextPath }/images/A1006.jpg" alt="" class="img-fluid">
              </figure>
              <div class="text">
                <span class="text-uppercase">Collections</span>
                <h3>Watch</h3>
              </div>
            </a>
          </div>
          <div class="col-sm-6 col-md-6 col-lg-4 mb-5 mb-lg-0" data-aos="fade" data-aos-delay="200">
            <a class="block-2-item" href="${pageContext.request.contextPath }/product/productCategory.jsp?category=Ring">
              <figure class="image">
                <img src="${pageContext.request.contextPath }/images/A1020.jpg" alt="" class="img-fluid">
              </figure>
              <div class="text">
                <span class="text-uppercase">Collections</span>
                <h3>Ring</h3>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>

    <div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>Featured Products</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel">
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="${pageContext.request.contextPath }/images/A1015.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="${pageContext.request.contextPath }/product/product.jsp?p_id=A1015&p_filename=A1015.jpg">Dior Glasses</a></h3>
                    <p class="mb-0">Dior 0215F Glasses TSJ Safilo Korea</p>
                    <p class="text-primary font-weight-bold">$650</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="${pageContext.request.contextPath }/images/A1014.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="${pageContext.request.contextPath }/product/product.jsp?p_id=A1014&p_filename=A1014.jpg">Moncler Backpack</a></h3>
                    <p class="mb-0">Genius Fragment 0061200 Mens Backpack</p>
                    <p class="text-primary font-weight-bold">$730</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="${pageContext.request.contextPath }/images/A1022.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="${pageContext.request.contextPath }/product/product.jsp?p_id=A1022&p_filename=A1022.jpg">JEstina Rings</a></h3>
                    <p class="mb-0">JEstina Mariebel 14k Rings</p>
                    <p class="text-primary font-weight-bold">$720</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="${pageContext.request.contextPath }/images/A1010.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="${pageContext.request.contextPath }/product/product.jsp?p_id=A1010&p_filename=A1010.jpg">Neil Barret Coat</a></h3>
                    <p class="mb-0">2383 Mens Slim-Fit Coat</p>
                    <p class="text-primary font-weight-bold">$1900</p>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="block-4 text-center">
                  <figure class="block-4-image">
                    <img src="${pageContext.request.contextPath }/images/A1003.jpg" alt="Image placeholder" class="img-fluid">
                  </figure>
                  <div class="block-4-text p-4">
                    <h3><a href="${pageContext.request.contextPath }/product/product.jsp?p_id=A1003&p_filename=A1003.jpg">Tag Heuer Watch</a></h3>
                    <p class="mb-0">Aquaracer Mens Metal Watch</p>
                    <p class="text-primary font-weight-bold">$4400</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="footer.jsp"/>
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