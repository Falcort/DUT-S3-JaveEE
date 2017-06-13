/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

/**
 *
 * @author Jennifer
 */
public class Article {
    
    private int idArticle;
    private String nomArticle;
    private float prixArticle;
    private String photoArticle;

    public Article(int idArticle, String nomArticle, float prixArticle, String photoArticle) {
        this.idArticle = idArticle;
        this.nomArticle = nomArticle;
        this.prixArticle = prixArticle;
        this.photoArticle = photoArticle;
    }

    public int getIdArticle() {
        return idArticle;
    }

    public String getNomArticle() {
        return nomArticle;
    }

    public float getPrixArticle() {
        return prixArticle;
    }

    public String getPhotoArticle() {
        return photoArticle;
    }

    public void setIdArticle(int idArticle) {
        this.idArticle = idArticle;
    }

    public void setNomArticle(String nomArticle) {
        this.nomArticle = nomArticle;
    }

    public void setPrixArticle(float prixArticle) {
        this.prixArticle = prixArticle;
    }

    public void setPhotoArticle(String photoArticle) {
        this.photoArticle = photoArticle;
    } 
}
