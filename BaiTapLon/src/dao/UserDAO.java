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
import model.User;

/**
 *
 * @author NVB
 */
public class UserDAO {

	public boolean checkEmail(String email) {
		Connection connection = DBConnect.getConnection();
		String sql = "SELECT email FROM tbl_user WHERE email = ?";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				connection.close();
				return true;
			}
		} catch (SQLException ex) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	// add User.
	public boolean insertUser(User u) {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO tbl_user(c_email, c_password, c_fullname) VALUES(?,?,?)";

		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, u.getC_email());
			ps.setString(2, u.getC_password());
			ps.setString(3, u.getC_fullname());

			ps.executeUpdate();
			connection.close();
			return true;

		} catch (SQLException ex) {
			System.out.println("add UserDAO error");
		}
		return false;
	}

	// edit User by id.
	public boolean editUser(User u) {
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE tbl_user set c_email = ?, c_password = ?, c_fullname = ? WHERE pk_user_id = ?";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, u.getC_email());
			ps.setString(2, u.getC_password());
			ps.setString(3, u.getC_fullname());
			ps.setLong(4, u.getPk_user_id());
			ps.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	// check login 
	public User login(String email, String password) {
		User u = new User();
		Connection con = DBConnect.getConnection();
		String sql = "select * from tbl_user where c_email=? and c_password=?";
		PreparedStatement ps;
		try {
			ps = (PreparedStatement) con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				u.setPk_user_id(rs.getLong("pk_user_id"));
				u.setC_email(rs.getString("c_email"));
				u.setC_password(rs.getString("c_password"));
				u.setC_fullname(rs.getString("c_fullname"));

				con.close();
				return u;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return u;
	}

	public User getUserById(long userID) {
		User u = new User();
		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM tbl_user WHERE pk_user_id = ?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, userID);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				u.setPk_user_id(rs.getLong("pk_user_id"));
				u.setC_email(rs.getString("c_email"));
				u.setC_password(rs.getString("c_password"));
				u.setC_fullname(rs.getString("c_fullname"));
			}
			connection.close();
			return u;
		} catch (SQLException ex) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return u;
	}

	public ArrayList<User> getAllUser() {

		ArrayList<User> allUser = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM tbl_user";
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				User u = new User();
				u.setPk_user_id(rs.getLong("pk_user_id"));
				u.setC_email(rs.getString("c_email"));
				u.setC_password(rs.getString("c_password"));
				u.setC_fullname(rs.getString("c_fullname"));
				allUser.add(u);
			}
			connection.close();
			return allUser;
		} catch (SQLException ex) {
			Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return allUser;
	}

	public void deleteById(Long id) throws SQLException {
			Connection connection = DBConnect.getConnection();
			String query = "delete from tbl_user where pk_user_id = ?";
			PreparedStatement preparedStmt = connection.prepareStatement(query);
			preparedStmt.setLong(1, id);
			preparedStmt.execute();

			connection.close();

	}
}
