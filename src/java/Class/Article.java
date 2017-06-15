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
public class Article
{

    private int idArticle;
    private String nomArticle;
    private float prixArticle;
    private String photoArticle;
    private String descriptionArticle;

    public Article(int idArticle, String nomArticle, float prixArticle, String photoArticle, String descriptionArticle)
    {
        this.idArticle = idArticle;
        this.nomArticle = nomArticle;
        this.prixArticle = prixArticle;
        this.photoArticle = photoArticle;
        this.descriptionArticle = descriptionArticle;
    }

    public int getIdArticle()
    {
        return idArticle;
    }

    public String getNomArticle()
    {
        return nomArticle;
    }

    public float getPrixArticle()
    {
        return prixArticle;
    }

    public String getPhotoArticle()
    {
        return photoArticle;
    }

    public String getDescriptionArticle() {
        return descriptionArticle;
    }

    public void setIdArticle(int idArticle)
    {
        this.idArticle = idArticle;
    }

    public void setNomArticle(String nomArticle)
    {
        this.nomArticle = nomArticle;
    }

    public void setPrixArticle(float prixArticle)
    {
        this.prixArticle = prixArticle;
    }

    public void setPhotoArticle(String photoArticle)
    {
        this.photoArticle = photoArticle;
    }

    public void setDescriptionArticle(String descriptionArticle) {
        this.descriptionArticle = descriptionArticle;
    }
    
}
