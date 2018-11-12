package admin_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

public class ListUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListUser() {
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
			
			String roleAdmin = (String) session.getAttribute("role");
			
			if(roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYNHANVIEN)) {
				ArrayList<User> allUser = new UserDAO().getAllUser();
				
				String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? "" : request.getParameter("name");
				String email = (request.getParameter("email") == null || request.getParameter("email") == "") ? "" : request.getParameter("email");
				String phone = (request.getParameter("phone") == null || request.getParameter("phone") == "") ? "" : request.getParameter("phone");
				String role = (request.getParameter("role") == null || request.getParameter("role") == "0") ? "0" : request.getParameter("role");
				
				if (name != "" || email != "" || phone != "" || role != "") {
					allUser = new UserDAO().getWhere(name, email, phone, role);
				} else {
					allUser = new UserDAO().getAllUser();
				}
				request.setAttribute("users", allUser);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-nguoi-dung");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
				rd.forward(request, response);
			}	
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
