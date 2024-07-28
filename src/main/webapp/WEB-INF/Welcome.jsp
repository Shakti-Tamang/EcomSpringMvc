<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn538F...">
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
            height: 100vh; /* Full viewport height */
            margin-top: 180px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: #333; /* Change font color to dark gray */
            font-size: 2rem;
            z-index: 1;
        }
        .background-slider {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            animation: slide 15s infinite;
            background-size: cover;
            background-position: center;
            transition: background-image 1s ease-in-out;
        }
        @keyframes slide {
            0% { background-image: url('https://wallpapers.com/images/hd/ulysse-nardin-swiss-watch-wyav7st0voldaem8.jpg'); }
            33% { background-image: url('https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0'); }
            66% { background-image: url('https://media.istockphoto.com/id/1347455404/photo/shot-of-an-unrecognizable-woman-spending-a-day-in-the-city.jpg?s=612x612&w=0&k=20&c=W3-QMPd9D-ok_upk94ooFtb3wnWUZW4Gu8dtYRH3fKI='); }
            100% { background-image: url('https://cdn.mos.cms.futurecdn.net/whowhatwear/posts/208566/brands-nyc-girls-love-208566-1541704360071-main-320-80.gif'); }
        }
        p {
            font-family: 'Pacifico', cursive; /* Apply cursive handwriting font */
            font-size: 2.5rem; /* Increase font size */
            font-style: italic;
            color: white;
        }
        .btn-get-started {
            margin-top: 80px;
            padding: 8px 16px; /* Reduce padding for smaller size */
            font-size: 1.2rem; /* Reduce font size */
            color: #333; /* Match button font color with text color */
            background-color: #ffd700; /* Change button background color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
            text-decoration: none; /* Remove underline */
            color: black; /* Set text color to black */
        }
        .btn-get-started:hover {
            background-color: #ffc107; /* Change hover color */
            transform: scale(1.1);
            text-decoration: none; /* Ensure no underline on hover */
            color: black; /* Ensure text color remains black on hover */
        }
    </style>
    <jsp:include page="customerDashBoard.jsp"/>
</head>
<body>
<div class="container">
    <div class="background-slider"></div>
    <h1 style="color:white;font-family: 'Rage Italic'">Discover a wide range of amazing products and exclusive offers.</h1> <p> From the latest fashion trends to cutting-edge gadgets, we have everything you need to stay ahead of the curve. Join us today and experience shopping like never before!</p> <a class="btn-get-started" href="userProduct">Get Started</a>
</div>
</body>
</html>
