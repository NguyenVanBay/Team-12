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
import model.Image;
import model.Product;

/**
 *
 * @author NVB
 */
public class ProductDAO {

	// add Product.
	public boolean insertProduct(Product p) {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO products(name, author, public, count, price, id_category) VALUES(?,?,?,?,?,?)";
		
		Long id = (long)0;
		
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, p.getName());
			ps.setString(2, p.getAuthor());
			ps.setTimestamp(3, p.getPublicAt());
			ps.setLong(4, p.getCount());
			ps.setDouble(5, p.getPrice());
			ps.setLong(6, p.getCategory().getId());
			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();

			if (rs.next()) {
				id = rs.getLong(1);
			}
			connection.close();
			
			p.getThumbnail().setProduct(new Product(id));
			new ImageDAO().insertImage(p.getThumbnail());
			
			for (Image img : p.getListImage()) {
				img.setProduct(new Product(id));
				new ImageDAO().insertImage(img);
			}
			
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	// edit Product by id.
	public boolean editProduct(Product p) {
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE products set name = ?, author = ?, public = ?, count= ? , price= ?, id_category = ? WHERE id = ?";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, p.getName());
			ps.setString(2, p.getAuthor());
			ps.setTimestamp(3, p.getPublicAt());
			ps.setLong(4, p.getCount());
			ps.setDouble(5, p.getPrice());
			ps.setLong(6, p.getCategory().getId());
			ps.setLong(6, p.getId());
			ps.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	public Product getProductById(long id) {
		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM products WHERE id = ?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			Product p = new Product();
			
			Long categoryId = (long) 0;
			
			while (rs.next()) {
		
				p.setId(rs.getLong("id"));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPublicAt(rs.getTimestamp("public"));
				p.setCount(rs.getLong("count"));
				p.setPrice(rs.getDouble("price"));

				
			}
			connection.close();
			
			Category category = new CategoryDAO().getCategoryById(categoryId);
			ArrayList<Image> listImage = new ImageDAO().getImageByProductIdAndType(p.getId(), 2);
			Image thumbnail = new ImageDAO().getImageByProductIdAndType(p.getId(), 1).get(0);

			p.setCategory(category);
			p.setListImage(listImage);
			p.setThumbnail(thumbnail);
			
			return p;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public ArrayList<Product> getAll() {

		ArrayList<Product> allProduct = new ArrayList<>();
		ArrayList<Long> allCategory = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM products";
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Product p = new Product();
				p.setId(rs.getLong("id"));
				p.setName(rs.getString("name"));
				p.setAuthor(rs.getString("author"));
				p.setPublicAt(rs.getTimestamp("public"));
				p.setCount(rs.getLong("count"));
				p.setPrice(rs.getDouble("price"));
				allProduct.add(p);
				allCategory.add(rs.getLong("id_category"));
			}
			connection.close();

			for (int i = 0; i < allProduct.size(); i++) {

				Product p = allProduct.get(i);

				Category category = new CategoryDAO().getCategoryById(allCategory.get(i));
				ArrayList<Image> listImage = new ImageDAO().getImageByProductIdAndType(p.getId(), 2);
				Image thumbnail = new ImageDAO().getImageByProductIdAndType(p.getId(), 1).get(0);

				p.setCategory(category);
				p.setListImage(listImage);
				p.setThumbnail(thumbnail);
				allProduct.set(i, p);
			}

			return allProduct;
		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

	public void deleteById(Long id) {
		try {
			Connection connection = DBConnect.getConnection();

			String query = "delete from products where id = ?";
			PreparedStatement preparedStmt = connection.prepareStatement(query);
			preparedStmt.setLong(1, id);
			preparedStmt.execute();

			connection.close();

		} catch (SQLException ex) {
			Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
	}

	public static void main(String[] args) {
		ArrayList<Product> allProduct = new ProductDAO().getAll();

		for (Product product : allProduct) {

			for (Image img : product.getListImage()) {
				System.out.print(img.getName() + " - ");
			}

			System.out.println(product.getName());
			System.out.println(product.getThumbnail().getName());
			System.out.println(product.getCategory().getName());
		}

	}
}
