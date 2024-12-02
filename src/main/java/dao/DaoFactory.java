package dao;

import dao.model.*;
import dao.jpa.JpaDaoFactory;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public abstract class DaoFactory {
	
	public abstract UtenteDao getUtenteDao();
	public abstract ProdottoDao getProdottoDao();
	public abstract CartDao getCartDao();
	public abstract PurchaseDao getPurchaseDao();
	public abstract ProductPurchaseDao getProductPurchaseDao();
	//TODO dichiarazioni degli altri metodi abstract getModelDao()
	
	public static DaoFactory getDaoFactory() {
		//return new JdbcDaoFactory();
		//return new TecnologiaDaoFactory();
		return new JpaDaoFactory();
	}

	protected static EntityManager getManager() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ecommercePU");
		EntityManager manager = factory.createEntityManager();
		return manager;
	}
}
