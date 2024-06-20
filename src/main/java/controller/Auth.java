package controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.User;
import dao.UserDAO;

@WebServlet("/auth")
public class Auth extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public Auth() {
        super();
        userDAO = new UserDAO();
    }

 // Importez les classes nécessaires

 // Importez les classes nécessaires

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        String l = request.getParameter("login");
        String p = request.getParameter("pass");
        String role = request.getParameter("role");

        // Vérification du rôle et redirection en conséquence
        if ("chefcuisinier".equals(l) && "chef".equals(p) && "chefcuisinier".equals(role)) {
            response.sendRedirect(request.getContextPath() + "/ListeCommandesServlet");
        } else if ("admin".equals(l) && "admin".equals(p) && "admin".equals(role)) {
            response.sendRedirect(request.getContextPath() + "/AfficheUser.jsp");
        } else if ("livreur".equals(l) && "livreur".equals(p) && "livreur".equals(role)) {
            response.sendRedirect(request.getContextPath() + "/CommandelivreurServlet");
        } else if ("user".equals(role)) {
            // Vérifiez les informations d'authentification dans la base de données
            UserDAO userDAO = new UserDAO();
            List<User> users = userDAO.findAll();
            boolean userFound = false;
            User authenticatedUser = null;
            
            // Parcourir tous les utilisateurs de la base de données pour trouver une correspondance
            for (User user : users) {
                if (user.getLogin().equals(l) && user.getPass().equals(p)) {
                    userFound = true;
                    authenticatedUser = user;
                    break;
                }
            }
            
            // Redirection en fonction du résultat de la vérification
            if (userFound) {
                // Ajouter l'utilisateur connecté à la session
                HttpSession session = request.getSession();
                session.setAttribute("user", authenticatedUser);
                response.sendRedirect(request.getContextPath() + "/ProduitServlet");
            } else {
                // Si les informations d'identification ne correspondent à aucun utilisateur, redirigez vers une page d'erreur ou auth.jsp
                // Exemple : 
                response.sendRedirect(request.getContextPath() + "/auth.jsp");
            }
        } else {
            // Afficher une alerte et un message d'erreur dans la page
            out.println("<script>alert('Le rôle spécifié n'est pas valide !');</script>");
            out.println("<p>Le rôle spécifié n'est pas valide.</p>");
            // Redirection vers la page d'authentification
            response.sendRedirect(request.getContextPath() + "/auth.jsp");
        }

    }



}
