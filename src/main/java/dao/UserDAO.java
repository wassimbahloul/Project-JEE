package dao;

import java.util.List;
import model.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.Hibernate;

public class UserDAO {

	SessionFactory sessionFactory;

	public UserDAO() {

		sessionFactory = Hibernate.getSessionFactory();

	}
	public List<User> findAll() {
	    Session session = sessionFactory.openSession();
	    List<User> results = session.createQuery("from User", User.class).getResultList();
	    session.close();
	    return results;
	}

	public User findById(long id) {
		Session session = sessionFactory.openSession();
		User p = session.get(User.class, id);
		session.close();
		return p;

	}
	public boolean create(User p) {

		Session session=sessionFactory.openSession();
		Transaction tx=null;
		boolean success = false;
		try {

		tx = session.beginTransaction();
		session.persist(p);
		tx.commit();
		success=true;

		}
		catch (Exception e) { if (tx!=null) tx.rollback(); throw e; }
		finally { session.close(); }
		return success;

		}
	public boolean update(Long id, String nom, String prenom) {
		Session session=sessionFactory.openSession();
		User p=session.get(User.class, id);
		boolean success = false;
		if(p!=null) {

		p.setNom(nom);
		p.setPrenom(prenom);
		Transaction tx=null;
		try {

		tx = session.beginTransaction();
		session.persist(p);
		tx.commit();
		success=true;

		} catch (Exception e) { if (tx!=null) tx.rollback(); throw e; }
		finally { session.close(); }

		} return success;
		}
	
	public boolean delete(long id) {
		Session session=sessionFactory.openSession();
		User p=session.get(User.class, id);
		boolean success = false;
		if(p!=null) {
		Transaction tx=null;
		try {
		tx = session.beginTransaction();
		session.remove(p);
		tx.commit();
		success=true;
		}
		catch (Exception e) { if (tx!=null) tx.rollback(); throw e; }
		finally { session.close(); }
		}
		return success;
		}
	

}