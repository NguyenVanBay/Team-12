	package home;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import dao.ProductDAO;
import model.Category;
import model.Product;

public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchController() {
		super();
		// TODO Auto-generated constructor stub
	}
		
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = "";

		// Sử lý chuỗi để lây id sản phẩm.
		String pathInfo = request.getRequestURL().toString();
		System.out.println("duong dan : " + pathInfo);

		// get id thể loại.
		String[] pathParts = pathInfo.split("/");
		String[] paths = pathParts[pathParts.length - 1].split("-");
		
		id = paths[paths.length - 1];

		try {
			id = Long.parseLong(id) + "";
		} catch(Exception e) {
			id = "";
		}

		// get Param
		String name = (request.getParameter("name") == null) ? "" : request.getParameter("name");
		String author = (request.getParameter("author") == null) ? "" : request.getParameter("author");
		String priceFrom = (request.getParameter("priceFrom") == null) ? "" : request.getParameter("priceFrom");
		String priceTo = (request.getParameter("priceTo") == null) ? "" : request.getParameter("priceTo");
		String publicFrom = (request.getParameter("publicFrom") == null) ? "" : request.getParameter("publicFrom");
		String publicTo = (request.getParameter("publicTo") == null) ? "" : request.getParameter("publicTo");

		// tìm theo thể loại.
		if (id != "") {

			// category.
			Category category = new CategoryDAO().getCategoryById(Long.parseLong(id));
			request.setAttribute("category", category);

			ArrayList<Product> products = new ProductDAO().getProductByCategoryId(Long.parseLong(id));
			request.setAttribute("products", products);

		// tìm theo tham số khác.
		} else {

			Category category = new Category();
			request.setAttribute("category", category);

			ArrayList<Product> products = new ProductDAO().getWhereInClient(name, author, priceFrom, priceTo,
					publicFrom, publicTo);
			request.setAttribute("products", products);
		}

		ArrayList<Category> allCategory = new CategoryDAO().getAll();
		request.setAttribute("categorys", allCategory);

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/search.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
