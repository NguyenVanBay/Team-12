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

public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int page = 0;
		int numInPage = 10;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			if(page < 0) page = 0;
		};

		// get sp mới.
		ArrayList<Product> listNew = new ProductDAO().getProductBySQL(
				"Select * from products where type = 'new' limit " + page * numInPage + " , " + numInPage);
		request.setAttribute("listNew", listNew);

		// get sp hot.
		ArrayList<Product> listHot = new ProductDAO().getProductBySQL(
				"Select * from products where type = 'hot' limit " + page * numInPage + " , " + numInPage);
		request.setAttribute("listHot", listHot);

		// get sp bán chạy.
		ArrayList<Product> listsellMultiple = new ProductDAO().getProductBySQL(
				"Select * from products where type = 'sellMultiple' limit " + page * numInPage + " , " + numInPage);
		request.setAttribute("listsellMultiple", listsellMultiple);

		// get all product.
		ArrayList<Product> allProduct = new ProductDAO().getAll();
		request.setAttribute("products", allProduct);

		// get all category.
		ArrayList<Category> allCategory = new CategoryDAO().getAll();
		request.setAttribute("categorys", allCategory);
		
		request.setAttribute("page", page);

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
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
