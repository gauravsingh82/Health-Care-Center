package com.controller;

import com.dao.DatabaseHelper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class RegistrationServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String admin_name = request.getParameter("admin_name");
		String username = request.getParameter("username");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String contactNumber = request.getParameter("contact_number");
		String email = request.getParameter("email");
		String adharNo = request.getParameter("adharno");
		String address = request.getParameter("address");
		String role = "patient"; // Default role for patient
		String password = request.getParameter("password");

		try (Connection connection = DatabaseHelper.getConnection()) {
			String sql = "INSERT INTO " + role
					+ " (username, password,age, gender, role, email, contact_number, adhar_no, address) VALUES (?, ?, ?, ?, ?, ?, ?,?,?)";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			stmt.setString(3, age);
			stmt.setString(4, gender);
			stmt.setString(5, role);
			stmt.setString(6, email);
			stmt.setString(7, contactNumber);
			stmt.setString(8, adharNo);
			stmt.setString(9, address);

			int rowsAffected = stmt.executeUpdate();
			if (rowsAffected > 0) {
				response.sendRedirect("login.jsp?admin_name=" + admin_name);
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
		}
	}
}
