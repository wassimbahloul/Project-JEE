<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.CommandeClient" %>
<%@ page import="model.LigneCommande" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des commandes</title>
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
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .commande {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
            margin-bottom: 20px;
            position: relative;
        }
        .commande-header {
            margin-bottom: 10px;
        }
        .commande-details {
            margin-left: 20px;
        }
        .commande-image {
            max-width: 80px;
            height: auto;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-right: 20px;
        }
        .commande-status {
            position: absolute;
            top: 10px;
            right: 10px;
            
            
            padding: 5px 10px;
            border-radius: 3px;
            font-weight: bold;
        }
        .btn-ready {
            background-color: #28a745;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 130px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Liste des commandes</h1>
    <c:if test="${empty commandes}">
        <p>Aucune commande disponible.</p>
    </c:if>
    <c:if test="${not empty commandes}">
        <ul>
            <c:forEach items="${commandes}" var="commande" varStatus="status">
            
                <li class="commande">
                    <div class="commande-header">
                        <p>ID de la commande : ${commande.id}</p>
                        <c:choose>
						    <c:when test="${commande.etat eq 'Prêt'}">
						        <span class="commande-status" style="background-color: #28a745;">${commande.etat}</span>
						    </c:when>
						    <c:when test="${commande.etat eq 'livree'}">
						        <span class="commande-status" style="background-color: #007bff;">${commande.etat}</span>
						    </c:when>
						    <c:otherwise>
						        <span class="commande-status" style="background-color: #ffc107;">${commande.etat}</span>
						    </c:otherwise>
						</c:choose>
                        <p>Date de la commande : ${commande.date}</p>
                        <p>Nom de l'utilisateur : ${commande.nomUtilisateur}</p>
                    </div>
                    <div class="commande-details">
                        <p>Produits commandés :</p>
                        <ul>
                            <c:forEach items="${lignesCommande[status.index]}" var="ligneCommande">
                                <li>
                                    <img class="commande-image" src="${ligneCommande.produit.imageUrl}" alt="Product Image">
                                    <p>Nom du produit : ${ligneCommande.produit.nom}</p>
                                    <p>Quantité : ${ligneCommande.quantite}</p>
                                           <p>Supplement : ${ligneCommande.supplement}</p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                 <c:if test="${commande.etat ne 'livree' && commande.etat ne 'Prêt'}">
    <form action="ListeCommandesServlet" method="post">
        <input type="hidden" name="commandeId" value="${commande.id}">
        <button class="btn-ready">Prêt</button>
    </form>
</c:if>

    
                </li>
            </c:forEach>
        </ul>
    </c:if>
</div>


</body>
</html>
