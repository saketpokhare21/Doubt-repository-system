package com.doubtRepository.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.TimeZone;

public class LoginDao
{
	String sql="select * from user_login where prn_no=? and pass=?";
	String url="jdbc:mysql://localhost:3306/doubt_repository?serverTimezone=" + TimeZone.getDefault().getID();
	String username = "root";
	String password = "";
	
	
	public boolean check(int prn_no, String pass) throws Exception
	{ 
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,username,password);
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, prn_no);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery();
			{
				if(rs.next())
				{
					return true;
				}
				return false;
			}
	}
}
