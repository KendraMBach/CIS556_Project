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

<title>Product</title>
 
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

<style>
      @font-face { font-family: Otama-ep; src: url('${pageContext.request.contextPath}/resources/fonts/Otama-ep.otf'); } 
      
      h1 {
         font-family: Otama-ep;
         
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
	
    
}
</style>

</head>
<jsp:include page="_menu.jsp" />
<body>
<main style="padding:100px;">
 
  
   <fmt:setLocale value="en_US" scope="session"/>
  
  <div class="container">

      <div class="row">
        <!-- /.col-lg-3 -->


    <!-- Page Content -->

        <div class="col-lg-3">
        
		<form:form method="POST" action="${pageContext.request.contextPath}/productList">
          <h1 class="my-4">Junction Jewelers</h1>
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
            <button type="submit" name="filter" value="necklace" class="btn btn-info">Most popular</button>
            </br>
            <button type="submit" name="filter" value="earrings" class="btn btn-info">Earrings</button>
            </br>
            <button type="submit" name="filter" value="necklace" class="btn btn-info">Necklaces</button>
            </br>
            <button type="submit" name="filter" value="set" class="btn btn-info">Sets</button>
            </br>
            <button type="submit" name="filter" value="everyday" class="btn btn-info">Everyday Jewelry</button>

          </div>
		</form:form>
        </div>     
    	<div class="col-lg-9">

          <div class="card mt-4">
          
            <img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/resources/img/jewelryImages/${productForm.fileData}" style="max-height: 400px; max-width: 400px; display: block; margin: 0 auto;"  alt="">
           <div id="line"><hr /></div>
            <div class="card-body">
              <h3 class="card-title" style="font-weight: bold;">${productForm.name}</h3>
              </br>
              <h5>Price: <fmt:formatNumber value="${productForm.price}" type="currency"/></h5>
              <p class="card-text">${productForm.description}</p>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
              <form:form modelAttribute="productForm" method="POST" enctype="multipart/form-data">
              </br>
              <a href="${pageContext.request.contextPath}/buyProduct?code=${productForm.code}" class="btn btn-info">Add to Cart</a>
            </form:form>
            </div>
          </div>
          <!-- /.card -->

          <div class="card card-outline-secondary my-4">
            <div class="card-header">
              Product Reviews
            </div>
            <div class="card-body">
              <p>Love it!</p>
              <small class="text-muted">Posted by Anonymous on 11/5/18</small>
              <hr>
              <p>Great addition to my jewelry collection.</p>
              <small class="text-muted">Posted by Anonymous on 10/18/18</small>
              <hr>
              <p>Quality was just meh, but it looks cute with my sweater.</p>
              <small class="text-muted">Posted by Anonymous on 10/02/17</small>
              <hr>
              </div>
            </div>
          </div>
          <!-- /.card -->

       
        
        <!-- /.col-lg-9 -->
	
    </div>
    </div>
    </div>
    
    <!-- /.container -->

    <!-- Footer -->
    
<!--  
  
   <c:if test="${not empty errorMessage }">
     <div class="error-message">
         ${errorMessage}
     </div>
   </c:if>
 
   <form:form modelAttribute="productForm" method="POST" enctype="multipart/form-data">
       <table style="text-align:left;">
           <tr>
               <td>Code *</td>
               <td style="color:red;">
                  <c:if test="${not empty productForm.code}">
                       <form:hidden path="code"/>
                       ${productForm.code}
                  </c:if>
                  <c:if test="${empty productForm.code}">
                       <form:input path="code" />
                       <form:hidden path="newProduct" />
                  </c:if>
               </td>
               <td><form:errors path="code" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Name *</td>
               <td><form:input path="name" /></td>
               <td><form:errors path="name" class="error-message" /></td>
           </tr>
 
           <tr>
               <td>Price *</td>
               <td><form:input path="price" /></td>
               <td><form:errors path="price" class="error-message" /></td>
           </tr>
           <tr>
               <td>Image</td>
               <td>
               <img src="${pageContext.request.contextPath}/productImage?code=${productForm.code}" width="100"/></td>
               <td> </td>
           </tr>
           <tr>
               <td>Upload Image</td>
               <td><form:input type="file" path="fileData"/></td>
               <td> </td>
           </tr>
 
 
           <tr>
               <td>&nbsp;</td>
               <td><input type="submit" value="Submit" /> <input type="reset"
                   value="Reset" /></td>
           </tr>
       </table>
   </form:form>
 
 
 -->
 
 
 </main>  
 <jsp:include page="_footer.jsp" />
</body>



</html>