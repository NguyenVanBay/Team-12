/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.Bill;
import model.BillDetail;

/**
 *
 * @author NVB
 */
public class BillDAO {

	// add bill.
	public boolean insertBill(Bill b) {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO bills(customer, address, phone, sumMoney, status, create_by) VALUES(?,?,?,?,?,?)";

		Long id = (long) 0;

		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, b.getCustomer());
			ps.setString(2, b.getAddress());
			ps.setString(3, b.getPhone());
			ps.setDouble(4, b.getSumMoney());
			ps.setLong(5, b.getStatus());
			ps.setLong(6, b.getCreateBy());
			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();

			if (rs.next()) {
				id = rs.getLong(1);
			}

			connection.close();

			for (BillDetail billDetail : b.getListBillDetail()) {
				billDetail.setBill(new Bill(id));
				new BillDetailDAO().insertBillDetail(billDetail);
			}

			return true;
		} catch (SQLException ex) {
			Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	// edit Bill.
	public boolean editBill(Bill b) {
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE bills set status = ? WHERE id = ?";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, b.getStatus());
			ps.setLong(2, b.getId());
			ps.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(BillDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	public Bill getBillById(long id) {
		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM bills WHERE id = ?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			Bill b = new Bill();

			while (rs.next()) {

				b.setId(rs.getLong("id"));
				b.setAddress(rs.getString("address"));
				b.setCustomer(rs.getString("customer"));
				b.setPhone(rs.getString("phone"));
				b.setSumMoney(rs.getDouble("sumMoney"));
				b.setStatus(rs.getLong("status"));

			}

			ArrayList<BillDetail> listBillDetail = new BillDetailDAO().getBillDetailByIdBill(id);
			b.setListBillDetail(listBillDetail);

			connection.close();

			return b;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public ArrayList<Bill> getAll() {

		ArrayList<Bill> listBill = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM bills ORDER BY status ASC";
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Bill b = new Bill();
				b.setId(rs.getLong("id"));
				b.setAddress(rs.getString("address"));
				b.setCustomer(rs.getString("customer"));
				b.setPhone(rs.getString("phone"));
				b.setSumMoney(rs.getDouble("sumMoney"));
				b.setStatus(rs.getLong("status"));
				listBill.add(b);

			}

			connection.close();
			int i = 0;
			for (Bill bill : listBill) {
				ArrayList<BillDetail> listBillDetail = new BillDetailDAO().getBillDetailByIdBill(bill.getId());
				bill.setListBillDetail(listBillDetail);
				listBill.set(i, bill);
				i++;
			}

			return listBill;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return listBill;
	}

	public ArrayList<Bill> getWhere(String name, String address, String phone, String sumFrom, String sumTo) {
		ArrayList<Bill> listBill = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM bills Where 1 = 1 ";
			
			if(name != "") {
				sql += " AND customer like '%" + name + "%'";
			}
			
			if(address != "") {
				sql += " AND address like '%" + address + "%'";
			}
			
			if(phone != "") {
				sql += " AND phone like '%" + phone + "%'";
			}
			
			if(sumFrom != "" && sumTo != "") {
				sql += " AND sumMoney BETWEEN "+ sumFrom +" AND " + sumTo +" ";
			}


			sql += " ORDER BY status ASC";
			
			PreparedStatement ps = connection.prepareCall(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Bill b = new Bill();
				b.setId(rs.getLong("id"));
				b.setAddress(rs.getString("address"));
				b.setCustomer(rs.getString("customer"));
				b.setPhone(rs.getString("phone"));
				b.setSumMoney(rs.getDouble("sumMoney"));
				b.setStatus(rs.getLong("status"));
				listBill.add(b);

			}

			connection.close();
			int i = 0;
			for (Bill bill : listBill) {
				ArrayList<BillDetail> listBillDetail = new BillDetailDAO().getBillDetailByIdBill(bill.getId());
				bill.setListBillDetail(listBillDetail);
				listBill.set(i, bill);
				i++;
			}

			return listBill;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return listBill;
	}
}
