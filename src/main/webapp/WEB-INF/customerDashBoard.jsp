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
            color: rgb(255, 147, 2); /* Orange color text for hover */
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
            margin-left: 830px; /* Move logout button to the right */
            border: 0px solid gray; /* Correct border syntax */
            color: gray;
            height: 35px;
            width: 75px;
            transition: color 0.3s;
            font-size: 26px; /* Decrease font size */
            padding: 5px 10px; /* Decrease padding */
        }

        .logout:hover {
            color:rgb(255, 147, 2);
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
                <span style="color:rgb(255, 147, 2);">Shakti-stores</span>
            </li>
            <li><a href="userProduct" style="text-transform: uppercase;text-decoration: none; font-weight: bold;"><i class="fa fa-product-hunt"></i> Products</a></li>
            <li><a href="addToCartPannel" style="text-transform: uppercase;text-decoration: none; font-weight: bold;"><i class="fa fa-shopping-cart"></i>Cart</a></li>
            <li><a href="paye" style="text-transform: uppercase;text-decoration: none; font-weight: bold;"><i class="fa fa-credit-card"></i> Payement</a></li>
            <li><a href="#" style="text-transform: uppercase;text-decoration: none; font-weight: bold;"><i class="fa fa-bar-chart"></i> Reports</a></li>
            <li><a href="#" style="text-transform: uppercase;text-decoration: none; font-weight: bold;"><i class="fa fa-cogs"></i> Settings</a></li>
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
                    <li class="nav-profile">
                        <div class="nav-profile-image">
                            <div class="nav-profile-name">
                                <i style="color:rgb(255, 147, 2);width: 18px;height: 20px;margin-top: 35px" class="fa fa-user"></i>
                                <c:if test="${not empty user}">
                                    <span style="color:rgb(255, 147, 2);text-transform: uppercase;text-decoration: none; font-weight: bold;font-size: 18px;margin-top: 22px;">${user}</span>
                                </c:if>
                            </div>
                        </div>
                    </li>
                    <li>
                        <!-- Add icon in front of Logout anchor tag and style it -->
                        <a class="logout" href="home" style="font-size: 17px;"><i class="fa fa-sign-out" style="color:rgb(255, 147, 2);"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>

</body>
</html>
