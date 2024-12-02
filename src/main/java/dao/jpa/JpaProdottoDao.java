package dao.jpa;

import com.example.progettoecommerce.model.Product;
import dao.model.ProdottoDao;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class JpaProdottoDao implements ProdottoDao {
    private static JpaProdottoDao instance = new JpaProdottoDao();

    public static JpaProdottoDao getInstance() {
        return instance;
    }
    public JpaProdottoDao() {
    }

    @Override
    public List<Product> findAll() {
        EntityManager em = JpaDaoFactory.getManager();
        TypedQuery<Product> query = em.createQuery("SELECT p FROM Product p", Product.class);
        return query.getResultList();
    }

    @Override
    public void save(Product p) {
        EntityManager em = JpaDaoFactory.getManager();
        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
    }

    @Override
    public void edit(Product p) {
        EntityManager em = JpaDaoFactory.getManager();
        em.getTransaction().begin();
        em.merge(p);
        em.getTransaction().commit();
    }

    @Override
    public Product find(int id) {
        EntityManager em = JpaDaoFactory.getManager();
        return em.find(Product.class, id);
    }

    @Override
    public void delete(int id) {
        EntityManager em = JpaDaoFactory.getManager();
        try {
            em.getTransaction().begin();

            // Remove references to the product in the cart_product table
            em.createNativeQuery("DELETE FROM cart_product WHERE product_id = :productId")
                    .setParameter("productId", id)
                    .executeUpdate();

            // Remove references to the product in the purchase_product table
            em.createNativeQuery("DELETE FROM purchase_product WHERE id_product = :productId")
                    .setParameter("productId", id)
                    .executeUpdate();

            // Now delete the product
            Product p = em.find(Product.class, id);
            if (p != null) {
                em.remove(p);
            }

            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw new RuntimeException("Failed to delete product with id " + id, e);
        } finally {
            em.close();
        }
    }

}