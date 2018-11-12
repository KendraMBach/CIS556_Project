<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
 
<title>Online Jewelry Store</title>
 
<link href="${pageContext.request.contextPath}/resources/css/paper-kit.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/nucleo-icons.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/demo.css" rel="stylesheet" >

<!-- Core JS Files -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui-1.12.1.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!--  Paper Kit Initialization snd functons -->
<script src="${pageContext.request.contextPath}/resources/js/paper-kit.js?v=2.1.0"></script>

 
</head>
<jsp:include page="_menu.jsp" />
<body>
 

		<div class="page-header" data-parallax="true" style="background-image: url('${pageContext.request.contextPath}/resources/img/daniel-olahh.jpg');">
			<div class="filter"></div>
			<div class="container">
			    <div class="motto text-center">
			        <h1>Junction Jewelers</h1>
			        <h3>Just Buy It.</h3>
			        <br />
			        <a href="${pageContext.request.contextPath}/productList" class="btn btn-outline-neutral btn-round"><i class="fa fa-play"></i>Shop</a>
			        <button type="button" class="btn btn-outline-neutral btn-round">Do Something</button>
			    </div>
			</div>
    	</div>
 <div class="main">
			<div class="section text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 ml-auto mr-auto">
                        <h2 class="title">The Finest of Jewelry</h2>
                        <h5 class="description">You'll probably like it.</h5>
                        <br>
                        <a href="#paper-kit" class="btn btn-danger btn-round">See Details</a>
                    </div>
                </div>
				<br/><br/>
				<div class="row">
					<div class="col-md-3">
						<div class="info">
							<div class="icon icon-danger">
								<i class="nc-icon nc-album-2"></i>
							</div>
							<div class="description">
								<h4 class="info-title">The latest and greatest</h4>
								<p class="description">All that you want for double the price.</p>
								<a href="#pkp" class="btn btn-link btn-danger">See more</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="info">
							<div class="icon icon-danger">
								<i class="nc-icon nc-bulb-63"></i>
							</div>
							<div class="description">
								<h4 class="info-title">New pieces for everyone</h4>
								<p>Trust me, it's not worth the price.</p>
								<a href="#pkp" class="btn btn-link btn-danger">See more</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="info">
							<div class="icon icon-danger">
								<i class="nc-icon nc-chart-bar-32"></i>
							</div>
							<div class="description">
								<h4 class="info-title">For Mother</h4>
								<p>Choose from a variety of colors and designs.</p>
								<a href="#pkp" class="btn btn-link btn-danger">See more</a>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="info">
							<div class="icon icon-danger">
								<i class="nc-icon nc-sun-fog-29"></i>
							</div>
							<div class="description">
								<h4 class="info-title">For Grandmother</h4>
								<p>Rad stuff for your rad g-ma.</p>
								<a href="#pkp" class="btn btn-link btn-danger">See more</a>
							</div>
						</div>
					</div>
				</div>

            </div>
        </div>

		<div class="section section-dark text-center">
            <div class="container">
                <h2 class="title">Let's talk about us</h2>
				<div class="row">
    				<div class="col-md-4">
                        <div class="card card-profile card-plain">
                            <div class="card-avatar">
                                <a href="#avatar"><img src="${pageContext.request.contextPath}/resources/img/faces/clem-onojeghuo-3.jpg" alt="..."></a>
                            </div>
                            <div class="card-body">
                                <a href="#paper-kit">
                                    <div class="author">
                                        <h4 class="card-title">Mark</h4>
                                        <h6 class="card-category">Product Manager/Techie</h6>
                                    </div>
                                </a>
                                <p class="card-description text-center">
                                Insert cool quote here.
                                </p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-twitter"></i></a>
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-google-plus"></i></a>
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
    				</div>

    				<div class="col-md-4">
                        <div class="card card-profile card-plain">
                            <div class="card-avatar">
                                <a href="#avatar"><img src="${pageContext.request.contextPath}/resources/img/faces/joe-gardner-2.jpg" alt="..."></a>
                            </div>
                            <div class="card-body">
                                <a href="#paper-kit">
                                    <div class="author">
                                        <h4 class="card-title">Kendra</h4>
                                        <h6 class="card-category">Techie</h6>
                                    </div>
                                </a>
                                <p class="card-description text-center">
                                I'll insert something great here someday.
                                </p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-twitter"></i></a>
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-google-plus"></i></a>
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
    				</div>

    				<div class="col-md-4">
                        <div class="card card-profile card-plain">
                            <div class="card-avatar">
                                <a href="#avatar"><img src="${pageContext.request.contextPath}/resources/img/faces/erik-lucatero-2.jpg" alt="..."></a>
                            </div>
                            <div class="card-body">
                                <a href="#paper-kit">
                                    <div class="author">
                                        <h4 class="card-title">Cooper</h4>
                                        <h6 class="card-category">Project Manager/Techie</h6>
                                    </div>
                                </a>
                                <p class="card-description text-center">
                                Imagine that this is another cool quote.
                                </p>
                            </div>
                            <div class="card-footer text-center">
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-twitter"></i></a>
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-google-plus"></i></a>
                                <a href="#pablo" class="btn btn-link btn-just-icon btn-neutral"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
    				</div>
    			</div>
        	</div>
    	</div>

            <div class="section landing-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 ml-auto mr-auto">
                            <h2 class="text-center">Keep in touch?</h2>
                            <form class="contact-form">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label>Name</label>
										<div class="input-group">
	                                        <span class="input-group-addon">
	                                            <i class="nc-icon nc-single-02"></i>
	                                        </span>
	                                        <input type="text" class="form-control" placeholder="Name">
	                                    </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Email</label>
										<div class="input-group">
											<span class="input-group-addon">
												<i class="nc-icon nc-email-85"></i>
											</span>
											<input type="text" class="form-control" placeholder="Email">
										</div>
                                    </div>
                                </div>
                                <label>Message</label>
                                <textarea class="form-control" rows="4" placeholder="Tell us your thoughts and feelings..."></textarea>
                                <div class="row">
                                    <div class="col-md-4 ml-auto mr-auto">
                                        <button class="btn btn-danger btn-lg btn-fill">Send Message</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
 
   <div class="page-title">Shopping Cart Demo</div>
  <button type="button" class="btn btn-outline-default btn-round" data-toggle="modal" data-target="#myModal">
    Launch demo modal
	</button>
	<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title text-center" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"> 
            <h3>Demo content</h3>
  
				   <ul>
				      <li>Buy online</li>
				      <li>Admin pages</li>
				      <li>Reports</li>
				   </ul>
				   </div>
  
            </div>
            <div class="modal-footer">
                <div class="left-side">
                    <button type="button" class="btn btn-default btn-link" data-dismiss="modal">Never mind</button>
                </div>
                <div class="divider"></div>
                <div class="right-side">
                    <button type="button" class="btn btn-danger btn-link">Delete</button>
                </div>
            </div>
        </div>
    </div>
</div>

  
  
   <jsp:include page="_footer.jsp" />
 
</body>
</html>