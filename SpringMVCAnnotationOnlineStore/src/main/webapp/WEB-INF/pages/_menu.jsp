<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>   

<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%> 

 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="container">
			<div class="navbar-translate">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/">Junction Jewelers</a>
	            <button class="navbar-toggler navbar-toggler-right navbar-burger" type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-bar"></span>
					<span class="navbar-toggler-bar"></span>
					<span class="navbar-toggler-bar"></span>
	            </button>
			</div>
	        <div class="collapse navbar-collapse" id="navbarToggler">
	            <ul class="navbar-nav ml-auto">
					<li class="nav-item">
	                    <a href="${pageContext.request.contextPath}/shoppingCart" class="nav-link"><i class="nc-icon nc-cart-simple"></i>Shopping Cart</a>
	                </li>
	                
	                <c:if test="${pageContext.request.userPrincipal.name != null}">
			        <li class="nav-item">
	                    <a href="${pageContext.request.contextPath}/accountInfo" target="_blank" class="nav-link"><i class="nc-icon nc-single-02"></i>Hello ${pageContext.request.userPrincipal.name}</a>
	                	<a href="${pageContext.request.contextPath}/logout">Logout</a>
	                </li>
			 
			        </c:if>
			        <li class="nav-item">
			        <c:if test="${pageContext.request.userPrincipal.name == null}">
			            <a href="${pageContext.request.contextPath}/login"class="nav-link"><i class="nc-icon nc-single-02"></i>Login</a>
			        </c:if>
	                </li>
	                
					<li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Follow us on Twitter" data-placement="bottom" href="https://twitter.com/CreativeTim" target="_blank">
                            <i class="fa fa-twitter" style="color:white;"></i>
                            <p class="d-lg-none">Twitter</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Like us on Facebook" data-placement="bottom" href="https://www.facebook.com/" target="_blank">
                            <i class="fa fa-facebook-square" style="color:white;"></i>
                            <p class="d-lg-none">Facebook</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Follow us on Instagram" data-placement="bottom" href="https://www.instagram.com/" target="_blank">
                            <i class="fa fa-instagram" style="color:white;"></i>
                            <p class="d-lg-none">Instagram</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" rel="tooltip" title="Star on GitHub" data-placement="bottom" href="https://github.com/CooperStansbury/CIS556_Project" target="_blank">
                            <i class="fa fa-github" style="color:white;"></i>
                            <p class="d-lg-none">GitHub</p>
                        </a>
                    </li>
	            </ul>
	        </div>
		</div>
    </nav>