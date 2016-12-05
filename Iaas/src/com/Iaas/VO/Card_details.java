package com.Iaas.VO;

import java.math.BigInteger;

public class Card_details {
	private Long card_number;
	private int exp_date;
	private int cvv;
	private String name_on_card;
	
	public Long getCard_number() {
		return card_number;
	}
	public void setCard_number(Long card_number) {
		this.card_number = card_number;
	}
	public int getExp_date() {
		return exp_date;
	}
	public void setExp_date(int exp_date) {
		this.exp_date = exp_date;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	public String getName_on_card() {
		return name_on_card;
	}
	public void setName_on_card(String name_on_card) {
		this.name_on_card = name_on_card;
	}

}
