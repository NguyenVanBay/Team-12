package admin_controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;

public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteProduct() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		if (null == session.getAttribute("email")) {
			// User is not logged in.
			response.sendRedirect("/Book/admin/Login");
		} else {

			Long id = Long.parseLong(request.getParameter("id"));

			new ProductDAO().deleteById(id);

			response.sendRedirect("/Book/admin/listProduct");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
