<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 1200px;
            margin-top: 80px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }


        .search-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .search-input {
            width: 300px;
            padding: 10px 20px;
            border: 2px solid #ddd;
            border-radius: 25px;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.1);
            outline: none;
            transition: all 0.3s ease;
        }

        .search-input:focus {
            border-color: #28a745;
            box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        .search-button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            margin-left: -50px;
            border-radius: 0 25px 25px 0;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3), inset 0 1px 3px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }

        .search-button:hover {
            background-color: #218838;
        }

        .search-button i {
            margin-right: 5px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            margin: -10px; /* Increased margin to create more space between cards */
        }

        .product-card {
            flex: 1 1 calc(25% - 20px); /* 4 cards per row with more space between */
            max-width: calc(25% - 20px); /* Prevent cards from getting too wide */
            margin: 10px; /* Increased margin to provide more space between cards */
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
            height: 300px; /* Decreased height for the card */
        }

        .product-card:hover {
            transform: scale(1.03);
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.2);
        }

        .product-image {
            width: 100%;
            height: 120px; /* Decreased height for the product image */
            object-fit: cover;
        }

        .product-info {
            padding: 8px;

            color: #fff;
            height: calc(100% - 120px); /* Adjust height to fit within the card */
            overflow: auto;
        }

        .product-info h5 {
            font-weight: bolder;
            margin: 0;
            font-size: 1rem;
            color: black;
        }

        .product-info p {
            margin: 3px 0;
            font-size: 0.9rem;
            color: black;
        }

        .product-info strong {
            color: black;
        }

        @media (max-width: 992px) {
            .product-card {
                flex: 1 1 calc(33.333% - 20px); /* 3 cards per row on medium screens */
                max-width: calc(33.333% - 20px);
            }
        }

        @media (max-width: 768px) {
            .product-card {
                flex: 1 1 calc(50% - 20px); /* 2 cards per row on small screens */
                max-width: calc(50% - 20px);
            }
        }

        @media (max-width: 576px) {
            .product-card {
                flex: 1 1 calc(100% - 20px); /* 1 card per row on very small screens */
                max-width: calc(100% - 20px);
            }

            .product-image {
                height: 100px; /* Further decrease height for smaller screens */
            }
        }

    </style>
    <jsp:include page="customerDashBoard.jsp"/>
</head>
<body>
<div class="container">
    <h2 style="color: #808080;">
        <i class="fas fa-list-alt"></i> Product List
    </h2><br>
    <!-- Search Bar -->
    <div class="search-container">
        <input type="text" placeholder="Search by Category....." name="search" id="search" class="search-input">
        <button class="search-button" onclick="searchProducts()">
            <i class="fas fa-search"></i> Search
        </button>
    </div><br>

    <div class="row">
        <c:forEach var="product" items="${productList}">
            <div class="product-card card">
                <img src="${pageContext.request.contextPath}/image/${product.imageUrl}" class="product-image" alt="${product.name}"/>
                <div class="product-info">
                    <h5>${product.name}</h5>
                    <p><strong>Category:</strong> ${product.category}</p>
                    <p><strong>Brand:</strong> ${product.brand}</p>
                    <p><strong>Quantity:</strong> ${product.quantity}</p>
                    <p><strong>Price:</strong> Rs. ${product.price}</p>
                    <a class="btn" style="background-color: #28a745; box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3), inset 0 1px 3px rgba(0, 0, 0, 0.2); width: 242px; margin-left: 3px; color: white; font-weight: bold; text-align: center; display: inline-block; text-decoration: none; transition: all 0.3s;" href="<c:url value='/addToCart?productId=${product.productId}'/>">
                        Add To Cart
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- Existing content -->
</div>

</body>
</html>

