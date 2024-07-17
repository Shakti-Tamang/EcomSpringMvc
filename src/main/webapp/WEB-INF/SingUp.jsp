<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--Expression Language (EL) expressions will not be ignored by the JSP container.--%>
<%--This allows EL expressions like ${} to be evaluated and processed, enabling you to--%>
<%--include dynamic content within your JSP pages.--%>
<%@ page isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up - E-Commerce</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
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
            width: 500px; /* Increased width */
            transition: width 0.3s;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
            font-weight: 700;
        }

        .message {
            color: red;
            text-align: center;
            margin-bottom: 20px;
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

        .input-group input,
        .input-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .input-group input:focus,
        .input-group select:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
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

            .input-group input,
            .input-group select {
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
    <h1>Create Your Account</h1>
    <form action="save" method="POST" onsubmit="return validForm()">
        <c:if test="${not empty message}">
            <div class="message">${message}</div>
        </c:if>
        <div class="input-group">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div class="input-group">
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="input-group">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="input-group">
            <label for="confirm_password">Confirm Password</label>
            <input type="password" id="confirm_password" name="confirmPassword" required>
        </div>
        <div class="input-group">
            <label for="role">Role</label>
            <select id="role" name="role" required>
                <option value="USER">User</option>
                <option value="ADMIN">Admin</option>
            </select>
        </div>
        <button type="submit" style="background:rgb(255, 147, 2);">Sign Up</button>
        <p class="redirect">Already have an account? <a href="logIn">Login here</a>.</p>
    </form>
</div>
<script>
    function validForm() {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        var passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;

        var name = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirm_password").value;

        var isValid = true;
        var errorMessage = "";

        if (name.trim() === "") {
            errorMessage += "Name cannot be empty.\n";
            isValid = false;
        }

        if (!emailRegex.test(email)) {
            errorMessage += "Invalid email format.\n";
            isValid = false;
        }

        if (!passwordRegex.test(password)) {
            errorMessage += "Password must contain at least 8 characters, including one uppercase letter, one lowercase letter, and one number.\n";
            isValid = false;
        }

        if (password !== confirmPassword) {
            errorMessage += "Passwords do not match.\n";
            isValid = false;
        }

        if (!isValid) {
            alert(errorMessage);
            return false;
        }

        return true;
    }
</script>
</body>
</html>
