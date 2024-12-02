package dao.model;

import java.time.LocalDate;
import java.util.List;

import com.example.progettoecommerce.model.Product;
import com.example.progettoecommerce.model.User;

public interface UtenteDao {
	
	//dichiaro i metodi astratti per eseguire operazioni sul database inerenti all'Utente
	List<User> getAll();
	User findUtenteByUsername(String username);
	User login (String username, String password);
	void registra (String nome, String cognome, String username, String password, String email, LocalDate dataNascita, String indirizzo);
	//eventuali ulteriori metodi astratti per interagire con il DB
	User find(long id);
	void edit(User u);
	void delete(int id);

}
