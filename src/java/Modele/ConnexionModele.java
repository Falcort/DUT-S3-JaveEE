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
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 *
 * @author Thinkpad-Falcort
 */
public class ConnexionModele
{
    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();
    
    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Compte connecterClient(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String check = request.getParameter("check");
        
        System.out.println("Check = " + check);
        
        try {
            validationEmail(email);
        } catch (Exception e) {
            setErreur("email", e.getMessage());
        }
        
        try
        {
            validatePassword(password);
        } catch (Exception e) {
            setErreur("password", e.getMessage());
        }
        
        int verifyAccount =verifyAccount(email, password);
        if(verifyAccount == -1)
        {
            resultat = "Compte introuvable";
        }
        else
        {
            Cookie isLogged = new Cookie("isLogged", "true");
            Cookie id = new Cookie("id", verifyAccount+"");
            if(check == "on")
            {
                System.out.println("Check is on");
                isLogged.setMaxAge(60*60*24*7);
                id.setMaxAge(60*60*24*7); 
                response.addCookie(isLogged);
                response.addCookie(id);
            }
            else
            {
                System.out.println("Check is off");
                isLogged.setMaxAge(60*60);
                id.setMaxAge(60*60);
                response.addCookie(isLogged);
                response.addCookie(id);
            }
        }
        
        Compte client = new Compte();
        return client;
    }
    
    private void validationEmail(String email) throws Exception {
        if (email != null) {
            if (!email.matches("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
                throw new Exception("Merci de saisir une adresse mail valide.");
            }
        } else {
            throw new Exception("Merci de saisir une adresse mail.");
        }
    }
    
    private void validatePassword(String password) throws Exception {
        if(password != null)
        {
            if(password.length() < 3)
            {
                throw new Exception("Les mots de passe doivent contenir au moins 3 caractères.");
            }
            throw new Exception("Merci de saisir et confirmer votre mot de passe.");
        }
    }
    
    private void setErreur(String champ, String message) {
        erreurs.put(champ, message);
    }
    
    private int verifyAccount(String email, String password) throws Exception
    {
        DataSource cnx = BDD.getDataSource();
        Connection connexion = cnx.getConnection();   
        int count = 0;
        int id;
        ResultSet rSet = null;
        
        try
        {
            String query = "SELECT id FROM Utilisateurs WHERE email = ? OR mdp = ?";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            rSet = pstmt.executeQuery();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(InscriptionModele.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        id = -1;
        while (rSet.next())
        {
            count = count + 1;
            id = rSet.getInt(1);
        }
        if (count == 0)
        {
            return -1;
        }
        
        
        return id;
    }
}
