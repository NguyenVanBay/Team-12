package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import model.User;

public interface UserInterface {
	public int checkCreatedUser(Long id);
	public boolean checkEmail(String email);
	public void deleteById(Long id) throws SQLException;
	public boolean editUser(User u);
	public ArrayList<User> getAllCustomer(int page);
	public ArrayList<User> getAllUser(int page);
	public User getUserById(long userID);
	public ArrayList<User> getWhereUser(String name, String email, String phone, String role, int page);
	public ArrayList<User> getWhereCustomer(String name, String email, String phone, int page);
	public boolean insertUser(User u);
	public User loginAdmin(String email, String password);
	public User loginUser(String email, String password);
}
