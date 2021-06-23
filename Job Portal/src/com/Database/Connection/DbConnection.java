package com.Database.Connection;



import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;


public class DbConnection
{
    static Connection con;
    
    public static Connection getConnect()
    {
         
        
        try
        {
           Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal","root","root");
            
            
            
           
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return con;
    }
}
