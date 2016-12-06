package com.Iaas.Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Iaas.Util.*;
import com.Iaas.VO.BillingDetails;
import com.Iaas.VO.PaymentHistory;
import com.Iaas.dbConnections.DBOperations;

/**
 * @author Anushree
 */
@WebServlet("/Billing")
public class BillingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UtilConstants util = new UtilConstants();
		String userId = util.getUserId();
		DBOperations dbOperations = new DBOperations();
		List<BillingDetails> billingData = null;
		List<PaymentHistory> paymentHistory= null;
		int total_cost = 0;
		int amount_paid = 0;
		int total_amount_due = 0;
		
		
		if(request.getParameter("status")!=null && request.getParameter("status").equals("new"))
		{
			request.removeAttribute("status");
		RequestDispatcher rd = request.getRequestDispatcher("billingDashBoard.jsp");
		rd.forward(request, response);
		
		}
		else if(request.getParameter("status")!=null && request.getParameter("status").equals("current_bill")){
			try {
				billingData = dbOperations.viewBillDetails(userId);
				total_cost = dbOperations.getTotalCost(userId);
				amount_paid = dbOperations.getAmountPaid(userId);
				total_amount_due = total_cost - amount_paid;
			} catch (ClassNotFoundException | SQLException  e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("billingData", billingData);
			request.setAttribute("total_amount_due", total_amount_due);
			request.setAttribute("amount_paid", amount_paid);
			request.removeAttribute("status");
			
			RequestDispatcher rd = request.getRequestDispatcher("currentBill.jsp");
			rd.forward(request, response);
		}
		
		else if(request.getParameter("status")!=null && request.getParameter("status").equals("payment_history")){
			try {
				paymentHistory = dbOperations.viewPaymentHistory(userId);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("paymentHistory", paymentHistory);
			request.removeAttribute("status");
			RequestDispatcher rd = request.getRequestDispatcher("paymentHistory.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
