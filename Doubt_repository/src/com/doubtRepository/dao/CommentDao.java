package com.doubtRepository.dao;

import java.util.TimeZone;
import java.sql.*;
import com.doubtRepository.model.CommentModel;

public class CommentDao
{
	
	
	public int insertData(CommentModel commentModel) throws ClassNotFoundException, SQLException
	{
		String sql="insert into comments_table(comments, post_id, prn_no) values(?,?,?)";
		String url="jdbc:mysql://localhost:3306/doubt_repository?serverTimezone=" + TimeZone.getDefault().getID();
		String username = "root";
		String password = "";
        int result = 0;

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection connection = DriverManager.getConnection(url, username, password);

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
          
            preparedStatement.setString(1, commentModel.getComment());
            preparedStatement.setInt(2, commentModel.getPost_id());
            preparedStatement.setInt(3, commentModel.getPrn_no());
            
            System.out.println(preparedStatement);
            
            // Step 3: Execute the query or update query
            result = preparedStatement.executeUpdate();
        
            return result; 
	}	

}
