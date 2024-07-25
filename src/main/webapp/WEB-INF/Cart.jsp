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
            margin: 20px;
            margin-top: 80px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-image {
            max-width: 150px;
            max-height: 150px;
        }
        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 10px;
            }
        }
        @media (max-width: 576px) {
            .product-image {
                max-width: 100px;
                max-height: 100px;
            }
        }
        .footer {
            margin-top: 65px;
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #f8f9fa; /* Optional: Add background color for footer */
        }


    </style>
    <jsp:include page="customerDashBoard.jsp"/>
</head>
<body>
<div class="container">
    <h1 style="color: #808080;margin-left: 23px;margin-top: 22px">
        <i class="fa fa-shopping-cart"></i>Your-Cart
    </h1><br><br>

    <!-- New Product Card Section -->
    <div class="table-responsive">
        <table class="table table-hover table-responsive-md">
            <thead class="tbl-header">
            <tr>
                <th>Serial No.</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Brand</th>
                <th>Quantity</th>
                <th>Price/piece</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="productList">
            <c:forEach var="product" items="${cart}">
                <tr>
                    <td><c:out value="${product.id}"/></td>
                    <td><c:out value="${product.name}"/></td>
                    <td><c:out value="${product.category}"/></td>
                    <td><c:out value="${product.brand}"/></td>
                    <td>
                        <button class="btn btn-danger" style="background:red;" onclick="updateQuantity('${product.id}', 'increase')">+</button>
                        <span>${product.quantity}</span>
                        <button class="btn btn-danger" style="background:red;" onclick="updateQuantity('${product.id}', 'decrease')">-</button>
                    </td>
                    <td><c:out value="Rs.${product.price}"/></td>
                    <td>
                        <a class="btn btn-danger" style="background:red;" href="<c:url value='/deleteCart?id=${product.id}'/>" onclick="return confirmDelete()">Remove</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="footer" >
            <a class="btn" style="background-color: #3b5998; color: white;" href="userProduct">Continue shopping</a>
            <a class="btn" style="background-color: #28a745; color: white;" href="<c:url value='/editProduct?productId=${product.productId}'/>" >Proceed To Checkout</a>

        </div>

    <!-- Existing content -->
</div>
    <script>
        function  confirmDelete() {
            return confirm("Are you sure you want to delete this product?");
        }


        function updateQuantity(productId, action) {
            $.ajax({
                url: action === 'increase' ? '<c:url value="/increaseQuantity"/>' : '<c:url value="/decreaseQuantity"/>',
                type: 'POST',
                data: { id: productId },
                success: function (response) {
                    $('#productList').html($(response).find('#productList').html());
                },
                error: function () {
                    alert('Error updating quantity');
                }
            });
        }
    </script>
</body>
</html>
