/**
 * 
 */
package com.Iaas.Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Iaas.Util.UtilConstants;
import com.Iaas.dbConnections.DBConnections;

/**
 * @author Rahul
 *
 */
public class LoginServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String action1 = request.getParameter("action1");
			String action2 = request.getParameter("action2");
			String adminLogin = request.getParameter("adminLogin");
			HttpSession session = request.getSession();
			
			if(action2!=null){
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			if(adminLogin!=null){
				String adminname = request.getParameter("adminname");
				String adminpwd = request.getParameter("adminpwd");
				
				if(adminname!=null && adminname.equalsIgnoreCase("admin") && adminpwd!=null && adminpwd.equalsIgnoreCase("admin")){
					RequestDispatcher rd = request.getRequestDispatcher("adminDashBoard.jsp");
					rd.forward(request, response);
				}
				else
				{
					request.setAttribute("adminerror", "Invalid name or password.. Please try again");
					RequestDispatcher rd = request.getRequestDispatcher("adminLogin.jsp");
					rd.forward(request, response);
				}
			}
			if (action1!=null) {
				Connection con = DBConnections.createDbConnection();
				Statement st0 = con.createStatement();
				int userId = 0;
				
				
				String query0 = ("select user_id from user where email_id ='"+name+"'");
				ResultSet rs0 = st0.executeQuery(query0);
				if(rs0!=null && rs0.next()){
					userId = rs0.getInt(1);
					
					String query1 = ("select * from auth_table where user_id = "+userId+" and password_val='"+password+"'");
					ResultSet rs1 = st0.executeQuery(query1);
					
					if(rs1!=null && rs1.next()){
						RequestDispatcher rd = request.getRequestDispatcher("userDashBoard.jsp");
						rd.forward(request, response);
						UtilConstants.setUserId(Integer.toString(userId));
						session.setAttribute("userId", UtilConstants.getUserId());
					}
					else
					{
						request.setAttribute("error", "Incorrect email id or password..Please try again..!!");
						RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
						rd.forward(request, response);
					}
				}
				else{
					request.setAttribute("error", "Email id does not exit..Please try again or click on Register.!");
					RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
					rd.forward(request, response);
				}
				
				
				DBConnections.closeConnection(con);
				
			} 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}