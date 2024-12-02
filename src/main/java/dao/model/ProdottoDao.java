package dao.model;

import com.example.progettoecommerce.model.Product;

import java.util.List;

public interface ProdottoDao {
    List<Product> findAll();
    void save(Product p);
    void edit(Product p);
    Product find(int id);
    void delete(int id);
}
