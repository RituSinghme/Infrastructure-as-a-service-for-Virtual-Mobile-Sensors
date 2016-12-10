/**
 * 
 */
package com.Iaas.VO;

/**
 * @author Rahul
 *
 */
public class HubVO {
	private String name;
	private String[] latlng;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String[] getLatlng() {
		return latlng;
	}
	public void setLatlng(String[] latlng) {
		this.latlng = latlng;
	}
	@Override
	public String toString() {
		return latlng[0]+", "+latlng[1];
	}
	
}
