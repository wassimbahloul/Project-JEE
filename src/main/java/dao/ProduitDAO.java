package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.Produit;
import util.Hibernate;

public class ProduitDAO {

    private SessionFactory sessionFactory;

    public ProduitDAO() {
        sessionFactory = Hibernate.getSessionFactory();
    }

    public Produit findById(int id) {
        Session session = sessionFactory.openSession();
        Produit produit = session.get(Produit.class, id);
        session.close();
        return produit;
    }

    public boolean create(Produit produit) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.persist(produit);
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
        Produit produit = session.get(Produit.class, id);
        boolean success = false;
        if (produit != null) {
            produit.setNom(nom);
            produit.setPrix(prix);
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.persist(produit);
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
        Produit produit = session.get(Produit.class, id);
        boolean success = false;
        if (produit != null) {
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.remove(produit);
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

    public List<Produit> findAll() {
        Session session = sessionFactory.openSession();
        List<Produit> produits = session.createQuery("from Produit", Produit.class).getResultList();
        session.close();
        return produits;
    }
}
	