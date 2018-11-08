package admin_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

@WebServlet("/admin/listCustomer")
public class ListCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListCustomer() {
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
			ArrayList<User> allUser = new UserDAO().getAllCustomer();

			String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? "" : request.getParameter("name");
			String email = (request.getParameter("email") == null || request.getParameter("email") == "") ? "" : request.getParameter("email");
			String phone = (request.getParameter("phone") == null || request.getParameter("phone") == "") ? "" : request.getParameter("phone");


			if (name != "" || email != "" || phone != "") {
				allUser = new UserDAO().getWhere(name, email, phone, "0");
			} else {
				allUser = new UserDAO().getAllCustomer();
			}
			
			request.setAttribute("users", allUser);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/listCustomer.jsp");
			rd.forward(request, response);
		}

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
