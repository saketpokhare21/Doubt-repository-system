package com.doubtRepository.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.doubtRepository.dao.LoginDao;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int prn_no = Integer.parseInt(request.getParameter("prn_no"));
		String pass = request.getParameter("pass");
		
		LoginDao dao = new LoginDao();
		
		try 
		{
			if(dao.check(prn_no,pass))
			{
				HttpSession session = request.getSession();
				session.setAttribute("prn_no", prn_no);
				
				response.sendRedirect("welcome.jsp");
			}
			else
			{ 
				response.sendRedirect("login.jsp");
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}
