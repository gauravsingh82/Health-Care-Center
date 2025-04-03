package com.controller;

import com.dao.DatabaseHelper;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ForgotPassword extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String age = request.getParameter("age");
		String contactNumber = request.getParameter("mobile");
		String role = request.getParameter("role");

		try (Connection connection = DatabaseHelper.getConnection()) {
			String sql = "select password from " + role + "  where email=? and age=? and role=? and contact_number=? ";
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, age);
			stmt.setString(3, role);
			stmt.setString(4, contactNumber);
			ResultSet resultSet = stmt.executeQuery();
			if (resultSet.next()) {
				request.setAttribute("password", resultSet.getString(1));
				RequestDispatcher rd = request.getRequestDispatcher("forgetpassword.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("forgetpassword.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
		}
	}
}
