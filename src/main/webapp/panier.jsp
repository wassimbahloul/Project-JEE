<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panier</title>
    <!-- Liens vers Bootstrap pour le style -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Panier</h1>
        <table class="table">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Nom du Produit</th>
                    <th>Prix</th>
                    <th>Quantité</th>
                    <th>Supplément</th>
                    <th>Sous-total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${sessionScope.panier}" var="panier">
                    <tr>
                        <td><img src="${panier.produit.imageUrl}" alt="Product Image" style="max-width: 100px;"></td>
                        <td>${panier.produit.nom}</td>
                        <td>${panier.produit.prix}</td>
                        <td>${panier.quantite}</td>
                        <td>${panier.supplement}</td>
                        <td>${panier.produit.prix * panier.quantite}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <form action="CommanderServlet" method="post">
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Commander</button>
            </div>
        </form>
        <div class="text-center mt-3">
            <a href="/projetjsp1/produits" class="btn btn-secondary">Retour aux Produits</a>
        </div>
    </div>
</body>
</html>
