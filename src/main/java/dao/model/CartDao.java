package dao.model;

import com.example.progettoecommerce.model.Cart;

public interface CartDao {
    Cart find(int id);
    void save(Cart cart);
    void update(Cart cart);
    void delete(int id);
    Cart findByUserId(long userId);
    void saveOrUpdate(Cart cart); // Add this method
}