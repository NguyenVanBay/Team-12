
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import connect.DBConnect;
import model.New;

/**
 *
 * @author NVB
 */
public class NewDAO {

	// add Category.
	public boolean insertNew(New n) {
		Connection connection = DBConnect.getConnection();
		String sql = "INSERT INTO tbl_news(fk_category_news_id, c_name, c_description, c_content, c_img, c_hotnews, c_latestnews, c_time ) VALUES(?, ?, ?, ?, ?,?, ?, ?)";

		
		long milliseconds = 0;
		SimpleDateFormat f = new SimpleDateFormat("dd-MM-yyyy");
		try {
			Date d = new Date();
			milliseconds = d.getTime();
		} catch (Exception e) {
			System.out.println("chÆ°a nháº­p ngÃ y");
		}
		
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, n.getFk_category_news_id());
			ps.setString(2, n.getC_name());
			ps.setString(3, n.getC_description());
			ps.setString(4, n.getC_content());
			ps.setString(5, n.getC_img());
			ps.setLong(6, n.getC_hotnews());
			ps.setLong(7, n.getC_latestnews());
			ps.setTimestamp(8, new Timestamp(milliseconds));
			ps.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(NewDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}
	
	

	// edit Category by id.
	public boolean editNew(New n) {

		Connection connection = DBConnect.getConnection();
		String sql = "UPDATE tbl_news set fk_category_news_id= ?, c_name = ?, c_description = ?, c_content = ?, c_img = ?,  c_hotnews = ? , c_latestnews = ? WHERE pk_news_id = ?";
		try {
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, n.getFk_category_news_id());
			ps.setString(2, n.getC_name());
			ps.setString(3, n.getC_description());
			ps.setString(4, n.getC_content());
			ps.setString(5, n.getC_img());
			ps.setLong(6, n.getC_hotnews());
			ps.setLong(7, n.getC_latestnews());
			ps.setLong(8, n.getPk_news_id());
			ps.executeUpdate();
			connection.close();
			return true;
		} catch (SQLException ex) {
			Logger.getLogger(NewDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return false;
	}

	public New getNewById(long id) {
		New n = new New();
		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM tbl_news WHERE pk_news_id = ?";
			PreparedStatement ps = connection.prepareCall(sql);
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				n.setPk_news_id(rs.getLong("pk_news_id"));
				n.setFk_category_news_id(rs.getLong("fk_category_news_id"));
				n.setC_content(rs.getString("c_content"));
				n.setC_description(rs.getString("c_description"));
				n.setC_img(rs.getString("c_img"));
				n.setC_name(rs.getString("c_name"));
				n.setC_hotnews(rs.getLong("c_hotnews"));
				n.setC_latestnews(rs.getLong("c_latestnews"));

			}
			connection.close();
			return n;
		} catch (SQLException ex) {
			Logger.getLogger(NewDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return n;
	}
	
	public ArrayList<New> getAll(int page) {

		ArrayList<New> allNew = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM tbl_news limit " + page * 10 + ", 10";
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				New n = new New();
				n.setPk_news_id(rs.getLong("pk_news_id"));
				n.setFk_category_news_id(rs.getLong("fk_category_news_id"));
				n.setC_content(rs.getString("c_content"));
				n.setC_description(rs.getString("c_description"));
				n.setC_img(rs.getString("c_img"));
				n.setC_name(rs.getString("c_name"));
				n.setC_hotnews(rs.getLong("c_hotnews"));
				n.setC_latestnews(rs.getLong("c_latestnews"));
				allNew.add(n);
			}
			connection.close();
			return allNew;
		} catch (SQLException ex) {
			Logger.getLogger(NewDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return allNew;
	}
	
	

	public ArrayList<New> getAll() {

		ArrayList<New> allNew = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM tbl_news";
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				New n = new New();
				n.setPk_news_id(rs.getLong("pk_news_id"));
				n.setFk_category_news_id(rs.getLong("fk_category_news_id"));
				n.setC_content(rs.getString("c_content"));
				n.setC_description(rs.getString("c_description"));
				n.setC_img(rs.getString("c_img"));
				n.setC_name(rs.getString("c_name"));
				n.setC_hotnews(rs.getLong("c_hotnews"));
				n.setC_latestnews(rs.getLong("c_latestnews"));
				allNew.add(n);
			}
			connection.close();
			return allNew;
		} catch (SQLException ex) {
			Logger.getLogger(NewDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return allNew;
	}
	
	// lấy 3 tin phan dau trang.
	public ArrayList<New> get3TinChinh() {

		ArrayList<New> allNew = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM tbl_news limit 0, 3";
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				New n = new New();
				n.setPk_news_id(rs.getLong("pk_news_id"));
				n.setFk_category_news_id(rs.getLong("fk_category_news_id"));
				n.setC_content(rs.getString("c_content"));
				n.setC_description(rs.getString("c_description"));
				n.setC_img(rs.getString("c_img"));
				n.setC_name(rs.getString("c_name"));
				n.setC_hotnews(rs.getLong("c_hotnews"));
				n.setC_latestnews(rs.getLong("c_latestnews"));
				allNew.add(n);
			}
			connection.close();
			return allNew;
		} catch (SQLException ex) {
			Logger.getLogger(NewDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return allNew;
	}
	
	public ArrayList<New> getByCategoryId(long id) {

		ArrayList<New> allNew = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM tbl_news where fk_category_news_id = " + id;
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				New n = new New();
				n.setPk_news_id(rs.getLong("pk_news_id"));
				n.setFk_category_news_id(rs.getLong("fk_category_news_id"));
				n.setC_content(rs.getString("c_content"));
				n.setC_description(rs.getString("c_description"));
				n.setC_img(rs.getString("c_img"));
				n.setC_name(rs.getString("c_name"));
				n.setC_hotnews(rs.getLong("c_hotnews"));
				n.setC_latestnews(rs.getLong("c_latestnews"));
				allNew.add(n);
			}
			connection.close();
			return allNew;
		} catch (SQLException ex) {
			Logger.getLogger(NewDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return allNew;
	}
	
	public ArrayList<New> getNewByCategoryId(Long id) {

		ArrayList<New> allNew = new ArrayList<>();

		try {
			Connection connection = DBConnect.getConnection();
			String sql = "SELECT * FROM tbl_news where fk_category_news_id = " + id;
			PreparedStatement ps = connection.prepareCall(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				New n = new New();
				n.setPk_news_id(rs.getLong("pk_news_id"));
				n.setFk_category_news_id(rs.getLong("fk_category_news_id"));
				n.setC_content(rs.getString("c_content"));
				n.setC_description(rs.getString("c_description"));
				n.setC_img(rs.getString("c_img"));
				n.setC_name(rs.getString("c_name"));
				n.setC_hotnews(rs.getLong("c_hotnews"));
				n.setC_latestnews(rs.getLong("c_latestnews"));
				allNew.add(n);
			}
			connection.close();
			return allNew;
		} catch (SQLException ex) {
			Logger.getLogger(NewDAO.class.getName()).log(Level.SEVERE, null, ex);
		}
		return allNew;
	}

	public void deleteById(Long id) throws SQLException {
		Connection connection = DBConnect.getConnection();

		String query = "delete from tbl_news where pk_news_id = ?";
		PreparedStatement preparedStmt = connection.prepareStatement(query);
		preparedStmt.setLong(1, id);
		preparedStmt.execute();

		connection.close();

	}
}
