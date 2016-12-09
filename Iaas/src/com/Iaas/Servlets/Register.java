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
	   	
	   	if(request.getParameter("card_number")!=null){
		Long card_number = Long.parseLong(request.getParameter("card_number").toString());
		int exp_date = Integer.parseInt(request.getParameter("exp_date").toString());
		int cvv = Integer.parseInt(request.getParameter("cvv").toString());
		
		
		int user_id = 0;
		
		 Connection connection = null;
	     PreparedStatement pstatement = null;
	     
	     	        
		if ((card_number != 0) &&
				(exp_date != 0 )&&
				(cvv != 0) &&
				(name != null && name.length() != 0) &&
				(email_id != null && email_id.length() != 0))
		
		{

			int insertQuery1 = 0;
			int insertQuery2 = 0;
			int insertQuery3 = 0;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");

				connection = DriverManager.getConnection("jdbc:mysql://team18-instance1.c2s2dfvr9r2j.us-west-1.rds.amazonaws.com:3306/team18dB1?useSSL=false",
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
				if (us != null && us.next()) 
					user_id = us.getInt(1)+1;
				else
						user_id=1;
					System.out.println(user_id);
				
				String queryString1 = ("insert into user(user_id, name, email_id, phone_no) VALUES (?, ?, ?,?)");
				pstatement = connection.prepareStatement(queryString1);
				pstatement.setInt(1, user_id);
				pstatement.setString(2, name);
				pstatement.setString(3, email_id);
				pstatement.setString(4, phone_no);

				System.out.println(queryString1); 
				
				insertQuery1 = pstatement.executeUpdate();
				pstatement = null;

					String queryString2 = ("insert into auth_table(user_id,username,password_val) values (?,?,?)");
					pstatement = connection.prepareStatement(queryString2);
					pstatement.setInt(1, user_id);
					pstatement.setString(2, username);
					pstatement.setString(3, password);
					insertQuery2 = pstatement.executeUpdate();
					
					System.out.println(queryString2); 
					 //pstatement = null;

					String query3 = ("insert into card_details(user_id,exp_date,cvv,name_on_card,card_number) values (?,?,?,?,?)");
					pstatement = connection.prepareStatement(query3);
					pstatement.setInt(1, user_id);
					pstatement.setInt(2, exp_date);
					pstatement.setInt(3, cvv);
					pstatement.setString(4, name_on_card);
					pstatement.setLong(5, card_number);
					
					insertQuery3 = pstatement.executeUpdate();
					
					System.out.println(query3); 
				

				if (insertQuery1 != 0 && insertQuery2 != 0 && insertQuery3 != 0)
					success = true; System.out.println("all executed"); 

			} 
			catch (Exception ex) {
				System.out.println("Unable to connect to database.");

			} finally {
				
				try {
					//connection.close();
				} catch (Exception e) {
					System.out.println(e);
				}
			}
		}
	   	}

		return success;
	}
	   	

}
