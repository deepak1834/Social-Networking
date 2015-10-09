package bean;
import java.sql.*;
import static bean.Provider.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectionProvider {
	static Connection con=null;
	

   public  static Connection getCon() {
        
         try {
                
                try {
                    Class.forName("com.ibm.db2.jcc.DB2Driver");
                    
                } catch (ClassNotFoundException ex) {
                    System.out.println("h1");
                    ex.printStackTrace();
                }
                con=DriverManager.getConnection("jdbc:db2://"+"localhost:50000/lnms","dksh","deep");
                
            } catch (SQLException ex) {
                                    System.out.println("h2");
                                    ex.printStackTrace();
            }
        
        
        
        
        
        
        
        
        		return con;
        }

        
    }