package admin_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CategoryDAO;
import model.Category;
import model.User;

public class AddCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCategory() {
		super();
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

				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/them-the-loai");
				rd.forward(request, response);

			} else {
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard");
				rd.forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (null == session.getAttribute("email")) {
			// User is not logged in.
			response.sendRedirect("/Book/admin/Login");
		} else {

			request.setCharacterEncoding("UTF-8");
			String name = request.getParameter("name");
			String url = request.getParameter("url");
			
			if(name.equals("") || url.equals("")) {
				response.sendRedirect("/Book/admin/addCategory?error=add");
				return;
			}

			System.out.println(name);

			Category c = new Category();

			c.setName(name);
			c.setUrl(url);
			c.setCreateBy(Long.parseLong(session.getAttribute("idAdmin").toString()));

			new CategoryDAO().insertCategory(c);

			response.sendRedirect("/Book/admin/listCategory");
		}
	}
}
