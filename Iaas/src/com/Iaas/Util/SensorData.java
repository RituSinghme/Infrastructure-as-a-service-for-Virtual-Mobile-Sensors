/**
 * 
 */
package com.Iaas.Util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.nio.charset.Charset;
import java.sql.SQLException;

import org.json.JSONException;
import org.json.JSONObject;

import com.Iaas.VO.WeatherDataVO;
import com.Iaas.dbConnections.DBConnections;

/**
 * @author Rahul
 *
 */
public class SensorData {
	public void fetchData(String url, String city) throws IOException, JSONException, ClassNotFoundException, SQLException {
		WeatherDataVO weatherData = new WeatherDataVO();
		InputStream is = new URL(url).openStream();
		try {
			BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
			String jsonText = readAll(rd);
			JSONObject json = new JSONObject(jsonText);
			Utils util = new Utils();
			DBConnections dbconn = new DBConnections();
			int locationIId = dbconn.getLocationId(city);
			weatherData.setLocationId(locationIId);
			weatherData.setTemp(json.getJSONObject("main").getString("temp"));
			weatherData.setMax_temp(json.getJSONObject("main").getString("temp_max"));
			weatherData.setMin_temp(json.getJSONObject("main").getString("temp_min"));
			weatherData.setHumidity(json.getJSONObject("main").getString("humidity"));
			weatherData.setPressure(json.getJSONObject("main").getString("pressure"));
			weatherData.setWindDirection(json.getJSONObject("wind").getString("deg"));
			weatherData.setWindSpeed(json.getJSONObject("wind").getString("speed"));
			weatherData.setTimeStamp(util.getCurrentTime());
			System.out.println(json.getJSONObject("main"));
			
			DBConnections dbc = new DBConnections();
			dbc.insertWeatherData(weatherData);
		} finally {
			is.close();
		}
	}
	
	private static String readAll(Reader rd) throws IOException {
		StringBuilder sb = new StringBuilder();
		int cp;
		while ((cp = rd.read()) != -1) {
			sb.append((char) cp);
		}
		return sb.toString();
	}
}
