package controller;

import java.io.IOException;
import java.util.List;

import dao.ProduitDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Produit;

@WebServlet("/produits")
public class ProduitServlet extends HttpServlet {
    private ProduitDAO produitDAO;

    public void init() {
        produitDAO = new ProduitDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Produit> produits = produitDAO.findAll();
        request.setAttribute("produits", produits);
        request.getRequestDispatcher("/Produits.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        double prix = Double.parseDouble(request.getParameter("prix"));
        String imageUrl = request.getParameter("imageUrl");
        String ingredients = request.getParameter("ingredients");
       

        Produit nouveauProduit = new Produit(nom, prix, imageUrl, ingredients);
        produitDAO.create(nouveauProduit);

        response.sendRedirect(request.getContextPath() + "/produits");
    }
}
