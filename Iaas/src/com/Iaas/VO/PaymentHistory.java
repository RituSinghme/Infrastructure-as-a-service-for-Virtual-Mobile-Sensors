package com.Iaas.VO;

public class PaymentHistory {
	private int bill_id;
	private String user_name;
	private int billed_storage;
	private int billed_hours;
	private String card_used;
	private int amount_paid;
	private String status;
	
	
	public int getBill_id() {
		return bill_id;
	}
	public void setBill_id(int bill_id) {
		this.bill_id = bill_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getBilled_storage() {
		return billed_storage;
	}
	public void setBilled_storage(int billed_storage) {
		this.billed_storage = billed_storage;
	}
	public int getBilled_hours() {
		return billed_hours;
	}
	public void setBilled_hours(int billed_hours) {
		this.billed_hours = billed_hours;
	}
	public String getCard_used() {
		return card_used;
	}
	public void setCard_used(String card_used) {
		this.card_used = card_used;
	}
	public int getAmount_paid() {
		return amount_paid;
	}
	public void setAmount_paid(int amount_paid) {
		this.amount_paid = amount_paid;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

}
