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
            background-color: #f8f9fa;
        }
    </style>
    <jsp:include page="customerDashBoard.jsp"/>
</head>
<body>
<div class="container">
    <h1 style="color: #808080; margin-left: 23px; margin-top: 22px;">
        <i class="fa fa-shopping-cart"></i>Your Cart
    </h1><br><br>

    <div class="table-responsive">
        <table class="table table-hover table-responsive-md" style="background: #e0f7fa;">
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
                        <button class="btn btn-secondary" style="background-color:darkblue; color: white;" onclick="updateQuantity(${product.id}, 'decrease')">-</button>
                        <span id="quantity-${product.id}">
                            <c:out value="${product.quantity != null ? product.quantity : 1}"/>
                        </span>
                        <button class="btn btn-secondary"  style="background-color:darkblue; color: white;" onclick="updateQuantity(${product.id}, 'increase')">+</button>
                    </td>
                    <td>Rs.<c:out value="${product.price}"/></td>
                    <td>
                        <a class="btn btn-danger" style="background:darkblue;" href="<c:url value='/deleteCart?id=${product.id}'/>" onclick="return confirmDelete()">Remove</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="footer">
            <a class="btn" style="background-color: green; color: white;" href="userProduct">Continue shopping</a>
            <a class="btn" style="background-color: green; color: white;" href="paye">Proceed To Checkout for payement</a>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete this product?");
    }
    function updateQuantity(productId, action) {
        var url = action === 'increase' ? '<c:url value="/increaseQuantity"/>' : '<c:url value="/decreaseQuantity"/>';

        $.ajax({
            url: url,
            type: 'POST',
            data: { id: productId },
            success: function(response) {
                if (response.newQuantity !== undefined) {
                    $('#quantity-' + productId).text(response.newQuantity);
                } else {
                    alert(response.error);
                }
            },
            error: function(xhr, status, error) {
                alert("An error occurred: " + xhr.responseText);
            }
        });
    }

</script>
</body>
</html>
