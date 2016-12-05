package com.Iaas.VO;

import java.util.*;

public class BillingDetails {
	
	private String sensor_id;
	//private int bill_amount;
	private String end_time;
	private String start_time;
	private int session_cost;
	private int gbUsed;
	private int costforStorageUsed;
	private String total_cost;
	
	public int getGbUsed() {
		return gbUsed;
	}
	public void setGbUsed(int gbUsed) {
		this.gbUsed = gbUsed;
	}
	public int getCostforStorageUsed() {
		return costforStorageUsed;
	}
	public void setCostforStorageUsed(int costforStorageUsed) {
		this.costforStorageUsed = costforStorageUsed;
	}
	public String getTotals_cost() {
		return total_cost;
	}
	public void setTotals_cost(String totals_cost) {
		this.total_cost = totals_cost;
	}
	
	
	public String getSensor_id() {
		return sensor_id;
	}
	public void setSensor_id(String sensor_id) {
		this.sensor_id = sensor_id;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public int getSession_cost() {
		return session_cost;
	}
	public void setSession_cost(int session_cost) {
		this.session_cost = session_cost;
	}
	
	
	

}
