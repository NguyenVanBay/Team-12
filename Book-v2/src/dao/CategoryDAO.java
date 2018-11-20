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
import model.Category;

/**
 *
 * @author NVB
 */
public class CategoryDAO implements CategoryInterface {

	// add Category.
	public boolean insertCategory(Category c) {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO categorys(name, create_by, url) VALUES(?, ?, ?)";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, c.getName());
			ps.setLong(2, c.getCreateBy());
			ps.setString(3, c.getUrl());
			ps.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	// edit Category by id.
	public boolean editCategory(Category c) {
		
		System.out.println("ten la  "+ c.getName());
		
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE categorys set name = ?, url = ? WHERE id = ?";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, c.getName());
			ps.setString(2, c.getUrl());
			ps.setLong(3, c.getId());
			ps.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	public Category getCategoryById(long id) {
		Category c = new Category();
		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM categorys WHERE id = ?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {

				c.setId(rs.getLong("id"));
				c.setName(rs.getString("name"));
				c.setUrl(rs.getString("url"));
				c.setCreateBy(rs.getLong("create_by"));
			}
			connection.close();
			return c;
		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return c;
	}

	public ArrayList<Category> getAll() {

		ArrayList<Category> allCategory = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM categorys";
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Category c = new Category();
				c.setId(rs.getLong("id"));
				c.setName(rs.getString("name"));
				c.setUrl(rs.getString("url"));
				c.setCreateBy(rs.getLong("create_by"));
				allCategory.add(c);
			}
			connection.close();
			return allCategory;
		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return allCategory;
	}

	public void deleteById(Long id) throws SQLException {
			Connection connection = DBConnect.getConnection();

			String query = "delete from categorys where id = ?";
			PreparedStatement preparedStmt = connection.prepareStatement(query);
			preparedStmt.setLong(1, id);
			preparedStmt.execute();

			connection.close();

	}

	public ArrayList<Category> getWhere(String name) {

		ArrayList<Category> allCategory = new ArrayList<>();
		String sql = "SELECT * FROM categorys where 1 = 1 ";
		
		if(name != "") {
			sql += " AND name like '%" + name + "%'";
		}

		try {
			Connection connection = DBConnect.getConnection();
			
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Category c = new Category();
				c.setId(rs.getLong("id"));
				c.setName(rs.getString("name"));
				c.setUrl(rs.getString("url"));
				c.setCreateBy(rs.getLong("create_by"));
				allCategory.add(c);
			}
			connection.close();
			return allCategory;
		} catch (SQLException ex) {
			Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return allCategory;
	}
}
