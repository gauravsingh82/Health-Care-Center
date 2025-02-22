package com.dao;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@SuppressWarnings("serial")
public class MyImages extends HttpServlet {

	// Retrieve image from database
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OutputStream outputStream = null;
		int imageId = Integer.parseInt(req.getParameter("id"));
		try {
			conn = DatabaseHelper.getConnection();
			String sql = "SELECT image_data FROM doctor WHERE user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, imageId);// column name
			rs = pstmt.executeQuery();

			if (rs.next()) {
				byte[] imageBytes = rs.getBytes("image_data");// column name
				res.setContentType("image/png");
				outputStream = res.getOutputStream();
				outputStream.write(imageBytes);
				outputStream.flush();
				outputStream.close();
			}
		} catch (SQLException | ClassNotFoundException | IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (outputStream != null)
					outputStream.close();
			} catch (SQLException | IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static byte[] storeImage(Part filePart) {

		try {
			if (filePart != null) {
				InputStream fileContent = filePart.getInputStream();
				byte[] imageBytes = fileContent.readAllBytes();

				return imageBytes;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
