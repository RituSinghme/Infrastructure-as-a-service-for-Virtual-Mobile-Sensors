/**
 * 
 */
package com.Iaas.Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Iaas.Util.InstancesUtilility;

/**
 * @author Rahul
 *
 */
public class UserServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String place = request.getParameter("myPlace");
			List<String> placeString = new ArrayList<>(Arrays.asList(place.split("</span>")));
			for (String loc : placeString) {
				if (loc.contains("\"locality\">")) {
					List<String> p = new ArrayList<>(Arrays.asList(loc.split("\"locality\">")));
					place = p.get(p.size() - 1);
					break;
				}
			}
			InstancesUtilility iu = new InstancesUtilility();
			iu.createSensorInstance("Pressure", place);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);
	}
}
