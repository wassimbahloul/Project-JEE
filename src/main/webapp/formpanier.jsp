<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Formulaire du Panier</title>
    <!-- Liens vers Bootstrap pour le style -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        function calculerPrix() {
            // Récupérer la quantité entrée par l'utilisateur
            var quantite = document.getElementById("quantite").value;
            // Vérifier si la quantité est négative
            if (quantite < 0) {
                alert("La quantité ne peut pas être négative !");
                // Remettre la valeur de la quantité à 0
                document.getElementById("quantite").value = 0;
                // Arrêter l'exécution de la fonction
                return;
            }
            // Récupérer la quantité disponible du produit
            var quantiteDisponible = parseInt(document.getElementById("quantite-disponible").textContent);
            // Vérifier si la quantité dépasse la quantité disponible
            if (quantite > quantiteDisponible) {
                alert("La quantité ne peut pas dépasser la quantité disponible !");
                // Remettre la valeur de la quantité à la quantité disponible
                document.getElementById("quantite").value = quantiteDisponible;
                // Arrêter l'exécution de la fonction
                return;
            }
            // Récupérer le prix unitaire du produit (en euros)
            var prixUnitaire = parseFloat(document.getElementById("prix-unitaire").dataset.prix);
            // Calculer le prix total en multipliant la quantité par le prix unitaire
            var prixTotal = quantite * prixUnitaire;
            // Mettre à jour le contenu de l'élément affichant le prix total
            document.getElementById("prix-total").textContent = prixTotal.toFixed(2) + " €";
        }
    </script>
</head>
<body>
    <div class="container">
        <h1 class="text-center mb-4">Formulaire du Panier</h1>
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <%-- Récupération du produit à partir de l'objet request --%>
                <% model.Produit produit = (model.Produit) request.getAttribute("produit"); %>
                <h4>Nom du Produit: <%= produit.getNom() %></h4>
                <p>Prix du Produit: <%= produit.getPrix() %> €</p>
                
                <%-- Affichage du champ de quantité et mise à jour dynamique du prix --%>
                <form action="AjouterAuPanierServlet" method="post">
                <input type="hidden" name="id" value="<%= produit.getId() %>">
                    <input type="hidden" id="prix-unitaire" data-prix="<%= produit.getPrix() %>">
                    <img src="<%= produit.getImageUrl() %>" alt="Image du produit" class="card-img-top">
                    <div class="form-group">
                        <label for="quantite">Quantité :</label>
                        <input type="number" class="form-control" id="quantite" name="quantite" onchange="calculerPrix()" required>
                    </div>
                    <div class="form-group">
                        <label for="supplement">Supplément :</label>
                        <input type="text" class="form-control" id="supplement" name="supplement">
                    </div>
                    <button type="submit" class="btn btn-primary">commander</button>
                </form>
                <p>Prix Total: <span id="prix-total"><%= produit.getPrix() %> €</span></p>
            </div>
        </div>
    </div>
</body>
</html>
