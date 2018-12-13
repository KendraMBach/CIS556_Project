<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
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

<title>Shopping Cart</title>
 
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

<script type="text/javascript">
    $(window).on('load',function(){
        $('#myModal').modal('show');
    });
</script>

<style>
#stay {
	   position:absolute;
	   bottom:0;
	   width:100%;
	   height:60px;   /* Height of the footer */
	   background:#6cf;
	}

</style> 
 
</head>

<jsp:include page="_menu.jsp" />
<body>
<main style="margin:100px">
<div class="container">

	<div class="row">

	<div class="col-lg-12">

           
      <!-- If Cart is Empty -->
       <c:if test="${empty cartForm or empty cartForm.cartLines}">
       	<div class="row" id="modals">
						<div class="col-md-6">
							<!-- Button trigger modal -->
							<button type="button" style="display: none;" data-toggle="modal" data-target="#myModal">
							    
							</button>
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title text-center" id="exampleModalLabel">Empty Cart Alert</h5>
                                            <button onclick="${pageContext.request.contextPath}/" type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body"> 
                                        	Your shopping cart is empty! Let's do something about that.
                                        </div>
                                        <div class="modal-footer">
                                            <div class="left-side">
                                                <a href="${pageContext.request.contextPath}/productList" class="btn btn-info btn-link">Okay, cool</a>
                                            </div>
                                            <div class="divider"></div>
                                            <div class="right-side">
                                                <a href="${pageContext.request.contextPath}/" class="btn btn-default btn-link">Nah, I'm good</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
							</div>
							</div>
							</div>
			
		   <div class="container">
		       <h1 class="text-center text-info">There are no items in your cart!</h1>
		       <hr>
		       <p class="text-center" style="font-size:20px; margin:35px">Feel free to keep <b class="text-info"><u>shopping</u></b> and <b class="text-info"><u>spending</u></b>.</p>
		       <hr>
		       <div class="container col-xs-4 text-center"">
		       	<a href="${pageContext.request.contextPath}/productList" class="btn btn-info btn-round" style="margin:10px">Shop</a>
		       	<a href="${pageContext.request.contextPath}/" class="btn btn-default btn-round" style="margin:10px">Home</a>
		       </div>
		   </div>
	      
	       
	           
   		</c:if>
   		
   		<!-- If Cart is Not Empty -->
 <div class="table-responsive">
  <table class="table table-shopping">
   		
   		 <c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
   		 <thead>
          <tr>
              <th class="text-center"></th>
              <th>Product</th>
              <th class="th-description">Color</th>
              <th class="th-description">Size</th>
              <th class="text-center">Price</th>
              <th class="text-left">Qty</th>
              <th class="text-center">Amount</th>
              <th></th>
          </tr>
      	</thead>
   		 <tbody>
	       <form:form method="POST" modelAttribute="cartForm" action="${pageContext.request.contextPath}/shoppingCart">
 		
           <c:forEach items="${cartForm.cartLines}" var="cartLineInfo" varStatus="varStatus">
           <form:hidden path="cartLines[${varStatus.index}].productInfo.code" />
           <input type="hidden" id="price" value="${cartLineInfo.productInfo.price}">
           <input type="hidden" id="quantity" value="1"> <!-- Update to Quantity -->
           
          <tr>
              <td>
                  <div>
                      <img class="img-responsive img-thumbnail" src="${pageContext.request.contextPath}/resources/img/jewelryImages/${cartLineInfo.productInfo.fileData}" width="50px" height="50px" alt="...">
                  </div>
              </td>
              <td class="td-name">
                  <a href="${pageContext.request.contextPath}/product?code=${cartLineInfo.productInfo.code}">${cartLineInfo.productInfo.name}</a>
                  <br><small>by Junction Jewelers</small>
              </td>
              <td>
                 ${cartLineInfo.productInfo.color} 
              </td>
              <td>
                 ${cartLineInfo.productInfo.size}
              </td>
              <td class="td-number">
                  <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
              </td>
              <td class="td-number">
              		
                  	<form:input size="3" path="cartLines[${varStatus.index}].quantity" />
                  <div class="btn-group">
                      <button class="btn btn-info btn-sm" type="submit" value="Update Quantity">Update</button>
                  </div>
              </td>
              <td class="td-number">
                  <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
              </td>
              <td class="td-actions">
                  
                      <a href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
                      <i class="nc-icon nc-simple-remove"></i>
                      </a>
                  
              </td>
          </tr>
          <tr>
          	<td class="th-description">Options:</td>
          
          	<td><c:if test="${not empty cartLineInfo.productInfo.engraving}">Engraving: "${cartLineInfo.productInfo.engraving}"  <fmt:formatNumber value="0" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.birthstoneSelected}">Birthstone: ${cartLineInfo.productInfo.birthstoneSelected.month}  <fmt:formatNumber value="${cartLineInfo.productInfo.birthstoneSelected.cost}" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.charmSelected1}">Charm: ${cartLineInfo.productInfo.charmSelected1.type}  <fmt:formatNumber value="${cartLineInfo.productInfo.charmSelected1.cost}" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.charmSelected2}">Charm: ${cartLineInfo.productInfo.charmSelected2.type}  <fmt:formatNumber value="${cartLineInfo.productInfo.charmSelected2.cost}" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.charmSelected3}">Charm: ${cartLineInfo.productInfo.charmSelected3.type}  <fmt:formatNumber value="${cartLineInfo.productInfo.charmSelected3.cost}" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.charmSelected4}">Charm: ${cartLineInfo.productInfo.charmSelected4.type}  <fmt:formatNumber value="${cartLineInfo.productInfo.charmSelected4.cost}" type="currency"/></c:if></td>
          	
          	
          </tr>
          </c:forEach>
          </form:form>
          <tr>
	          <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
		      <td></td>
          	<td class="th-description">Total:</td>
          	<td class="th-description"><fmt:formatNumber value="${total}" type="currency"/></td>
          </tr>
      <tr>
      <td></td>
      <td></td>
      <td></td>
      
      <td><a class="navi-item" href="${pageContext.request.contextPath}/productList">Keep Shopping</a></td>
      <td>
      	<c:if test="${pageContext.request.userPrincipal.name == null}">
           <a class="navi-item"
               href="${pageContext.request.contextPath}/login">Login to Checkout</a>
           </c:if>
           <c:if test="${pageContext.request.userPrincipal.name != null}">
           <a class="navi-item" href="${pageContext.request.contextPath}/shoppingCartConfirmation">Checkout</a>
           </c:if>
               </td>
       
               <td>
          
               </td>
               <td></td>
               </tr>
               </tbody>
   </c:if>
  </table>
