<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<div class="page-header">
 
    <div class="site-name">Online Shop</div>
    

<div class="page-header" data-parallax="true" style="background-image: url('../assets/img/daniel-olahh.jpg');">
			<div class="filter"></div>
			<div class="container">
			    <div class="motto text-center">
			    <c:if test="${pageContext.request.userPrincipal.name != null}">
			        Hello
			           <a href="${pageContext.request.contextPath}/accountInfo">
			                ${pageContext.request.userPrincipal.name} </a>
			         &nbsp;|&nbsp;
			           <a href="${pageContext.request.contextPath}/logout">Logout</a>
			 
			        </c:if>
			        <c:if test="${pageContext.request.userPrincipal.name == null}">
			            <a href="${pageContext.request.contextPath}/login">Login</a>
			        </c:if>
			        <h1>Example page</h1>
			        <h3>Start designing your landing page here.</h3>
			        <br />
			        <a href="https://www.youtube.com/watch?v=dQw4w9WgXcQ" class="btn btn-outline-neutral btn-round"><i class="fa fa-play"></i>Watch video</a>
			        <button type="button" class="btn btn-outline-neutral btn-round">Download</button>
			    </div>
			</div>
    	</div>
        