<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Authentification</title>
<!-- Inclure Bootstrap CSS -->
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background-color: #f0f2f5;
        margin: 0;
    }
    .bg-image {
        background-image: url('https://static.vecteezy.com/system/resources/previews/000/294/962/non_2x/a-pizza-shop-on-white-background-vector.jpg');
        height: 300px;
        background-size: cover;
        background-position: center;
        width: 100%;
        margin: 57px 0 -50px 9px;
        border-top-left-radius: 15px;
        border-top-right-radius: 15px;
    }
    .card {
        width: 50%;
        max-width: 500px;
        margin-top: -50px;
        backdrop-filter: blur(30px);
        border-radius: 15px;
        border: 1px solid #dddfe2;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }
    .card-body {
        padding: 1rem;
    }
    .btn-primary {
        background-color: #007bff;
        border: none;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
    .form-outline {
        margin-bottom: 20px;
    }
    .form-outline label {
        margin-top: 10px;
    }
    .form-check-label {
        font-size: 0.9em;
    }
</style>
</head>
<body>

<%  
    String m = (String)request.getAttribute("message");
    if (m != null)
        out.print("<span style='color:red'>" + m + "</span><br><br>");
%>

<!-- Section: Design Block -->
<section class="text-center w-100">
  <div class="card mx-auto">
    <div class="bg-image"></div>
    <div class="card-body py-5 px-md-5">

      <div class="row d-flex justify-content-center">
        <div class="col-lg-10">
          
          <form action='Auth' method='get'>
            <!-- Login input -->
            <div class="form-outline">
              <label class="form-label" for="login">Login</label>
              <input type="text" id="login" name="login" class="form-control" />
            </div>

            <!-- Password input -->
            <div class="form-outline">
              <label class="form-label" for="pass">Password</label>
              <input type="password" id="pass" name="pass" class="form-control" />
            </div>

            <!-- Role select -->
            <div class="form-outline">
              <label for="role" class="form-label">Rôle</label>
              <select id="role" name="role" class="form-control">
                <option value="chefcuisinier">Chef Cuisinier</option>
                <option value="admin">Admin</option>
                <option value="livreur">Livreur</option>
                <option value="user">Utilisateur</option>
              </select>
            </div>

            <!-- Submit button -->
            <button type="submit" class="btn btn-primary btn-block mb-4">Login</button>

            <!-- Register link -->
            <div class="form-links">
              <a href="inscription.jsp">Inscription</a>
            </div>

            <!-- Social login buttons -->
            <div class="text-center">
              <p>or login with:</p>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-facebook-f"></i>
              </button>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-google"></i>
              </button>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-twitter"></i>
              </button>
              <button type="button" class="btn btn-link btn-floating mx-1">
                <i class="fab fa-github"></i>
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Section: Design Block -->

<!-- Inclure Bootstrap JS et les dépendances -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- Inclure Font Awesome pour les icônes -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</body>
</html>
