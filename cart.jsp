<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
</head>
<body>
    <h1>Cart</h1>
    
    <div>
        <% 
        // Retrieve cart items from session
        Object cartItems = request.getSession().getAttribute("cartItems");
        if (cartItems != null && cartItems instanceof ArrayList) {
            ArrayList<String> items = (ArrayList<String>) cartItems;
            for (String item : items) {
                out.println("<p>" + item + "</p>");
            }
        } else {
            out.println("<p>No items in cart</p>");
        }
        %>
    </div>
    
    <a href="store.jsp">Back to Store</a>
</body>
</html>
