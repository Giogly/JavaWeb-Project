package com.example.progettoecommerce.model;


import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.List;

@Entity
//annotation per creare una NamedQuery, ovvero una query salvata con un nome, così che sia di facile accesso
@NamedQuery(name="getAllUtenti", query = "select u from User u")
public class User {
	
	//annotation per mappare la Primary Key
	@Id
	//annotation per impostare il tipo di generazione della PK. IDENTITY = autoincrement
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private long id;
	
	//annotation per andare a parametrizzare/configurare la colonna
	@Column (nullable = false)
	private String nome;
	
	@Column (nullable = false)
	private String cognome;
	
	@Column (nullable = false, unique = true)
	private String username;
	
	@Column (nullable = false)
	private String password;

	@Column (nullable = false)
	private String email;

	@Column (nullable = false)
	private LocalDate dataNascita;

	@Column (nullable = false)
	private String indirizzo;

	@Column(nullable = false)
	private boolean isAdmin = false;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private Ruolo ruolo;

	@OneToOne(mappedBy = "user", cascade = CascadeType.ALL)
	private Cart cart;

	@OneToMany(mappedBy = "user", cascade = CascadeType.ALL)
	private List<Purchase> orders;
	
	public User() {
		
	}

	public User(String nome, String cognome, String username, String password, String email, LocalDate dataNascita, String indirizzo,Ruolo ruolo) {
		super();
		this.nome = nome;
		this.cognome = cognome;
		this.username = username;
		this.password = password;
		this.email = email;
		this.dataNascita = dataNascita;
		this.indirizzo = indirizzo;
		this.ruolo = ruolo;
	}


	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public LocalDate getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(LocalDate dataNascita) {
		this.dataNascita = dataNascita;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public boolean isAdmin() {
		return isAdmin;
	}

	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public boolean getisAdmin() {
		return isAdmin;
	}

	public Ruolo getRuolo() {
		return ruolo;
	}

	public void setRuolo(Ruolo ruolo) {
		this.ruolo = ruolo;
	}




}
