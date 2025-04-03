package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.Part;

public class AdminDaoImpl implements AdminDao {

	@Override
	public ResultSet allDoctors() {
		ResultSet resultSet = null;
		try {
			Connection connection = DatabaseHelper.getConnection();
			PreparedStatement pstm = connection.prepareStatement("select * from doctor");
			resultSet = pstm.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}

	@Override
	public int deleteDoctors(int id) {
		int count = 0;
		try {
			Connection connection = DatabaseHelper.getConnection();
			PreparedStatement pstm = connection.prepareStatement("delete from doctor where user_id=?");
			pstm.setInt(1, id);
			count = pstm.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;

	}

	@Override
	public int UpdateDoctors(int id, String name, String age, String gender, String phone, String email, String adhar,
			String address, Part file) {
		int count = 0;
		try {
			String sql = null;
			byte[] imageFile = null;
			if (file.getSubmittedFileName().equals("")) {
				sql = "update doctor set username=?,age=?, gender=?, email=?, contact_number=?, adhar_no=?, address=? where user_id=?";
			} else {
				imageFile = MyImages.storeImage(file);
				sql = "update doctor set username=?,age=?, gender=?, email=?, contact_number=?, adhar_no=?, address=?,image_data=? where user_id=?";
			}
			Connection connection = DatabaseHelper.getConnection();
			PreparedStatement pstm = connection.prepareStatement(sql);
			pstm.setString(1, name);
			pstm.setString(2, age);
			pstm.setString(3, gender);
			pstm.setString(4, email);
			pstm.setString(5, phone);
			pstm.setString(6, adhar);
			pstm.setString(7, address);

			if (!file.getSubmittedFileName().equals("")) {
				pstm.setBytes(8, imageFile);
				pstm.setInt(9, id);
			} else
				pstm.setInt(8, id);
			count = pstm.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	@Override
	public ResultSet findDoctors(int id) {
		ResultSet resultSet = null;
		try {
			Connection connection = DatabaseHelper.getConnection();
			PreparedStatement pstm = connection.prepareStatement("select * from doctor where user_id=?");
			pstm.setInt(1, id);
			resultSet = pstm.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}

	@Override
	public ResultSet allPatients() {
		ResultSet resultSet = null;
		try {
			Connection connection = DatabaseHelper.getConnection();
			PreparedStatement pstm = connection.prepareStatement("select * from patient");
			resultSet = pstm.executeQuery();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resultSet;
	}

	@Override
	public int deletePatient(int id) {
		int count = 0;
		try {
			Connection connection = DatabaseHelper.getConnection();
			PreparedStatement pstm = connection.prepareStatement("delete from patient where user_id=?");
			pstm.setInt(1, id);
			count = pstm.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

}
