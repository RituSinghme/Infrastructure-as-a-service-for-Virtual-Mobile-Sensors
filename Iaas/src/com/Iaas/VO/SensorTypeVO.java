/**
 * 
 */
package com.Iaas.VO;

/**
 * @author Rahul
 *
 */
public class SensorTypeVO {
	private int userId;
	private String sensorId;
	private String type;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getSensorId() {
		return sensorId;
	}
	public void setSensorId(String sensorId) {
		this.sensorId = sensorId;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
