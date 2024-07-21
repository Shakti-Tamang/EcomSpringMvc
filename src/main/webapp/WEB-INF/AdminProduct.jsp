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
            width: 100%;
            max-width: 1200px;
            margin: 20px;
            margin-top: 80px;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .product-image {
            max-width: 150px;
            max-height: 150px;
        }
        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 10px;
            }
        }
        @media (max-width: 576px) {
            .product-image {
                max-width: 100px;
                max-height: 100px;
            }
        }
        #message {
            margin-bottom: 20px;
        }
    </style>
    <jsp:include page="AdminGet.jsp"/>
</head>
<body>
<div class="container">
    <h2 style="color: #808080;">
        <i class="fas fa-plus-circle"></i> Add New Product
    </h2>
    <div id="message">
        <c:if test="${not empty message}">
            <h3 style="color:red">${message}</h3>
        </c:if>
        <c:if test="${not empty filesuccess}">
            <h3 style="color:green">${filesuccess}</h3>
        </c:if>
    </div>
    <form id="productForm" enctype="multipart/form-data">
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
            <input type="number" class="form-control" id="price" name="price" required>
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
    <div class="table-responsive">
        <table class="table table-hover table-responsive-md">
            <thead class="tbl-header">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Description</th>
                <th>Image</th>
                <th>Category</th>
                <th>Brand</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Delete</th>
                <th>Edit</th>
            </tr>
            </thead>
            <tbody id="productList">
            <c:forEach items="${productList}" var="product">
                <tr>
                    <td><c:out value="${product.productId}" /></td>
                    <td><c:out value="${product.name}" /></td>
                    <td><c:out value="${product.description}"/></td>
                    <td><img src="${pageContext.request.contextPath}${product.imageUrl}" class="product-image" alt="Product Image"/></td>
                    <td><c:out value="${product.category}"/></td>
                    <td><c:out value="${product.brand}"/></td>
                    <td><c:out value="${product.quantity}"/></td>
                    <td><c:out value="${product.price}"/></td>
                    <td>
                        <a class="btn btn-danger" style="background:rgb(255, 147, 2);" href="<c:url value='/deleteProduct?id=${product.productId}'/>" onclick="return confirmDelete()">Delete</a>
                    </td>
                    <td>
                        <a class="btn btn-danger" style="background:rgb(255, 147, 2);" href="<c:url value='/edit?id=${product.productId}'/>">Edit</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script>
    // Define context path for JavaScript
    var contextPath = '${pageContext.request.contextPath}';

    document.getElementById('productForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the form from submitting the traditional way

        var formData = new FormData(this);

        fetch(contextPath + '/saveProduct', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                var messageElement = document.getElementById('message');
                messageElement.innerHTML = '';

                if (data.status === 'success') {
                    messageElement.innerHTML = '<h3 style="color:green">' + data.message + '</h3>';
                    var productListElement = document.getElementById('productList');
                    productListElement.innerHTML = '';

                    data.productList.forEach(function(product) {
                        var row = '<tr>' +
                            '<td>' + product.productId+ '</td>' +
                            '<td>' + product.name + '</td>' +
                            '<td>' + product.description + '</td>' +
                            '<td><img src="' + contextPath + encodeURIComponent(product.imageUrl) + '" class="product-image" alt="Product Image"/></td>' +
                            '<td>' + product.category + '</td>' +
                            '<td>' + product.brand + '</td>' +
                            '<td>' + product.quantity + '</td>' +
                            '<td>' + product.price + '</td>' +
                            '<td><a class="btn btn-danger" style="background:rgb(255, 147, 2);" href="' + contextPath + '/deleteProduct?id=' + product.productId + '" onclick="return confirmDelete()">Delete</a></td>' +
                            '<td><a class="btn btn-danger" style="background:rgb(255, 147, 2);" href="' + contextPath + '/edit?id=' + product.productId + '">Edit</a></td>' +
                            '</tr>';
                        productListElement.insertAdjacentHTML('beforeend', row);
                    });

                    document.getElementById('productForm').reset(); // Clear the form
                } else {
                    messageElement.innerHTML = '<h3 style="color:red">' + data.message + '</h3>';
                }
            })
            .catch(error => console.error('Error:', error));
    });

    function confirmDelete() {
        return confirm('Are you sure you want to delete this product?');
    }
</script>
</body>
</html>
