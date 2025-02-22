package com.controller;

import com.dao.DatabaseHelper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		try (Connection connection = DatabaseHelper.getConnection()) {
			String sql = "SELECT * FROM " + role + " WHERE  email= ? AND password = ? and role=?";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, password);
			stmt.setString(3, role);

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				if (role.equals("patient")) {
					response.sendRedirect("patient/patient_dashboard.jsp?patient_name=" + rs.getString(2)
							+ "&&patient_id=" + rs.getInt(1));
				} else if (role.equals("doctor")) {
					response.sendRedirect("doctor/doctor_dashboard.jsp?doctorId=" + rs.getInt(1) + "&&doctor_name="
							+ rs.getString(2));
				} else if (role.equals("admin")) {
					response.sendRedirect("admin/admin_dashboard.jsp?admin_name=" + rs.getString(2));
				}
			} else {
				response.sendRedirect("login.jsp?error=true");
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
		}
	}
}
