
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
public class CategoryDAO {

	// add Category.
	public boolean insertCategory(Category c) {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO tbl_category_news(c_name) VALUES(?)";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, c.getC_name());
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
		
		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE tbl_category_news set c_name = ? WHERE pk_category_news_id = ?";
		System.out.println(sql);
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setString(1, c.getC_name());
			ps.setLong(2, c.getPk_category_news_id());
			
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
			String sql = "SELECT * FROM tbl_category_news WHERE pk_category_news_id = ?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				c.setPk_category_news_id(rs.getLong("pk_category_news_id"));
				c.setC_name(rs.getString("c_name"));
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
			String sql = "SELECT * FROM tbl_category_news";
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Category c = new Category();
				c.setPk_category_news_id(rs.getLong("pk_category_news_id"));
				c.setC_name(rs.getString("c_name"));
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

			String query = "delete from tbl_category_news where pk_category_news_id = ?";
			PreparedStatement preparedStmt = connection.prepareStatement(query);
			preparedStmt.setLong(1, id);
			preparedStmt.execute();

			connection.close();

	}
	
	public static void main(String[] args) {
		ArrayList<Category> list = new CategoryDAO().getAll();
		for (Category category : list) {
			System.out.println(category.getC_name());
		}
	}
}
