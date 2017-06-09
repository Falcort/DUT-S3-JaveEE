/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import Class.Compte;
import Modele.BDD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

/**
 *
 * @author Thibault
 */
public class Connexion
{
    private static final String email = "email";
    private static final String password = "password";

    
    public Compte connexionClient (HttpServletRequest request) throws Exception 
    {
        String email = getValeurChamp(request, "email");
        String password = getValeurChamp(request, "password");
        
        DataSource bdd = BDD.getDataSource();
        Connection connection = bdd.getConnection();

        Compte compte = new Compte();
        
        String query = "SELECT * FROM Utilisateurs WHERE email='" + email + "' AND mdp='"+password+"'";
        Statement stmt = connection.createStatement();
        ResultSet rset = stmt.executeQuery(query);
        while (rset.next())
        {
            System.out.println("ok");
            return compte;
        }
        System.out.println("pas ok");
        return compte;
    }
    
    private static String getValeurChamp(HttpServletRequest request, String nomChamp) {
        String valeur = request.getParameter(nomChamp);
        if (valeur == null || valeur.trim().length() == 0) {
            return null;
        } else {
            return valeur.trim();
        }
    }
}
