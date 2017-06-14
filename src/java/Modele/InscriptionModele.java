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
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

/**
 *
 * @author Thinkpad-Falcort
 */
public class InscriptionModele
{

    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    public String getResultat()
    {
        return resultat;
    }

    public Map<String, String> getErreurs()
    {
        return erreurs;
    }

    public Compte inscrireClient(HttpServletRequest request) throws Exception
    {
        String email = request.getParameter("email");
        System.out.println(email);
        String password = request.getParameter("password");
        System.out.println(password);
        String passwordRe = request.getParameter("passwordRe");
        System.out.println(passwordRe);
        String nom = request.getParameter("nom");
        System.out.println(nom);
        String prenom = request.getParameter("prenom");
        System.out.println(prenom);
        String telephone = request.getParameter("telephone");
        System.out.println(telephone);
        String pseudo = request.getParameter("pseudo");
        System.out.println(pseudo);

        Compte client = new Compte();

        try
        {
            validationEmail(email);
        }
        catch (Exception e)
        {
            setErreur("email", e.getMessage());
        }
        client.setEmail(email);

        try
        {
            validationPseudo(pseudo);
        }
        catch (Exception e)
        {
            setErreur("pseudo", e.getMessage());
        }
        client.setPseudo(pseudo);

        try
        {
            validationPrenom(prenom);
        }
        catch (Exception e)
        {
            setErreur("prenom", e.getMessage());
        }
        client.setPrenom(prenom);

        try
        {
            validationTelephone(telephone);
        }
        catch (Exception e)
        {
            setErreur("telephone", e.getMessage());
        }
        client.setTelephone(telephone);

        try
        {
            validationMotsDePasse(password, passwordRe);
        }
        catch (Exception e)
        {
            setErreur("password", e.getMessage());
            setErreur("passwordRe", null);
        }
        client.setMotDePasse(password);

        try
        {
            validationNom(nom);
        }
        catch (Exception e)
        {
            setErreur("nom", e.getMessage());
        }
        client.setNom(nom);

        if (erreurs.isEmpty())
        {

            Boolean userExist = verifUtilisateur(email, pseudo);
            if (userExist == false)
            {
                DataSource cnx = BDD.getDataSource();
                Connection connexion = cnx.getConnection();
                try
                {
                    String query = "INSERT INTO Utilisateurs (nom, prenom, pseudo, tel, email, type, mdp) VALUES (?,?,?,?,?,?,?)";
                    PreparedStatement pstmt = connexion.prepareStatement(query);
                    pstmt.setString(1, nom);
                    pstmt.setString(2, prenom);
                    pstmt.setString(3, pseudo);
                    pstmt.setString(4, telephone);
                    pstmt.setString(5, email);
                    pstmt.setInt(6, 0);
                    pstmt.setString(7, password);
                    pstmt.executeUpdate();
                    pstmt.close();
                }
                catch (Exception e)
                {
                    System.out.println(e);
                }
                resultat = "Inscription réussie !";
            }

        }
        else
        {
            resultat = "Inscription ratée !";
        }

        return client;
    }

    private Boolean verifUtilisateur(String email, String pseudo) throws Exception
    {
        DataSource cnx = BDD.getDataSource();
        Connection connexion = cnx.getConnection();
        int count = 0;
        ResultSet rSet = null;

        try
        {
            String query = "SELECT email FROM Utilisateurs WHERE email = ? OR pseudo = ?";
            PreparedStatement pstmt = connexion.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, pseudo);
            rSet = pstmt.executeQuery();
        }
        catch (SQLException ex)
        {
            Logger.getLogger(InscriptionModele.class.getName()).log(Level.SEVERE, null, ex);
        }

        while (rSet.next())
        {
            count = count + 1;
        }
        System.out.println(count);
        if (count == 0)
        {
            return false;
        }
        return true;
    }

    private void validationEmail(String email) throws Exception
    {
        if (email != null)
        {
            if (!email.matches("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)"))
            {
                throw new Exception("Merci de saisir une adresse mail valide.");
            }
        }
        else
        {
            throw new Exception("Merci de saisir une adresse mail.");
        }
    }

    private void validationMotsDePasse(String motDePasse, String confirmation) throws Exception
    {
        if (motDePasse != null && confirmation != null)
        {
            if (!motDePasse.equals(confirmation))
            {
                throw new Exception("Les mots de passe entrés sont différents, merci de les saisir à nouveau.");
            }
            else if (motDePasse.length() < 3)
            {
                throw new Exception("Les mots de passe doivent contenir au moins 3 caractères.");
            }
        }
        else
        {
            throw new Exception("Merci de saisir et confirmer votre mot de passe.");
        }
    }

    private void validationNom(String nom) throws Exception
    {
        if (nom == null || nom.length() == 0)
        {
            throw new Exception("Le champ nom doit être non vide.");
        }
    }

    private void setErreur(String champ, String message)
    {
        erreurs.put(champ, message);
    }

    private void validationPseudo(String pseudo) throws Exception
    {
        if (pseudo == null || pseudo.length() < 3)
        {
            throw new Exception("Le pseudo doit contenir au moins 3 caractères.");
        }
    }

    private void validationPrenom(String prenom) throws Exception
    {
        if (prenom == null || prenom.length() == 0)
        {
            throw new Exception("Le champ prénom doit être non vide.");
        }
    }

    private void validationTelephone(String telephone) throws Exception
    {
        if (telephone == null || telephone.length() == 0)
        {
            throw new Exception("Le champ téléphone doit être non vide.");
        }
    }
}
