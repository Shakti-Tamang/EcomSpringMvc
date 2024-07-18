<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Products</title>
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
            width: 100vw;
            margin-top: 80px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
    <jsp:include page="AdminGet.jsp"/>
</head>
<body>
<div class="container">
    <h2 style="color: #808080;">
        <i class="fas fa-plus-circle"></i> Add New Product
    </h2>
    <c:if test="${not empty message}">
        <h3 style="color:red">${message}</h3>
    </c:if>
    <c:if test="${not empty filesuccess}">
        <h3 style="color:green">${filesuccess}</h3>
    </c:if>

    <form action="saveProduct" method="post" enctype="multipart/form-data">
    <div class="form-group">
            <label for="name">Product Name:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
        </div>
        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number"  class="form-control" id="price" name="price" required>
        </div>
        <div class="form-group">
            <label for="quantity">Quantity:</label>
            <input type="number" class="form-control" id="quantity" name="quantity" required>
        </div>
        <div class="form-group">
            <label for="imageFile">Image:</label>
            <input type="file" class="form-control" id="imageFile" name="imageFile" required>
        </div>
        <div class="form-group">
            <label for="category">Category:</label>
            <input type="text" class="form-control" id="category" name="category">
        </div>
        <div class="form-group">
            <label for="brand">Brand:</label>
            <input type="text" class="form-control" id="brand" name="brand">
        </div>
        <button style="background:rgb(255, 147, 2);" type="submit" class="btn btn-primary">Save Product</button>
    </form>
    <h2 style="color: #808080; margin-top: 75px;">
        <i class="fas fa-list-alt"></i> Product List
    </h2>

    <c:if test="${!empty productList}">
        <table class="table table-hover table-responsive-md">
            <thead class="tbl-header">
            <tr>
                <th>ID</th>
                <th>UserName</th>
                <th>Email</th>
                <th>Password</th>
                <th>confirm password</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody id="th-body">
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td><c:out value="${product.id}" /></td>
                    <td><c:out value="${product.username}" /></td>
                    <td><c:out value="${product.email}" /></td>
                    <td><c:out value="${product.password}" /></td>
                    <td><c:out value="${product.confirmPassword} "/></td>
                    <td>
                        <a class="btn btn-danger" href="<c:url value='/deleteProduct?id=${Student.id}'/>" onclick="return confirmdelete()">Delete</a>

                        <a class="btn btn-danger" href="<c:url value='/edit?id=${Student.id}'/>">Edit</a>

                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
<script>
    function confirmDelete() {
        return confirm("Are you sure you want to delete the data");
    }
</script>
</div>

</body>
</html>
