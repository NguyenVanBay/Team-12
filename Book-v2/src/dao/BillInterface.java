package dao;

import java.util.ArrayList;

import model.Bill;

public interface BillInterface {
	public boolean insertBill(Bill b);
	public boolean editBill(Bill b);
	public ArrayList<Bill> getAll();
	public Bill getBillById(long id);
	public ArrayList<Bill> getWhere(String name, String address, String phone, String sumFrom, String sumTo);
	
}
