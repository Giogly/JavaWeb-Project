package dao.jpa;

import dao.DaoFactory;
import dao.model.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaDaoFactory extends DaoFactory {
	private static final EntityManagerFactory entityManagerFactory;

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		entityManagerFactory = Persistence.createEntityManagerFactory("ecommercePU");
	}

	@Override
	public UtenteDao getUtenteDao() {
		return JpaUtenteDao.getInstance();
	}

	@Override
	public ProdottoDao getProdottoDao() {
		return JpaProdottoDao.getInstance();
	}

	@Override
	public CartDao getCartDao() {
		return JpaCartDao.getInstance();
	}

	@Override
	public PurchaseDao getPurchaseDao() {
		return JpaPurchaseDao.getInstance();
	}

	public static EntityManager getManager() {
		return entityManagerFactory.createEntityManager();
	}

	public ProductPurchaseDao getProductPurchaseDao() {
		return new dao.jpa.JpaProductPurchaseDao();
	}
}