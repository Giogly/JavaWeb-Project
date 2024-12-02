package dao.jpa;

import com.example.progettoecommerce.model.Cart;
import dao.model.CartDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.NoResultException;
import jakarta.persistence.TypedQuery;

public class JpaCartDao implements CartDao {

    private static JpaCartDao instance = new JpaCartDao();

    private JpaCartDao() {
    }

    public static JpaCartDao getInstance() {
        return instance;
    }

    @Override
    public Cart find(int id) {
        EntityManager em = JpaDaoFactory.getManager();
        return em.find(Cart.class, id);
    }

    @Override
    public void save(Cart cart) {
        EntityManager em = JpaDaoFactory.getManager();
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        em.persist(cart);
        transaction.commit();
    }

    @Override
    public void update(Cart cart) {
        EntityManager em = JpaDaoFactory.getManager();
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        em.merge(cart);
        transaction.commit();
    }

    @Override
    public void delete(int id) {
        EntityManager em = JpaDaoFactory.getManager();
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        Cart cart = em.find(Cart.class, id);
        em.remove(cart);
        transaction.commit();
    }

    @Override
    public Cart findByUserId(long userId) {
        EntityManager em = JpaDaoFactory.getManager();
        try {
            TypedQuery<Cart> query = em.createQuery(
                    "SELECT c FROM Cart c WHERE c.user.id = :userId", Cart.class);
            query.setParameter("userId", userId);
            return query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    @Override
    public void saveOrUpdate(Cart cart) {
        EntityManager em = JpaDaoFactory.getManager();
        EntityTransaction transaction = em.getTransaction();
        transaction.begin();
        if (cart.getId() == 0) {
            em.persist(cart);
        } else {
            em.merge(cart);
        }
        transaction.commit();
    }
}