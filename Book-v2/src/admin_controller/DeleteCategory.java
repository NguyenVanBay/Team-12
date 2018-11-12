package admin_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import model.User;

public class DeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteCategory() {
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

			if (roleAdmin.equals("" + User.GIAMDOC) || roleAdmin.equals("" + User.QUANLYTHELOAI)) {

				Long id = Long.parseLong(request.getParameter("id"));
				new CategoryDAO().deleteById(id);
				response.sendRedirect("/Book/admin/listCategory");

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
