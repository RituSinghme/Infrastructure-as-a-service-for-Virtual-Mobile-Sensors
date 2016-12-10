/**
 * 
 */
package com.Iaas.Servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Iaas.dbConnections.DBOperations;

/**
 * @author Rahul
 *
 */
public class CreateHubServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String places = request.getParameter("myPlace");
			String place = "";
			List<String> placeString = new ArrayList<>(Arrays.asList(places.split("</span>")));
			System.out.println(placeString);
			for (String loc : placeString) {
				if (loc.contains("\"street-address\">")) {
					List<String> p = new ArrayList<>(Arrays.asList(loc.split("\"street-address\">")));
					place = p.get(p.size() - 1) + ", ";
				}
				System.out.println("loc:" + loc);
				if (loc.contains("\"locality\">")) {
					List<String> p = new ArrayList<>(Arrays.asList(loc.split("\"locality\">")));
					place = place + p.get(p.size() - 1) + ", ";
				}
				if (loc.contains("\"region\">")) {
					List<String> p = new ArrayList<>(Arrays.asList(loc.split("\"region\">")));
					place = place + p.get(p.size() - 1) + ", ";
				}
				if (loc.contains("\"postal-code\">")) {
					List<String> p = new ArrayList<>(Arrays.asList(loc.split("\"postal-code\">")));
					place = place + p.get(p.size() - 1) + ", ";
				}
				if (loc.contains("\"country-name\">")) {
					List<String> p = new ArrayList<>(Arrays.asList(loc.split("\"country-name\">")));
					place = place + p.get(p.size() - 1);
				}
			}
			// Sensor Hub being created.
			DBOperations dboper = new DBOperations();
			dboper.createHub(place);
			RequestDispatcher rd = request.getRequestDispatcher("adminDashBoard.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
