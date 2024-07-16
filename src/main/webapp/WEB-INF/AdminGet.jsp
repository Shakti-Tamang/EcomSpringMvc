<%--
  Created by IntelliJ IDEA.
  User: Shakti
  Date: 4/28/2024
  Time: 3:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        /* General body styling */
        body {

            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4; /* Light grey background for the main area */
        }

        /* Styling for the sidebar */
        #sidebar {
            background-color: #FFFFFF; /* White background */
            color: #808080; /* Gray text color */
            width: 250px; /* Sidebar width */
            height: 100vh; /* Full height of the viewport */
            position: fixed; /* Fixed position to stay visible while scrolling */
            left: 0;
            top: 0;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1); /* Subtle shadow to the right of the sidebar */
        }

        /* Navigation list styling */
        #sidebar-nav ul {
            list-style: none;
            padding: 0;
        }

        #sidebar-nav ul li {
            padding: 10px 0;
        }

        #sidebar-nav ul li a {
            color: #808080; /* Gray text color */
            text-decoration: none; /* Removes underline from links */
            display: block; /* Makes the links fill the available space */
            transition: color 0.3s, background-color 0.3s; /* Smooth transition for color and background */
        }

        #sidebar-nav ul li a i {
            margin-right: 10px; /* Space between icon and text */
        }

        #sidebar-nav ul li a:hover {
            background-color: #e9ecef; /* Light gray background for hover state */
            color:rgb(100,220,164); /* Green color text for hover */
        }

        /* Header styling */
        #header {
            padding: 10px; /* Decrease padding */
            background-color: #FFFFFF;
            color: #808080;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            display: flex;
            align-items: center;
            position: fixed;
            width: calc(100% - 250px);
            left: 250px;
            top: 0;
            z-index: 1000;
            height: 60px;
        }

        /* Navigation icons styling */
        .header-nav ul li {
            display: inline-block;
            margin-right: 10px; /* Decrease margin between icons */
        }

        .header-nav ul li:last-child {
            margin-right: 0;
        }

        .header-nav ul li a {
            color: #808080;
            text-decoration: none;
            font-size: 14px; /* Decrease font size */
        }

        /* Logout button styling */
        .logout {
            margin-left: 490px; /* Move logout button to the right */
            border: 0px solid gray; /* Correct border syntax */
            color: gray;
            height: 35px;
            width: 75px;
            transition: color 0.3s;
            font-size: 16px; /* Decrease font size */
            padding: 5px 10px; /* Decrease padding */
        }

        .logout:hover {
            color:rgb(100,220,164);
        }

        /* Content area styling */
        #content {
            margin-left: 250px; /* Same as sidebar width */
            padding: 20px;
            margin-top: 70px; /* Adjusting content margin to avoid overlap with fixed header */
        }

        .content-header h1 {
            margin-top: 0;
        }

        /* Responsive design elements (for smaller screens) */
        @media (max-width: 768px) {
            #sidebar {
                width: 100%; /* Full width for smaller screens */
                height: auto; /* Auto height based on content */
                position: relative; /* Normal flow of the document */
            }
            #header {
                margin-left: 0; /* Header takes full width on small screens */
                left: 0;
            }
            #content {
                margin-left: 0; /* Content takes full width on small screens */
                margin-top: 50px; /* Adjusting content margin for small screens */
            }
        }

        /* Styling for ETracker logo */
        #sidebar-nav ul li img {
            margin-right: 4px;
            width: 80px;
            height: 70px;
        }

        #sidebar-nav ul li span {
            font-size: 25px;
            color: #000000; /* Dark black text color */
        }
    </style>

</head>
<body>

<section id="sidebar">
    <div class="white-label"></div>
    <div id="sidebar-nav">
        <ul>
            <li>

                <span>Admin-Dashboard</span>
            </li>
            <li class="active"><a href="DashboardController?action=DashBoard"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li><a href="DashboardController?action=Records"><i class="fa fa-file-text-o"></i> Records</a></li>
            <li><a href="DashboardController?action=Budget"><i class="fa fa-money"></i> Budget</a></li>
            <li><a href="DashboardController?action=Accounts"><i class="fa fa-users"></i> Accounts</a></li>
            <li><a href="DashboardController?action=Transation"><i class="fa fa-exchange"></i> Transactions</a></li>
            <li><a href="addstudent"><i class="fa fa-plus-square-o"></i> Add students</a></li>
        </ul>
    </div>
</section>
<section id="content">
    <div id="header">
        <div class="header-nav">
            <div class="menu-button">
                <!-- Placeholder for menu button if needed -->
            </div>
            <div class="nav">
                <ul>
                    <li class="nav-settings"><div class="font-icon"><i class="fa fa-tasks"></i></div></li>
                    <li class="nav-mail"><div class="font-icon"><i class="fa fa-envelope-o"></i></div></li>
                    <li class="nav-calendar"><div class="font-icon"><i class="fa fa-calendar"></i></div></li>
                    <li class="nav-chat"><div class="font-icon"><i class="fa fa-comments-o"></i></div></li>
                    <li class="nav-profile">
                        <div class="header">
                            <div class="title">
                                <i class="fas fa-user"></i> Admin
                            </div>
                            <div class="user-info">
                                <img src="https://via.placeholder.com/40" alt="User Avatar">
                                <c:if test="${not empty user}">
                                    <span>${user}</span>
                                </c:if>
                            </div>
                            <a href="logIn" style="color: #1877F2;">
                                <i class="fas fa-sign-out-alt"></i> Logout
                            </a>
                        </div>

            </ul>
        </div>
    </div>
    </div>
</section>

</body>
</html>
