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
import dao.ProductDAO;
import model.Category;
import model.Product;
import model.User;

public class ListProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ListProduct() {
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

				ArrayList<Product> allProduct = new ProductDAO().getAll();

				String name = (request.getParameter("name") == null || request.getParameter("name") == "") ? ""
						: request.getParameter("name");
				String author = (request.getParameter("author") == null || request.getParameter("author") == "") ? ""
						: request.getParameter("author");
				String title = (request.getParameter("title") == null || request.getParameter("title") == "") ? ""
						: request.getParameter("title");
				String priceFrom = (request.getParameter("priceFrom") == null
						|| request.getParameter("priceFrom") == "") ? "" : request.getParameter("priceFrom");
				String priceTo = (request.getParameter("priceTo") == null || request.getParameter("priceTo") == "") ? ""
						: request.getParameter("priceTo");
				String idCategory = (request.getParameter("idCategory") == null
						|| request.getParameter("idCategory") == "") ? "-1" : request.getParameter("idCategory");

				if (name != "" || author != "" || title != "" || priceFrom != "" || priceTo != ""
						|| idCategory != "-1") {
					allProduct = new ProductDAO().getWhere(name, author, title, priceFrom, priceTo, idCategory);
				} else {
					allProduct = new ProductDAO().getAll();
				}

				ArrayList<Category> listCategory = new CategoryDAO().getAll();
				request.setAttribute("categorys", listCategory);

				request.setAttribute("products", allProduct);
				RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/danh-sach-san-pham");
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
