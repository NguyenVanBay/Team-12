package admin_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;

public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (null == session.getAttribute("email")) {
			// User is not logged in.
			response.sendRedirect("/Book/admin/Login");
		} else {
			Long id = Long.parseLong(request.getParameter("id"));
			
			String type = request.getParameter("type");
			
			
			new UserDAO().deleteById(id);
			if(type.equals("customer")) {
				response.sendRedirect("/Book/admin/listCustomer");
			} else {
				response.sendRedirect("/Book/admin/listUser");
			}

			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
