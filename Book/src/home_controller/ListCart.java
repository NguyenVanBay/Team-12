package home_controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Cart;
import model.Item;

/**
 * Servlet implementation class ListCart
 */
@WebServlet("/danh-sach-gio-hang")
public class ListCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListCart() {
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
		Cart cart = (Cart) session.getAttribute("cart");

		ArrayList<Item> listItem = new ArrayList<>();

		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		} else {
			session.setAttribute("cart", cart);
			cart.getCartItems().forEach((key, value) -> {
				listItem.add(value);
				System.out.println(key);
				System.out.println(value.getProduct().getName());
				System.out.println(value.getQuantity());
			});
		}

		request.setAttribute("listItem", listItem);
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/listCart.jsp");
		rd.forward(request, response);
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
