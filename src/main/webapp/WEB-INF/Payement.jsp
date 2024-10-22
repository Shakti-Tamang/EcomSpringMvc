<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Detail</title>
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
            max-width: 800px;
            margin: 20px;
            margin-top: 80px;
            background-color: #e0f7fa;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            color: #333;
        }
        .item {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .item:last-child {
            border-bottom: none;
        }
        .item-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .item-name {
            font-weight: bold;
        }
        .footer {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }
        .btn-pay {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .btn-pay:hover {
            background-color: #0056b3;
            color: #fff;
        }
    </style>
    <jsp:include page="customerDashBoard.jsp"/>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Shakti-Stores</h1>
        <p><i class="fa fa-file-invoice-dollar"></i> Payment Detail</p>
    </div>

    <div id="productList">
        <c:forEach var="product" items="${cart}">
            <div class="item">
                <div class="item-details">
                    <span class="item-name">Product-Name: <c:out value="${product.name}"/></span>
                    <span>Category: <c:out value="${product.category}"/></span>
                </div>
                <div class="item-details">
                    <span>Brand: <c:out value="${product.brand}"/></span>
                    <span>Quantity: <c:out value="${product.quantity}"/></span>
                </div>
                <div class="item-details">
                    <span>Price: Rs. <c:out value="${product.price}"/></span>
                    <span>Total: Rs. <span class="item-total"><c:out value="${product.price * product.quantity}"/></span></span>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="footer">
        <span class="total">Grand Total: Rs. <span id="grandTotal"></span></span>
        <a href="getPay" class="btn-pay" style="background-color:green">Pay from Here</a>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // .iem-total for line number 80 to take all price from user not only one
        let totalElements = document.querySelectorAll('.item-total');
        let grandTotal = 0;

        totalElements.forEach(function(element) {
            grandTotal += parseFloat(element.innerText);
        });

        document.getElementById('grandTotal').innerText = grandTotal.toFixed(2);
    });
</script>
</body>
</html>
