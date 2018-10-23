package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import model.Cart;
import model.Item;
import model.Product;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final ProductDAO productDAO = new ProductDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		String productID = request.getParameter("productId");

		System.out.println(command);
		System.out.println(productID);
		Cart cart = (Cart) session.getAttribute("cart");

		if (cart == null) {
			cart = new Cart();
		}

		try {
			Long idProduct = Long.parseLong(productID);
			Product product = productDAO.getProductById(idProduct);
			switch (command) {
			case "plus":
				if (cart.getCartItems().containsKey(idProduct)) {
					cart.plusToCart(idProduct, new Item(product, cart.getCartItems().get(idProduct).getQuantity()));
					System.out.println("cong vao");
				} else {
					cart.plusToCart(idProduct, new Item(product, 1));
					System.out.println("t");
				}
				break;

			case "remove":
				cart.removeToCart(idProduct);
				break;
			}
		} catch (Exception e) {
			System.out.println("ngoai le");
			e.printStackTrace();
		}
		session.setAttribute("cart", cart);
		response.sendRedirect("/Book/ListCart");
	}

}