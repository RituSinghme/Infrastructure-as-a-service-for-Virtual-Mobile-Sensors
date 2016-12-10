/**
 * 
 */
package com.Iaas.Util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.Iaas.VO.SensorTypeVO;

/**
 * @author Rahul
 *
 */
public class UtilConstants {
	// Amazon account access details with IAM credentials and end point
		public static final String accessKeyId = "**";
		public static final String secretAccessKey = "**";
		public static final String endPoint = "**";
		
		// Weather API URL
		public static final String weatherURLLat = "http://api.openweathermap.org/data/2.5/weather?lat=";
		public static final String weatherURLLong = "&lon=";
		public static final String weatherURLAppID = "**";
		// Amazon instance creation constants	
		public static final String ec2ImageId = "**";
		public static final String ec2InstanceType = "**";
		
		// Database credentials
		public static final String URL = "**";
		public static final String USER = "**";
		public static final String PASS = "**";
		public static final String DB = "**";
		
		public static double angle=0;
		public static double distance = 10000.0; // in miles
		
		// Billing Costs
		public static final double costPerHour = 0.05;
		public static final double costPerGb = 0.5;
		public static final double perHourUsage = 200; // in Mb
		
		// Sensors Type List
		private static List<SensorTypeVO> pressureSensorsList;
		private static List<SensorTypeVO> temperatureSensorsList;
		private static List<SensorTypeVO> windSensorsList;
		private static List<SensorTypeVO> humiditySensorsList;
		private static List<String> citiesList;
		
		// Mobile Hubs Map
		private static Map<String, String[]> hubDetails =new HashMap<>();
		

		public static Map<String, String[]> getHubDetails() {
			return hubDetails;
		}

		public static void setHubDetails(Map<String, String[]> hubDetails) {
			UtilConstants.hubDetails = hubDetails;
		}

		public static List<String> getCitiesList() {
			return citiesList;
		}

		public static void setCitiesList(List<String> citiesList) {
			UtilConstants.citiesList = citiesList;
		}

		public static List<SensorTypeVO> getPressureSensorsList() {
			return pressureSensorsList;
		}

		public static void setPressureSensorsList(List<SensorTypeVO> pressureSensorsList) {
			UtilConstants.pressureSensorsList = pressureSensorsList;
		}

		public static List<SensorTypeVO> getTemperatureSensorsList() {
			return temperatureSensorsList;
		}

		public static void setTemperatureSensorsList(List<SensorTypeVO> temperatureSensorsList) {
			UtilConstants.temperatureSensorsList = temperatureSensorsList;
		}

		public static List<SensorTypeVO> getWindSensorsList() {
			return windSensorsList;
		}

		public static void setWindSensorsList(List<SensorTypeVO> windSensorsList) {
			UtilConstants.windSensorsList = windSensorsList;
		}

		public static List<SensorTypeVO> getHumiditySensorsList() {
			return humiditySensorsList;
		}

		public static void setHumiditySensorsList(List<SensorTypeVO> humiditySensorsList) {
			UtilConstants.humiditySensorsList = humiditySensorsList;
		}

		//userID
		private static String userId;

		public static String getUserId() {
			return userId;
		}

		public static void setUserId(String userId) {
			UtilConstants.userId = userId;
		}
}
