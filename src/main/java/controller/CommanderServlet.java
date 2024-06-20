package controller;

import dao.CommandeClientDAO;
import dao.LigneCommandeDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.CommandeClient;
import model.LigneCommande;

import model.Produit;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@WebServlet("/CommanderServlet")
public class CommanderServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();
	    User utilisateur = (User) session.getAttribute("user");

	    if (utilisateur == null) {
	        // Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
	        response.sendRedirect("auth.jsp");
	        return;
	    }

	    String nomUtilisateur = utilisateur.getNom();

	    // Récupération de la liste de paniers depuis la session
	    List<LigneCommande> paniers = (List<LigneCommande>) session.getAttribute("panier");

	    // Vérifiez s'il y a des paniers à traiter
	    if (paniers != null && !paniers.isEmpty()) {
	        // Création de la nouvelle commande client
	        CommandeClient nouvelleCommandeClient = new CommandeClient();
	        nouvelleCommandeClient.setNomUtilisateur(nomUtilisateur);

	        // Enregistrement de la nouvelle commande client en base de données
	        CommandeClientDAO commandeClientDAO = new CommandeClientDAO();
	        commandeClientDAO.create(nouvelleCommandeClient);

	        // Pour chaque panier dans la liste
	        for (LigneCommande panier : paniers) {
	            // Associez le panier à la nouvelle commande
	            panier.setCommandeClient(nouvelleCommandeClient);

	            // Enregistrez le panier en base de données
	            LigneCommandeDAO panierDAO = new LigneCommandeDAO();
	            panierDAO.create(panier);
	        }

	        // Suppression de la liste de paniers de la session
	        session.removeAttribute("panier");

	        // Redirection vers la servlet d'affichage de la commande avec l'ID de la nouvelle commande
	        response.sendRedirect("AfficherCommandeServlet?id=" + nouvelleCommandeClient.getId());
	    } else {
	        // Si aucun panier n'est présent, redirigez l'utilisateur vers une page d'erreur ou une page appropriée
	        response.sendRedirect("error.jsp");
	    }
	}

}
