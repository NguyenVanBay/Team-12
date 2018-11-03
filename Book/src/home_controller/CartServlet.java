package home_controller;

import java.io.IOException;
import java.net.NetworkInterface;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

@WebServlet("/cart")
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
		int countL = (request.getParameter("count") == null) ? 1 : Integer.parseInt(request.getParameter("count"));
		int countPr = 0;

		Cart cart = (Cart) session.getAttribute("cart");

		if (cart == null) {
			cart = new Cart();
		}

		try {

			switch (command) {
			case "plus":

				String productID = request.getParameter("productId");
				Long idProduct = Long.parseLong(productID);
				Product product = productDAO.getProductById(idProduct);

				if (cart.getCartItems().containsKey(idProduct)) {
					cart.plusToCart(idProduct,
							new Item(product, cart.getCartItems().get(idProduct).getQuantity() + countL));

				} else {
					cart.plusToCart(idProduct, new Item(product, countL));

				}

				break;

			case "edit":
				ArrayList<Long> listKey = new ArrayList<>();
				
				cart.getCartItems().forEach((k, v) -> {
					listKey.add(k);
				});

				for (int i = 0; i < listKey.size(); i++) {
					cart.plusToCart(listKey.get(i), new Item(cart.getCartItems().get(listKey.get(i)).getProduct(), Integer.parseInt(request.getParameter("soLuong" + listKey.get(i)))));
				}

				break;

			case "remove":
				String productID1 = request.getParameter("productId");
				Long idProduct1 = Long.parseLong(productID1);
				cart.removeToCart(idProduct1);
				break;
			}
		} catch (Exception e) {
			System.out.println("ngoai le");
			e.printStackTrace();
		}
		session.setAttribute("cart", cart);
		response.sendRedirect("/Book/danh-sach-gio-hang");
	}

}