package admin_controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Product;

/**
 * Servlet implementation class Dasboard
 */
@WebServlet("/admin/dasboard")
public class Dasboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Dasboard() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		if (null == session.getAttribute("email")) {
			// User is not logged in.
			response.sendRedirect("/Book/admin/Login");
		} else {
			
			// lấy danh sách sản phẩm sắp hết hàng.
			ArrayList<Product> listProduct = new ProductDAO().getProductBySQL("SELECT * FROM products WHERE count < 15");
			request.setAttribute("listwarningProduct", listProduct);
			
			// lấy tháng hiện tại.
			Date date = new Date();
			LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			int month = localDate.getMonthValue();
//			"SELECT COUNT(*) FROM bills WHERE MONTH(happened_at) = 1"
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/admin/dasboard.jsp");
			rd.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
