package home;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
public class CartController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private final ProductDAO productDAO = new ProductDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String command = request.getParameter("command");
		Cart cart = (Cart) session.getAttribute("cart");

		switch (command) {
		case "list": // xem danh sách giỏ hàng.
			ArrayList<Item> listItem = new ArrayList<>();

			// sản phẩm đề xuất.
			ArrayList<Product> listProductSugerencias = new ArrayList<>();

			// nếu cart null -> create cart.
			if (cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);

				// lấy toàn bộ đơn.
			} else {
				session.setAttribute("cart", cart);
				cart.getCartItems().forEach((key, value) -> {
					listItem.add(value);
					double priceFrom = value.getProduct().getPrice() - 20000;
					double priceTo = value.getProduct().getPrice() + 20000;

					// lấy sản phẩm cùng lại và có giá hơn kém 20k.
					String sql = "Select * from products where id_category = " + value.getProduct().getCategory().getId()
							+ " AND price between " + priceFrom + " AND " + priceTo + " limit 2";
					System.out.println(sql);
					ArrayList<Product> temp = new ProductDAO().getProductBySQL(sql);

					listProductSugerencias.addAll(temp);
				});
			}

			// send data to cart view.
			request.setAttribute("listItem", listItem);
			request.setAttribute("listProductSugerencias", listProductSugerencias);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/listCart.jsp");
			rd.forward(request, response);
			return;

		case "remove": // xóa giỏ hàng.
			String productID1 = request.getParameter("productId");
			Long idProduct1 = Long.parseLong(productID1);
			cart.removeToCart(idProduct1);
			// chuyển trang.
			session.setAttribute("cart", cart);
			response.sendRedirect(this.getServletContext().getInitParameter("contextPath") + "cart?command=list");
			return;
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String command = request.getParameter("command");

		int countL = (request.getParameter("count") == null) ? 1 : Integer.parseInt(request.getParameter("count"));
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
		}
		try {

			switch (command) {
			case "plus":
				Long idProduct = Long.parseLong(request.getParameter("productId"));
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
					cart.plusToCart(listKey.get(i), new Item(cart.getCartItems().get(listKey.get(i)).getProduct(),
							Integer.parseInt(request.getParameter("soLuong" + listKey.get(i)))));
				}
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.setAttribute("cart", cart);
		response.sendRedirect("/Book/cart?command=list");
	}

}