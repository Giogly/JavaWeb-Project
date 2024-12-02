package dao.jpa;

import java.time.LocalDate;
import java.util.List;

import com.example.progettoecommerce.model.Ruolo;
import dao.model.UtenteDao;
import jakarta.persistence.*;
import com.example.progettoecommerce.model.User;

public class JpaUtenteDao implements UtenteDao {
	
	private static JpaUtenteDao instance = new JpaUtenteDao();
	
	private JpaUtenteDao() {
		
	}
	
	public static JpaUtenteDao getInstance() {
		return instance;
	}

	@Override
	public List<User> getAll() {
			EntityManager em = JpaDaoFactory.getManager();
			TypedQuery<User> query = em.createQuery("SELECT u FROM User u", User.class);
			return query.getResultList();
	}

	@Override
	public User findUtenteByUsername(String username) {
		try {
			EntityManager em = JpaDaoFactory.getManager();
			//ATTENZIONE SQL INJECTION
			Query q = em.createNativeQuery("select * from Utente where username = '" + username + "'", User.class);
			return (User)q.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public User login(String username, String password) {
		try {
			EntityManager em = JpaDaoFactory.getManager();
			Query q = em.createQuery("select u from User u where username = :username and password = :password");
			q.setParameter("username", username);
			q.setParameter("password", password);
			return (User)q.getSingleResult();
		} catch (NoResultException e) {
			return null;
		}
	}

	@Override
	public void registra(String nome, String cognome, String username, String password, String email, LocalDate dataNascita, String indirizzo) {
		User u = new User(nome,cognome,username,password,email,dataNascita,indirizzo, Ruolo.USER);
		EntityManager em = JpaDaoFactory.getManager();
		EntityTransaction transaction = em.getTransaction();
		transaction.begin();
		em.persist(u);
		transaction.commit();
	}

	@Override
	public User find(long id) {
		EntityManager em = JpaDaoFactory.getManager();
		return em.find(User.class, id);
	}

	@Override
	public void edit(User u) {
		EntityManager em = JpaDaoFactory.getManager();
		em.getTransaction().begin();
		em.merge(u);
		em.getTransaction().commit();
	}

	@Override
	public void delete(int id) {
		EntityManager em = JpaDaoFactory.getManager();
		em.getTransaction().begin();
		User u = em.find(User.class, id);
		em.remove(u);
		em.getTransaction().commit();
	}
}
