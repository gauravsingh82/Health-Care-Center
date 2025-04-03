package com.dao;

import java.sql.ResultSet;

import javax.servlet.http.Part;

public interface AdminDao {
	public ResultSet allDoctors();

	public int deleteDoctors(int id);

	public ResultSet findDoctors(int id);

	public int UpdateDoctors(int id, String name, String age, String gender, String phone, String email, String adhar,
			String address, Part file);

	public ResultSet allPatients();

	public int deletePatient(int id);

}
