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
            background-color: #007bff;
            color: #333;
            padding: 5px 10px;
            border-radius: 3px;
            font-weight: bold;
        }
        .btn-ready {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 5px 10px;
            border-radius: 3px;
            cursor: pointer;
            position: absolute;
            top: 10px;
            right: 130px;
        }
        .btn-livrer {
    background-color: #007bff; /* Couleur de fond */
    color: #fff; /* Couleur du texte */
    border: none; /* Supprimer la bordure */
    padding: 8px 16px; /* Ajouter un peu de rembourrage */
    border-radius: 4px; /* Ajouter des coins arrondis */
    cursor: pointer; /* Ajouter un curseur pointer */
    transition: background-color 0.3s; /* Ajouter une transition douce */
}

.btn-livrer:hover {
    background-color: #0056b3; /* Changer la couleur de fond au survol */
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
                        <p><span class="commande-status">${commande.etat}</span></p>
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
                                    <p>supplement : ${ligneCommande.supplement}</p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                 <form action="CommandelivreurServlet" method="post">
    <input type="hidden" name="commandeId" value="${commande.id}">
    <button type="submit"class="btn-livrer">Marquer comme livrée</button>
</form>

    
                </li>
            </c:forEach>
        </ul>
    </c:if>
</div>
<script>
    function changeStatus(button) {
        var statusElement = button.parentNode.querySelector('.commande-status');
        statusElement.textContent = 'Prêt';
        statusElement.style.backgroundColor = '#28a745';
    }
</script>
</body>
</html>
