package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddUser() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/them-nguoi-dung");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String rePassword = request.getParameter("re-password");
		String phone = request.getParameter("phone");
		
		if(checkUser(email, password, rePassword) == 1) {
			User u = new User();
			u.setAddress(address);
			u.setEmail(email);
			u.setName(name);
			u.setPassword(password);
			u.setPhone(phone);

			new UserDAO().insertUser(u);
		}
		
		response.sendRedirect("/Book/admin/listUser");
	}

	private int checkUser(String email, String password, String rePassword) {

		
		if(password.equals(rePassword)) {
			return 1;
		}
		return 0;
		
	}

}
