package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import model.Category;

public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Long id = Long.parseLong(request.getParameter("id"));
		
		Category category = new CategoryDAO().getCategoryById(id);

		request.setAttribute("category", category);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-the-loai");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		Category c = new Category();
		c.setId(Long.parseLong(id));
		c.setName(name);
		
		new CategoryDAO().editCategory(c);

		response.sendRedirect("/Book/admin/listCategory");

	}
}
