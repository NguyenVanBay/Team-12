package admin_controller;

import java.io.IOException;
import java.nio.ByteBuffer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.nio.charset.Charset;
import static java.nio.charset.StandardCharsets.*;

import dao.CategoryDAO;
import model.Category;
import sun.nio.cs.StandardCharsets;

public class EditCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditCategory() {
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
			
			request.setCharacterEncoding("UTF-8");

			Long id = Long.parseLong(request.getParameter("id"));

			Category category = new CategoryDAO().getCategoryById(id);

			request.setAttribute("category", category);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/sua-the-loai");
			rd.forward(request, response);
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
			
			String id = request.getParameter("id");

			String name = request.getParameter("name");
			String url = request.getParameter("url");
			
			Category c = new Category();
			c.setId(Long.parseLong(id));
			c.setName(name);
			c.setUrl(url);

			new CategoryDAO().editCategory(c);

			response.sendRedirect("/Book/admin/listCategory");

		}
	}
}
