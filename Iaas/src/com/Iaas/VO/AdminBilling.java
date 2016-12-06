package com.Iaas.VO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.Iaas.VO.AdminDueList;
import com.Iaas.dbConnections.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class AdminBilling extends HttpServlet{
	
	public void findDuelist(HttpServletRequest request){
		
		List<AdminDueList> dueslist = new ArrayList<>();
		int total_cost=0;
		int amount_paid = 0;
		int amount_due=0;
		try{
		DBConnections connection = new DBConnections();
		Connection dBConnection = connection.createDbConnection();
		Statement stmt = dBConnection.createStatement();
		String query=("select user_id,name from user;");
		ResultSet result = stmt.executeQuery(query);
		
		while(result.next()){
			total_cost = connection.totalcost(Integer.toString(result.getInt("user_id")));
			amount_paid = connection.amountpaid(Integer.toString(result.getInt("user_id")));
			amount_due = total_cost - amount_paid;
			if(amount_due>0){
				AdminDueList adminDueList = new AdminDueList();
				adminDueList.setUser_id(result.getInt("user_id"));
				adminDueList.setName(result.getString("name"));
				adminDueList.setAmount_due(amount_due);
				dueslist.add(adminDueList);
			}
		}
		connection.closeConnection(dBConnection);
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		
		request.setAttribute("dueslist", dueslist);
		
	}

}
