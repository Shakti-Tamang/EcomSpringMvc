<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Products - E-Commerce</title>
    <style>
        .main-content {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            padding: 20px;
            background-color: #f0f2f5;
            margin-left: 250px; /* Adjust margin to account for sidebar width */
        }

        .content {
            margin-top: 20px;
            flex-grow: 1;
            padding: 20px;
            text-align: center;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            margin: 0;
            font-size: 28px;
            font-weight: bold;
            color: #333;
        }
    </style>
    <jsp:include page="AdminGet.jsp" />
</head>
<body>
<div class="main-content">
    <div class="content">
        <h1>Products</h1>
        <!-- Add your products display logic here -->
    </div>
</div>
</body>
</html>
