package dao.model;

import com.example.progettoecommerce.model.Product;
import java.util.List;

public interface ProductPurchaseDao {
    List<Product> findByPurchaseId(Long purchaseId);
}