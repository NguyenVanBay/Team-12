package admin_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import dao.UserDAO;
import model.Category;

public class ListCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListCategory() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (null == session.getAttribute("email")) {
			// User is not logged in.
			response.sendRedirect("/Book/admin/Login");
		} else {

			ArrayList<Category> allCategory = new CategoryDAO().getAll();
			String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? "" : request.getParameter("name");

			if (name != "") {
				allCategory = new CategoryDAO().getWhere(name);
			} else {
				allCategory = new CategoryDAO().getAll();
			}
			
			request.setAttribute("categorys", allCategory);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-the-loai");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
