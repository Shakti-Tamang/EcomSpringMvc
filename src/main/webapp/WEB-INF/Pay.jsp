<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment with Khalti</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Pacifico&display=swap');

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .container {
            width: 100%;
            max-width: 1200px;
            height: 100vh;
            margin-top: 180px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #333;
            font-size: 2rem;
        }
    </style>
    <jsp:include page="customerDashBoard.jsp"/>
</head>
<body>

<div class="container">
    <h2>Payment with Khalti</h2>
    <form id="paymentForm" method="POST">
        <div class="form-group">
            <label for="productInfo">Product List:</label>
            <input type="text" class="form-control" id="productInfo" name="productInfo" required>
        </div>
        <div class="form-group">
            <label for="amount">Amount (in Rupee):</label>
            <input type="number" class="form-control" id="amount" name="amount" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
        </div>
        <button type="button" class="btn btn-primary" style="background-color: green" id="payButton">Pay with Khalti</button>
    </form>
</div>

<script src="https://khalti.com/static/khalti-checkout.js"></script>
<script>
    var config = {
        "publicKey": "YOUR_KHALTI_PUBLIC_KEY", // Replace with your Khalti public key
        "productIdentity": "1234567890",
        "productName": "Product List",
        "productUrl": "http://localhost:8080/products",
        "eventHandler": {
            onSuccess (payload) {
                // Get the payment token from the payload
                var token = payload.token;

                // Get the amount from the input field
                var amount = document.getElementById('amount').value;

                // Create a hidden input to send the token
                var form = document.getElementById('paymentForm');
                var hiddenInputToken = document.createElement('input');
                hiddenInputToken.type = 'hidden';
                hiddenInputToken.name = 'token';
                hiddenInputToken.value = token;
                form.appendChild(hiddenInputToken);

                // Optionally, also set the amount (in paisa)
                var hiddenInputAmount = document.createElement('input');
                hiddenInputAmount.type = 'hidden';
                hiddenInputAmount.name = 'amount';
                hiddenInputAmount.value = amount;
                form.appendChild(hiddenInputAmount);

                // Submit the form
                form.action = "/processPayment"; // Ensure this points to the correct endpoint
                form.submit();
            },
            onError (error) {
                console.log(error);
            },
            onClose () {
                console.log('Widget is closing');
            }
        }
    };

    var checkout = new KhaltiCheckout(config);
    document.getElementById('payButton').onclick = function (e) {
        e.preventDefault();
        checkout.show({amount: document.getElementById('amount').value * 100}); // Convert to paisa
    };
</script>

</body>
</html>
