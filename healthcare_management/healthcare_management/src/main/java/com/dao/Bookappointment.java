package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Bookappointment {
	public static int patient_appointment(String patient_name, String username, String gender, String age,
			String contactNumber, String date, String description, String id, String doctor_name, String doctor_id)
			throws ClassNotFoundException, SQLException {
		Connection connection = DatabaseHelper.getConnection();
		String sql = "INSERT INTO appointments (username,age, gender,contact_number, date, description,id,doctor_name,doctor_id) VALUES (?, ?, ?, ?, ?, ?, ?,?, ?)";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, username);
		stmt.setString(2, age);
		stmt.setString(3, gender);
		stmt.setString(4, contactNumber);
		stmt.setString(5, date);
		stmt.setString(6, description);
		stmt.setString(7, id);
		stmt.setString(8, doctor_name);
		stmt.setString(9, doctor_id);
		return stmt.executeUpdate();
	}

	public static int appointment_status(String status, int appointment_id)
			throws ClassNotFoundException, SQLException {
		Connection connection = DatabaseHelper.getConnection();
		String sql = "update appointments set status=? where appointment_id=?";
		PreparedStatement stmt = connection.prepareStatement(sql);
		stmt.setString(1, status);
		stmt.setInt(2, appointment_id);
		return stmt.executeUpdate();
	}

	public static ResultSet allAppointments(int id) throws ClassNotFoundException, SQLException {
		ResultSet resultSet = null;
		Connection connection = DatabaseHelper.getConnection();
		PreparedStatement pstm = connection.prepareStatement("select * from appointments where id=?");
		pstm.setInt(1, id);
		resultSet = pstm.executeQuery();
		return resultSet;
	}

	public static ResultSet allAppointments() throws ClassNotFoundException, SQLException {
		ResultSet resultSet = null;
		Connection connection = DatabaseHelper.getConnection();
		PreparedStatement pstm = connection.prepareStatement("select * from appointments");
		resultSet = pstm.executeQuery();
		return resultSet;
	}

	public static ResultSet doctorAppointments(int doctor_id, String doctor_name)
			throws ClassNotFoundException, SQLException {
		ResultSet resultSet = null;
		Connection connection = DatabaseHelper.getConnection();
		PreparedStatement pstm = connection
				.prepareStatement("select * from appointments where doctor_id=? and doctor_name=?");
		pstm.setInt(1, doctor_id);
		pstm.setString(2, doctor_name);
		resultSet = pstm.executeQuery();
		return resultSet;
	}

	public static ResultSet patientAppointmentsDetails(int appointmentId) throws ClassNotFoundException, SQLException {
		ResultSet resultSet = null;
		Connection connection = DatabaseHelper.getConnection();
		PreparedStatement pstm = connection.prepareStatement("select * from appointments where appointment_id=?");
		pstm.setInt(1, appointmentId);
		resultSet = pstm.executeQuery();
		return resultSet;
	}
}
