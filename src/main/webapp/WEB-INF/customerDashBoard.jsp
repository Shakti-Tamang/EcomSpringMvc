<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--Expression Language (EL) expressions will not be ignored by the JSP container.--%>
<%--This allows EL expressions like ${} to be evaluated and processed, enabling you to--%>
<%--include dynamic content within your JSP pages.--%>
<%@ page isELIgnored="false" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - E-Commerce</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
            background-color: #f0f2f5;
        }

        .sidebar {
            width: 250px;
            background-color: #4267B2;
            color: #fff;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            transition: width 0.3s;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 22px;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 15px 20px;
            transition: background-color 0.3s;
        }

        .sidebar ul li:hover {
            background-color: #365899;
        }

        .sidebar ul li a {
            color: #fff;
            text-decoration: none;
            display: block;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
            background-color: #fff;
        }

        .header {
            background-color: #4267B2;
            color: #fff;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header .title {
            font-size: 24px;
            font-weight: 700;
        }

        .header .user-info {
            display: flex;
            align-items: center;
        }

        .header .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .header .user-info span {
            font-size: 16px;
        }

        .content {
            margin-top: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }

        .card h3 {
            margin-bottom: 15px;
            font-size: 20px;
            font-weight: 700;
            color: #333;
        }

        .card p {
            color: #555;
            font-size: 16px;
            line-height: 1.5;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .header .title {
                font-size: 20px;
            }

            .header .user-info span {
                font-size: 14px;
            }

            .card h3 {
                font-size: 18px;
            }

            .card p {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .sidebar {
                width: 150px;
            }

            .header .title {
                font-size: 18px;
            }

            .header .user-info span {
                font-size: 12px;
            }

            .card h3 {
                font-size: 16px;
            }

            .card p {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h2>Dashboard</h2>
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">Orders</a></li>
        <li><a href="#">Customers</a></li>
        <li><a href="#">Reports</a></li>
        <li><a href="#">Settings</a></li>
    </ul>
</div>
<div class="main-content">
    <div class="header">
        <div class="title">Welcome to E-Commerce Dashboard</div>
        <div class="user-info">
            <img src="https://via.placeholder.com/40" alt="User Avatar">
            <c:if test="${not empty user}">
                <span>${user}</span>
            </c:if>
        </div>
    </div>
    <div class="content">
        <div class="card">
            <h3>Sales Overview</h3>
            <p>Here you can see the overall sales performance and trends for your e-commerce site.</p>
        </div>
        <div class="card">
            <h3>Product Management</h3>
            <p>Manage your products, add new ones, update details, and track inventory.</p>
        </div>
        <div class="card">
            <h3>Order Tracking</h3>
            <p>View and manage customer orders, track shipping, and handle returns.</p>
        </div>
    </div>
</div>
</body>
</html>
