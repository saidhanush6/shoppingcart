<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Store</title>
<style>
body {
    font-family: Arial, sans-serif;
    text-align: center; 
    background-image: url('sc2.jpg');
    background-size: cover;
    background-attachment: fixed;
}

h1 {
    margin-top: 20px; 
    background-color: lightblue;
    display: flex;
    justify-content: center;
    align-items: center;
}

#heading-icon {
    width: 30px;
    height: 30px;
    margin-left: 10px; /* Adjusted margin for the icon */
}

label, select {
    margin: 20px; 
    width: 200px; 
}

.product {
    display: flex;
    align-items: center; 
    justify-content: center;
    margin: 60px;
    margin-left: 280px;
    padding: 20px;
    border: 2px solid #ccc;
    border-radius: 25px;
    background-color: rgba(255, 255, 245, 0.9);
    max-width: 750px; 
    height: 200px;
}

.product img {
    width: 150px; 
    height: auto;
    border-radius: 25px;
    margin-right: 20px; 
}

.product-description {
    flex: 1; 
    text-align: left;
}

.add-to-cart {
    display: inline-block;
    padding: 8px 16px;
    background-color: #4CAF50;
    color: white;
    text-decoration: none;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 10px; 
}

.add-to-cart:hover {
    background-color: #45a049;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('.add-to-cart').click(function(e) {
        e.preventDefault();
        var productIndex = $(this).val();
        $.ajax({
            type: 'POST',
            url: 'cart.jsp',
            data: { productIndex: productIndex },
            success: function(response) {
                console.log(response); // Log response to console for debugging
                // Update cart content here if needed
            },
            error: function(xhr, status, error) {
                console.error(error); // Log error to console for debugging
            }
        });
    });

    // Click event for the cart icon in the header
    $('h1').click(function() {
        // Redirect to cart.jsp to display cart contents
        window.location.href = 'cart.jsp';
    });
});
</script>
</head>
<body>
    <h1>Online Store <img id="heading-icon" src="https://cdn-icons-png.flaticon.com/512/2037/2037516.png" alt="Icon"></h1> 
    <form action="cart.jsp" method="post">
        <label id="l1">Category:</label>
        <select name="category" id="category">
            <option value="1">Category 1</option>
            <option value="2">Category 2</option>
            <option value="3">Category 3</option>
        </select>

        <label id="l2">Sort Price Wise:</label>
        <select name="sortPriceWise" id="sortPriceWise">
            <option value="asc">Low to High</option>
            <option value="desc">High to Low</option>
        </select>
    </form>

    <%
    String[][] products = {
        {"Soap with Foam", "https://img.freepik.com/premium-vector/soap-with-foam-vector-flat-illustration_444100-100.jpg", "This refreshing soap illustration features a rich lather of foam that will leave your skin feeling clean and rejuvenated. Perfect for your daily bath routine!"},
        {"T-Shirt", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPyNfiBKbbmJij3kyfewOK2jD0oIf_mfu8mg_bcMy6WA&s", "Our best-selling T-Shirt is made from premium cotton and designed for comfort and style. Available in various sizes and colors. Get yours today!"},
        {"Mobile Phone Icon", "https://static.vecteezy.com/system/resources/previews/011/157/544/original/mobile-phone-cartoon-icon-illustration-technology-object-icon-concept-isolated-premium-flat-cartoon-style-vector.jpg", "Discover our premium flat mobile phone icon, perfect for web and app design projects. This sleek design will elevate your digital creations!"}
    };

    // Display product cards
    for (int i = 0; i < products.length; i++) {
    %>
    <div class="product">
        <img src="<%= products[i][1] %>" alt="<%= products[i][0] %>">
        <div class="product-description">
            <h3><%= products[i][0] %></h3>
            <p><%= products[i][2] %></p>
            <button class="add-to-cart" value="<%= i %>">Add to Cart</button>
        </div>
    </div>
    <%
    }
    %>

</body>
</html>
