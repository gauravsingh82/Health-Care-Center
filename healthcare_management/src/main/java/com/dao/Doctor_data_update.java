package com.dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@SuppressWarnings("serial")
@MultipartConfig
public class Doctor_data_update extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String call_name = request.getParameter("call_name");

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("username");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String address = request.getParameter("address");
		String phone = request.getParameter("contact_number");
		String adhar = request.getParameter("adharno");
		Part file = request.getPart("file");

		int result = new AdminDaoImpl().UpdateDoctors(id, name, age, gender, phone, email, adhar, address, file);
		if (result > 0) {
			if (call_name.equals("admin")) {
				response.sendRedirect("admin/view_all_doctors.jsp?admin_name=" + request.getParameter("name"));
			} else if (call_name.equals("doctor")) {
				response.sendRedirect("doctor/doctor_details.jsp?doctorId=" + id + "&&doctor_name=" + name);
			}
		} else {
			System.out.println("Doctor data update Record not not Found");
		}

	}

}
