<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style>
body {
    font-family: Arial, sans-serif;
    text-align: center; 
    background-color: lightblue; /* Example background color for cart page */
    padding: 20px;
}

h1 {
    margin-top: 20px; 
}

table {
    margin: auto;
    border-collapse: collapse;
}

table, th, td {
    border: 1px solid black;
}

th, td {
    padding: 10px;
}

.product-image {
    max-width: 150px;
    height: auto;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('.checkout').click(function(e) {
        e.preventDefault();
       
        alert("Successfully Booked Your Items!!!");
        
    });
});
</script>



</head>
<body>
<h1>Cart</h1>

<%
String[][] products = {
    {"Soap with Foam", "https://img.freepik.com/premium-vector/soap-with-foam-vector-flat-illustration_444100-100.jpg"},
    {"T-Shirt", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPyNfiBKbbmJij3kyfewOK2jD0oIf_mfu8mg_bcMy6WA&s"},
    {"Mobile Phone Icon", "https://static.vecteezy.com/system/resources/previews/011/157/544/original/mobile-phone-cartoon-icon-illustration-technology-object-icon-concept-isolated-premium-flat-cartoon-style-vector.jpg"}
};

String productIndexStr = request.getParameter("productIndex");
System.out.println("String:"+productIndexStr);
int productIndex=0;

if (productIndexStr != null && !productIndexStr.isEmpty()) {
	 productIndex=Integer.parseInt(productIndexStr);
	System.out.println("New Int:"+productIndex);
    
    
%>

       
       
<%
} else {
    
%>

<table>
    <tr>
        <th>Product Name</th>
        <th>Product Image</th>
    </tr>
    <tr>
        <td><%= products[productIndex][0] %></td>
        <td><img src="<%= products[productIndex][1] %>" alt="<%= products[productIndex][0] %>" class="product-image"></td>
    </tr>
</table>
<br><br><br>
<button type="submit" class="checkout">Checkout</button>
<%
}
%>

</body>
</html>
