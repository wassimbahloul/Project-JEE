<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Register</title>
<style>
    /* Votre style CSS ici */
    /* Styles */
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-left: 250px;
    }
   
    .title {
      font-size: 50px;
      font-weight: bold;
      color: #24e437;
      font-family: "Arial", sans-serif;
    }

    .description {
      font-size: 30px;
      color: #000000;
    }

    .right-container {
      flex-grow: 1;
      max-width: 400px;
      margin: 150px auto; /* Adjust top and bottom margins for vertical positioning */
      padding: 30px;
      border: 1px solid #dddfe2;
      border-radius: 8px;
      background-color: #fff;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-input {
      width: 94%;
      padding: 10px;
      border: 1px solid #dddfe2;
      border-radius: 5px;
    }

    .login-button {
      width: 100%;
      padding: 12px;
      background-color: dodgerblue;
      color: #fff;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
      margin-bottom: 10px;
    }

    .login-button:hover {
      background-color: dodgerblue;
    }

    .form-links {
      margin-top: 10px;
      text-align: center;
    }

    .form-link {
      margin-top: 10px;
      text-align: center;
    }

    .form-links a {
      color: dodgerblue;
      text-decoration: none;
    }

    .form-links a:hover {
      text-decoration: underline;
    }

    .line-separator {
      margin: 20px 0;
      border-bottom: 1px solid #ccc;
    }

    /* Style for the error message container */
    .error-container {
      background-color: #f8d7da;
      color: #721c24;
      
      padding: 10px;
      margin-bottom: 10px;
      border-radius: 5px;
    }

    /* Style for the error message */
    .error-message {
      font-weight: bold;
    }
</style>

</head>

<body>

		<form action="inscriptionController" method="post" class="right-container">
		<h1>Register</h1>
    <div class="form-group">
        <label for="nom">Nom:</label>
        <input type="text" id="nom" name="nom" class="form-input">
    </div>
    <div class="form-group">
        <label for="prenom">Prénom:</label>
        <input type="text" id="prenom" name="prenom" class="form-input">
    </div>
    <div class="form-group">
        <label for="login">Login:</label>
        <input type="text" id="login" name="login" class="form-input">
    </div>
    <div class="form-group">
        <label for="pass">Mot de passe:</label>
        <input type="password" id="pass" name="pass" class="form-input">
    </div>
    <button type="submit" class="login-button">S'inscrire</button>
</form>




</body>

</html>

