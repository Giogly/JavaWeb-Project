package com.example.progettoecommerce.model;

import jakarta.persistence.*;
import java.math.BigInteger;

import java.util.List;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private long id;
    @Column(nullable = false)
    private String nome;

    @Column(nullable = false)
    private String marca;

    @Column(nullable = false)
    private double prezzo;

    @Column(nullable = false, columnDefinition = "LONGTEXT")
    private String immagine;

    @Column(nullable = false)
    private double peso;

    @Column(nullable = false, columnDefinition = "LONGTEXT")
    private String ingredienti;

    @Column(nullable = false)
    private BigInteger quantita;

    @ManyToMany(mappedBy = "products")
    private List<Purchase> orders;

    public Product(String nome, String marca, double prezzo, String immagine, double peso, String ingredienti, BigInteger quantita) {
        this.nome = nome;
        this.marca = marca;
        this.prezzo = prezzo;
        this.immagine = immagine;
        this.peso = peso;
        this.ingredienti = ingredienti;
        this.quantita = quantita;
    }

    public Product() {
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

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public String getImmagine() {
        return immagine;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public double getPeso() {
        return peso;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public String getIngredienti() {
        return ingredienti;
    }

    public void setIngredienti(String ingredienti) {
        this.ingredienti = ingredienti;
    }

    public BigInteger getQuantita() {
        return quantita;
    }

    public void setQuantita(BigInteger quantita) {
        this.quantita = quantita;
    }
}
