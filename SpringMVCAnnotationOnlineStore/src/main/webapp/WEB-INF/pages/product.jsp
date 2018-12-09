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
              </br>
              </br>
              
  <form:form modelAttribute="productForm" method="POST" action="buyProduct" enctype="multipart/form-data">
  <div>             
   	<div class="form-row">
    		
            <div class="mx-sm-3 mb-2 dropdown">
			    <form:select name="size" path="size" required="required" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			        Size
			        <b class="caret"></b>
			    
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton" style="z-index:1000">
			        <form:option value="" class="dropdown-header">Select Size</form:option>
			        
			        <c:forEach items="${sizes}" var="size">
				        <form:option value="${size}" class="dropdown-item">${size}</form:option>
				        <div class="dropdown-divider"></div>
			        </c:forEach>
			        
			    </ul>
			</form:select>
		</div>
		</div>
		</br>
		
		<div class="form-row" style="padding-right:350px">
		<c:if test="${engraving == 1}">
		<div class="mx-sm-3 mb-2 col">
			    <label>Engraving Option: </label>
		</div> 
		<div class="col"> 
			    <form:input path="engraving" name="engraving" id="engraving" type="text" class="form-control" placeholder="type engraving here"></form:input>

		</div>
		</c:if>
		</div>
		</br>
		<c:if test="${not empty birthstones}">
		<div class="form-row">
		<div class="mx-sm-3 mb-2 dropdown">
			    <form:select path="birthstone" name="birthstone" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			        Birthstone
			        <b class="caret"></b>
			  
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			        
			        <form:option disabled="disabled" selected="selected" value="0" class="dropdown-header">Select Birthstone</form:option>
			        
			        <c:forEach items="${birthstones}" var="stone">
				        <form:option name="birthstone" value="${stone.id}" class="dropdown-item">${stone.month}</form:option>
				        <div class="dropdown-divider"></div>
			        </c:forEach>
			    </ul>
			</form:select>
		</div>
		 </div>
		 
		</br> 
		 
		</c:if>
		<div class="form-row"> 
		<c:if test="${charm1 == 1}">
		<div class="mx-sm-3 mb-2 dropdown">
			    <form:select path="charm1" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			        Charm 1
			        
			    
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			        <form:option selected="selected" value="0" class="dropdown-header">Select Charm 1</form:option>
			        <c:forEach items="${charmList}" var="charm">
				        <form:option name="charm1" value="${charm.id}" class="dropdown-item">${charm.type} - <fmt:formatNumber value="${charm.cost}" type="currency"/></form:option>
				        <div class="dropdown-divider"></div>
			        </c:forEach>
			    </ul>
		</form:select>
		</div>
		</c:if>
		<c:if test="${charm2 == 1}">
		<div class="dropdown">
			    <form:select path="charm2" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			        Charm 2
			        
			    
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			        <form:option selected="selected" value="0" class="dropdown-header">Select Charm 2</form:option>
			        <c:forEach items="${charmList}" var="charm">
				        <form:option name="charm2" value="${charm.id}" class="dropdown-item">${charm.type} - <fmt:formatNumber value="${charm.cost}" type="currency"/></form:option>
				        <div class="dropdown-divider"></div>
			        </c:forEach>
			    </ul>
		</form:select>
		</div>
		</c:if>
		
		<c:if test="${charm3 == 1}">
		<div class="mx-sm-3 mb-2 dropdown">
			    <form:select path="charm3" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			        Charm 3
			        
			    
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			        <form:option selected="selected" value="0" class="dropdown-header">Select Charm 3</form:option>
			        <c:forEach items="${charmList}" var="charm">
				        <form:option name="charm3" value="${charm.id}" class="dropdown-item">${charm.type} - <fmt:formatNumber value="${charm.cost}" type="currency"/></form:option>
				        <div class="dropdown-divider"></div>
			        </c:forEach>
			    </ul>
		</form:select>
		
		</div>
		</c:if>
		
		<c:if test="${charm4 == 1}">
		<div class="mx-sm-3 mb-2 dropdown">
			    <form:select path="charm4" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			        Charm 4
			        
			    
			    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			        <form:option selected="selected" value="0" class="dropdown-header">Select Charm 4</form:option>
			        <c:forEach items="${charmList}" var="charm">
				        <form:option name="charm4" value="${charm.id}" class="dropdown-item">${charm.type} - <fmt:formatNumber value="${charm.cost}" type="currency"/></form:option>
				        <div class="dropdown-divider"></div>
			        </c:forEach>
			    </ul>
		</form:select>
		</div>
		
		</c:if>
		</div>
		<hr>
		<div class="form-group row">
			<div class="col" style="padding-top:20px;">
			<form:hidden path="code" id="code" name="code" value="${productForm.code}" />
			<form:hidden path="gender" id="gender" name="gender" value="${gender}" />
			
              <form:button id="buyProduct" name="buyProduct" class="btn btn-info">Add to Cart</form:button>
   				</div>
   				</div>
   			</div>
		</form:form>
            </div>
            
          </div>
          <!-- /.card -->

          <div class="card card-outline-secondary my-4" style="z-index:0">
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