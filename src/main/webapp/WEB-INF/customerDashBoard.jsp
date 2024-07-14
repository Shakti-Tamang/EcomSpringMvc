<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - E-Commerce</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
            background-color: #fff;
            color: #000;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            padding-top: 20px;
            transition: width 0.3s;
            box-shadow: inset -5px -5px 10px rgba(0, 0, 0, 0.1), inset 5px 5px 10px rgba(255, 255, 255, 0.7);
            border-right: 1px solid #d3d3d3;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
            font-weight: 700;
            font-size: 22px;
            color: #1877F2;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 15px 20px;
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
        }

        .sidebar ul li:hover {
            background-color: #f0f2f5;
        }

        .sidebar ul li a {
            color: #1877F2;
            text-decoration: none;
            display: block;
            flex-grow: 1;
            text-transform: uppercase;
            font-weight: bold;
        }

        .main-content {
            flex-grow: 1;
            padding: 0;
            background-color: #fff;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-color: #fff;
            color: #000;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid #d3d3d3;
        }

        .header .title {
            font-size: 24px;
            font-weight: 700;
            color: #1877F2;
            display: flex;
            align-items: center;
        }

        .header .title i {
            margin-right: 10px;
            color: #1877F2;
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
            color: #1877F2;
            text-transform: uppercase;
            font-weight: bold;
        }

        .content {
            margin-top: 20px;
            flex-grow: 1;
            padding: 20px;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            border: 1px solid #d3d3d3;
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
    <h2 style="margin-right:100px;text-transform: uppercase;text-decoration: none; font-weight: bold;margin-top: 25px">Dashboard</h2>
    <ul>
        <li><a href="#" style="text-transform: uppercase;text-decoration: none; font-weight: bold;">Home</a></li>
        <li><a href="#" style="text-transform: uppercase;text-decoration: none; font-weight: bold;">Products</a></li>
        <li><a href="#" style="text-transform: uppercase;text-decoration: none; font-weight: bold;">Orders</a></li>
        <li><a href="#" style="text-transform: uppercase;text-decoration: none; font-weight: bold;">Customers</a></li>
        <li><a href="#" style="text-transform: uppercase;text-decoration: none; font-weight: bold;">Reports</a></li>
        <li><a href="#" style="text-transform: uppercase;text-decoration: none; font-weight: bold;">Settings</a></li>
    </ul>
</div>
<div class="main-content">
    <div class="header">
        <div class="user-info">
            <i style="color: blue;width: 18px;height: 20px;" class="fas fa-user"></i>
            <c:if test="${not empty user}">
                <span style="color:blue;text-transform: uppercase;text-decoration: none; font-weight: bold;font-size: 18px;">${user}</span>
            </c:if>
        </div>
        <div class="title" style="text-transform: uppercase;color:blue;text-decoration: none; font-weight: bold;margin-left: 44px">Welcome to Shakti-Commerce</div>
        <a href="logIn" style="color:blue;text-transform: uppercase;text-decoration: none; font-weight: bold;">
            <i class="fas fa-sign-out-alt"></i> Logout
        </a>
    </div>
    <div class="content">
        <!-- Your other content goes here -->
    </div>
</div>
</body>
</html>
