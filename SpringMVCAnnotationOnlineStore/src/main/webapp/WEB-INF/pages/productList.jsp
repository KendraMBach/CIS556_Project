<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Product List</title>
 
<link href="${pageContext.request.contextPath}/resources/css/paper-kit.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/nucleo-icons.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/demo.css" rel="stylesheet" > 
<link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet" >

<!-- Core JS Files -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.12.1.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>


<!--  Paper Kit Initialization and functions -->
<script src="${pageContext.request.contextPath}/resources/js/paper-kit.js?v=2.1.0"></script>

</head>
<jsp:include page="_menu.jsp" />
<body style="padding:100px;">
 
  
   <fmt:setLocale value="en_US" scope="session"/>


    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
        

          <h1 class="my-4">Junction Jewelers</h1>
          <div class="list-group">
            <a href="#" class="list-group-item">Mother's Bracelets</a>
            <a href="#" class="list-group-item">Baby Bracelets</a>
            <a href="#" class="list-group-item">Grandmother's Bracelets</a>
            <a href="#" class="list-group-item">Wedding Bracelets</a>
            <a href="#" class="list-group-item">Most popular</a>
            <a href="#" class="list-group-item">Earrings</a>
            <a href="#" class="list-group-item">Necklaces</a>
            <a href="#" class="list-group-item">Sets</a>
            <a href="#" class="list-group-item">Everyday Jewelry</a>

          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resources/img/accessories.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resources/img/watch01.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resources/img/rose-ring.jpg" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>
<!--  
<c:forEach items="${paginationProducts.list}" var="prodInfo">
       <div class="product-preview-container">
           <ul>
               <li><img class="product-image"
                   src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" /></li>
               <li>Code: ${prodInfo.code}</li>
               <li>Name: ${prodInfo.name}</li>
               <li>Price: <fmt:formatNumber value="${prodInfo.price}" type="currency"/></li>
               <li><a
                   href="${pageContext.request.contextPath}/buyProduct?code=${prodInfo.code}">
                       Buy Now</a></li>
               For Manager edit Product 
               <security:authorize  access="hasRole('ROLE_MANAGER')">
                 <li><a style="color:red;"
                     href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">
                       Edit Product</a></li>
               </security:authorize>
           </ul>
       </div>
 
   </c:forEach>
   <br/>
-->
	
          <div class="row">
	<c:forEach items="${paginationProducts.list}" var="prodInfo">
            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/productImage?code=${prodInfo.code}" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">${prodInfo.name}</a>
                  </h4>
                  <h5>Price: <fmt:formatNumber value="${prodInfo.price}" type="currency"/></h5>
                  <p class="card-text"> </p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
              </div>
            </div>
			</c:forEach>
          </div>
          <!-- /.row -->

  <c:if test="${paginationProducts.totalPages > 1}">
       <div class="page-navigator">
          <c:forEach items="${paginationProducts.navigationPages}" var = "page">
              <c:if test="${page != -1 }">
                <a href="productList?page=${page}" class="nav-item">${page}</a>
              </c:if>
              <c:if test="${page == -1 }">
                <span class="nav-item"> ... </span>
              </c:if>
          </c:forEach>
          
       </div>
   </c:if>
        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Wundermen Underground</p>
      </div>
      <!-- /.container -->
    </footer>

   <jsp:include page="_footer.jsp" />
 
</body>
</html>