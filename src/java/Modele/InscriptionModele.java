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
    private static final String CHAMP_EMAIL = "email";
    private static final String CHAMP_PASS = "password";
    private static final String CHAMP_CONF = "passwordRe";
    private static final String CHAMP_NOM = "nom";
    private static final String CHAMP_PRENOM = "prenom";
    private static final String CHAMP_LOGIN = "pseudo";
    private static final String CHAMP_CELL = "telephone";

    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public Compte inscrireClient(HttpServletRequest request) throws Exception {
        String email = getValeurChamp(request, CHAMP_EMAIL);
        System.out.println(email);
        String password = getValeurChamp(request, CHAMP_PASS);
        System.out.println(password);
        String passwordRe = getValeurChamp(request, CHAMP_CONF);
        System.out.println(passwordRe);
        String nom = getValeurChamp(request, CHAMP_NOM);
        System.out.println(nom);
        String prenom = getValeurChamp(request, CHAMP_PRENOM);
        System.out.println(prenom);
        String telephone = getValeurChamp(request, CHAMP_CELL);
        System.out.println(telephone);
        String pseudo = getValeurChamp(request, CHAMP_LOGIN);
        System.out.println(pseudo);

        Compte client = new Compte();

        try {
            validationEmail(email);
        } catch (Exception e) {
            setErreur(CHAMP_EMAIL, e.getMessage());
        }
        client.setEmail(email);

        try {
            validationLogin(pseudo);
        } catch (Exception e) {
            setErreur(CHAMP_LOGIN, e.getMessage());
        }
        client.setPseudo(pseudo);

        try {
            validationPrenom(prenom);
        } catch (Exception e) {
            setErreur(CHAMP_PRENOM, e.getMessage());
        }
        client.setPrenom(prenom);

        try {
            validationCell(telephone);
        } catch (Exception e) {
            setErreur(CHAMP_CELL, e.getMessage());
        }
        client.setTelephone(telephone);

        try {
            validationMotsDePasse(password, passwordRe);
        } catch (Exception e) {
            setErreur(CHAMP_PASS, e.getMessage());
            setErreur(CHAMP_CONF, null);
        }
        client.setMotDePasse(password);

        try {
            validationNom(nom);
        } catch (Exception e) {
            setErreur(CHAMP_NOM, e.getMessage());
        }
        client.setNom(nom);

        if (erreurs.isEmpty()) {

            Boolean userExist = verifUtilisateur(email, pseudo);
            if (userExist == false) {
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

        } else {
            resultat = "Inscription raté !";
        }

        return client;
    }

    private Boolean verifUtilisateur(String email, String pseudo) throws Exception {
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

    private void validationEmail(String email) throws Exception {
        if (email != null) {
            if (!email.matches("([^.@]+)(\\.[^.@]+)*@([^.@]+\\.)+([^.@]+)")) {
                throw new Exception("Merci de saisir une adresse mail valide.");
            }
        } else {
            throw new Exception("Merci de saisir une adresse mail.");
        }
    }

    private void validationMotsDePasse(String motDePasse, String confirmation) throws Exception {
        if (motDePasse != null && confirmation != null) {
            if (!motDePasse.equals(confirmation)) {
                throw new Exception("Les mots de passe entrés sont différents, merci de les saisir à nouveau.");
            } else if (motDePasse.length() < 3) {
                throw new Exception("Les mots de passe doivent contenir au moins 3 caractères.");
            }
        } else {
            throw new Exception("Merci de saisir et confirmer votre mot de passe.");
        }
    }

    private void validationNom(String nom) throws Exception {
        if (nom == null) {
            throw new Exception("Le nom d'utilisateur doit être non vide.");
        }
    }

    private void setErreur(String champ, String message) {
        erreurs.put(champ, message);
    }

    private static String getValeurChamp(HttpServletRequest request, String nomChamp) {
        String valeur = request.getParameter(nomChamp);
        if (valeur == null || valeur.trim().length() == 0) {
            return null;
        } else {
            return valeur.trim();
        }
    }

    private void validationLogin(String login) throws Exception {
        if (login == null || login.length() < 3) {
            throw new Exception("Le login doit être d'au moins 3 caractères.");
        }
    }

    private void validationPrenom(String prenom) throws Exception {
        if (prenom == null) {
            throw new Exception("Le prénom doit être non vide.");
        }
    }

    private void validationCell(String cell) throws Exception {
        if (cell == null) {
            throw new Exception("Le numéro de téléphone doit être non vide.");
        }
    }    
}
