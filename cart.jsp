<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,practice.*"%>
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
</head>
<body>
<h1>Cart</h1>

<%
// Array of products (same as in store.jsp, ideally this should come from a session attribute or database)
String[][] products = {
    {"Soap with Foam", "https://img.freepik.com/premium-vector/soap-with-foam-vector-flat-illustration_444100-100.jpg"},
    {"T-Shirt", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPyNfiBKbbmJij3kyfewOK2jD0oIf_mfu8mg_bcMy6WA&s"},
    {"Mobile Phone Icon", "https://static.vecteezy.com/system/resources/previews/011/157/544/original/mobile-phone-cartoon-icon-illustration-technology-object-icon-concept-isolated-premium-flat-cartoon-style-vector.jpg"}
};

// Retrieve the selected product index from the request parameter
String productIndexStr = request.getParameter("productIndex");

if (productIndexStr != null && !productIndexStr.isEmpty()) {
    int productIndex = Integer.parseInt(productIndexStr);

    // Display the selected product in the cart
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
<%
} else {
    // Handle case where no product is selected
%>
<p>No items in the cart.</p>
<%
}
%>

</body>
</html>
