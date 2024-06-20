package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Produit;
import model.LigneCommande;

import dao.LigneCommandeDAO;
import dao.ProduitDAO;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/AjouterAuPanierServlet")
public class AjouterAuPanierServlet extends HttpServlet {
    private ProduitDAO produitDAO;
    private LigneCommandeDAO panierDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        produitDAO = new ProduitDAO();
        panierDAO = new LigneCommandeDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String produitId = request.getParameter("id");
        Produit produit = produitDAO.findById(Integer.parseInt(produitId));

        // Ajouter le produit à l'objet request
        request.setAttribute("produit", produit);

        // Transférer la requête à la JSP
        request.getRequestDispatcher("formpanier.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String produitId = request.getParameter("id");
        
        // Vérifier si l'identifiant du produit n'est pas nul
        if (produitId != null) {
            Produit produit = produitDAO.findById(Integer.parseInt(produitId));

            // Récupérer la quantité et le supplément du formulaire
            int quantite;
            try {
                quantite = Integer.parseInt(request.getParameter("quantite"));
            } catch (NumberFormatException e) {
                // Gérer le cas où la quantité n'est pas un entier valide
                // Par exemple, afficher un message d'erreur et retourner
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Quantité non valide");
                return;
            }
            String supplement = request.getParameter("supplement");

            // Créer un objet Panier avec les détails
            LigneCommande panier = new LigneCommande();
            panier.setProduit(produit);
            panier.setQuantite(quantite);
            panier.setSupplement(supplement);

            // Ajouter le panier à la session
            HttpSession session = request.getSession();
            List<LigneCommande> paniers = (List<LigneCommande>) session.getAttribute("panier");
            if (paniers == null) {
                paniers = new ArrayList<>();
                session.setAttribute("panier", paniers);
            }
            paniers.add(panier);

            // Rediriger vers la page du panier
            response.sendRedirect("panier.jsp");
        } else {
            // Gérer le cas où l'identifiant du produit est manquant
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Identifiant de produit manquant");
        }
    }
}
