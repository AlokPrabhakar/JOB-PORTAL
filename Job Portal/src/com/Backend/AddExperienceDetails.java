package com.Backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Database.Connection.DbConnection;

public class AddExperienceDetails extends HttpServlet{
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String email2=(String)session.getAttribute("session_email");
        
        String company2=req.getParameter("company1");
        String title2=req.getParameter("title1");
        String year2=req.getParameter("year1");
        String locationt2=req.getParameter("location1");
        String project2=req.getParameter("project1");
        String description2=req.getParameter("description1");
        Connection con=null;
        PreparedStatement ps=null;
        try
        {
            
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            ps=con.prepareStatement("insert into experience(email,company,title,year,location,project,description) values(?,?,?,?,?,?,?)");
            ps.setString(1, email2);
            ps.setString(2, company2);
            ps.setString(3, title2);
            ps.setString(4, year2);
            ps.setString(5, locationt2);
            ps.setString(6, project2);
            ps.setString(7, description2);
            
            int i=ps.executeUpdate();
            if(i>0)
            {
            	con.commit();
                resp.sendRedirect("profile.jsp");
            }
            else
            {
            	con.rollback();
                RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
                rd1.include(req, resp);
                
                RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-education.jsp");
                rd2.include(req, resp);
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        finally {
        	try {
				con.close();
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	
        }
    }
}
