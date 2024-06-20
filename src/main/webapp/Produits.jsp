<%@page import="model.Produit"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Produits</title>
    <!-- Liens vers Bootstrap pour le style -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <style>
        /* Style pour les cartes */
        .card {
            margin: 20px;
            width: 300px;
            display: inline-block;
            vertical-align: top;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        /* Style pour les boutons Ajouter au Panier */
        .btn-panier {
            width: 100%;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 0;
            padding: 10px;
            cursor: pointer;
        }
        /* Style pour les titres des cartes */
        .card-title {
            font-size: 20px;
            font-weight: bold;
        }
        /* Style pour les images des cartes */
        .card-img-top {
            max-height: 200px;
            object-fit: cover;
        }
        /* Style pour le texte des cartes */
        .card-text {
            font-size: 16px;
            color: #555;
        }
        
        /* Styles spécifiques pour les animations de la carte */
        @property --rotate {
            syntax: "<angle>";
            initial-value: 132deg;
            inherits: false;
        }
        
        :root {
            --card-height: 55vh;
            --card-width: calc(var(--card-height) / 1.5);
        }
        
        body {
            min-height: 100vh;
            background: #ffffff;
            display: flex;
            align-items: center;
            flex-direction: column;
            padding-top: 2rem;
            padding-bottom: 2rem;
            box-sizing: border-box;
        }
        
        .card {
            background: #191c29;
            width: var(--card-width);
            height: var(--card-height);
            padding: 3px;
            position: relative;
            border-radius: 6px;
            justify-content: center;
            align-items: center;
            text-align: center;
            display: flex;
            font-size: 1.5em;
            color: rgb(88 199 250 / 0%);
            cursor: pointer;
            font-family: cursive;
        }
        
        .card:hover {
            color: rgb(88 199 250 / 100%);
            transition: color 1s;
        }
        
        .card:hover:before, .card:hover:after {
            animation: none;
            opacity: 0;
        }
        
        .card::before {
            content: "";
            width: 104%;
            height: 102%;
            border-radius: 8px;
            background-image: linear-gradient(
                var(--rotate)
                , #5ddcff, #3c67e3 43%, #4e00c2);
            position: absolute;
            z-index: -1;
            top: -1%;
            left: -2%;
            animation: spin 2.5s linear infinite;
        }
        
        .card::after {
            position: absolute;
            content: "";
            top: calc(var(--card-height) / 6);
            left: 0;
            right: 0;
            z-index: -1;
            height: 100%;
            width: 100%;
            margin: 0 auto;
            transform: scale(0.8);
            filter: blur(calc(var(--card-height) / 6));
            background-image: linear-gradient(
                var(--rotate)
                , #5ddcff, #3c67e3 43%, #4e00c2);
            opacity: 1;
            transition: opacity .5s;
            animation: spin 2.5s linear infinite;
        }
        
        @keyframes spin {
            0% {
                --rotate: 0deg;
            }
            100% {
                --rotate: 360deg;
            }
        }
        
        a {
            color: #212534;
            text-decoration: none;
            font-family: sans-serif;
            font-weight: bold;
            margin-top: 2rem;
        }
        .text-center {
   
    color: blue;
}
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Liste des Produits</h1>
        <div class="row">
            <% 
            List<Produit> produits = (List<Produit>)request.getAttribute("produits");
            User u = (User)session.getAttribute("user");
            if(produits != null) {
                for (Produit produit : produits) {
            %>
            <div class="col-md-4">
                <div class="card">
                    <img src="<%= produit.getImageUrl() %>" alt="Image du produit" class="card-img-top">
                    <div class="card-body">
                        <h5 class="card-title"><%= produit.getNom() %></h5>
                        <p class="card-text">Prix: <%= produit.getPrix() %> €</p>
                        <p class="card-text">Ingrédients: <%= produit.getIngredients() %></p>
                        
                        <!-- Bouton Ajouter au Panier avec lien vers formpenier et envoi de l'ID du produit -->
                      <form action="AjouterAuPanierServlet" method="get">
    <!-- Autres champs du formulaire -->
    <input type="hidden" name="id" value="<%= produit.getId() %>">
    <button type="submit" class="btn btn-primary btn-panier" >
						    
						        Ajouter au Panier
						    
						</button>
</form>


                    </div>
                </div>
            </div>
            <% 
                }
            }
            %>
        </div>
    </div>
</body>
</html>
