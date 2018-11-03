package admin_controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Product;

@WebServlet("/admin/detailProduct")
public class DetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DetailProduct() {
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

			Product product = new ProductDAO().getProductById(id);

			request.setAttribute("product", product);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/detailProduct.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
