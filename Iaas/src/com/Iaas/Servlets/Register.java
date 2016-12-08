package com.Iaas.Servlets;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;

import java.sql.*; 
import java.io.*;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class Register extends HttpServlet{
	
	
	public boolean filldetails(HttpServletRequest request){
		boolean success = false;
		HttpSession session = request.getSession();
	 	String name = request.getParameter("name");    
	   	String username = request.getParameter("username");
	   	String phone_no = request.getParameter("phone_no");
	   	String email_id = request.getParameter("email_id");
	   	String password = request.getParameter("password");
	   	String name_on_card = request.getParameter("name_on_card");
		String card_number = request.getParameter("card_number");
		String exp_date = request.getParameter("exp_date");
		String cvv = request.getParameter("cvv");
		
		
		String user_id = null;
		
		 Connection connection = null;
	     PreparedStatement pstatement = null;
	     
	     	        
		if ((card_number != null && card_number.length() != 0) &&
				(exp_date != null && exp_date.length() != 0) &&
				(cvv != null && cvv.length() != 0) &&
				(name != null && name.length() != 0) &&
				(email_id != null && email_id.length() != 0))
		
		{

			int insertQuery1 = 0;
			int insertQuery2 = 0;
			int insertQuery3 = 0;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");

				connection = DriverManager.getConnection("jdbc:mysql://team18-instance1.c2s2dfvr9r2j.us-west-1.rds.amazonaws.com:3306/Wedding_Planner?useSSL=false",
						"team18user", "team18pass");
				
				String query0 = ("select * from user where email_id = '" + email_id +"'");
				pstatement = connection.prepareStatement(query0);
				ResultSet rs0 = pstatement.executeQuery();
				
				System.out.println(query0);
				System.out.println(email_id);
				
				if(rs0!=null && rs0.next())
				{ 
					 
					//System.out.println(rs0.next());
					request.setAttribute("err_msg", "Email id already registered..Please Login..!!");
					return false;
				}
				
				String query1 = ("select max(user_id) from user");
				pstatement = connection.prepareStatement(query1);
				ResultSet us = pstatement.executeQuery();
				if (us != null && us.next()) {
					user_id = us.getString(1); System.out.println(user_id);
				
				String queryString1 = ("insert into user(user_id, name, email_id, phone_no) VALUES (?, ?, ?)");
				pstatement = connection.prepareStatement(queryString1);
				pstatement.setString(1, user_id);
				pstatement.setString(2, name);
				pstatement.setString(3, email_id);
				pstatement.setString(4, phone_no);

				System.out.println(queryString1); 
				
				insertQuery1 = pstatement.executeUpdate();
				pstatement = null;

					String queryString2 = ("insert into auth_table(user_id,username,password_val) values (?,?,?)");
					pstatement = connection.prepareStatement(queryString2);
					pstatement.setString(1, user_id);
					pstatement.setString(2, username);
					pstatement.setString(3, password);
					insertQuery2 = pstatement.executeUpdate();
					
					System.out.println(queryString2); 
					 //pstatement = null;

					String query3 = ("insert into card_details(user_id,exp_date,cvv,name_on_card,card_number) values (?,?,?,?,?)");
					pstatement = connection.prepareStatement(query3);
					pstatement.setString(1, user_id);
					pstatement.setString(2, exp_date);
					pstatement.setString(2, cvv);
					pstatement.setString(2, name_on_card);
					pstatement.setString(2, card_number);
					
					insertQuery3 = pstatement.executeUpdate();
					
					System.out.println(query3); 
				}

				if (insertQuery1 != 0 && insertQuery2 != 0 && insertQuery3 != 0)
					success = true; System.out.println("all executed"); 

			} catch (Exception ex) {
				System.out.println("Unable to connect to database.");

			} finally {
				// close all the connections.
				try {
					//pstatement.close();

					connection.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
		}

		return success;
	}

}
