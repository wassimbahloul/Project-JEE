package model;

import jakarta.persistence.*;

@Entity
@Table(name = "Produit")
public class Produit {
    @Id @GeneratedValue
    @Column(name = "id")
    private int id;
    
    @Column(name = "nom")
    private String nom;
    
    @Column(name = "prix")
    private double prix;
    
    @Column(name = "image_url")
    private String imageUrl; // URL de l'image
    
    @Column(name = "ingredients")
    private String ingredients; // Liste des ingrédients
    
  
    
    // Constructeurs
    public Produit() {
    }

    public Produit(String nom, double prix, String imageUrl, String ingredients) {
        this.nom = nom;
        this.prix = prix;
        this.imageUrl = imageUrl;
        this.ingredients = ingredients;
        
    }

    // Getters et setters
    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNom() {
        return nom;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public double getPrix() {
        return prix;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getIngredients() {
        return ingredients;
    }

    public void setIngredients(String ingredients) {
        this.ingredients = ingredients;
    }


	
    
    // Autres méthodes si nécessaire
}
