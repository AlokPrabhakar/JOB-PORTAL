package com.Backend;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Database.Connection.DbConnection;

public class Login extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String remember = req.getParameter("remember");
		String name = "", dob = "", gender = "", city = "", field1 = "";
		Connection con = null;
        PreparedStatement ps = null;
		try {
			
			con = DbConnection.getConnect();
			
		  ps = con.prepareStatement("select * from register where email=? and password=?");
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			System.out.println(rs);
			if (rs.next()) {
				name = rs.getString("name");
				gender = rs.getString("gender");
				city = rs.getString("city");
				field1 = rs.getString("field1");
				dob = rs.getString("dob");

				HttpSession session = req.getSession();
				session.setAttribute("session_name", name);
				session.setAttribute("session_email", email);
				session.setAttribute("session_gender", gender);
				session.setAttribute("session_dob", dob);
				session.setAttribute("session_city", city);
				session.setAttribute("session_field1", field1);
				String title = "", skills = "";
				PreparedStatement ps2 = con.prepareStatement("select * from about_user where email=?");
				ps2.setString(1, email);
				ResultSet rs2 = ps2.executeQuery();
				while (rs2.next()) {
					title = rs2.getString("title");
					skills = rs2.getString("skills");
				}
				System.out.println(email + "  " + password + " " + city + " " + gender + " " + field1 + " " + title);
				session.setAttribute("session_title", title);
				session.setAttribute("session_skills", skills);

				resp.sendRedirect("profile.jsp");

			} else {
				RequestDispatcher rd1 = req.getRequestDispatcher("header.jsp");
				rd1.include(req, resp);

				RequestDispatcher rd2 = req.getRequestDispatcher("menubar.jsp");
				rd2.include(req, resp);

				RequestDispatcher rd3 = req.getRequestDispatcher("loginerror.jsp");
				rd3.include(req, resp);

				RequestDispatcher rd4 = req.getRequestDispatcher("logindiv.jsp");
				rd4.include(req, resp);

				RequestDispatcher rd5 = req.getRequestDispatcher("footer.jsp");
				rd5.include(req, resp);

			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

}
