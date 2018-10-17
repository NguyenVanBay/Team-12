package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import model.User;

public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Long id = Long.parseLong(request.getParameter("id"));
		
		User user = new UserDAO().getUserById(id);

		request.setAttribute("user", user);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-nguoi-dung");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String phone = request.getParameter("phone");
		
		if(checkUser(email, password, id) == 1) {
			User u = new User();
			u.setId(Long.parseLong(id));
			u.setAddress(address);
			u.setEmail(email);
			u.setName(name);
			u.setPassword(password);
			u.setPhone(phone);

			new UserDAO().editUser(u);
		}
		
		response.sendRedirect("/Book/admin/listUser");

	}

	private int checkUser(String email, String password, String id) {
		
		return 1;
		
	}

}
