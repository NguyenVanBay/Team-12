package connect;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author NVB
 */
public class DBConnect {
    
    public static Connection getConnection(){
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/btl_webtin?useUnicode=yes&characterEncoding=UTF-8", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("connect false");
        }
        return conn;
    }
}
