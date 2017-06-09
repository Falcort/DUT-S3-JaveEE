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


public class BDD {
    
    public static DataSource getDataSource() throws Exception
    {
        MariaDbDataSource ds = new MariaDbDataSource();
        ds.setPortNumber(Integer.parseInt("3306"));
        ds.setDatabaseName("JavaEE");
        ds.setServerName("falcort.fr");
        ds.setUserName("java");
        ds.setUser("java");
        ds.setPassword("TKA7tEMFDoCqVakU");
        return ds;
    }
}
