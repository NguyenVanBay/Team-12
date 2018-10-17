package model;

import java.util.ArrayList;

public class Bill {
	private Long id;
	private String customer;
	private String address;
	private String phone;
	private double sumMoney;
	private Long createBy;
	private int status;
	ArrayList<BillDetail> listBill;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public double getSumMoney() {
		return sumMoney;
	}
	public void setSumMoney(double sumMoney) {
		this.sumMoney = sumMoney;
	}
	public Long getCreateBy() {
		return createBy;
	}
	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public ArrayList<BillDetail> getListBill() {
		return listBill;
	}
	public void setListBill(ArrayList<BillDetail> listBill) {
		this.listBill = listBill;
	}
}
