package com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.Bookappointment;

@SuppressWarnings("serial")
public class BookAppointment extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String patient_name = request.getParameter("patient_name");
		String username = request.getParameter("username");
		String gender = request.getParameter("gender");
		String age = request.getParameter("age");
		String contactNumber = request.getParameter("phone");
		String date = request.getParameter("date");
		String description = request.getParameter("Disease");
		String patient_id = request.getParameter("patient_id");
		String doctor_name = request.getParameter("doctor_name");
		String doctor_id = request.getParameter("doctor_id");

		try {
			int result = Bookappointment.patient_appointment(patient_name, username, gender, age, contactNumber, date,
					description, patient_id, doctor_name, doctor_id);
			if (result > 0) {
				response.sendRedirect(
						"patient/appointments.jsp?patient_name=" + patient_name + "&&patient_id=" + patient_id);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int result = Bookappointment.appointment_status(req.getParameter("status"),
					Integer.parseInt(req.getParameter("appointment_id")));
			if (result > 0) {
				resp.sendRedirect("doctor/viewappointments.jsp?doctor_name=" + req.getParameter("doctor_name")
						+ "&&doctor_id=" + req.getParameter("doctor_id"));
			}
		} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
