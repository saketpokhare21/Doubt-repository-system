package com.doubtRepository.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteDao")
public class DeleteDao extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	 
	String sql="delete from doubt_table where post_id = ?";
	String url="jdbc:mysql://localhost:3306/doubt_repository?serverTimezone=" + TimeZone.getDefault().getID();
	String username = "root";
	String password = "";
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int post_id = Integer.parseInt(request.getParameter("post_id"));
		System.out.println(post_id);
				try
				{
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection(url,username,password);
					PreparedStatement st = con.prepareStatement(sql);
					st.setInt(1, post_id);
					if(st.executeUpdate()== 1)
					{
						System.out.println("Entered into if block of delDao");
						response.sendRedirect("welcome.jsp");
					}
				}
				catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	}
	
}
