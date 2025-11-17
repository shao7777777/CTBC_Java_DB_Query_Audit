import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// java connect to mssql
public class SQLDatabaseConnection {
        public static void main(String[] args) {
        String connectionUrl
                = "jdbc:sqlserver://localhost:1433;"
                + "database=NorthWind;"
                + "user=sa;"
                + "password=1234;"
                + "encrypt=false;"
                + "trustServerCertificate=false;"
                + "loginTimeout=30;";

        try (Connection connection = DriverManager.getConnection(connectionUrl);) {  //多型
            // Code here.
            System.out.println("連結成功");
        } // Handle any errors that may have occurred.
        catch (SQLException e) {
            System.out.println("連結失敗");
            e.printStackTrace();

        }
    }
}
