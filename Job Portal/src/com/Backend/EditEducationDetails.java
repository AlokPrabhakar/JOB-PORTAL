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

public class EditEducationDetails extends HttpServlet {
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
        PrintWriter out=resp.getWriter();
        
        HttpSession session=req.getSession();
        String email2=(String)session.getAttribute("session_email");
        
        String id2=req.getParameter("id1");
        String school2=req.getParameter("school1");
        String degree2=req.getParameter("degree1");
        String year2=req.getParameter("year1");
        String percent2=req.getParameter("percent1");
        String description2=req.getParameter("description1");
        Connection con = null;
        PreparedStatement ps = null;
        try
        {
           
            con=DbConnection.getConnect();
            con.setAutoCommit(false);
            ps=con.prepareStatement("update education1 set school=?, degree=?, year=?, percent=?, description=? where id=?");
            ps.setString(1, school2);
            ps.setString(2, degree2);
            ps.setString(3, year2);
            ps.setString(4, percent2);
            ps.setString(5, description2);
            ps.setString(6, id2);
            
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
            out.print("Exception "+e);
            RequestDispatcher rd1=req.getRequestDispatcher("error.jsp");
            rd1.include(req, resp);

            RequestDispatcher rd2=req.getRequestDispatcher("edit-profile-education.jsp");
            rd2.include(req, resp);
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
