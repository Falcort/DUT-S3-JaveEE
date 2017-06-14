/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import Class.Adresse;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;


/**
 *
 * @author angel
 */
public class AdresseLivraisonModele {
    

    private Map<String, String> erreurs = new HashMap<String, String>();

    public Map<String, String> getErreurs() {
        return erreurs;
    }
    
    public Adresse adresseLivraison(HttpServletRequest request) throws Exception {

        String nom = request.getParameter("nom");
        System.out.println(nom);
        String prenom = request.getParameter("prenom");
        System.out.println(prenom);
        String telephone = request.getParameter("telephone");
        System.out.println(telephone);
        String adresse = request.getParameter("adresse");
        System.out.println(adresse);
        String cp = request.getParameter("cp");
        System.out.println(cp);
        String ville = request.getParameter("ville");
        System.out.println(ville);
        
        Adresse adresseLivraison = new Adresse();

        try {
            validationPrenom(prenom);
        } catch (Exception e) {
            setErreur("prenom", e.getMessage());
        }

        try {
            validationTelephone(telephone);
        } catch (Exception e) {
            setErreur("telephone", e.getMessage());
        }

        try {
            validationNom(nom);
        } catch (Exception e) {
            setErreur("nom", e.getMessage());
        }

        try {
            validationAdresse(adresse);
        } catch (Exception e) {
            setErreur("adresse", e.getMessage());
        }
        
        try {
            validationCp(cp);
        } catch (Exception e) {
            setErreur("cp", e.getMessage());
        }
        
        try {
            validationVille(ville);
        } catch (Exception e) {
            setErreur("ville", e.getMessage());
        }

        return adresseLivraison;
    }
   
    private void validationNom(String nom) throws Exception {
        if (nom == null || nom.length() == 0) {
            throw new Exception("Le champ nom doit être non vide.");
        }
    }
    
    private void validationCp(String cp) throws Exception {
        if (cp == null || cp.length() == 0) {
            throw new Exception("Le champ code postal doit être non vide.");
        }
    }
    
    private void validationVille(String ville) throws Exception {
        if (ville == null || ville.length() == 0) {
            throw new Exception("Le champ ville doit être non vide.");
        }
    }

    private void setErreur(String champ, String message) {
        erreurs.put(champ, message);
    }

    private void validationAdresse(String adresse) throws Exception {
        if (adresse == null || adresse.length() == 0) {
            throw new Exception("Le champ adresse doit être non vide.");
        }
    }

    private void validationPrenom(String prenom) throws Exception {
        if (prenom == null || prenom.length() == 0) {
            throw new Exception("Le champ prénom doit être non vide.");
        }
    }

    private void validationTelephone(String telephone) throws Exception {
        if (telephone == null || telephone.length() == 0) {
            throw new Exception("Le champ téléphone doit être non vide.");
        }
    } 
}
