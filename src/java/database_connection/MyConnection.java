package database_connection;
import java.sql.*;
public class MyConnection
{
   public Connection conDB()	{
            try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/socialnetwork","root","root");
		if(con==null){return null;	}
		else	{return con;	}	
            }catch(Exception e){return null;}
            	
		
	}			
 }

