<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Login</title>
 
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

</head>

<jsp:include page="_menu.jsp" /> 
 <body>
   
    <div class="wrapper">
        <div class="page-header" style="background-image: url('${pageContext.request.contextPath}/resources/img/login-image.jpg');">
            <div class="filter"></div>
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 ml-auto mr-auto">
                            <div class="card card-register">
                                <h3 class="title">Sign Up!</h3>
								<div class="social-line text-center">
                                    <a href="#pablo" class="btn btn-neutral btn-facebook btn-just-icon">
                                        <i class="fa fa-facebook-square"></i>
                                    </a>
                                    <a href="#pablo" class="btn btn-neutral btn-google btn-just-icon">
                                        <i class="fa fa-google-plus"></i>
                                    </a>
									<a href="#pablo" class="btn btn-neutral btn-twitter btn-just-icon">
										<i class="fa fa-twitter"></i>
									</a>
                                </div>
                                 <form:form id="regForm" modelAttribute="newUserForm" action="register" method="post"> 
                                	
                                    <form:input path="firstName" name="firstName" id="firstName" type="text" class="form-control" placeholder="First Name"/>
                                
                                	
                                    <form:input path="lastName" name="lastName" id="lastName" type="text" class="form-control" placeholder="Last Name"/>
                                    
                                    <hr>
                                    <form:input path="phone" name="phone" id="phone" type="text" class="form-control" placeholder="Phone"/>
                                    
                                    
                                    <form:input path="address" name="address" id="address" type="text" class="form-control" placeholder="Address"/>
                                    
                                    
                                    <form:input path="city" name="city" id="city" type="text" class="form-control" placeholder="City"/>
                                    
                                    
                                    <form:select path="state" name="state" id="state" class="form-control" placeholder="State">
                                    	<form:option value="NONE" label="--- State ---" />
                                    	<c:forEach items="${states}" var="state" varStatus="varStatus">
								    		<form:option value="${state.state}" items="${state.state}" />
								    	</c:forEach>
									</form:select>
                                    
                                    
                                    <form:input path="zip" name="zip" id="zip" type="text" class="form-control" placeholder="Zip"/>
                                
                                    <hr>
                                    <form:input path="email" name="email" id="email" type="text" class="form-control" placeholder="Email"/>
                                    
                                    
                                    <form:input path="password" name="password" id="password" type="password" class="form-control" placeholder="Password"/>
                                    <form:button id="register" name="register" class="btn btn-danger btn-block btn-round">Register</form:button>
                                  </form:form>
                                <div class="forgot">
                                	<c:if test= "${not empty error }">
                                		<span class="label label-danger">${error }</span>
                                	</c:if>
                                    <a href="${pageContext.request.contextPath}/login" class="btn btn-link btn-danger">Already A User?</a>
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="footer register-footer text-center">
						<h6>&copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by Weatherman Underground</h6>
					</div>
                </div>
                </br>
    </br>
        </div>
        
    </div>
    
  <jsp:include page="_footer.jsp" />   
</body>
 