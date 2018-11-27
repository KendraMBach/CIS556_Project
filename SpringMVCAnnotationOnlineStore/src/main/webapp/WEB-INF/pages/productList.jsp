<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
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
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,300,700' rel='stylesheet' type='text/css'>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">

<style>
      
      
      h1 {

	     -webkit-animation-name: fade_in; /* Safari 4.0 - 8.0 */
	     -webkit-animation-duration: 4s; /* Safari 4.0 - 8.0 */
	     animation-name: fade_in;
	     animation-duration: 4s;
      }
      
	
	/* Safari 4.0 - 8.0 */
	@-webkit-keyframes fade_in {
	    from {opacity: 0;}
	    to {opacity: 1;}
	}
	
	/* Standard syntax */
	@keyframes fade_in {
	    from {opacity: 0;}
	    to {opacity: 1;}
	}
</style>

</head>
<jsp:include page="_menu.jsp" />
<body>
<main style="padding:100px;">
 
  
   <fmt:setLocale value="en_US" scope="session"/>
   
   <input type="hidden" id="filter" name="filter" value="${filter}">
   <input type="hidden" id="paginationProducts" name="paginationProducts" value="${paginationProducts}">
   


    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
        
		<form:form method="POST" action="${pageContext.request.contextPath}/productList">
          <h1 class="card-title" style="font-weight: bold;">Junction Jewelers</h1>
          <div class="list-group">
			    <button class="btn btn-info dropdown-toggle" data-toggle="dropdown">Bracelets</button>
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			        <li class="dropdown-header">Bracelet Types</li>
			        <button type="submit" name="filter" value="bracelet,all" class="btn dropdown-item">All Bracelets</button>
			        <div class="dropdown-divider"></div>
			        <button type="submit" name="filter" value="bracelet,mother's bracelet" class="btn dropdown-item">Mother's Bracelets</button>
            		<div class="dropdown-divider"></div>
            		<button type="submit" name="filter" value="bracelet,christening bracelet" class="btn dropdown-item">Baby Bracelets</button>
            		<div class="dropdown-divider"></div>
            		<button type="submit" name="filter" value="bracelet,grandmother's bracelet" class="btn dropdown-item">Grandmother's Bracelets</button>
			        
			    </ul>
            </br>
            <button type="submit" name="filter" value="ring" class="btn btn-info">Wedding Rings</button>
            </br>
            <button type="submit" name="filter" value="popular" class="btn btn-info">Most popular</button>
            </br>
            <button type="submit" name="filter" value="earrings" class="btn btn-info">Earrings</button>
            </br>
            <button type="submit" name="filter" value="necklace" class="btn btn-info">Necklaces</button>
            </br>
            <button type="submit" name="filter" value="set" class="btn btn-info">Sets</button>
            </br>
            <button type="submit" name="filter" value="everyday" class="btn btn-info">Everyday Jewelry</button>

          </div>
          </br>
           <!-- Search form -->
           </form:form>
           <form:form method="GET" action="${pageContext.request.contextPath}/productSearch">
		<div class="col-md-12">
        <div class="form-group">
        <div class="row">
        
            <input type="text" name="likeName" class="form-control" placeholder="Search">
            <div class="col"></div>
        	<div class="col"></div>
        	
            <button type="submit" class="btn btn-info" style="margin-top:10px">Go</button>
        </div>    
        </div>
		</form:form>
		
		
		
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
                <a href="${pageContext.request.contextPath}/product?code=${prodInfo.code}"><img class="card-img-top" src="${pageContext.request.contextPath}/resources/img/jewelryImages/${prodInfo.fileData}" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="${pageContext.request.contextPath}/product?code=${prodInfo.code}">${prodInfo.name}</a>
                  </h4>
                  <hr>
                  <p><font size=+1>Color: ${prodInfo.color}</font></p>
                  </br>
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
                <a href="productList?page=${page}&filter=${filter}" class="nav-item">${page}</a>
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

	</main>
   <jsp:include page="_footer.jsp" />
 
</body>
</html>