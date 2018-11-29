<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
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
   <div class="page-title">Reports</div>
 	</br>
   <div class>
 
 	<!--	<c:forEach items="${customers}" var="customer">
 			<p> Customer ID: ${customer.id} </p>
 			<p> Customer Name: ${customer.firstName} ${customer.lastName} </p>
 		</c:forEach>-->
 	  <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/jewlz"
         user = "root"  password = "YourStrong!Passw0rd"/>
 
	  <c:if test="${param.type == 'monthlySales'}">
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT DATE_FORMAT(STR_TO_DATE(Order_Date, "%m/%d/%Y"), '%M %Y') AS Order_Month, 
         SUM(CONVERT(Product_Retail_Price, DECIMAL(10,2))) AS Price
         from orders 
         where Order_Status = 'Complete'
         group by DATE_FORMAT(STR_TO_DATE(Order_Date, "%m/%d/%Y"), '%M %Y')
      </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Month</th>
            <th>Total Sales</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Order_Month}"/></td>
               <td><c:out value = "${row.Price}"/></td>
            </tr>
         </c:forEach>
      </table>
   	  </c:if>

   	  <c:if test="${param.type == 'yearlySales'}">
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT YEAR(STR_TO_DATE(Order_Date, "%m/%d/%Y")) AS Order_Year, SUM(CONVERT(Product_Retail_Price, DECIMAL(10,2))) AS Price
         from orders 
         where Order_Status = 'Complete'
         group by YEAR(STR_TO_DATE(Order_Date, "%m/%d/%Y"))
      </sql:query>
      <table border = "1" width = "100%">
         <tr>
            <th>Year</th>
            <th>Total Sales</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Order_Year}"/></td>
               <td><c:out value = "${row.Price}"/></td>
            </tr>
         </c:forEach>
      </table>
   	  </c:if>

   	  <c:if test="${param.type == 'inventoryLevels'}">
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT Product_ID, Product_Name, Product_Color, Product_Size, Number_In_Stock from product;
      </sql:query>
      <table border = "1" width = "100%">
         <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Color</th>
            <th>Size</th>
            <th>Stock</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Product_ID}"/></td>
               <td><c:out value = "${row.Product_Name}"/></td>
               <td><c:out value = "${row.Product_Color}"/></td>
               <td><c:out value = "${row.Product_Size}"/></td>
               <td><c:out value = "${row.Number_In_Stock}"/></td>
            </tr>
         </c:forEach>
      </table>
   	  </c:if>

   	  <c:if test="${param.type == 'inventoryCosts'}">
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT Product_ID, Product_Name, Product_Color, Product_Size, Product_Retail_Price * Number_In_Stock AS Inventory_Cost from product;
      </sql:query>
      <table border = "1" width = "100%">
         <tr>
            <th>Product ID</th>
            <th>Product Name</th>
            <th>Color</th>
            <th>Size</th>
            <th>Inventory Cost</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Product_ID}"/></td>
               <td><c:out value = "${row.Product_Name}"/></td>
               <td><c:out value = "${row.Product_Color}"/></td>
               <td><c:out value = "${row.Product_Size}"/></td>
               <td><c:out value = "${row.Inventory_Cost}"/></td>
            </tr>
         </c:forEach>
      </table>
   	  </c:if>

   	  <c:if test="${param.type == 'customerList'}">
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from customer;
      </sql:query>
      <table border = "1" width = "100%">
         <tr>
            <th>Customer ID</th>
            <th>First Name</th>
            <th>Last Name</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.Customer_ID}"/></td>
               <td><c:out value = "${row.Customer_First_Name}"/></td>
               <td><c:out value = "${row.Customer_Last_Name}"/></td>
            </tr>
         </c:forEach>
      </table>
   	  </c:if>

   	  <c:if test="${param.type == 'mailingLabels'}">
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT CONCAT(Customer_First_Name, ' ', Customer_Last_Name) AS Customer_Full_Name, Customer_Street_Address, 
         CONCAT(Customer_City, ', ', Customer_State, ' ', Customer_Zip) AS Customer_CSZ from customer where Customer_ID = ?;
         <sql:param value="${param.customerID}" />
      </sql:query> 
      <table border = "1" width = "100%">
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
            </tr>
            <tr>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
            </tr>
            <tr>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
               <td align="center"><c:out value = "${row.Customer_Full_Name}"/><br><c:out value = "${row.Customer_Street_Address}"/><br><c:out value = "${row.Customer_CSZ}"/></td>
            </tr>            
         </c:forEach>
      </table>
   	  </c:if>
   </div>
 
 </div>
 </main>  
 
</body>
<div id="stay">
 <jsp:include page="_footer.jsp" />
 </div>
</html>