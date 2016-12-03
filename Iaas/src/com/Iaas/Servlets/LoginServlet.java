/**
 * 
 */
package com.Iaas.Servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author Rahul
 *
 */
public class LoginServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
        String password=request.getParameter("password");
        String action = request.getParameter("action");
        if(action.equals("Submit")){
        	if(name.equals("rahul@gmail.com") && password.equals("rahul")){
        		RequestDispatcher rd=request.getRequestDispatcher("userDashBoard.jsp");    
                rd.forward(request, response);  
            }
        	else{
        		RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");    
                rd.forward(request, response);
        	}
        }
        else if(action.equals("Register")){
        	RequestDispatcher rd=request.getRequestDispatcher("register.jsp");    
            rd.forward(request, response);
        }
	}
}
