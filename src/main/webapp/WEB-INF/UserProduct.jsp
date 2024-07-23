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

        .row {
            display: flex;
            flex-wrap: wrap;
            gap: 20px; /* Space between cards */
        }

        .product-card {
            flex: 1 1 calc(33.333% - 20px); /* 3 cards per row with space between */
            max-width: calc(33.333% - 20px); /* Prevent cards from getting too wide */
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .product-image {
            max-width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .product-info {
            padding: 15px;
            background-color: rgb(255, 147, 2); /* Background color for the info section */
            color: #fff; /* Text color for better contrast */
            border-top: 2px solid rgb(255, 147, 2);
        }

        .product-info h5 {
            margin: 0;
            color: #fff; /* Text color for the product name */
        }

        .product-info p {
            margin: 5px 0;
            color: #fff; /* Text color for the product details */
        }

        .product-info strong {
            color: #fff; /* Text color for strong tags */
        }

        @media (max-width: 992px) {
            .product-card {
                flex: 1 1 calc(50% - 20px); /* 2 cards per row on medium screens */
                max-width: calc(50% - 20px);
            }
        }

        @media (max-width: 768px) {
            .product-card {
                flex: 1 1 100%; /* 1 card per row on small screens */
                max-width: 100%;
            }
        }

        @media (max-width: 576px) {
            .product-image {
                height: 150px;
            }
        }

    </style>
    <jsp:include page="AdminGet.jsp"/>
</head>
<body>
<div class="container">
    <h2 style="color: #808080;">
        <i class="fas fa-list-alt"></i> ProductList
    </h2>

    <!-- New Product Card Section -->
    <div class="row">
        <div class="col-md-12">
            <c:forEach var="product" items="${productList}">
                <div class="product-card card">
                    <img src="${pageContext.request.contextPath}/image/${product.imageUrl}" class="card-img-top product-image" alt="${product.name}"/>
                    <div class="card-body product-info">
                        <h5 class="card-title">${product.name}</h5>
                        <p><strong>Description:</strong> ${product.description}</p>
                        <p><strong>Category:</strong> ${product.category}</p>
                        <p><strong>Brand:</strong> ${product.brand}</p>
                        <p><strong>Quantity:</strong> ${product.quantity}</p>
                        <p><strong>Price:</strong> $${product.price}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Existing content -->
</div>
</body>
</html>
