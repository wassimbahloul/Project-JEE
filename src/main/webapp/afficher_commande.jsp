<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.CommandeClient" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Détails de la commande</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            color: #333;
        }
        p {
            margin-bottom: 10px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin-bottom: 10px;
        }
        img {
            max-width: 100px;
            height: auto;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        a {
    text-decoration: none;
    color: #fff;
    background-color: #333;
    padding: 10px 20px;
    border-radius: 5px;
}

a:hover {
    background-color: #555;
}
        
    </style>
</head>
<body>
<div class="container">
	<a href="/projetjsp1/auth.jsp" style="float: right;">Log out</a>
    <h1>Détails de la commande</h1>
    <c:if test="${empty commande}">
        <p>La commande demandée n'existe pas.</p>
    </c:if>
    <c:if test="${not empty commande}">
        <p>ID de la commande : ${commande.id}</p>
        <p>État de la commande : ${commande.etat}</p>
        <p>Date de la commande : ${commande.date}</p>
        <p>Nom de l'utilisateur : ${commande.nomUtilisateur}</p>

        <!-- Afficher les détails des produits de la commande -->
        <h2>Produits commandés :</h2>
        <c:if test="${empty commande.paniers}">
            <p>Aucun produit commandé.</p>
        </c:if>
        <c:if test="${not empty commande.paniers}">
            <table>
                <tr>
                    <th>Image</th>
                    <th>Nom du produit</th>
                    <th>Prix</th>
                    <th>Quantité</th>
                    <th>Supplément</th>
                    <th>Total</th>
                </tr>
                <c:forEach items="${commande.paniers}" var="panier">
                    <tr>
                        <td><img src="${panier.produit.imageUrl}" alt="Product Image"></td>
                        <td>${panier.produit.nom}</td>
                        <td>${panier.produit.prix}</td>
                        <td>${panier.quantite}</td>
                        <td>${panier.supplement}</td>
                        <td>${panier.produit.prix * panier.quantite}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </c:if>
</div>
</body>
</html>
