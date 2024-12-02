// JpaPurchaseDao.java
package dao.jpa;

import com.example.progettoecommerce.model.Purchase;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class JpaPurchaseDao implements dao.model.PurchaseDao {
    private static JpaPurchaseDao instance = new JpaPurchaseDao();

    private JpaPurchaseDao() {
    }

    public static JpaPurchaseDao getInstance() {
        return instance;
    }

    @Override
    public void save(Purchase purchase) {
        EntityManager em = JpaDaoFactory.getManager();
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        em.persist(purchase);
        transaction.commit();
    }


}