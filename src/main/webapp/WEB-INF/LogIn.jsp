<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--Expression Language (EL) expressions will not be ignored by the JSP container.--%>
<%--This allows EL expressions like ${} to be evaluated and processed, enabling you to--%>
<%--include dynamic content within your JSP pages.--%>
<%@ page isELIgnored="false" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log In - E-Commerce</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Existing CSS */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Roboto', sans-serif;
        }

        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            padding: 20px;
        }

        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 500px;
            transition: width 0.3s;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-weight: 700;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: 500;
        }

        .input-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .input-group input:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        .message {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 4px;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.02);
        }

        .redirect {
            text-align: center;
            margin-top: 20px;
        }

        .redirect a {
            color: #007BFF;
            text-decoration: none;
            transition: text-decoration 0.3s;
        }

        .redirect a:hover {
            text-decoration: underline;
        }

        /* Media Queries for Responsiveness */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 30px;
            }

            h1 {
                font-size: 24px;
            }

            button {
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .container {
                width: 95%;
                padding: 20px;
            }

            h1 {
                font-size: 22px;
            }

            .input-group input {
                padding: 10px;
            }

            button {
                padding: 10px;
                font-size: 16px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Log In to Your Account</h1>
    <c:if test="${not empty message}">
        <div class="message">${message}</div>
    </c:if>
    <form action="LoggedInuser" method="POST">
        <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <button type="submit" style="background:#3b5998;">Log In</button>
        <p class="redirect" style="color: #28a745">Don't have an account? <a href="signup" style="color: #28a745">Sign up here</a>.</p>
    </form>
</div>

</body>
</html>