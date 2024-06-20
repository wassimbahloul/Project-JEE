package model;

import java.util.Date;
import java.util.List;
import java.util.Set;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "CommandeClient")
public class CommandeClient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "etat")
    private String etat;

    @Column(name = "date")
    private Date date;
    
    @Column(name = "nom_utilisateur")
    private String nomUtilisateur;
    
  
 
    @OneToMany(mappedBy = "commandeClient", fetch = FetchType.EAGER)
    private Set<LigneCommande> ligneCommandes;

    
    public CommandeClient() {
        this.etat = "en attente";
        this.date = new Date();
    }

    public CommandeClient(String etat, Date date, String nomUtilisateur, Set<LigneCommande> ligneCommandes) {
        this.etat = etat;
        this.date = date;
        this.nomUtilisateur = nomUtilisateur;
        this.ligneCommandes = ligneCommandes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEtat() {
        return etat;
    }

    public void setEtat(String etat) {
        this.etat = etat;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getNomUtilisateur() {
        return nomUtilisateur;
    }

    public void setNomUtilisateur(String nomUtilisateur) {
        this.nomUtilisateur = nomUtilisateur;
    }

    public Set<LigneCommande> getPaniers() {
        return ligneCommandes;
    }

    public void setPaniers(Set<LigneCommande> paniers) {
        this.ligneCommandes = paniers;
    }

	public void setLigneCommandes(List<LigneCommande> lignesCommande) {
		// TODO Auto-generated method stub
		
	}
}
