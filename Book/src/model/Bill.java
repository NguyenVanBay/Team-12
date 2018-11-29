package model;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Bill {
	private Long id;
	private String customer;
	private String address;
	private String phone;
	private double sumMoney;
	private Long status;
	ArrayList<BillDetail> listBillDetail;
	private Long createBy;
	private Timestamp createAt;

	public Timestamp getCreateAt() {
		return createAt;
	}

	public void setCreateAt(Timestamp createAt) {
		this.createAt = createAt;
	}

	public static final Long CHODUYETDON = (long)0;
	public static final Long DAGIAODON = (long)1;
	public static final Long DANGGIAODON = (long)2;
	public static final Long HUYDON = (long)3;

	public Long getCreateBy() {
		return createBy;
	}

	public void setCreateBy(Long createBy) {
		this.createBy = createBy;
	}

	public Bill() {
		// TODO Auto-generated constructor stub
	}

	public Bill(long id) {
		this.id = id;
	}

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

	public long getStatus() {
		return status;
	}

	public void setStatus(long status) {
		this.status = status;
	}

	public ArrayList<BillDetail> getListBillDetail() {
		return listBillDetail;
	}

	public void setListBillDetail(ArrayList<BillDetail> listBillDetail) {
		this.listBillDetail = listBillDetail;
	}
}
