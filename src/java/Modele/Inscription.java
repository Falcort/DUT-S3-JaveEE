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
public class Inscription {

    private static final String pseudo = "pseudo";
    private static final String nom = "nom";
    private static final String prenom = "prenom";
    private static final String email = "email";
    private static final String emailRe = "emailRe";
    private static final String password = "password";
    private static final String passwordRe = "passwordRe";
    private static final String telephone = "telephone";

    public Compte inscriptionClient(HttpServletRequest request) throws Exception {
        System.out.println("DEBUT SCRIPT");
        String pseudo = getValeurChamp(request, "pseudo");
        String nom = getValeurChamp(request, "nom");
        String prenom = getValeurChamp(request, "prenom");
        String email = getValeurChamp(request, "email");
        String emailRe = getValeurChamp(request, "emailRe");
        String password = getValeurChamp(request, "password");
        String passwordRe = getValeurChamp(request, "passwordRe");
        String telephone = getValeurChamp(request, "telephone");

        Compte compte = new Compte();

        if (email.equals(emailRe)) {
            compte.setEmail(email);
        } else {
            throw new Exception("Email non identique");
        }

        if (password.equals(passwordRe)) {
            compte.setMotDePasse(password);
        } else {
            throw new Exception("Mot de passe non identique");
        }

        compte.setNom(nom);
        compte.setPrenom(prenom);
        compte.setPseudo(pseudo);
        compte.setTelephone(telephone);

        Boolean user = verifAlreadyUse(compte);
        if (!user) {
            DataSource bdd = BDD.getDataSource();
            Connection connection = bdd.getConnection();

            String query = "INSERT INTO Utilisateurs(nom, prenom, pseudo, tel, email, type, mdp) VALUES ('" + compte.getNom() + "','" + compte.getPrenom() + "','" + compte.getPseudo() + "','" + compte.getTelephone() + "','" + compte.getEmail() + "',0,'" + compte.getMotDePasse() + "')";
            PreparedStatement pstmt = connection.prepareStatement(query);
            pstmt.executeUpdate();
            pstmt.close();
            return compte;
        } else {
            throw new Exception("Email ou mot de passe deja utiliser");
        }
    }

    private static String getValeurChamp(HttpServletRequest request, String nomChamp) {
        String valeur = request.getParameter(nomChamp);
        if (valeur == null || valeur.trim().length() == 0) {
            return null;
        } else {
            return valeur.trim();
        }
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

    private Boolean verifAlreadyUse(Compte compte) throws Exception {
        DataSource bdd = BDD.getDataSource();
        Connection connection = bdd.getConnection();

        String query = "SELECT * FROM Utilisateurs WHERE email='" + compte.getEmail() + "' AND pseudo='" + compte.getPseudo() + "'";
        Statement stmt = connection.createStatement();
        ResultSet rset = stmt.executeQuery(query);
        while (rset.next()) {
            return true;
        }
        return false;
    }
}
