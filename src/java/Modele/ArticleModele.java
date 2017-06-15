/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import Class.Article;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ArticleModele
{

    private List<Article> articles = new ArrayList<>();

    public List<Article> getArticleList()
    {
        return articles;
    }

    public void articleChat() throws Exception
    {
        DataSource cnx = BDD.getDataSource();
        Connection connexion = cnx.getConnection();

        ResultSet res = null;
        try
        {
            String query = "SELECT * FROM Cat";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            res = pstmt.executeQuery();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(ArticleModele.class.getName()).log(Level.SEVERE, null, ex);
        }

        System.out.println("RST CHAT" + res);
        while (res.next())
        {
            int idChat = res.getInt("idCat");
            String photoChat = res.getString("photoCat");
            String raceChat = res.getString("raceCat");
            int prixChat = res.getInt("priceCat");
            String descriptionChat = res.getString("descriptionCat");
            Article chat = new Article(idChat, raceChat, prixChat, photoChat, descriptionChat);
            articles.add(chat);
            System.out.println("RST CHAT + 1");
        }
        res.close();
    }

    public void articleChien() throws Exception
    {
        DataSource cnx = BDD.getDataSource();
        Connection connexion = cnx.getConnection();

        ResultSet res = null;
        try
        {
            String query = "SELECT * FROM Dog";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            res = pstmt.executeQuery();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(ArticleModele.class.getName()).log(Level.SEVERE, null, ex);
        }

        while (res.next())
        {
            int idChien = res.getInt("idDog");
            String photoChien = res.getString("photoDog");
            String raceChien = res.getString("raceDog");
            int prixChien = res.getInt("priceDog");
            String descriptionChien = res.getString("descriptionDog");
            Article chien = new Article(idChien, raceChien, prixChien, photoChien, descriptionChien);
            articles.add(chien);
        }
        res.close();
    }

    public void articlePoisson() throws Exception
    {
        DataSource cnx = BDD.getDataSource();
        Connection connexion = cnx.getConnection();

        ResultSet res = null;
        try
        {
            String query = "SELECT * FROM Fish";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            res = pstmt.executeQuery();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(ArticleModele.class.getName()).log(Level.SEVERE, null, ex);
        }

        while (res.next())
        {
            int idPoisson = res.getInt("idFish");
            String photoPoisson = res.getString("photoFish");
            String racePoisson = res.getString("raceFish");
            int prixPoisson = res.getInt("priceFish");
            String descriptionPoisson = res.getString("descriptionFish");
            Article poisson = new Article(idPoisson, racePoisson, prixPoisson, photoPoisson, descriptionPoisson);
            articles.add(poisson);
        }
        res.close();
    }

    public void articleOiseau() throws Exception
    {
        DataSource cnx = BDD.getDataSource();
        Connection connexion = cnx.getConnection();

        ResultSet res = null;
        try
        {
            String query = "SELECT * FROM Bird";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            res = pstmt.executeQuery();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(ArticleModele.class.getName()).log(Level.SEVERE, null, ex);
        }

        while (res.next())
        {
            int idOiseau = res.getInt("idBird");
            String photoOiseau = res.getString("photoBird");
            String raceOiseau = res.getString("raceBird");
            int prixOiseau = res.getInt("priceBird");
            String descriptionOiseau = res.getString("descriptionBird");
            Article oiseau = new Article(idOiseau, raceOiseau, prixOiseau, photoOiseau, descriptionOiseau);
            articles.add(oiseau);
        }
        res.close();
    }

    public void articleDivers() throws Exception
    {
        DataSource cnx = BDD.getDataSource();
        Connection connexion = cnx.getConnection();

        ResultSet res = null;
        try
        {
            String query = "SELECT * FROM Stuff";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            res = pstmt.executeQuery();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(ArticleModele.class.getName()).log(Level.SEVERE, null, ex);
        }

        while (res.next())
        {
            int idDivers = res.getInt("idStuff");
            String photoDivers = res.getString("photoStuff");
            String nameDivers = res.getString("nameStuff");
            int prixDivers = res.getInt("priceStuff");
            String descriptionDivers = res.getString("descriptionStuff");
            Article divers = new Article(idDivers, nameDivers, prixDivers, photoDivers, descriptionDivers);
            articles.add(divers);
        }
        res.close();
    }

}
