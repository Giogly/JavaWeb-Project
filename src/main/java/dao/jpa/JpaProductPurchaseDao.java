package dao.jpa;

import dao.model.ProductPurchaseDao;
import com.example.progettoecommerce.model.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;

public class JpaProductPurchaseDao implements ProductPurchaseDao {
    private EntityManager entityManager;

    public JpaProductPurchaseDao() {
        this.entityManager = JpaDaoFactory.getManager();
    }

    @Override
    public List<Product> findByPurchaseId(Long purchaseId) {
        TypedQuery<Product> query = entityManager.createQuery(
                "SELECT pp.product FROM purchase_product pp WHERE pp.purchase.id = :purchaseId", Product.class);
        query.setParameter("purchaseId", purchaseId);
        return query.getResultList();
    }

    // Other methods...
}