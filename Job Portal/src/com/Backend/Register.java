package com.Backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Database.Connection.DbConnection;

public class Register extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String name = req.getParameter("myname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String dob = req.getParameter("dob");
		String city = req.getParameter("city");
		String gender = req.getParameter("gender");
		String[] field2 = req.getParameterValues("field1");

		String fields2 = "";
		if (field2 != null) {
			for (String s : field2) {
				fields2 = fields2 + "," + s;
			}
		}
		Connection con = null;
        PreparedStatement ps = null;
		try {
			
			con = DbConnection.getConnect();
			con.setAutoCommit(false);
			ps = con.prepareStatement("insert into register(name,email,password,dob,city,gender,field1) values(?,?,?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, dob);
			ps.setString(5, city);
			ps.setString(6, gender);
			ps.setObject(7, fields2);
			int i1=ps.executeUpdate();
			PreparedStatement ps2=con.prepareStatement("insert into about_user(email, title, skills) values(?,?,?)");
            ps2.setString(1, email);
            ps2.setString(2, "");
            ps2.setString(3, "");
            int i2=ps2.executeUpdate();
            
            if(i1>0 && i2>0)
            {
            	con.commit();
                HttpSession session=req.getSession();
                session.setAttribute("session_name", name);
                session.setAttribute("session_email", email);
                session.setAttribute("session_gender", gender);
                session.setAttribute("session_city", city);
                session.setAttribute("session_fields", field2);
                
                session.setAttribute("session_title", "");
                session.setAttribute("session_skills", "");
                
                resp.sendRedirect("profile.jsp");
            }
            else
            {
            	con.rollback();
                out.println("Failed");
            }

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
