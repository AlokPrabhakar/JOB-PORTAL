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

public class EditProfilePlus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		PrintWriter out = resp.getWriter();

		HttpSession session = req.getSession();
		String email2 = (String) session.getAttribute("session_email");
		String name2 = req.getParameter("name1");
		String dob2 = req.getParameter("dob1");
		String city2 = req.getParameter("city1");
		String gender2 = req.getParameter("gender1");
		String title2 = req.getParameter("title1");
		String skills2 = req.getParameter("skills1");
		Connection con = null;
        PreparedStatement ps1 = null;
        PreparedStatement ps2=null;
		try {
			
			con = DbConnection.getConnect();
			con.setAutoCommit(false);
			ps1 = con.prepareStatement("update register set name=?,dob=?, city=?, gender=? where email=?");
			ps1.setString(1, name2);
			ps1.setString(2, dob2);
			ps1.setString(3, city2);
			ps1.setString(4, gender2);
			ps1.setString(5,email2);
			int i1 = ps1.executeUpdate();
					
		    ps2 = con.prepareStatement("update about_user set title=?, skills=? where email=?");
			ps2.setString(1, title2);
			ps2.setString(2, skills2);
			ps2.setString(3, email2);
			int i2 = ps2.executeUpdate();
			
			if (i1 > 0 && i2 > 0) {
				con.commit();
				session.setAttribute("session_name", name2);
				session.setAttribute("session_email", email2);
				session.setAttribute("session_gender", gender2);
				session.setAttribute("session_city", city2);
				
				session.setAttribute("session_title", title2);
				session.setAttribute("session_skills", skills2);

				resp.sendRedirect("profile.jsp");
			} else {
				con.rollback();
				RequestDispatcher rd1 = req.getRequestDispatcher("error.jsp");
				rd1.include(req, resp);

				RequestDispatcher rd2 = req.getRequestDispatcher("edit-profile-about.jsp");
				rd2.include(req, resp);
			}
		} catch (Exception e) {
			out.print(e);
		}
		 finally {
	        	try {
					con.close();
					ps1.close();
					ps2.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
	}

}
