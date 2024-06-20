<%@page import="model.User"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Produit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            text-align: center;
            color: #007bff;
        }
        form {
            margin-top: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: bold;
        }
        input[type="text"],
        input[type="number"],
        textarea {
            width: calc(100% - 12px);
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ced4da;
            border-radius: 4px;
            box-sizing: border-box;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
     
        <h2>Ajouter un Pizza</h2>
        <form action="ProduitServlet" method="post">
            <label for="nom">Nom du Produit :</label>
            <input type="text" id="nom" name="nom" required><br>
            <label for="prix">Prix du Produit :</label>
            <input type="text" id="prix" name="prix" required><br>
            <label for="imageUrl">URL de l'image :</label>
            <input type="text" id="imageUrl" name="imageUrl" required><br>
            <label for="ingredients">Ingrédients :</label>
            <textarea id="ingredients" name="ingredients" required></textarea><br>
           
            
            <input type="submit" value="Ajouter">
        </form>
    </div>
</body>
</html>
