/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Modele;

import java.io.FileInputStream;
import java.net.PasswordAuthentication;
import java.util.Properties;
import javax.sql.DataSource;
import org.mariadb.jdbc.MariaDbDataSource;

/**
 *
 * @author Alain
 */
public class BDD {
    
    public static DataSource getDataSource() throws Exception
    {
        Properties props = new Properties();
        FileInputStream fichier = new FileInputStream("src/Modele/connexion.properties");
        props.load(fichier);
        MariaDbDataSource ds = new MariaDbDataSource();
        ds.setPortNumber(Integer.parseInt(props.getProperty("port")));
        ds.setDatabaseName(props.getProperty("service"));
        ds.setServerName(props.getProperty("serveur"));
        ds.setUser(props.getProperty("user"));
        ds.setPassword(props.getProperty("pwd"));
        return ds;
    }
}
