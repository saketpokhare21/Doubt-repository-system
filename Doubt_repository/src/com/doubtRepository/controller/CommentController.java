package com.doubtRepository.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doubtRepository.dao.CommentDao;
import com.doubtRepository.model.CommentModel;

@WebServlet("/CommentController")
public class CommentController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
			System.out.println("Entered controller");
			HttpSession session = request.getSession();
			
			int prn_no=(int)session.getAttribute("prn_no");
			
			String comment = request.getParameter("comment");
			int post_id = Integer.parseInt(request.getParameter("post_id"));
			
			System.out.println(prn_no);
			System.out.println(post_id);
			System.out.println(comment);
			
			CommentDao commentDao = new CommentDao();
			
			CommentModel commentModel = new CommentModel();
			commentModel.setComment(comment);
			commentModel.setPost_id(post_id);
			commentModel.setPrn_no(prn_no);
		try
		{
			if(commentDao.insertData(commentModel)==1)
			{
				System.out.println("Comment inserted");
				response.sendRedirect("welcome.jsp");
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

	}
}
