package com.doubtRepository.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/WelcomeController")
@MultipartConfig(maxFileSize = 16177215)
	// upload file's size up to 16MB
public class WelcomeController extends HttpServlet {
	// database connection settings
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String dbURL = "jdbc:mysql://localhost:3306/doubt_repository?serverTimezone=" + TimeZone.getDefault().getID();
	private String dbUser = "root";
	private String dbPass = "";
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException
	{
		// gets values of text fields
		String description = request.getParameter("description");
		int subject_id = Integer.parseInt(request.getParameter("subject_id"));
		InputStream inputStream = null; // input stream of the upload file
		
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("image");
		if (filePart != null)
		{
			// prints out some information for debugging
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());

			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		
		HttpSession session = request.getSession();
		int prn_no=(int)session.getAttribute("prn_no");
		
		System.out.println(description);
		System.out.println(subject_id);
		System.out.println(prn_no);
		
		Connection conn = null; // connection to the database
		String message = null;	// message will be sent back to client
		
		try {
			// connects to the database
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			// constructs SQL statement
			String sql = "INSERT INTO doubt_table (post_desc, post_img, subject_id, prn_no) values (?, ?, ?, ?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1, description);
			
			if (inputStream != null)
			{
				// fetches input stream of the upload file for the blob column
				statement.setBlob(2, inputStream);
			}
			statement.setInt(3, subject_id);
			statement.setInt(4, prn_no);

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0)
			{
				message = "File uploaded and saved into database";
			}
		} 
		catch (SQLException ex)
		{
			message = "ERROR: " + ex.getMessage();
			ex.printStackTrace();
		} 
		finally
		{
			if (conn != null)
			{
				// closes the database connection
				try
				{
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			// sets the message in request scope
			//request.setAttribute("Message", message);
			
			// forwards to the message page
			getServletContext().getRequestDispatcher("/welcome.jsp").forward(request, response);
		}
	}
}