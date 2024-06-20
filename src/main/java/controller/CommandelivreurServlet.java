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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CommandelivreurServlet")
public class CommandelivreurServlet extends HttpServlet {

    private LigneCommandeDAO ligneCommandeDAO;
    private CommandeClientDAO commandeClientDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        ligneCommandeDAO = new LigneCommandeDAO();
        commandeClientDAO = new CommandeClientDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<CommandeClient> commandes = commandeClientDAO.findAll();
        List<List<LigneCommande>> lignesCommande = new ArrayList<>();

        // Créer une liste pour stocker les commandes ayant un état "prêt"
        List<CommandeClient> commandesPretes = new ArrayList<>();

        for (CommandeClient commande : commandes) {
            if ("Prêt".equals(commande.getEtat())) { // Vérifier si l'état est "prêt"
                commandesPretes.add(commande);
                int commandeId = commande.getId();
                List<LigneCommande> lignes = ligneCommandeDAO.findByCommandeId(commandeId);
                lignesCommande.add(lignes);
            }
        }

        request.setAttribute("commandes", commandesPretes); // Utiliser la liste filtrée
        request.setAttribute("lignesCommande", lignesCommande);
        RequestDispatcher dispatcher = request.getRequestDispatcher("commandeslivreur.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer l'ID de la commande à partir des paramètres de la requête
        int commandeId = Integer.parseInt(request.getParameter("commandeId"));

        // Récupérer la commande correspondante depuis la base de données
        CommandeClientDAO commandeClientDAO = new CommandeClientDAO();
        CommandeClient commande = commandeClientDAO.findById(commandeId);

        // Vérifier si la commande existe
        if (commande != null) {
            // Mettre à jour l'état de la commande
            commande.setEtat("livree");

            // Mettre à jour la commande dans la base de données
            commandeClientDAO.update(commande);
            


            // Rediriger vers la servlet ListeCommandesServlet
            response.sendRedirect(request.getContextPath() + "/CommandelivreurServlet");
        } else {
            // Gérer le cas où la commande n'existe pas
            response.getWriter().println("La commande avec l'ID " + commandeId + " n'existe pas.");
        }
    }

}
