package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import model.CommandeClient;
import util.Hibernate;

import jakarta.persistence.OneToMany;

public class CommandeClientDAO {

    private SessionFactory sessionFactory;

    public CommandeClientDAO() {
        sessionFactory = Hibernate.getSessionFactory();
    }

    public CommandeClient findById(int id) {
        Session session = sessionFactory.openSession();
        CommandeClient commandeClient = session.get(CommandeClient.class, id);
        session.close();
        return commandeClient;
    }

    public boolean create(CommandeClient commandeClient) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.persist(commandeClient);
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

    public boolean update(CommandeClient commandeClient) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.update(commandeClient);
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

    public boolean delete(CommandeClient commandeClient) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        boolean success = false;
        try {
            tx = session.beginTransaction();
            session.delete(commandeClient);
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

    public List<CommandeClient> findAll() {
        Session session = sessionFactory.openSession();
        List<CommandeClient> commandeClients = session.createQuery("from CommandeClient", CommandeClient.class).getResultList();
        session.close();
        return commandeClients;
    }

	public void setSession(jakarta.websocket.Session commandeSession) {
		// TODO Auto-generated method stub
		
	}
}
