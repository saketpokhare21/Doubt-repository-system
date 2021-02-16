package com.doubtRepository.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImageDao")
public class ImageDao extends HttpServlet
{
	private static final long serialVersionUID = 1L;
    
	//String sql="select post_img from doubt_table where post_id= ?";
	String url="jdbc:mysql://localhost:3306/doubt_repository?serverTimezone=" + TimeZone.getDefault().getID();
	String username = "root";
	String password = "";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		int post_id= (int)(request.getAttribute("post_id"));
		byte[] img = null;
		ServletOutputStream sos = null;
		String sql = "select post_img from doubt_table where post_id =? ";
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, post_id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
			{
				img = rs.getBytes(1);
			}
			sos = response.getOutputStream();
			sos.write(img);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
}
