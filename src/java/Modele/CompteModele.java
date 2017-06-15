/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import Class.Compte;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;

/**
 *
 * @author Thibault
 */
public class CompteModele
{
    public static Compte getAccount(int id) throws Exception
    {
        DataSource cnx = BDD.getDataSource();
        Connection connexion = cnx.getConnection();
        ResultSet rSet = null;
        String pseudo = "";
        String nom = "";
        String prenom = "";
        String email = "";
        String telephone = "";
        
        String query = "SELECT * FROM Utilisateurs WHERE id = ?";
        PreparedStatement pstmt = connexion.prepareStatement(query);
        pstmt.setInt(1, id);
        rSet = pstmt.executeQuery();
        
        while (rSet.next())
        {
            pseudo = rSet.getString(4);
            nom = rSet.getString(2);
            prenom = rSet.getString(3);
            email = rSet.getString(6);
            telephone = rSet.getString(5);
        }
        Compte compte = new Compte(pseudo, nom, prenom, email, telephone);
        return compte;
    }
}
