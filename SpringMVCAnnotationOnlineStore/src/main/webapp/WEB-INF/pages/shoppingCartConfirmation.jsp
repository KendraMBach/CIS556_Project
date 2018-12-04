<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Purchase Confirmation</title>

<link href="${pageContext.request.contextPath}/resources/css/paper-kit.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/nucleo-icons.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/demo.css" rel="stylesheet" >

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
 
 <main style="padding:100px">

  <fmt:setLocale value="en_US" scope="session"/>
 
 
 
   <table class="table table-striped table-light">
   <tr>
   		<th>CUSTOMER INFO</th>
   		<th></th>
   		<th></th>
   		<th></th>
   		<th></th>
   		<th></th>
   		<th></th>
   		<th></th>
   	</tr>
      <tr>
          <th>Name:</th>
          	<td>${myCart.customerInfo.firstName} ${myCart.customerInfo.lastName}</<td>
          <th>Email:</th>
          	<td>${myCart.customerInfo.email}</td>
          <th>Phone:</th>
          	<td>${myCart.customerInfo.phone}</td>
          <th></th>
          <td></td>
     </tr>
     <tr>
          <th>Address:</th>
          	<td>${myCart.customerInfo.address}</td>
          <th>City:</th>
          	<td>${myCart.customerInfo.city}</td>
          <th>State:</th>
          	<td>${myCart.customerInfo.state}</<td>
          <th>Zip Code:</th>
          <td>${myCart.customerInfo.zip}</td>
      </tr>
     </table>

     <table class="table table-striped table-light">
     
      <tr>
      	<th>CART SUMMARY</th>
      	<th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
        <th></th>
         
      	</tr>
      <tr>
          <th>Quantity:</th>
          <td>${myCart.quantityTotal}</td>
          <th>Shipping Total:</th>
          <td><fmt:formatNumber value="${shipping}" type="currency"/></td>
          <th>Total: </th>
          <td>
          <span class="total">
            <fmt:formatNumber value="${total}" type="currency"/>
          </span>
          </td>
      </tr>
      <hr>
  </table>
 
  <table class="table table-striped table-light">
  <hr>
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
 
      <c:forEach items="${myCart.cartLines}" var="cartLineInfo">
      
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
              		
                  	${cartLineInfo.quantity}
                  
              </td>
              <td class="td-number">
                  <fmt:formatNumber value="${cartLineInfo.amount}" type="currency"/>
              </td>
              <td>
                  
                      
              </td>
          </tr>
          <tr>
          	<th class="th-description">Options:</th>
          
          	<td><c:if test="${not empty cartLineInfo.productInfo.engraving}">Engraving: "${cartLineInfo.productInfo.engraving}"  <fmt:formatNumber value="0" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.birthstoneSelected}">Birthstone: ${cartLineInfo.productInfo.birthstoneSelected.month}  <fmt:formatNumber value="${cartLineInfo.productInfo.birthstoneSelected.cost}" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.charmSelected1}">Charm: ${cartLineInfo.productInfo.charmSelected1.type}  <fmt:formatNumber value="${cartLineInfo.productInfo.charmSelected1.cost}" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.charmSelected2}">Charm: ${cartLineInfo.productInfo.charmSelected2.type}  <fmt:formatNumber value="${cartLineInfo.productInfo.charmSelected2.cost}" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.charmSelected3}">Charm: ${cartLineInfo.productInfo.charmSelected3.type}  <fmt:formatNumber value="${cartLineInfo.productInfo.charmSelected3.cost}" type="currency"/></c:if></td>
          	
          	
          	<td><c:if test="${not empty cartLineInfo.productInfo.charmSelected4}">Charm: ${cartLineInfo.productInfo.charmSelected4.type}  <fmt:formatNumber value="${cartLineInfo.productInfo.charmSelected4.cost}" type="currency"/></c:if></td>
          	
          	<td></td>
          	
          </tr>
      
      </c:forEach>
 	<tr>
 		<td></td>
 		<td></td>
 		<td></td>
 		<td></td>
 		<td></td>
 		
 		<td>
 		<a class="navi-item"
          href="${pageContext.request.contextPath}/shoppingCart">Edit Cart</a>
          </td>
        <td>
        	<form method="post" action="${pageContext.request.contextPath}/shoppingCartConfirmation">
      			<input type="submit" value="Send" class="button-send-sc" />
      		</form>
        </td>
 	</tr>
  </table>
  
 </main>
</body>
<div id="stay">
  <jsp:include page="_footer.jsp" />
  </div>
</html>