<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
<title>Reports</title>

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
   <!--<div class="page-title">Reports</div>
  
   <div class="account-container">-->

    <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
     url = "jdbc:mysql://localhost/jewlz"
     user = "root"  password = "YourStrong!Passw0rd"/>
    
    <sql:query dataSource = "${snapshot}" var = "monthlyResult">
      SELECT DISTINCT DATE_FORMAT(Order_Date, '%M %Y') AS Order_Month,
      DATE_FORMAT(Order_Date, '%Y%m') num_month
      from orders 
      where Order_Status = 'Complete'
      order by num_month
    </sql:query>

    <sql:query dataSource = "${snapshot}" var = "yearlyResult">
      SELECT DISTINCT DATE_FORMAT(Order_Date, '%Y') AS Order_Year
      from orders 
      where Order_Status = 'Complete'
      order by Order_Year
    </sql:query>

     <h5>Monthly Sales</h5>
     <form action="reportRendering" id="monthForm">
     First Month: 
     <select form="monthForm" name="month1">
        <c:forEach var = "row" items = "${monthlyResult.rows}">  
            <option><c:out value = "${row.Order_Month}"/></option>
        </c:forEach>
     </select>
     Last Month:
     <select form="monthForm" name="month2">
        <c:forEach var = "row" items = "${monthlyResult.rows}">
            <option><c:out value = "${row.Order_Month}"/></option>
        </c:forEach>
     </select>
     <input type="hidden" name="type" value="monthlySales">
     <input type="submit" value="Generate">
     </form>
     <br>    

     <h5>Yearly Sales</h5>
     <form action="reportRendering" id="yearForm">
     First Year:
     <select form="yearForm" name="year1">
        <c:forEach var = "row" items = "${yearlyResult.rows}">
            <option><c:out value = "${row.Order_Year}"/></option>
        </c:forEach>
     </select>
     Last Year:
     <select form="yearForm" name="year2">
        <c:forEach var = "row" items = "${yearlyResult.rows}">
            <option><c:out value = "${row.Order_Year}"/></option>
        </c:forEach>
     </select>
     <input type="hidden" name="type" value="yearlySales">
     <input type="submit" value="Generate">
     </form>
     <br>     

     <h5>Inventory Report</h5>
     <form action="reportRendering" id="form3">
     <!--Product ID: <input type="text" name="productID">-->
     <input type="hidden" name="type" value="inventoryLevels">
     <input type="submit" value="Generate">
     </form>
     <br>

     <h5>Customer List</h5>
     <form action="reportRendering" id="form4">
     <input type="submit" value="Generate">
     <input type="hidden" name="type" value="customerList">
     </form>
     <br>

     <h5>Mailing Labels</h5>
     <form action="reportRendering" id="form5">
     Customer ID: <input type="text" name="customerID">
     <input type="hidden" name="type" value="mailingLabels">
     <input type="submit" value="Generate">
     </form>
     <br>
  <!--</div>-->
 
 </div>
 </main>  
 
</body>
<div id="stay">
 <jsp:include page="_footer.jsp" />
 </div>
</html>