package Modele;

import javax.sql.DataSource;
import org.mariadb.jdbc.MariaDbDataSource;

public class BDD
{

    public static DataSource getDataSource() throws Exception
    {
        MariaDbDataSource ds = new MariaDbDataSource();
        ds.setPortNumber(Integer.parseInt("3306"));
        ds.setDatabaseName("JavaEE-S3");
        ds.setServerName("falcort.fr");
        ds.setUserName("JavaEE-S3");
        ds.setUser("JavaEE-S3");
        ds.setPassword("NjmU1FgaS87Z8K6n");
        return ds;
    }
}
