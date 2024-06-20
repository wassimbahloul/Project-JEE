package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import jakarta.persistence.TypedQuery;
import model.LigneCommande;
import util.Hibernate;

public class LigneCommandeDAO {

    private SessionFactory sessionFactory;

    public LigneCommandeDAO() {
        sessionFactory = Hibernate.getSessionFactory();
    }

    public LigneCommande findById(int id) {
        Session session = sessionFactory.openSession();
        LigneCommande ligneCommande = session.get(LigneCommande.class, id);
        session.close();
        return ligneCommande;
    }

    public List<LigneCommande> findByCommandeId(int commandeId) {
        Session session = sessionFactory.openSession();
        String jpql = "SELECT p FROM LigneCommande p WHERE p.commandeClient.id = :commandeId";
        TypedQuery<LigneCommande> query = session.createQuery(jpql, LigneCommande.class);
        query.setParameter("commandeId", commandeId);
        List<LigneCommande> paniers = query.getResultList();
        session.close();
        return paniers;
    }

    public boolean create(LigneCommande ligneCommande) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.persist(ligneCommande);
            tx.commit();
            success = true;
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            session.close();
        }
        return success;
    }

    public boolean update(int id, String nom, double prix) {
        Session session = sessionFactory.openSession();
        LigneCommande ligneCommande = session.get(LigneCommande.class, id);
        boolean success = false;
        if (ligneCommande != null) {
        	ligneCommande.getProduit().setNom(nom);
        	ligneCommande.getProduit().setPrix(prix);
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.persist(ligneCommande);
                tx.commit();
                success = true;
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                throw e;
            } finally {
                session.close();
            }
        }
        return success;
    }

    public boolean delete(int id) {
        Session session = sessionFactory.openSession();
        LigneCommande panier = session.get(LigneCommande.class, id);
        boolean success = false;
        if (panier != null) {
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.remove(panier);
                tx.commit();
                success = true;
            } catch (Exception e) {
                if (tx != null) tx.rollback();
                throw e;
            } finally {
                session.close();
            }
        }
        return success;
    }

    public List<LigneCommande> findAll() {
        Session session = sessionFactory.openSession();
        List<LigneCommande> paniers = session.createQuery("from ligneCommande", LigneCommande.class).getResultList();
        session.close();
        return paniers;
    }

    public void update(LigneCommande ligneCommande) {
        // TODO Auto-generated method stub
    }

	public List<LigneCommande> findByIdCommande(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}