</div>
</div>
</div>




<!--  
   <jsp:include page="_header.jsp" />
  
   <jsp:include page="_menu.jsp" />
  
   <fmt:setLocale value="en_US" scope="session"/>
 
   <div class="page-title">My Cart</div>
 
   <c:if test="${empty cartForm or empty cartForm.cartLines}">
       <h2>There are no items in Cart</h2>
       <a href="${pageContext.request.contextPath}/productList">Show
           Product List</a>
   </c:if>
 
   <c:if test="${not empty cartForm and not empty cartForm.cartLines   }">
       <form:form method="POST" modelAttribute="cartForm"
           action="${pageContext.request.contextPath}/shoppingCart">
 
           <c:forEach items="${cartForm.cartLines}" var="cartLineInfo"
               varStatus="varStatus">
               <div class="product-preview-container">
                   <ul>
                       <li><img class="product-image"
                           src="${pageContext.request.contextPath}/productImage?code=${cartLineInfo.productInfo.code}" />
                       </li>
                       <li>Code: ${cartLineInfo.productInfo.code} <form:hidden
                               path="cartLines[${varStatus.index}].productInfo.code" />
 
                       </li>
                       <li>Name: ${cartLineInfo.productInfo.name}</li>
                       <li>Price: <span class="price">
                      
                         <fmt:formatNumber value="${cartLineInfo.productInfo.price}" type="currency"/>
                        
                       </span></li>
                       <li>Quantity: <form:input
                               path="cartLines[${varStatus.index}].quantity" /></li>
                       <li>Subtotal:
                         <span class="subtotal">
                        
                            <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
                      
                         </span>
                       </li>
                       <li><a
                           href="${pageContext.request.contextPath}/shoppingCartRemoveProduct?code=${cartLineInfo.productInfo.code}">
                               Delete </a></li>
                   </ul>
               </div>
           </c:forEach>
           <div style="clear: both"></div>
           <input class="button-update-sc" type="submit" value="Update Quantity" />
           <a class="navi-item"
               href="${pageContext.request.contextPath}/shoppingCartCustomer">Enter
               Customer Info</a>
           <a class="navi-item"
               href="${pageContext.request.contextPath}/productList">Continue
               Buy</a>
       </form:form>
 
 
   </c:if>
 
 
  
 -->
 </div>
 </main>
 <div id="stay">
 <jsp:include page="_footer.jsp" />
 </div>
</body>
</html>