package com.Iaas.Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Iaas.VO.Card_details;
import com.Iaas.VO.Invoice;
import com.Iaas.dbConnections.DBOperations;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Payment")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String total_cost = request.getAttribute("total_amount_due").toString();
		String userId = "1";
		DBOperations dbOperations = new DBOperations();
		try{
		  if (request.getParameter("status") != null && request.getParameter("status").equals("cardDetails") && request.getParameter("amt") != null ){

			List<Card_details> card_details = null;
			try {
				card_details = dbOperations.getCardDetails(userId);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("card_details", card_details);
			RequestDispatcher rd = request.getRequestDispatcher("verifyCard.jsp");
			rd.forward(request, response);
			request.removeAttribute("status");
		}
		  else if (request.getParameter("amt") != null ) {
				dbOperations.createInvoice(request,userId);
				List<Invoice> invoice = dbOperations.fetchinvoicedetails(userId);
				request.removeAttribute("amt");
				request.setAttribute("invoice", invoice);
				RequestDispatcher rd = request.getRequestDispatcher("invoice.jsp");
				rd.forward(request, response);

			}
		}catch(SQLException |  ClassNotFoundException ex){
			ex.printStackTrace();
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
