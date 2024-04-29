<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping Cart</title>
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
    justify-content: center;
    align-items: center;
}

#hd{
    background-color: lightyellow;
    padding:1px 0px 1px 0px;
}

#h1{
    margin-left:450px; 
}

#heading-icon {
    width: 50px;
    height: 50px; 
    padding-top:10 px;
    margin-left: 350px; 
}

#link {
    padding: 20px;
    margin-left: 1060px;
    margin-top: 100px;
    font-size: 17px;
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
        var productIndex = $(this).attr("data-product-index");
        console.log("Product Index: " + productIndex);
        $.ajax({
            type: 'POST',
            url: 'cart.jsp',
            data: { productIndex: productIndex },
            success: function(response) {
                console.log(response); 
            },
            error: function(xhr, status, error) {
                console.error(error); 
            }
        });
    });

    
    $('#heading-icon').click(function(e) {
        
        e.preventDefault();
        window.location.href = 'cart.jsp';
    });
});
</script>


</head>
<body>
<div id="hd">
    <h1><label id="h1">Online Store <label></label><img id="heading-icon" src="https://cdn-icons-png.flaticon.com/512/2037/2037516.png" alt="Icon">
    <a id="link" href="sclogin.html">
    SignIn/Register
    </a>    
    </h1> 
  </div> 
    <form>
       
        <label id="l1">Category:</label>
     <select name="category" id="category">
    <%  
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(
                "jdbc:postgresql://192.168.110.48:5432/plf_training?user=plf_training_admin&password=pff123");

        String qry = "SELECT DISTINCT category FROM dhanush_products"; 
        ps = conn.prepareStatement(qry);
        rs = ps.executeQuery();  

        while (rs.next()) {
            String category = rs.getString("category");
    %>
            <option value="<%= category %>"><%= category %></option>
    <%      
        }
    } catch (Exception e) {
        e.printStackTrace(); 
    } finally {
        
        try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (ps != null) ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
    %>
</select>

        

        <label id="l2">Sort Price Wise:</label>
        <select name="sortPriceWise" id="sortPriceWise">
            <option value="asc">Low to High</option>
            <option value="desc">High to Low</option>
        </select>
    </form>

    <div class="product">
        <img src="https://img.freepik.com/premium-vector/soap-with-foam-vector-flat-illustration_444100-100.jpg" alt="Product 1">
        <div class="product-description">
            <h3>Soap with Foam</h3>
            <p>
                This refreshing soap illustration features a rich lather of foam that will leave your skin feeling clean and rejuvenated. Perfect for your daily bath routine!
            </p>
            <p>Price:70 </p>

            <button class="add-to-cart" data-product-index="0">Add to Cart</button>
        </div>
    </div>

    <div class="product">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPyNfiBKbbmJij3kyfewOK2jD0oIf_mfu8mg_bcMy6WA&s" alt="Product 2">
        <div class="product-description">
            <h3>T-Shirt</h3>
            <p>
                Our best-selling T-Shirt is made from premium cotton and designed for comfort and style. Available in various sizes and colors. Get yours today!
            </p>
             <p>Price:750</p>
            <button class="add-to-cart" data-product-index="1">Add to Cart</button>
        </div>
    </div>

    <div class="product">
        <img src="https://static.vecteezy.com/system/resources/previews/011/157/544/original/mobile-phone-cartoon-icon-illustration-technology-object-icon-concept-isolated-premium-flat-cartoon-style-vector.jpg" alt="Product 3">
        <div class="product-description">
            <h3>Mobile Phone</h3>
            <p>
                Discover our premium flat mobile phone, perfect for web and app design projects. This sleek design will elevate your digital creations!
            </p>
             <p>Price:100000</p>
            <button class="add-to-cart" data-product-index="2">Add to Cart</button>
        </div>
    </div>
</body>
</html>
