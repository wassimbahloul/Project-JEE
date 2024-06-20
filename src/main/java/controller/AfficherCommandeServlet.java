package controller;

import dao.CommandeClientDAO;
import dao.LigneCommandeDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.CommandeClient;
import model.LigneCommande;

import java.io.IOException;
import java.util.List;

@WebServlet("/AfficherCommandeServlet")
public class AfficherCommandeServlet extends HttpServlet {
    private LigneCommandeDAO panierDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        panierDAO = new LigneCommandeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer l'ID de la commande à partir de l'URL
        int commandeId = Integer.parseInt(request.getParameter("id"));

        // Récupérer la commande correspondante depuis la base de données
        CommandeClientDAO commandeClientDAO = new CommandeClientDAO();
        CommandeClient commande = commandeClientDAO.findById(commandeId);

        if (commande != null) {
            // Récupérer les paniers associés à cette commande en utilisant findByCommandeId
            List<LigneCommande> paniers = panierDAO.findByCommandeId(commandeId);

            // Passer la commande et la liste des paniers à la page JSP
            request.setAttribute("commande", commande);
            request.setAttribute("paniers", paniers);

            // Rediriger vers la page JSP pour affichage
            RequestDispatcher dispatcher = request.getRequestDispatcher("afficher_commande.jsp");
            dispatcher.forward(request, response);
        } else {
            // Gérer le cas où la commande n'existe pas
            response.getWriter().println("La commande avec l'ID " + commandeId + " n'existe pas.");
        }
    }
}
