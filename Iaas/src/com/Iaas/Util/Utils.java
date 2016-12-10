/**
 * 
 */
package com.Iaas.Util;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.gavaghan.geodesy.Ellipsoid;
import org.gavaghan.geodesy.GeodeticCalculator;
import org.gavaghan.geodesy.GlobalPosition;
import org.w3c.dom.Document;

/**
 * @author Rahul
 *
 */
public class Utils {
	public String[] getLatLongPositions(String address) throws Exception {
		int responseCode = 0;
		String api = "http://maps.googleapis.com/maps/api/geocode/xml?address=" + URLEncoder.encode(address, "UTF-8")
				+ "&sensor=true";
		URL url = new URL(api);
		HttpURLConnection httpConnection = (HttpURLConnection) url.openConnection();
		httpConnection.connect();
		responseCode = httpConnection.getResponseCode();
		if (responseCode == 200) {
			DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
			Document document = builder.parse(httpConnection.getInputStream());
			XPathFactory xPathfactory = XPathFactory.newInstance();
			XPath xpath = xPathfactory.newXPath();
			XPathExpression expr = xpath.compile("/GeocodeResponse/status");
			String status = (String) expr.evaluate(document, XPathConstants.STRING);
			if (status.equals("OK")) {
				expr = xpath.compile("//geometry/location/lat");
				String latitude = (String) expr.evaluate(document, XPathConstants.STRING);
				expr = xpath.compile("//geometry/location/lng");
				String longitude = (String) expr.evaluate(document, XPathConstants.STRING);
				return new String[] { latitude, longitude };
			} else {
				throw new Exception("Error from the API - response status: " + status);
			}
		}
		return null;
	}
	
	public String getCurrentTime(){
		Calendar calendar = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat();
        String timeStamp = sdf.format(calendar.getTime());
		return timeStamp;
	}
	
	public void startFetchingData(){
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				// TODO Auto-generated method stub
				for(String city : UtilConstants.getCitiesList()){
					Utils util = new Utils();
					try {
						System.out.println(city);
						String[] latlng=util.getLatLongPositions(city);
						SensorData data = new SensorData();
						data.fetchData(UtilConstants.weatherURLLat+latlng[0]+UtilConstants.weatherURLLong+latlng[1]+
								UtilConstants.weatherURLAppID, city);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		};
		Timer timer = new Timer();
		timer.scheduleAtFixedRate(task, 0, 3600000);
	}
	
	public double getDistanceBetweenLatLng(String latPlace, String lonPlace, String latHub, String lonHub){
		GeodeticCalculator geoCalc = new GeodeticCalculator();
		Ellipsoid reference = Ellipsoid.WGS84;  
		GlobalPosition pointA = new GlobalPosition(Double.parseDouble(latPlace), Double.parseDouble(lonPlace), 0.0); // Point A
		GlobalPosition userPos = new GlobalPosition(Double.parseDouble(latHub), Double.parseDouble(lonHub), 0.0); // Point B
		double distance = geoCalc.calculateGeodeticCurve(reference, userPos, pointA).getEllipsoidalDistance();
		return distance;
	}
}
