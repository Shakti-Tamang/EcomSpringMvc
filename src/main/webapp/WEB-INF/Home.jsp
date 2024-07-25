<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/Ecommerse/Css/bootstrap.css">
    <link rel="stylesheet" href="/Ecommerse/Css/bootstrap-grid.css">
    <link rel="stylesheet" href="/Ecommerse/Css/main.css">
    <link rel="stylesheet" href="/Ecommerse/Css/bootstrap-reboot.css">

    <link rel="stylesheet" href="/Ecommerse/Css/utils.css">    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <title>AMIG--A Shopping Website</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light" id="myNav">
    <a class="navbar-brand" href="#" id="logo" >Shakti-Stores</a>
    <button class="navbar-toggler" style="background:#fff;" id="t1" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav m-auto">
            <li class="nav-item active">
                <a class="nav-link" id="n1" href="#" style="border-bottom:1px solid red">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" id="n2" href="#" style="margin-right: 130px">About <span class="sr-only">(current)</span></a>
            </li>


            <button type="button" class="btn btn-outline-warning" style="margin-left: 330px;" data-toggle="modal" data-target="#loginModal" id="btn1">Login</button>
            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#signupModal" id="btn2">Sign Up</button>
        </ul>
    </div>
</nav>

<!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="login">Login Here!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:if test="${not empty message}">
                    <script>
                        window.onload = function() {
                            var message = "${message}";
                            if (message.includes("Access denied")) {
                                alert(message);
                            } else if (message.includes("Invalid email or password")) {
                                alert(message);
                            } else if (message.includes("User does not exist")) {
                                alert(message);
                            }
                        };
                    </script>
                </c:if>
                <form action="LoggedInuserCustomer" method="POST" >
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="firstemail" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="firstpassword" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Log In</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Sign Up Modal -->
<div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signUp">Sign Up Here!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <c:choose>
                    <c:when test="${param.error eq 'exists'}">
                        <script>
                            alert('User already exists. Please try again with a different email.');
                        </script>
                    </c:when>
                    <c:when test="${param.success eq 'true'}">
                        <script>
                            alert('Your account has been created successfully! Now you can enjoy our services.');
                        </script>
                    </c:when>
                </c:choose>
                <form action="saveCustomer" method="POST" onsubmit="return validForm()">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">Confirm Password</label>
                        <input type="password" class="form-control" id="confirm_password" name="confirmPassword" required>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <select class="form-control" id="role" name="role" required>
                            <option value="USER">User</option>
                        </select>

                    </div>
                    <button type="submit" class="btn btn-primary">Sign up</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<div class="container" id="cont">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-aos="flip-up" data-aos-duration="1500">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
        </ol>
        <div class="carousel-inner py-2">
            <div class="carousel-item active">
                <img src="/Ecommerse/imageFront/p2.jpg" height="500px" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/Ecommerse/imageFront/p3.jpg" height="500px" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/Ecommerse/imageFront/k.jpeg" height="500px" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/Ecommerse/imageFront/s.jpg" height="500px" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/Ecommerse/imageFront/m.png" height="500px" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <section>
        <h1 class="text-center" style="color: #ff6600; padding: 50px 0 30px 0; font-family: 'Kaushan Script', cursive;">Trending Items</h1>
        <div class="row">
            <div class="col-md-3">
                <div class="card" data-aos="fade-up" data-aos-duration="1500">
                    <img src="/Ecommerse/imageFront/k.jpeg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Item 1</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card" data-aos="fade-up" data-aos-duration="1500">
                    <img src="/Ecommerse/imageFront/p2.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Item 2</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card" data-aos="fade-up" data-aos-duration="1500">
                    <img src="/Ecommerse/imageFront/s.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Item 3</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card" data-aos="fade-up" data-aos-duration="1500">
                    <img src="/Ecommerse/imageFront/s.jpeg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Item 4</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="/Ecommerse/javascript/bootstrap.bundle.js"></script>
<script src="/Ecommerse/javascript/bootstrap.js"></script>
<script src="/Ecommerse/javascript/jquery.3.6.min.js"></script>
<script src="/Ecommerse/javascript/jquery.min.js"></script>
<script src="/Ecommerse/javascript/popper.min.js"></script>
<script src="/Ecommerse/javascript/bootstrap.min.js"></script>
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
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

<script>
    AOS.init();
</script>
</body>
</html>
