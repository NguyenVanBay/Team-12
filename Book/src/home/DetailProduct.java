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

public class DetailProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DetailProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		long id = 0;
		
		// Sử lý chuỗi để lây id sản phẩm.
		String pathInfo = request.getRequestURL().toString();
		System.out.println("duong dan : " + pathInfo);
		// get id thể loại.
		String[] pathParts = pathInfo.split("/");
		String[] paths = pathParts[pathParts.length - 1].split("-");

		try {
			id = Long.parseLong(paths[paths.length - 1]);
		} catch (Exception e) {
			System.out.println("Lỗi xem chi tiết.");
		}

		// get Product.
		Product product = new ProductDAO().getProductById(id);
		request.setAttribute("product", product);

		// get all category.
		ArrayList<Category> allCategory = new CategoryDAO().getAll();
		request.setAttribute("categorys", allCategory);

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/detailProduct.jsp");
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
