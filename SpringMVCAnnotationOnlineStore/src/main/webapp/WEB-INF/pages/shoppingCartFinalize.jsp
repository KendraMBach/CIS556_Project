<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Purchase Receipt</title>

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
   
 
  
   <div class="container">
       <h1 class="text-center text-info">Thank you for shopping Junction Jewelers!</h1>
       <hr>
       <p class="text-center" style="font-size:20px; margin:35px">Your order number is: <b class="text-info"><u> ${lastOrderedCart.orderNum} </u></b> </p>
       <p class="text-center" style="font-size:20px; margin:35px">You will be receiving an emailed receipt shortly.</p>
       <hr>
       <div class="container col-xs-4 text-center"">
       	<a href="${pageContext.request.contextPath}/productList" class="btn btn-info btn-round" style="margin:10px">Shop</a>
       	<a href="${pageContext.request.contextPath}/" class="btn btn-default btn-round" style="margin:10px">Home</a>
       </div>
   </div>
 
   
 </main>
 <div id="stay">
 	<jsp:include page="_footer.jsp" />
 	</div>
</body>
</html>